Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F762C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 13:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v6IZ779T9bBNZba26eex0KrT9vXsFUEO7FzK3vtGhiY=; b=h7oAp90axsR3xaTiM01rh6XOeP
	LpvsS7EzDC5eF8XSBbiUpOPMPiTdTWJvpkb5Bkly2YSqPWeoTkFdY2eWPIUwXlcToi9zykrfmmVRh
	Et9aWtP8jG7FNXonkqojnvnlyuTH2dphuSs7KY2GJKbjSJuM5/BolwMUk3WqlEnoZv0hQvMOwX6FV
	viSCWBiTRQVAGXWSx28iwuB/2wW6OBrdD+kYC2WofVE/i/6/tRP+/U9HkB0zaawVF0+kI+3+YE09/
	X/lT8xuoRJJXiTNw31jcu+zmXMn7yy3jnAxh46dshk38/hwB8e6b29je7yFSxdCblIziKfkRZeE+8
	qE/fl2bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDAp-00000002Z6H-3cB8;
	Tue, 22 Jul 2025 13:36:52 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueCEm-00000002RvE-2xcF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 12:36:54 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1753187808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=v6IZ779T9bBNZba26eex0KrT9vXsFUEO7FzK3vtGhiY=;
	b=NePw5Gy4EHSJ+3t7aQNISH7CzV3OlBtxnMOpkL4s4XfJMDCqPo9GCv8ebVueKR/U5+6laR
	sdP+1XgfpMUD3EUu2o2bszQK2OkBUbVBWyBqM+wgSrNAMDiwDcXwFa0/LdcGAAlnEg6WiI
	A4OfuBz7ecwTdwYSNAcTWvVQjA1wAO/UTITRdNZjKn/2nCpHm/xIc39SmE+j0HBqDrlNjt
	LC4hV6w0QEpLz1WmGOzeRaJv85vN76Aa6R0yr/6rDEt8Sl/wI4Qp3llWCb7Si4mxO5+oOy
	9M5xZ6MmN32ny0+sdVdsdXyvfaI4BhcEdYQTGGrj04VVwtp+61LMyLhodBOgGw==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Tianling Shen <cnsztl@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>,
	Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH] arm64: dts: rockchip: Drop netdev triggers on NanoPi R5S
Date: Tue, 22 Jul 2025 14:35:33 +0200
Message-ID: <20250722123628.25660-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_053653_303624_F67E86AF 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
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

Sometimes the netdev triggers causes tasks to get blocked for more then
120 seconds, which in turn makes the (WAN) network port on the NanoPi
R5S fail to come up.
This results in the following (partial) trace:

  INFO: task kworker/0:1:11 blocked for more than 120 seconds.
        Not tainted 6.16-rc6+unreleased-arm64-cknow #1 Debian 6.16~rc6-1~exp1
  "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
  task:kworker/0:1     state:D stack:0     pid:11    tgid:11    ppid:2      task_flags:0x4208060 flags:0x00000010
  Workqueue: events_power_efficient reg_check_chans_work [cfg80211]
  Call trace:
   __switch_to+0xf8/0x168 (T)
   __schedule+0x3f8/0xda8
   schedule+0x3c/0x120
   schedule_preempt_disabled+0x2c/0x58
   __mutex_lock.constprop.0+0x4d0/0xab8
   __mutex_lock_slowpath+0x1c/0x30
   mutex_lock+0x50/0x68
   rtnl_lock+0x20/0x38
   reg_check_chans_work+0x40/0x478 [cfg80211]
   process_one_work+0x178/0x3e0
   worker_thread+0x260/0x390
   kthread+0x150/0x250
   ret_from_fork+0x10/0x20
  INFO: task kworker/0:1:11 is blocked on a mutex likely owned by task dhcpcd:615.
  task:dhcpcd          state:D stack:0     pid:615   tgid:615   ppid:614    task_flags:0x400140 flags:0x00000018
  Call trace:
   __switch_to+0xf8/0x168 (T)
   __schedule+0x3f8/0xda8
   schedule+0x3c/0x120
   schedule_preempt_disabled+0x2c/0x58
   rwsem_down_write_slowpath+0x1e4/0x750
   down_write+0x98/0xb0
   led_trigger_register+0x134/0x1c0
   phy_led_triggers_register+0xf4/0x258 [libphy]
   phy_attach_direct+0x30c/0x390 [libphy]
   phylink_fwnode_phy_connect+0xb0/0x138 [phylink]
   __stmmac_open+0xec/0x520 [stmmac]
   stmmac_open+0x4c/0xe8 [stmmac]
   __dev_open+0x130/0x2e0
   __dev_change_flags+0x1c4/0x248
   netif_change_flags+0x2c/0x80
   dev_change_flags+0x88/0xc8
   devinet_ioctl+0x35c/0x610
   inet_ioctl+0x204/0x260
   sock_do_ioctl+0x6c/0x140
   sock_ioctl+0x2e4/0x388
   __arm64_sys_ioctl+0xb4/0x120
   invoke_syscall+0x6c/0x100
   el0_svc_common.constprop.0+0x48/0xf0
   do_el0_svc+0x24/0x38
   el0_svc+0x3c/0x188
   el0t_64_sync_handler+0x10c/0x140
   el0t_64_sync+0x198/0x1a0

In order to not introduce a regression with kernel 6.16, drop the netdev
triggers for now while the problem is being investigated further.

Fixes: 1631cbdb8089 ("arm64: dts: rockchip: Improve LED config for NanoPi R5S")
Helped-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
index 3b31f0dd8f3b..539edc3c535f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
@@ -29,7 +29,6 @@ led-lan1 {
 			function-enumerator = <1>;
 			gpios = <&gpio3 RK_PD6 GPIO_ACTIVE_HIGH>;
 			label = "LAN-1";
-			linux,default-trigger = "netdev";
 		};
 
 		led-lan2 {
@@ -39,7 +38,6 @@ led-lan2 {
 			function-enumerator = <2>;
 			gpios = <&gpio3 RK_PD7 GPIO_ACTIVE_HIGH>;
 			label = "LAN-2";
-			linux,default-trigger = "netdev";
 		};
 
 		power_led: led-sys {
@@ -56,7 +54,6 @@ led-wan {
 			function = LED_FUNCTION_WAN;
 			gpios = <&gpio2 RK_PC1 GPIO_ACTIVE_HIGH>;
 			label = "WAN";
-			linux,default-trigger = "netdev";
 		};
 	};
 };
-- 
2.50.0


