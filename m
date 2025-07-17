Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797FFC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 10:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YsvJzJZksMHyPgxlzp5g7bmyBUFLA7czr+FzeFnmb+0=; b=1wR3D3szY1nroSNM6d0+/d0aOq
	nbGpvMChucxdbZangU7S+i+gj2bx6ci6m4+77D/2EUBF7WlJpMaVErRX/+96W7Le+VFYj4Cv15n3Q
	crou7xiWEnDtFuyuHhwxuyhpzuv2uXO6+RH0g2d99sDi0K5BcUTcYXjPgYDcUDUtr80iBnGKrJ1Do
	iFGapjglAscXDt28g7HxSITUbvV9kcTpSkIe9mOC0kyZu6AHl46P1UjcziR5esqs8evH0Lf1+i5uZ
	HvBiKOSSXKKMz3FOsoaFT8p8ne6wQ/TtP+kLw610Ukds+P9Azs1P8mnFh+A4I9KnZ4SExxYD8Phs2
	d3KGjGtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLz2-00000009rfp-3rj9;
	Thu, 17 Jul 2025 10:37:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKSY-00000009ekS-1qAj;
	Thu, 17 Jul 2025 08:59:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3ED58A577C8;
	Thu, 17 Jul 2025 08:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4059C4CEED;
	Thu, 17 Jul 2025 08:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752742758;
	bh=M7D/j07sXCiX3umOa4PmP/ROxTjpH2Q+J8kImyrBWYs=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=IGpASrfmw1FDQQOEgSJMncOd/GV51zSPjIHldeEP7xjxpylB5G7IgmZteNAjDnunu
	 Cckxgdn8xqJ+AChr43i5R3K+HKWRb3oqnWXum8ir/i4H4uNMHRMnouv6dLMPTGgY+P
	 jQcERLetqSEzWkoSqNNb3ibnknvwo56qllmIkunmKjMBXx/QrJtvObD/YUGn5sMIKO
	 h/sEzduEONXMPxGSECcvBbAPqDOqBgxGJ9aHCpBMewHYFA626Ly6ZaIKRd93CVPln+
	 MByC6YFIIfnQccqy4CRahR0LfSkbHk0tmgkraPngf6P7Tf3cMooK8gFzVo6/uaPHXw
	 LzTXHG0NHDpOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4EE9C83F1A;
	Thu, 17 Jul 2025 08:59:18 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 17 Jul 2025 16:59:17 +0800
Subject: [PATCH] dts: arm: amlogic: fix pwm node for c3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-fix-pwm-node-v1-1-45021777efa9@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAGS7eGgC/x2MQQqAIBAAvxJ7bkEFlfpKdLBcaw9ZKFQg/j3pO
 AwzBTIlpgxjVyDRzZnP2ED2Hay7ixsh+8aghNLCSouBX7yeA+PpCY2koOziBiM0tORK1Py/m+Z
 aP+a/zN9eAAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuan Liu <chuan.liu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752742757; l=1025;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=o5anEexAdJpsa2RWVePMFRWkvLxzPjZ8flBM5Edgoco=;
 b=WiA8ozMtVIYrzvTWtrwaxBiYQ1SRzjW6Ye/Tg8+39l0g9LF2BvFGboskS2qOMR+lmFFa8W+jL
 Wo+31HvFNR4DFp7Ch5eHYMjU1LfkqNrvMUZSOaxphRUWBHalHX/VvNz
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_015922_553583_124A9DD4 
X-CRM114-Status: UNSURE (   8.28  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Fix reg address for c3 pwm node.

Fixes: 431a5281e701 ("arm64: dts: amlogic: Add Amlogic C3 PWM")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Fix c3 pwm node reg.
---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index cb9ea3ca6ee0..71b2b3b547f7 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -792,7 +792,7 @@ spicc1: spi@52000 {
 			pwm_mn: pwm@54000 {
 				compatible = "amlogic,c3-pwm",
 					     "amlogic,meson-s4-pwm";
-				reg = <0x0 54000 0x0 0x24>;
+				reg = <0x0 0x54000 0x0 0x24>;
 				clocks = <&clkc_periphs CLKID_PWM_M>,
 					 <&clkc_periphs CLKID_PWM_N>;
 				#pwm-cells = <3>;

---
base-commit: 58abdca0eb653c1a2e755ba9ba406ee475d87636
change-id: 20250717-fix-pwm-node-61ef27ba9605

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



