Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D49AC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 14:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBPv9ijrpAcAqgKYpU9jcq/SpHy7uCerkFQlG/G8YbY=; b=KIJaqbBj1zX7LccKKd0EG1Avpj
	e3CrutCF656MWrdiiegz4J5PYoJ5BphnAbXUIpnNA3960PrbBSiYMS2XMwTL7pU1b967uPcmZFiOc
	WmI3WsG6zo7vW4lkmsg0e0dTz2Q/bivAjfTcnpPw3P0BcqONa524g2eccvqlmtZYqQ1mUicm2cIFH
	uSmVQHOysyVmm4B2L4fre5ylDXqbpIOQ0u9Au16o3ArmbBCgP7sytwTNRo3Kd/AikSIsWcEJ1TpR9
	7O5dBvzlR1hB3+t+724fkOiJfPj5+9dPvYoVo5576lYI4yRKqRXDqtr8bAJUragDI9KCt/9HubXyH
	5vzmjR7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRBY-0000000FEPT-0nC6;
	Thu, 16 Jan 2025 14:49:28 +0000
Received: from smtp-8faa.mail.infomaniak.ch ([83.166.143.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRA8-0000000FDsW-3ulQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 14:48:03 +0000
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YYm1k6Lmgz8gw;
	Thu, 16 Jan 2025 15:47:54 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4YYm1k0qmMzZ7l;
	Thu, 16 Jan 2025 15:47:54 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Thu, 16 Jan 2025 15:47:11 +0100
Subject: [PATCH v2 2/3] arm64: dts: rockchip: add overlay tests for Rock 5B
 PCIe overlays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-pre-ict-jaguar-v2-2-157d319004fc@cherry.de>
References: <20250116-pre-ict-jaguar-v2-0-157d319004fc@cherry.de>
In-Reply-To: <20250116-pre-ict-jaguar-v2-0-157d319004fc@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jagan Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>
Cc: Michael Riesch <michael.riesch@wolfvision.net>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_064801_116660_91EC2DAE 
X-CRM114-Status: GOOD (  10.96  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

According to commit 40658534756f ("arm64: dts: rockchip: Add rock5b
overlays for PCIe endpoint mode"), Rock 5B can operate in PCIe endpoint
mode. For that to work, the rk3588-rock-5b-pcie-ep.dtbo overlay needs to
be applied on Rock 5B base Device Tree. If that Rock 5B is connected to
another Rock 5B, the latter needs to apply the
rk3588-rock-5b-pcie-srns.dtbo overlay.

In order to make sure the overlays are still valid in the future, let's
add a validation test by applying the overlays on top of the main base
at build time.

Fixes: 40658534756f ("arm64: dts: rockchip: Add rock5b overlays for PCIe endpoint mode")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 3f92d1a9d0b6efeee46ad4aff8c2b8ed3cb83d73..72f8666b42400a2f462421f5db6b3cb0cf369611 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -145,8 +145,6 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-5-plus.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-quartzpro64.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5-itx.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b.dtb
-dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtbo
-dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-toybrick-x0.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-turing-rk1.dtb
@@ -165,5 +163,9 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5c.dtb
 
 # Overlays
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtb
 
 rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb rk3588-edgeble-neu6a-wifi.dtbo
+rk3588-rock-5b-pcie-ep-dtbs := rk3588-rock-5b.dtb rk3588-rock-5b-pcie-ep.dtbo
+rk3588-rock-5b-pcie-srns-dtbs := rk3588-rock-5b.dtb rk3588-rock-5b-pcie-srns.dtbo

-- 
2.48.0


