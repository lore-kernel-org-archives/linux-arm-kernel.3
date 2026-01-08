Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D716BD232C3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 23:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uaUygdp8Qaksb9PlYCaqN/ZkAvongzDotSyp0Bvv+80=; b=Uyh3LYb5jsx8atjHEAIYtRD1CB
	5RdEg+01yoJRZk7r+bMnoXh+blel17jCdAI2B7/iiiS/yWaUEKaB0EkN+8G7nBK9WY/l7eswzyCKq
	ZjX4lyAVgC2SGs5+LlulpZK9bHOu/zzwfVdcHRy29JaxWQXhBsxJ4qVK34En00HxOV7Qec8B0ZTfp
	N5HX3CUrSGJVC+T+c6M6l+L9wDB0aFJsTKpqEKsR+bwUn3KbH3ZwHMUkT8yph/Qk/xiuWiotGP/s9
	zci1ADloOeNtm+DJHzziPDnmBCg5DsmLETzmKnpMiVLClMTFOdeItNSlIn6LwUlIKvzYJmS1qeggv
	lTHXXW6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdz5M-00000000ybR-2cfr;
	Thu, 08 Jan 2026 23:06:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdz5K-00000000yZy-0JWv;
	Thu, 08 Jan 2026 23:06:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B0011434B3;
	Thu,  8 Jan 2026 23:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41775C116C6;
	Thu,  8 Jan 2026 23:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767913589;
	bh=ABBMH1UHHf+tRlKLCHLUwhxw0iM+Uf9Jba+4eLCHBk0=;
	h=From:To:Cc:Subject:Date:From;
	b=HOshuotxq+DVquM67uUimF5/XIr5Vu0XCZ5UA+1D2F+sCbh8Tkd3w/uONYBIF2FVx
	 oII7o7lQh4L7AGNP3QuEyfPGHgQl8j8tIiP2qtmI2O8SbOR5t7VWZkqJy9kyYTXcf3
	 UV9YxgwcSEaVsbdTvqSv0Wpou5hZf27mpdhotwF2DbbHguGywrJgrI1OdvokHGzjBQ
	 zlBpZNy1lEjlxHmE67FUb5ETvJL9iIqZHc1XElnXFpN4p3ecaXnnmZvxZ/uYjkBLDr
	 vMFm83JEA+17E3wwVp7upHW4y73Txv4dXUuFZDbB4fszBjnnZxDBIMFieE/hNTEGfr
	 Rzggp8PC9haSg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Fix gpio pinctrl node names
Date: Thu,  8 Jan 2026 17:06:23 -0600
Message-ID: <20260108230623.1349310-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_150630_131158_8DE056BC 
X-CRM114-Status: UNSURE (   9.95  )
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

The pinctrl node names "gpios" or with "-gpio" suffix collide with GPIO
property names creating false warnings. Add a "-pins?" suffix to avoid
the issue.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi        | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index 587e89d7fc5e..8299e9d10c7c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
@@ -483,7 +483,7 @@ &pinctrl {
 	pinctrl-names = "default";
 	pinctrl-0 = <&q7_thermal_pin &bios_disable_override_hog_pin>;
 
-	gpios {
+	gpio-pins {
 		bios_disable_override_hog_pin: bios-disable-override-hog-pin {
 			rockchip,pins =
 				<3 RK_PD5 RK_FUNC_GPIO &pcfg_pull_down>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts b/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
index f95fd92d58ba..d9ff777b4913 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
@@ -537,11 +537,11 @@ pmic_int_l: pmic-int-l {
 			rockchip,pins = <1 RK_PC5 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 
-		vsel1_gpio: vsel1-gpio {
+		vsel1_gpio: vsel1-gpio-pin {
 			rockchip,pins = <1 RK_PC1 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 
-		vsel2_gpio: vsel2-gpio {
+		vsel2_gpio: vsel2-gpio-pin {
 			rockchip,pins = <1 RK_PB6 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 	};
-- 
2.51.0


