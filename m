Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5434BE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 12:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqgSKCLUFZKYyRk2IYZeinDp88Cy9cPcZFJ0oZWHxv4=; b=0Qqr7DTF1VDMQ9X0zQ7oF1DaXN
	ixJVtLVbcxS836rsKI/OuASkFMT58QUjO9gI3NlK68BwuBRkQ4f0aa4o8mbhtKHT/Y4vKtFTYhsgU
	DffZB+UVIRDZAU05ErCaJ2bzD0gYYUb6co6jQKV8xeFZRzJVi5jFfSUItpDtkOyequOGdlmk/A/Pj
	mrYBIkGV71nBr2kmIck9KA5kxP5cHebmf98CW4DiNyKh8pMLqI+5liiXrw9DNxe2sSz/jaaUiLMKV
	4VeXeD6L6icAlXGPRwdDMxtVPMFJfYnAenpNs2+48frOgnCHpGT5on6j6tYYhiHkvjhAbPNBnZAv3
	IJ39fZGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFq0-00000001q6I-11uC;
	Thu, 19 Dec 2024 12:41:08 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFk5-00000001od9-0eUY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 12:35:02 +0000
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1tOFk3-0007aQ-TF; Thu, 19 Dec 2024 13:34:59 +0100
From: Jonas Rebmann <jre@pengutronix.de>
Date: Thu, 19 Dec 2024 13:34:56 +0100
Subject: [PATCH 1/2] arm64: dts: rockchip: MECSBC: Remove i2c2 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-mb85rs128ty-mecsbc-v1-1-77a0e851ef19@pengutronix.de>
References: <20241219-mb85rs128ty-mecsbc-v1-0-77a0e851ef19@pengutronix.de>
In-Reply-To: <20241219-mb85rs128ty-mecsbc-v1-0-77a0e851ef19@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jonas Rebmann <jre@pengutronix.de>, David Jander <david@protonic.nl>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=976; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=SfUhCKWfnMwqxaoHNh+0OxbNh7oug+ykcNz4u6yGGJU=;
 b=owGbwMvMwCF2ZcYT3onnbjcwnlZLYkhPEfrEcz8rQFRfZW3HfDX9tWE7ecwbdQSNK55GHJpx4
 1heWWp/RykLgxgHg6yYIkusmpyCkLH/dbNKu1iYOaxMIEMYuDgFYCInPzMybOSZl+3jVdm6s+7z
 t4vegn4d+zQWPo5qj9pWZO+tH++gycjwI47pvYun2YeHR7n7VuwpmpMUZP3XWjCf38Hu3GPlDVI
 sAA==
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_043501_220046_9EB2CCF6 
X-CRM114-Status: GOOD (  10.65  )
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

From: David Jander <david@protonic.nl>

One of the pins of i2c2 is actually in use as chip select 0 for spi0.
The chip select 0 is used for an FRAM chip, which will be added in the
next patch.

Remove the i2c2 node from the rk3568-mecsbc device tree.

Signed-off-by: David Jander <david@protonic.nl>
Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dts | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dts b/arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dts
index c491dc4d4947dc460330847dede052b1b25ba86c..ca041b4d2d38a4e06cd0a54a806fed2ab723c94d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dts
@@ -206,12 +206,6 @@ regulator-state-mem {
 	};
 };
 
-&i2c2 {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c2m0_xfer>;
-};
-
 &i2c3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c3m0_xfer>;

-- 
2.39.5


