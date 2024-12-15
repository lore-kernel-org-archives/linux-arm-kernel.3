Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3CEE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 17:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gO6j8jr1nt82x5lNiGcUCtdj/U0RJroGhfhdM9wZl54=; b=Ho0F6Ka09wMb7WDVJoYKJFGhet
	S0fw5J/gLAIkrP+CNdgbImN42zPaXgKNblnH1pOzAU3EwJ89122k1tQO4Wrf+xRpCxpoOXsZeHB0Z
	hRoFaie4gnaYyh4DtS9IvL0piGj9ppRmJ9htJAmbZ4L/wuVi+uYzxE/EzrbK/Ly0zfpbg/fmaUgta
	eThKKxQzLZgnFs6hCbRSQj51rZOdD/yTl/tlOY1OnUs1+WCw/VuBTXTgTnKBPNi2Wne/QKUa+JtID
	75XazrnUDb7mvNNu/NOdpiRqurcPKXtMspLqBEBQ5y4fQQMF3RviAWWU4OmKlAclIlY2je3/45wab
	9HITF4XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMsAK-00000008CT3-2EvN;
	Sun, 15 Dec 2024 17:12:24 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMs8D-00000008CHe-3Su3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Dec 2024 17:10:15 +0000
DKIM-Signature: a=rsa-sha256; b=Dwwnwsi/P9XgTOdSdIr7ZKC5V2Lkq4H8UPWGssqGubAD5sqyC8UsBxgowIBWCCmSz/IUEIUtz4QvXSwPsKGBD9BRewG5AhDcoUsA0FZFQVeemZ1ULTM8Va+lBRIvFQb0uFa4+DmwjBGwD3CtuE/5G+KtAEdxSpbUUIQPf4FwpqYhkv/kjepTEG+Ux7Metm3ebgAVgheLt/yhRanYRQ1ikB3CLBf+VqmeaX+QfuBOfE2aq7QgCD2w95yujZe6blytD88OB79GkeKJySAg97S3DVpBXOcWyFG4nMyRzMAARiHxPuaMXB7AZAhXHB3qeSt2X9Ep93BUccf/EJtDddX/bw==; s=purelymail3; d=purelymail.com; v=1; bh=Xqqch/vhNEgGYAn/i2LGTac53RcxdOr6D+YPPMY4tLQ=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1363280443;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 15 Dec 2024 17:09:56 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] arm64: dts: exynos990: Add clock management unit nodes
Date: Sun, 15 Dec 2024 18:08:03 +0100
Message-ID: <20241215170803.1756850-2-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241215170803.1756850-1-igor.belwon@mentallysanemainliners.org>
References: <20241215170803.1756850-1-igor.belwon@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_091013_954641_21287CB2 
X-CRM114-Status: UNSURE (   8.04  )
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

Add CMU nodes for:
- cmu_top: provides clocks for other blocks
- cmu_hsi0: provides clocks for usb31

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 28 +++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dt=
s/exynos/exynos990.dtsi
index 2619f821bc7c..d6a8c04e6602 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -5,6 +5,7 @@
  * Copyright (c) 2024, Igor Belwon <igor.belwon@mentallysanemainliners.org=
>
  */
=20
+#include <dt-bindings/clock/samsung,exynos990.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
=20
 / {
@@ -199,6 +200,24 @@ pinctrl_peric1: pinctrl@10730000 {
 =09=09=09interrupts =3D <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>;
 =09=09};
=20
+=09=09cmu_hsi0: clock-controller@10a00000 {
+=09=09=09compatible =3D "samsung,exynos990-cmu-hsi0";
+=09=09=09reg =3D <0x10a00000 0x8000>;
+=09=09=09#clock-cells =3D <1>;
+
+=09=09=09clocks =3D <&oscclk>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_HSI0_BUS>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_HSI0_USB31DRD>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_HSI0_USBDP_DEBUG>,
+=09=09=09=09 <&cmu_top CLK_DOUT_CMU_HSI0_DPGTC>;
+=09=09=09clock-names =3D "oscclk",
+=09=09=09=09      "bus",
+=09=09=09=09      "usb31drd",
+=09=09=09=09      "usbdp_debug",
+=09=09=09=09      "dpgtc";
+
+=09=09};
+
 =09=09pinctrl_hsi1: pinctrl@13040000 {
 =09=09=09compatible =3D "samsung,exynos990-pinctrl";
 =09=09=09reg =3D <0x13040000 0x1000>;
@@ -245,6 +264,15 @@ pinctrl_cmgp: pinctrl@15c30000 {
 =09=09=09compatible =3D "samsung,exynos990-pinctrl";
 =09=09=09reg =3D <0x15c30000 0x1000>;
 =09=09};
+
+=09=09cmu_top: clock-controller@1a330000 {
+=09=09=09compatible =3D "samsung,exynos990-cmu-top";
+=09=09=09reg =3D <0x1a330000 0x8000>;
+=09=09=09#clock-cells =3D <1>;
+
+=09=09=09clocks =3D <&oscclk>;
+=09=09=09clock-names =3D "oscclk";
+=09=09};
 =09};
=20
 =09timer {
--=20
2.45.2


