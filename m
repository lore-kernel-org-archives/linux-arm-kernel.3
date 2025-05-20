Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10291C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 11:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pk5BE83kPSRFW3yStdHWRQs5PmrBOBL21e/d+q08bcs=; b=hS341WondWqEHIjRhz2YkMlOxv
	EgrykZDjSg3K0JT9q1wTNf/yhEqmL/SGZQrja+wY/sfsBdAq67zBOIBA5PbiWUDFvHEMx0+xySthS
	xA5fEQ1KFYG7gJOG3Uui5aMi0nnQtB6LxhOH9YtUf6weYEhfJP9/6exHAo1+mAkQlGwdu9Pgiw/kw
	VOF3H/WzXnO7iu39q+f7mYnVLkl3hLfx0Yb1Bd0mKACSR4K8O1B0hi7giOHNRkfIOEdsbyMdjahwn
	6Qh0ZUee5kp3LDz832un/M9c7S+0rwkyxv8ZV+hetc4knZxo4jFV0UqMCgVfpNOvdlp1xJKAUmlSC
	1rYVB+MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHL64-0000000Cd2y-2cq2;
	Tue, 20 May 2025 11:25:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHKvV-0000000CZtL-3wcP;
	Tue, 20 May 2025 11:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747739667;
	bh=9NOM1BnpOYdIMMsdfz/iuXKxgIAKdzhbcuh0RqV8Oes=;
	h=From:Date:Subject:To:Cc:From;
	b=JLB7tyUo7qUYP4jrah/fsPEOXIeqlVK9aBMagE6TeN/OgeDDwG4cDdrxo4ecTdxep
	 vqBxcl7Q7CCy0QqZyFiBzzJ+671LtFOzxgutNbuRuTIHR0bRuuGr1a31uPjxaAl7Vp
	 ypAqNm+4MDfJ9duxHgkikLI8d61qcEXc+Sfu30dkQuo8hdrmMFVad9hIdWU6m/OZhC
	 OGe75UkZqN1DqC14Bubsj52QWyFar9i0ZRFm+VkI4dQqkZOwzmZQc8NdPAu6axkoBf
	 So2j1Nqdt54QEgXHv/dbity4rLbA6oAAuDuQFxINQjlNZ5sUjZphiX6EalEBWWc2dT
	 7ARTj/7MvRWAw==
Received: from jupiter.universe (dyndsl-091-248-211-172.ewe-ip-backbone.de [91.248.211.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B7E5417E0256;
	Tue, 20 May 2025 13:14:27 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 5DEB8480038; Tue, 20 May 2025 13:14:27 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 20 May 2025 13:14:27 +0200
Subject: [PATCH] arm64: dts: rockchip: Add missing SFC power-domains to
 rk3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-rk3576-fix-fspi-pmdomain-v1-1-f07c6e62dadd@kernel.org>
X-B4-Tracking: v=1; b=H4sIABJkLGgC/x2MQQqAIBAAvxJ7bsFMDfpKdLBca4lMFCII/550H
 JiZFzIlpgxj80KimzNfoULXNrDuNmyE7CqDFFILLQWmo9eDQc8P+hwZ4+mu03JAtXpLRi9GOQc
 1j4mq9K+nuZQP3n2762oAAAA=
X-Change-ID: 20250520-rk3576-fix-fspi-pmdomain-4cfae65b64dd
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4394; i=sre@kernel.org;
 h=from:subject:message-id; bh=9NOM1BnpOYdIMMsdfz/iuXKxgIAKdzhbcuh0RqV8Oes=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGgsZBPq91G573PsEcDL6ydWxoOCNqPv5m/s0
 oIw7A+5EZsmOYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJoLGQTAAoJENju1/PI
 O/qaNiUQAIdoJXFKSx/rtSlc3S9FH+fQkR0qTYaPWI1c5KPoa8zTlwmXkzaoo0/DGOgP6C+tnyW
 O82tyej7sEaBkHJTrbWrlE3uuFIhgshOTme5pKc3NrSoC2F2MuuL8QV4iOFmWuWtuK0Bi1aCUAg
 d0zeWBPn20E7TTBAcO22yZ208n+Z/Yu2kKYbwHB1qJg7iLRDut7HiqLFFk9G/10/U8jqH+CT65q
 q3rJYGGlnazZNGFmlrZ7V8TkaQ1ctyMYwX2r5el6I3PFKKq5aekFEDWFXsSFlNM9tuRf8Q90/MB
 EA/n5TDJDmRn6fjPT25MfCkhtbULkOmc/+MpOaEKRfhPF8hWslHFdzFjlQSRhrMu5vjAKySlPYD
 HxjPwZC6gWjmJ9ZQceZV9MtTlmj6r9/K5BnjwPrcVE2PmxNkIN4HUgR7okYsWPx6PtKQ9GV0z7R
 EJ/7bOT4X8Nd8q4SQQj2/46pmea4QnzrR93ZA/AfZTfp0vkSrLWmC37goYK8xEYDEkBnPN8G/hT
 gwj0/Eo3QGfc/Ff4altnk9NFZQj5Brc34VVj0Cg3OuqciL04aHMQa4l7okLUSx+npYZYErwZfP0
 MvfXApNOvjLZ4sEm4z6bcLemHLmpI0iOrX00p71SfK3W4doM8jH597139sqopGkZ//K8vxHpIkg
 wOT1vrNlahY+DbnEnHT8yUQ==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_041430_135284_4E3B3188 
X-CRM114-Status: GOOD (  17.30  )
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

Add the power-domains for the RK3576 SFC nodes according to the
TRM part 1. This fixes potential SErrors when accessing the SFC
registers without other peripherals (e.g. eMMC) doing a prior
power-domain enable. For example this is easy to trigger on the
Rock 4D, which enables the SFC0 interface, but does not enable
the eMMC interface at the moment.

Cc: stable@vger.kernel.org
Fixes: 36299757129c8 ("arm64: dts: rockchip: Add SFC nodes for rk3576")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
I finally managed to get some RK3576 boards integrated to our CI
pipeline and promptly got some SError on Rock 4D with the extra
test coverage :( As we hope to get some of those boards for KernelCI,
it would be good to get this fixed in all affected trees. It seemed
enough to just describe the power-domain in DT (i.e. that fixed the
SError for the arm64 defconfig when booting the Rock 4D). If we see
further problems (I haven't so far), we might need something like
[0] for the FSPI driver.

[0] https://lore.kernel.org/all/20250423-rk3576-emmc-fix-v3-1-0bf80e29967f@collabora.com/

[   15.248915] Kernel panic - not syncing: Asynchronous SError Interrupt
[   15.248917] CPU: 7 UID: 0 PID: 142 Comm: (udev-worker) Not tainted 6.15.0-rc6-g51237a9145a9 #1 PREEMPT
[   15.248921] Hardware name: Radxa ROCK 4D (DT)
[   15.248923] Call trace:
[   15.248924]  show_stack+0x2c/0x84 (C)
[   15.248937]  dump_stack_lvl+0x60/0x80
[   15.248941]  dump_stack+0x18/0x24
[   15.248944]  panic+0x168/0x360
[   15.248948]  add_taint+0x0/0xbc
[   15.248952]  arm64_serror_panic+0x64/0x70
[   15.248956]  do_serror+0x3c/0x70
[   15.248958]  el1h_64_error_handler+0x30/0x48
[   15.248964]  el1h_64_error+0x6c/0x70
[   15.248967]  rockchip_sfc_init.isra.0+0x20/0x8c [spi_rockchip_sfc] (P)
[   15.248972]  platform_probe+0x68/0xdc
[   15.248978]  really_probe+0xc0/0x39c
[   15.248982]  __driver_probe_device+0x7c/0x14c
[   15.248985]  driver_probe_device+0x3c/0x120
[   15.248989]  __driver_attach+0xc4/0x200
[   15.248992]  bus_for_each_dev+0x7c/0xdc
[   15.248995]  driver_attach+0x24/0x30
[   15.248998]  bus_add_driver+0x110/0x240
[   15.249001]  driver_register+0x68/0x130
[   15.249005]  __platform_driver_register+0x24/0x30
[   15.249010]  rockchip_sfc_driver_init+0x20/0x1000 [spi_rockchip_sfc]
[   15.249014]  do_one_initcall+0x60/0x1e0
[   15.249017]  do_init_module+0x54/0x1fc
[   15.249021]  load_module+0x18f8/0x1e50
[   15.249024]  init_module_from_file+0x88/0xcc
[   15.249027]  __arm64_sys_finit_module+0x260/0x358
[   15.249031]  invoke_syscall+0x48/0x104
[   15.249035]  el0_svc_common.constprop.0+0x40/0xe0
[   15.249040]  do_el0_svc+0x1c/0x28
[   15.249044]  el0_svc+0x30/0xcc
[   15.249048]  el0t_64_sync_handler+0x10c/0x138
[   15.249052]  el0t_64_sync+0x198/0x19c
[   15.249057] SMP: stopping secondary CPUs
[   15.249064] Kernel Offset: 0x38f049600000 from 0xffff800080000000
[   15.249066] PHYS_OFFSET: 0xfff0e21340000000
[   15.249068] CPU features: 0x0400,00041250,01000400,0200421b
[   15.249071] Memory Limit: none
[   15.273962] ---[ end Kernel panic - not syncing: Asynchronous SError Interrupt ]---
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 79800959b7976950fb3655289076de70b5814283..260f9598ee6c9c1536115ca3dcb0cbaf61028057 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1605,6 +1605,7 @@ sfc1: spi@2a300000 {
 			interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cru SCLK_FSPI1_X2>, <&cru HCLK_FSPI1>;
 			clock-names = "clk_sfc", "hclk_sfc";
+			power-domains = <&power RK3576_PD_SDGMAC>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -1655,6 +1656,7 @@ sfc0: spi@2a340000 {
 			interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cru SCLK_FSPI_X2>, <&cru HCLK_FSPI>;
 			clock-names = "clk_sfc", "hclk_sfc";
+			power-domains = <&power RK3576_PD_NVM>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";

---
base-commit: a95d16b0324b6875f908e5965495b393c92614f8
change-id: 20250520-rk3576-fix-fspi-pmdomain-4cfae65b64dd

Best regards,
-- 
Sebastian Reichel <sre@kernel.org>


