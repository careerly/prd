// Agent应用主脚本
let currentPage = 'dashboard';
let isConnected = false;
let syncInterval = null;
let rpaStatus = 'running';

// DOM加载完成后初始化
document.addEventListener('DOMContentLoaded', function() {
    initializeAgent();
    bindEvents();
    startPeriodicUpdates();
});

// 初始化Agent应用
function initializeAgent() {
    console.log('Agent initializing...');
    
    // 设置默认页面
    showPage('dashboard');
    
    // 检查连接状态
    checkServerConnection();
    
    // 初始化系统信息
    updateSystemInfo();
    
    // 模拟连接服务器
    simulateServerConnection();
}

// 绑定事件
function bindEvents() {
    // 导航点击事件
    const navItems = document.querySelectorAll('.nav-item');
    navItems.forEach(item => {
        item.addEventListener('click', function() {
            const page = this.dataset.page;
            showPage(page);
            
            // 更新激活状态
            navItems.forEach(nav => nav.classList.remove('active'));
            this.classList.add('active');
        });
    });
    
    // 标签页切换
    const tabBtns = document.querySelectorAll('.tab-btn');
    tabBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const parent = this.closest('.settings-tabs');
            if (parent) {
                parent.querySelectorAll('.tab-btn').forEach(tab => tab.classList.remove('active'));
                this.classList.add('active');
                
                // 切换设置内容
                const tabName = this.dataset.tab;
                if (tabName) {
                    switchSettingsTab(tabName);
                }
            }
        });
    });
    
    // 窗口控制按钮
    bindWindowControls();
    
    // 键盘快捷键
    bindKeyboardShortcuts();
}

// 页面切换
function showPage(pageId) {
    // 隐藏所有页面
    const pages = document.querySelectorAll('.page-content');
    pages.forEach(page => page.classList.remove('active'));
    
    // 显示目标页面
    const targetPage = document.getElementById(pageId);
    if (targetPage) {
        targetPage.classList.add('active');
        currentPage = pageId;
        
        // 页面特定的初始化
        initializePage(pageId);
    }
}

// 页面特定初始化
function initializePage(pageId) {
    switch(pageId) {
        case 'dashboard':
            refreshDashboard();
            break;
        case 'sync':
            updateSyncProgress();
            break;
        case 'tasks':
            loadTaskQueue();
            break;
        case 'logs':
            loadLogs();
            break;
        case 'rpa':
            updateRPAStatus();
            break;
    }
}

// 刷新仪表盘
function refreshDashboard() {
    // 更新连接状态
    const connectionEl = document.getElementById('server-connection');
    if (connectionEl) {
        connectionEl.textContent = isConnected ? '在线' : '离线';
        connectionEl.className = isConnected ? 'status online' : 'status offline';
    }
    
    // 更新其他统计数据
    updateDashboardStats();
    
    showToast('仪表盘数据已更新', 'info');
}

// 更新仪表盘统计数据
function updateDashboardStats() {
    // 模拟数据更新
    const stats = {
        boundAccounts: Math.floor(Math.random() * 3) + 1,
        pendingTasks: Math.floor(Math.random() * 10) + 1,
        uptime: calculateUptime(),
        memoryUsage: (Math.random() * 50 + 50).toFixed(0) + 'MB'
    };
    
    const boundAccountsEl = document.getElementById('bound-accounts');
    const pendingTasksEl = document.getElementById('pending-tasks');
    const uptimeEl = document.getElementById('uptime');
    const memoryUsageEl = document.getElementById('memory-usage');
    
    if (boundAccountsEl) boundAccountsEl.textContent = stats.boundAccounts;
    if (pendingTasksEl) pendingTasksEl.textContent = stats.pendingTasks;
    if (uptimeEl) uptimeEl.textContent = stats.uptime;
    if (memoryUsageEl) memoryUsageEl.textContent = stats.memoryUsage;
}

// 计算运行时长
function calculateUptime() {
    const hours = Math.floor(Math.random() * 24);
    const minutes = Math.floor(Math.random() * 60);
    return `${hours}小时${minutes}分钟`;
}

// 更新系统信息
function updateSystemInfo() {
    const osInfo = document.getElementById('os-info');
    if (osInfo) {
        // 检测操作系统
        const userAgent = navigator.userAgent;
        let os = 'Unknown OS';
        
        if (userAgent.includes('Windows')) os = 'Windows';
        else if (userAgent.includes('Mac')) os = 'macOS';
        else if (userAgent.includes('Linux')) os = 'Linux';
        
        osInfo.textContent = os;
    }
}

// 模拟服务器连接
function simulateServerConnection() {
    setTimeout(() => {
        isConnected = true;
        updateConnectionStatus();
        showToast('已连接到服务器', 'success');
    }, 2000);
}

// 检查服务器连接
function checkServerConnection() {
    // 模拟连接检查
    const statusEl = document.getElementById('connection-status');
    const serverUrlEl = document.getElementById('server-url');
    
    if (isConnected) {
        statusEl.querySelector('i').style.color = '#27ae60';
        statusEl.querySelector('span').textContent = '已连接';
        if (serverUrlEl) serverUrlEl.textContent = 'https://api.content-manager.com';
    } else {
        statusEl.querySelector('i').style.color = '#e74c3c';
        statusEl.querySelector('span').textContent = '连接中...';
        if (serverUrlEl) serverUrlEl.textContent = '正在连接...';
    }
}

// 更新连接状态
function updateConnectionStatus() {
    checkServerConnection();
    
    // 更新仪表盘中的连接状态
    const serverConnectionEl = document.getElementById('server-connection');
    if (serverConnectionEl) {
        serverConnectionEl.textContent = isConnected ? '在线' : '离线';
        serverConnectionEl.className = isConnected ? 'status online' : 'status offline';
    }
}

// 绑定新账号
function bindNewAccount() {
    showToast('请在后台管理系统中配置账号信息', 'info');
}

// 绑定特定平台账号
function bindAccount(platform) {
    const platformNames = {
        'xiaohongshu': '小红书',
        'douyin': '抖音'
    };
    
    showToast(`正在准备绑定${platformNames[platform] || platform}账号...`, 'info');
    
    // 模拟绑定过程
    setTimeout(() => {
        showToast('请扫描二维码或输入密钥完成绑定', 'warning');
    }, 1000);
}

// 开始同步
function startSync() {
    if (!isConnected) {
        showToast('请先连接到服务器', 'error');
        return;
    }
    
    showToast('开始同步内容...', 'info');
    
    // 模拟同步过程
    updateSyncProgress();
}

// 更新同步进度
function updateSyncProgress() {
    // 模拟进度更新
    const progressBars = document.querySelectorAll('.progress-fill');
    progressBars.forEach(bar => {
        const currentWidth = parseInt(bar.style.width) || 0;
        const newWidth = Math.min(currentWidth + Math.random() * 20, 100);
        bar.style.width = newWidth + '%';
    });
}

// 重试同步
function retrySync(button) {
    const syncItem = button.closest('.sync-item');
    syncItem.classList.remove('failed');
    syncItem.classList.add('in-progress');
    
    const statusEl = syncItem.querySelector('.status');
    statusEl.innerHTML = '<i class="fas fa-spinner fa-spin"></i> 重试中';
    statusEl.className = 'status in-progress';
    
    showToast('正在重试同步...', 'info');
    
    // 模拟重试过程
    setTimeout(() => {
        const success = Math.random() > 0.3; // 70%成功率
        if (success) {
            syncItem.classList.remove('in-progress');
            syncItem.classList.add('completed');
            statusEl.innerHTML = '<i class="fas fa-check-circle"></i> 已完成';
            statusEl.className = 'status completed';
            showToast('同步成功', 'success');
        } else {
            syncItem.classList.remove('in-progress');
            syncItem.classList.add('failed');
            statusEl.innerHTML = '<i class="fas fa-exclamation-circle"></i> 失败';
            statusEl.className = 'status failed';
            showToast('同步失败，请检查网络连接', 'error');
        }
    }, 3000);
}

// 清理已完成的同步任务
function clearCompleted() {
    const completedItems = document.querySelectorAll('.sync-item.completed');
    completedItems.forEach(item => {
        item.style.transition = 'opacity 0.3s ease';
        item.style.opacity = '0';
        setTimeout(() => {
            item.remove();
        }, 300);
    });
    
    showToast(`已清理${completedItems.length}个已完成的任务`, 'success');
}

// 任务队列管理
function loadTaskQueue() {
    // 模拟加载任务队列
    console.log('Loading task queue...');
}

// 暂停任务
function pauseTask(button) {
    const taskItem = button.closest('.task-item');
    button.textContent = '继续';
    button.onclick = () => resumeTask(button);
    
    showToast('任务已暂停', 'warning');
}

// 继续任务
function resumeTask(button) {
    const taskItem = button.closest('.task-item');
    button.textContent = '暂停';
    button.onclick = () => pauseTask(button);
    
    showToast('任务已继续', 'info');
}

// 取消任务
function cancelTask(button) {
    const taskItem = button.closest('.task-item');
    taskItem.style.transition = 'opacity 0.3s ease';
    taskItem.style.opacity = '0';
    
    setTimeout(() => {
        taskItem.remove();
    }, 300);
    
    showToast('任务已取消', 'warning');
}

// 开始任务
function startTask(button) {
    const taskItem = button.closest('.task-item');
    taskItem.classList.remove('pending');
    taskItem.classList.add('running');
    
    const statusEl = taskItem.querySelector('.status');
    statusEl.innerHTML = '<i class="fas fa-spinner fa-spin"></i> 运行中';
    statusEl.className = 'status running';
    
    showToast('任务已开始执行', 'success');
}

// 重试任务
function retryTask(button) {
    const taskItem = button.closest('.task-item');
    taskItem.classList.remove('failed');
    taskItem.classList.add('running');
    
    const statusEl = taskItem.querySelector('.status');
    statusEl.innerHTML = '<i class="fas fa-spinner fa-spin"></i> 重试中';
    statusEl.className = 'status running';
    
    showToast('正在重试任务...', 'info');
}

// 编辑任务
function editTask(button) {
    showToast('任务编辑功能开发中...', 'info');
}

// 查看任务详情
function viewTaskDetails(button) {
    showToast('任务详情功能开发中...', 'info');
}

// 删除任务
function deleteTask(button) {
    const taskItem = button.closest('.task-item');
    taskItem.style.transition = 'opacity 0.3s ease';
    taskItem.style.opacity = '0';
    
    setTimeout(() => {
        taskItem.remove();
    }, 300);
    
    showToast('任务已删除', 'success');
}

// 查看错误
function viewError(button) {
    showToast('错误详情：网络连接超时，请检查网络设置', 'error');
}

// 清空任务队列
function clearTasks() {
    const completedTasks = document.querySelectorAll('.task-item.completed');
    completedTasks.forEach(task => {
        task.style.transition = 'opacity 0.3s ease';
        task.style.opacity = '0';
        setTimeout(() => {
            task.remove();
        }, 300);
    });
    
    showToast(`已清理${completedTasks.length}个已完成的任务`, 'success');
}

// 日志管理
function loadLogs() {
    console.log('Loading logs...');
}

// 导出日志
function exportLogs() {
    showToast('正在导出日志文件...', 'info');
    
    setTimeout(() => {
        showToast('日志文件已保存到桌面', 'success');
    }, 2000);
}

// 清空日志
function clearLogs() {
    const logContainer = document.querySelector('.log-container');
    if (logContainer) {
        logContainer.innerHTML = '<div class="log-entry info"><span class="log-time">刚刚</span><span class="log-level info">INFO</span><span class="log-message">日志已清空</span></div>';
    }
    
    showToast('日志已清空', 'success');
}

// RPA状态管理
function updateRPAStatus() {
    const rpaStatusEl = document.getElementById('rpa-status');
    if (rpaStatusEl) {
        rpaStatusEl.textContent = rpaStatus === 'running' ? '运行中' : '已停止';
        rpaStatusEl.className = rpaStatus === 'running' ? 'status running' : 'status offline';
    }
}

// 刷新RPA状态
function refreshRPA() {
    showToast('正在刷新RPA状态...', 'info');
    
    setTimeout(() => {
        updateRPAStatus();
        showToast('RPA状态已更新', 'success');
    }, 1500);
}

// 重启RPA
function restartRPA() {
    showToast('正在重启RPA工具...', 'warning');
    
    rpaStatus = 'stopped';
    updateRPAStatus();
    
    setTimeout(() => {
        rpaStatus = 'running';
        updateRPAStatus();
        showToast('RPA工具重启完成', 'success');
    }, 5000);
}

// 窗口控制
function bindWindowControls() {
    // 注意：这些功能在实际的Electron应用中需要通过IPC与主进程通信
}

// 最小化应用
function minimizeApp() {
    showToast('最小化到系统托盘', 'info');
    // 在实际应用中，这里会调用Electron的minimize方法
}

// 关闭应用
function closeApp() {
    if (confirm('确定要退出Agent应用吗？')) {
        showToast('正在退出应用...', 'info');
        // 在实际应用中，这里会调用Electron的close方法
    }
}

// 设置管理
function openSettings() {
    const modal = document.getElementById('settings-modal');
    modal.classList.add('show');
}

function closeSettings() {
    const modal = document.getElementById('settings-modal');
    modal.classList.remove('show');
}

function switchSettingsTab(tabName) {
    // 隐藏所有设置区域
    const sections = document.querySelectorAll('.settings-section');
    sections.forEach(section => section.classList.remove('active'));
    
    // 显示目标设置区域
    const targetSection = document.getElementById(tabName + '-settings');
    if (targetSection) {
        targetSection.classList.add('active');
    }
}

function saveSettings() {
    showToast('正在保存设置...', 'info');
    
    setTimeout(() => {
        showToast('设置保存成功', 'success');
        closeSettings();
    }, 1000);
}

// 键盘快捷键
function bindKeyboardShortcuts() {
    document.addEventListener('keydown', function(e) {
        // F5 刷新当前页面
        if (e.key === 'F5') {
            e.preventDefault();
            initializePage(currentPage);
        }
        
        // Ctrl+R 刷新
        if (e.ctrlKey && e.key === 'r') {
            e.preventDefault();
            initializePage(currentPage);
        }
        
        // ESC 关闭模态框
        if (e.key === 'Escape') {
            closeSettings();
        }
        
        // Ctrl+S 开始同步
        if (e.ctrlKey && e.key === 's') {
            e.preventDefault();
            if (currentPage === 'sync') {
                startSync();
            }
        }
    });
}

// 定期更新
function startPeriodicUpdates() {
    // 每30秒更新一次状态
    setInterval(() => {
        if (currentPage === 'dashboard') {
            updateDashboardStats();
        }
        
        // 模拟网络状态变化
        if (Math.random() < 0.05) { // 5%概率断线
            isConnected = false;
            updateConnectionStatus();
            showToast('与服务器连接中断', 'error');
            
            // 3秒后重连
            setTimeout(() => {
                isConnected = true;
                updateConnectionStatus();
                showToast('已重新连接到服务器', 'success');
            }, 3000);
        }
    }, 30000);
    
    // 每10秒更新一次同步进度
    syncInterval = setInterval(() => {
        if (currentPage === 'sync') {
            updateSyncProgress();
        }
    }, 10000);
}

// 显示提示消息
function showToast(message, type = 'info') {
    // 移除现有的toast
    const existingToast = document.querySelector('.toast');
    if (existingToast) {
        existingToast.remove();
    }
    
    // 创建新的toast
    const toast = document.createElement('div');
    toast.className = `toast toast-${type}`;
    toast.innerHTML = `
        <div class="toast-content">
            <i class="fas fa-${getToastIcon(type)}"></i>
            <span>${message}</span>
        </div>
    `;
    
    // 添加样式
    toast.style.cssText = `
        position: fixed;
        top: 80px;
        right: 20px;
        background: ${getToastBg(type)};
        color: white;
        padding: 12px 16px;
        border-radius: 8px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        z-index: 10000;
        transform: translateX(100%);
        transition: transform 0.3s ease;
        font-size: 0.85rem;
        max-width: 300px;
    `;
    
    document.body.appendChild(toast);
    
    // 显示动画
    setTimeout(() => {
        toast.style.transform = 'translateX(0)';
    }, 100);
    
    // 自动隐藏
    setTimeout(() => {
        toast.style.transform = 'translateX(100%)';
        setTimeout(() => {
            if (toast.parentNode) {
                document.body.removeChild(toast);
            }
        }, 300);
    }, 3000);
}

// 获取toast图标
function getToastIcon(type) {
    const icons = {
        'success': 'check-circle',
        'error': 'exclamation-circle',
        'warning': 'exclamation-triangle',
        'info': 'info-circle'
    };
    return icons[type] || 'info-circle';
}

// 获取toast背景色
function getToastBg(type) {
    const colors = {
        'success': '#27ae60',
        'error': '#e74c3c',
        'warning': '#f39c12',
        'info': '#3498db'
    };
    return colors[type] || '#3498db';
}

// 模拟实时日志
function simulateRealTimeLogs() {
    const logContainer = document.querySelector('.log-container');
    if (!logContainer || currentPage !== 'logs') return;
    
    const logTypes = ['info', 'success', 'warning', 'error'];
    const messages = [
        '检查服务器连接状态',
        '下载文件完成',
        'RPA工具响应缓慢',
        '任务执行失败',
        '内存使用率检查',
        '网络状态正常',
        '同步任务启动',
        '配置文件已更新'
    ];
    
    const randomType = logTypes[Math.floor(Math.random() * logTypes.length)];
    const randomMessage = messages[Math.floor(Math.random() * messages.length)];
    const timestamp = new Date().toLocaleTimeString();
    
    const logEntry = document.createElement('div');
    logEntry.className = `log-entry ${randomType}`;
    logEntry.innerHTML = `
        <span class="log-time">${timestamp}</span>
        <span class="log-level ${randomType}">${randomType.toUpperCase()}</span>
        <span class="log-message">${randomMessage}</span>
    `;
    
    logContainer.insertBefore(logEntry, logContainer.firstChild);
    
    // 限制日志条数
    const logEntries = logContainer.querySelectorAll('.log-entry');
    if (logEntries.length > 50) {
        logContainer.removeChild(logEntries[logEntries.length - 1]);
    }
}

// 启动实时日志模拟
setInterval(simulateRealTimeLogs, 15000);

// 导出全局函数
window.agentFunctions = {
    refreshDashboard,
    bindNewAccount,
    bindAccount,
    startSync,
    retrySync,
    clearCompleted,
    pauseTask,
    resumeTask,
    cancelTask,
    startTask,
    retryTask,
    editTask,
    viewTaskDetails,
    deleteTask,
    viewError,
    clearTasks,
    exportLogs,
    clearLogs,
    refreshRPA,
    restartRPA,
    openSettings,
    closeSettings,
    saveSettings,
    minimizeApp,
    closeApp
};


