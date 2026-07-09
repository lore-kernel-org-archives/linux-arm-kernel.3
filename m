Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7C7C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhBYvWOF+cgnaRqQxrykGk9N0o0tzWLbopxZBzBsMvw=; b=mF5/2Idf7zzTBkBNpI+3Xjsx2P
	AKWbwk9ctLI4ED4Gvp6rdmcNSONLyM/Y3gFYZEYj0ltt4tero1J3QGz5iAnsjTcxaxizcu/UNfwcT
	1t8jKVs9kKZC1SVPsCtL8Qc+8mRnaoU+E2tr2d1ouVEfexSlUAin3HZdHBjUfBi63aEyXq4WBeZpd
	b1BqWJbtQCc1vGM+9+ErmmUJFNOq7rO1NQ/HVYq681mSY10TPeAMvZAx/sMdZlsk3agNUoNW02QSG
	lDIgj5eGJYAaxs7oy0Ul1fVJN/a8iJpgoj1NhjRRgSsLWMMeHzR/iim6eq+v+dh8NYIUGmkazd40D
	2i5V016A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu1W-00000003MEw-3DjR;
	Thu, 09 Jul 2026 19:03:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu1C-00000003LQz-1x6a;
	Thu, 09 Jul 2026 19:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rhBYvWOF+cgnaRqQxrykGk9N0o0tzWLbopxZBzBsMvw=; b=UpuJvMgly+nMNgyXx4tzJvHQP1
	71e1euzq4eKSsAI7jBNtUiSo2g757PFwSzxSVkWAoo+aQaLKDlIjl3s8AZs4kKl3v8Xx00+vEECjN
	z3oSXlliTYmcUGo+PwIfcUSGA+PL+qvEc+mWA5RzFI7xP9JxfDpcmqjX2gDGqaqAR8/3A9UFPZVol
	8zKaWVF7BmDYgIQPAYkUcHUm47ntNWRltMwmvLAQJqr3cJoqhR8zlCn/HnREDGQC3LJGKnvwA8nUy
	Hkr1TIXc6oECmDQuBrVok8lHn0FUnLyvMoTxsB0CXlvvQmRPMXfMu1DACHe+RF2x6O35jna3ftES5
	Xw7ufFdw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whu18-00000009TL8-2gxg;
	Thu, 09 Jul 2026 19:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623750;
	bh=DGHAo+/yHQUfg6E5xfAgVJta4NhbAYv3HkIdYgaZpOw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lopJJ5AHuKouoTNzHcyTqRSZ7z8bmvR2Fcn7SmPkmLiUW9B7lIXsg5huUp3Kj3Reu
	 uJx7rbHy/CrGkvtLSEwe6IzYN7dF0HnpOUDJ6ObWhh1kAm78EkELZJgezJ/5bjQXa7
	 ifOuqOAc1UHYUndEcdLo8yEdJxGwUFwfpoNntGDEKGVDJLL+sFdS5JKComQXOqiRoc
	 baETDzyieNtoi8uHl9C6FtAgcCmAyL1OXf5X6Lkgzf1bYfeV5rA/b86onbyyswKlyR
	 E9jOYJC9gaXIxc/erwQDnevefRdVCuZxVIspKzT9kulnkcN5022HjrsyylC995/xYu
	 pDC3G4vu9I3SA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 75EC817E0FD0;
	Thu, 09 Jul 2026 21:02:30 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B6C6E480052; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:37 +0200
Subject: [PATCH v11 14/36] phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-14-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1546;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=DGHAo+/yHQUfg6E5xfAgVJta4NhbAYv3HkIdYgaZpOw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8ESAQQua4/zB5iwqfA9ypzmbw69wV0fJH
 tKQb/3/wXDjXIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BEAAoJENju1/PI
 O/qadgUP/20Azt8oEyXceQjrgd3jsT3KZfsz9W0W56qmf5ifW7w41nZc3s4RnrQ4WrSQ+d/+DYR
 NbURzVPue4sB0+aQiDn1DOFHEFAWydZ1CWRkpaevbKSPevYPEEjKuDpDmtS5pUg5uTFx+S2AmG9
 dnvcpxsliUKGSxeILGJuAFO91vfAL8mZYcPswHJQA/IM4IB4yop+oC5zUUw91BpzP+6yZ+Swqit
 ysN9jbfLCbxWveTFXRVzsLaJpo6rH0YPrGXQPPWIRK4DFPB8hePHrYhZXOZjOAXQMU1YL0GAhi7
 Z1AKE7x7BUrFv07Z59KesnUAmeD1NqIKAONHIQiezALbDM29Newjw/VtoB33KRN7ilJSRGvGuGO
 UVgS/RdRtaGoh1Sz08LemNIKPegeWCeucQ9xTJ1K2KqntbJXYCPK9t//uCY2x5N7uhy3aY6kM9R
 2ZrEdnLSiFTiUKHMn6y8D4QD6/HbKPJHP+7UrlyufDPnoodHtzdIge0QBTsi5Y6wGAeKC69yUVG
 fJA7f0NmYVcfIzjnQXfl8gYN2WhMJ7NjBtTur54IhRBg9F4qVhHVWZ3lOGSATn7y4C6L4lqVqDI
 5X+dXvEq2A10fVz+QNbrfMHARSOuyBZgkCE+8ktUqK1jzf/UPUrL2klJJhEdA6JGR2FGMFi8Iv2
 Sd59vkJZb0/jtsWuxvaEqxQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_200239_090253_2B3A633A 
X-CRM114-Status: GOOD (  11.60  )
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

Cleanup code by replacing open-coded version of FIELD_PREP_WM16_CONST
with the existing helper macro.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 7fb864a1486c..05593e98c16d 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -12,6 +12,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
+#include <linux/hw_bitfield.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -75,7 +76,6 @@
 #define TRSV_LN2_MON_RX_CDR_DONE_OFFSET		0x1b84	/* trsv_reg06E1 */
 #define TRSV_LN2_MON_RX_CDR_LOCK_DONE		BIT(0)
 
-#define BIT_WRITEABLE_SHIFT			16
 #define PHY_AUX_DP_DATA_POL_NORMAL		0
 #define PHY_AUX_DP_DATA_POL_INVERT		1
 #define PHY_LANE_MUX_USB			0
@@ -104,8 +104,8 @@ struct rk_udphy_grf_reg {
 #define _RK_UDPHY_GEN_GRF_REG(offset, mask, disable, enable) \
 {\
 	offset, \
-	FIELD_PREP_CONST(mask, disable) | (mask << BIT_WRITEABLE_SHIFT), \
-	FIELD_PREP_CONST(mask, enable) | (mask << BIT_WRITEABLE_SHIFT), \
+	FIELD_PREP_WM16_CONST(mask, disable), \
+	FIELD_PREP_WM16_CONST(mask, enable), \
 }
 
 #define RK_UDPHY_GEN_GRF_REG(offset, bitend, bitstart, disable, enable) \

-- 
2.53.0


