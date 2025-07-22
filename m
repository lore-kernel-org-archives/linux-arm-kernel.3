Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E80DC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 19:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpHbqa+GZa+9xtkjqGUyA4wPVQgcPiYEdCW8HwmxJKw=; b=RHe3MIic1c5OtDsEBQhn8Sh1LF
	X9u/yAy24cnISqFgFYwQIK+8FtBZktGMGdnmFb8H7rq3SMjN1uigFI41LNr0LTj21TN2wigX+pBYm
	wH5CjVp1ozK8mgFC4hLwm/xf1FcqEOk9+iFphNBnaF9t3/98c7w8zmDjHBIlNUg96Z1dd/8LBA+Mj
	1ds8qxrZKby96W/8tBgtBPNDgIGe+oRhEXlUHfVkXvftPdLuz121d9NRh0oaDhQbcWm9/Y/zgpcLS
	OArILmB+JzGAbEbOAnKI1FLJksZh8A4rhB5vXfNKjcfWavgcagSJyw488dpxe2QhaJykSfqBsEndO
	viYRReRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueIIw-00000003JME-2FC9;
	Tue, 22 Jul 2025 19:05:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueIGR-00000003J6v-0ajV;
	Tue, 22 Jul 2025 19:03:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=fpHbqa+GZa+9xtkjqGUyA4wPVQgcPiYEdCW8HwmxJKw=; b=lr2x7wIzdyYfzWxnWrlp1LsOcT
	xAn9Kg06imYc2Vs0UJNYeBSOOE/GoBqJiRK642uNvjjb5cRJvcBF49FN8wCS4PQYZmftpCYNB4oLY
	ebUbZ/7gv9TzrTq7bU/53+C5B4xlCocgu8w94+/h+0SgILdXkiOuCw1wgwVoZMrg5SCp/pOCWAStC
	fAJweD3LDAeeKHedCfYvYstEzaHOX+DRqawsX6YSX5JIHrM7FzA6y1nXyUe2PVulbpnFAY9yCFrPr
	Q5ASWz2njNTawNz2uOiJjSafMXrjJ/mzE14xrZ4VubOflXxfmMxv8LgYo9ZxUCsed0AqCxt31cRo8
	KUAuXWNw==;
Received: from i53875ad2.versanet.de ([83.135.90.210] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ueIGD-0006dq-Cz; Tue, 22 Jul 2025 21:02:45 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <didi.debian@cknow.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Tianling Shen <cnsztl@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Drop netdev triggers on NanoPi R5S
Date: Tue, 22 Jul 2025 21:02:43 +0200
Message-ID: <175321094779.3804838.4193109122815719935.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250722123628.25660-1-didi.debian@cknow.org>
References: <20250722123628.25660-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_120259_179570_B81560E6 
X-CRM114-Status: GOOD (  11.87  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Tue, 22 Jul 2025 14:35:33 +0200, Diederik de Haas wrote:
> Sometimes the netdev triggers causes tasks to get blocked for more then
> 120 seconds, which in turn makes the (WAN) network port on the NanoPi
> R5S fail to come up.
> This results in the following (partial) trace:
> 
>   INFO: task kworker/0:1:11 blocked for more than 120 seconds.
>         Not tainted 6.16-rc6+unreleased-arm64-cknow #1 Debian 6.16~rc6-1~exp1
>   "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>   task:kworker/0:1     state:D stack:0     pid:11    tgid:11    ppid:2      task_flags:0x4208060 flags:0x00000010
>   Workqueue: events_power_efficient reg_check_chans_work [cfg80211]
>   Call trace:
>    __switch_to+0xf8/0x168 (T)
>    __schedule+0x3f8/0xda8
>    schedule+0x3c/0x120
>    schedule_preempt_disabled+0x2c/0x58
>    __mutex_lock.constprop.0+0x4d0/0xab8
>    __mutex_lock_slowpath+0x1c/0x30
>    mutex_lock+0x50/0x68
>    rtnl_lock+0x20/0x38
>    reg_check_chans_work+0x40/0x478 [cfg80211]
>    process_one_work+0x178/0x3e0
>    worker_thread+0x260/0x390
>    kthread+0x150/0x250
>    ret_from_fork+0x10/0x20
>   INFO: task kworker/0:1:11 is blocked on a mutex likely owned by task dhcpcd:615.
>   task:dhcpcd          state:D stack:0     pid:615   tgid:615   ppid:614    task_flags:0x400140 flags:0x00000018
>   Call trace:
>    __switch_to+0xf8/0x168 (T)
>    __schedule+0x3f8/0xda8
>    schedule+0x3c/0x120
>    schedule_preempt_disabled+0x2c/0x58
>    rwsem_down_write_slowpath+0x1e4/0x750
>    down_write+0x98/0xb0
>    led_trigger_register+0x134/0x1c0
>    phy_led_triggers_register+0xf4/0x258 [libphy]
>    phy_attach_direct+0x30c/0x390 [libphy]
>    phylink_fwnode_phy_connect+0xb0/0x138 [phylink]
>    __stmmac_open+0xec/0x520 [stmmac]
>    stmmac_open+0x4c/0xe8 [stmmac]
>    __dev_open+0x130/0x2e0
>    __dev_change_flags+0x1c4/0x248
>    netif_change_flags+0x2c/0x80
>    dev_change_flags+0x88/0xc8
>    devinet_ioctl+0x35c/0x610
>    inet_ioctl+0x204/0x260
>    sock_do_ioctl+0x6c/0x140
>    sock_ioctl+0x2e4/0x388
>    __arm64_sys_ioctl+0xb4/0x120
>    invoke_syscall+0x6c/0x100
>    el0_svc_common.constprop.0+0x48/0xf0
>    do_el0_svc+0x24/0x38
>    el0_svc+0x3c/0x188
>    el0t_64_sync_handler+0x10c/0x140
>    el0t_64_sync+0x198/0x1a0
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Drop netdev triggers on NanoPi R5S
      commit: 60d89a256079895a154d0f714caee8c64de586f7

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

