Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFF5FD006D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 15:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AuTsVR9YP5tLO7hrVrTxtF2Zxcfc7K4Euiqb72bXa2Y=; b=ecusAWhZrSix3fWgaZUZkpdAmT
	OOcAD7Vmxd93mzNdvRLVdujfNuIss5BOnrdwHYcv1qwlZRQcaS92/LgYyGz9mSi58h/Ba+gvGgIts
	ZXKYl4SfEQ3NeY3sJajeTFwAkMg72w35sAMTzRdgBonjZUV3jM370KAJcAeJidfWfo2g41outqFRh
	reeqpvBSmmGXrLKWl8CST87GkqLcI4FrfxyvQbWgSFpaOY0HctSLvoCdVmhJS0ozG6Lufc163aOVc
	6my4L34Tfll4/l1PRsMlQ22rZi1cxmQw+wGmmUWovGiaozdspKmL29DsfSUJlFsBWyhoVagwhfQvC
	jhdW8EuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwj85-0000000Bcto-3IfO;
	Sun, 01 Mar 2026 15:54:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwj84-0000000Bcsw-3cr8;
	Sun, 01 Mar 2026 15:54:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 617BE600AE;
	Sun,  1 Mar 2026 15:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B549C116C6;
	Sun,  1 Mar 2026 15:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772380486;
	bh=2uJe2sUo2oqiPNZ7lC5cwtsfYp+C4N7Y/V1qMpOAXXQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=FVyxEr6p37mXHJG7Ulxjt04a2hbYT1R4n6PNPAOdR7T0Ws0goKdjEp1cjBhNlndh7
	 mj1PdCo5yKE03xI7erKKs+a8m7WAgfupiRhVk7cJF95CxNzrKr0ZBW1Kwh48oDMtvC
	 pWz+cCfvOtTdHIZ/HNXrFdajfFOCMasbxeIiuKt6I8xP3t6jKfurN4WQ9xLq613fQ3
	 PQXS0fQftIUIM5rk/MQjHBprEQdtHIlmAHLbD7NGlfmx5ICvqeJy6YCSwKR8Vlx3G8
	 gmEiudZ7lzDW1nRgLSGsI5jbnwe/kzlcwEoCYX4WbEZl1ag+QZdMngBB5iBT2GxhCR
	 05odGvMmQmrRA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DBBFD0058;
	Sun,  1 Mar 2026 15:54:45 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 01 Mar 2026 16:54:41 +0100
Subject: [PATCH] arm64: dts: rockchip: Fix PCIe v3 pinctrl for BPI-R2-Pro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-rk3568-bri-r2-pro-fix-pcie-v1-1-b9ed318b4a77@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAEBhpGkC/x3MQQqAMAwAwa9IzgZipEX8inhQGzUIWlIQofh3i
 8dhYTMkMZUEfZXB5Nak11nQ1BUs+3RughqKgYk9MTPa0Trf4WyKxhjtwlUfjIsKts7NxBQCBYY
 yiCal/fNhfN8POnPaC2wAAAA=
X-Change-ID: 20260222-rk3568-bri-r2-pro-fix-pcie-355b020dd0d2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Martin Filla <freebsd@sysctl.cz>, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1564; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=hKBdwEW8s0wqw58AWppcp4beoynxrSnUvu08wYJII6o=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBppGFF+OKscrXtUKPDUFx1VkK4u15AJq+eTA10S
 HKh+d13akmJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaRhRQAKCRBgAj/E00kg
 crgaD/0VyX+botSQ88NN25oGRqXJmjFf1KShvyRNvpP5FgOhaNsL4szbYoAHmGY+XZ6rpYSDH3g
 4kwvPSHs7tZOACQoo1BhoF1l13hSbwD5ChdL2OKLKbHX/aJHzU2YK//zIqG5MyfoyMZ4XGWVrvd
 3DQdQyHQP7NWWBai8F0IJaiumCNiF7PzbfHCXv81RL+mbREWsSFtNecbhzr46Vb3ezFXlYOyveX
 /7e+gHe16CmitpIEsLPAk3fIOQl2rPBjR/nXWL8HwQYiaz7pZsN/2oC9EltxfjY9TipRzxSLL2k
 CLC1p3pOFZHBaLJO3AAv1ubptvG3hoYhvFOKutvFW2Vn5ZpVHTZhYsZ/vxieBB8k7UN7p0sdeeU
 JXOOeDQd5E4zDESzi98nciwYVgN/wq3IaeqvR9hxc71gSNaY1pefyU+iXAMX8X92iXGApDOUCyQ
 veRuSw/m6r8mpoFfhp2+FKBARLPUFhgZ7Sf1Uzr8Q+HIBAy7mfkBs5EGGUxKfEotEH2DSTdy5By
 06dol0CN9ASQt7KoS39noEQ0cKHOC8g87uv7giI5fG8sfF9p4C/oFrfCUhFW+g32lwzG0kpjDRg
 Eqn16bX/KavbXYJOUvy25/guZaOLH7iNwLxgIopkigoUATTdQS6D6VQsImsSvzRMHShkhAmyxfh
 +YOn0Y08lnSV1xg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: David Heidelberg <david@ixit.cz>

Add missing pinctrl for PD4 (PI6C PCIe clock enable,
PCIE_CLKEN_H_GPIO0_D4) and set output high.

This does fix freeze at initialization due pinctrl being in input
state.

Reported-by: Martin Filla <freebsd@sysctl.cz> # reported by private message
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
index 4d3ebe50b90ba..b4c8abe37d1f3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
@@ -121,6 +121,8 @@ vcc3v3_pi6c_05: regulator-vcc3v3-pi6c-05 {
 		regulator-max-microvolt = <3300000>;
 		enable-active-high;
 		gpios = <&gpio0 RK_PD4 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&pi6cpcie_enable_h>;
+		pinctrl-names = "default";
 		startup-delay-us = <200000>;
 		vin-supply = <&vcc5v0_sys>;
 	};
@@ -635,6 +637,10 @@ ngffpcie_enable_h: ngffpcie-enable-h {
 			rockchip,pins = <0 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none_drv_level_5>;
 		};
 
+		pi6cpcie_enable_h: pi6cpcie-enable-h {
+			rockchip,pins = <0 RK_PD4 RK_FUNC_GPIO &pcfg_output_high>;
+		};
+
 		minipcie_reset_h: minipcie-reset-h {
 			rockchip,pins = <2 RK_PD6 RK_FUNC_GPIO &pcfg_pull_none_drv_level_5>;
 		};

---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260222-rk3568-bri-r2-pro-fix-pcie-355b020dd0d2

Best regards,
-- 
David Heidelberg <david@ixit.cz>



