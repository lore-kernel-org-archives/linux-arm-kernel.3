Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68E3CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 19:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	Date:Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5NIBzHXHLTvGZLCPYIRsSe5gBL+3KSRcfZdaGnG5L8=; b=AnUaVNasF01/r/eKkL1WXKcq4B
	37GAvKykF1zSm8cEEYFYBiOd4IgUmMsy7jF1xAfqkS1xZNMhUAVLaX4iMbz5Fz5c6fk5dW28kcb7P
	XUeNsNoVxgPVk9VR/exFGYkQOMsBLCVeBCoYgExITt79SJaIfRBjY10HyvNoTNhO/0X2v3dVIR6Qd
	yWqc+xlq+GOMfP95BPQQMYBBiiFZLRS8WOf7R0jr2U9PJHSobwE4+vvw2nzeOumUq7QS91Dg//OIC
	QTa/ilIIBvh9PMhOptRtQ8rz7uE4jC4q/TY4n6k6eKMsjIdmC+RvqbvL5EJ0BQIGwhR1LZ+ljnVrB
	pwnXWYGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxsSh-00000002357-30GD;
	Sun, 14 Sep 2025 19:32:35 +0000
Received: from mail-4323.protonmail.ch ([185.70.43.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxsSf-0000000233F-1hYc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 19:32:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757878351; x=1758137551;
	bh=J5NIBzHXHLTvGZLCPYIRsSe5gBL+3KSRcfZdaGnG5L8=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=y+6ktBAktvLZB6UsAV5Kka7ykU3Jin0T0AjwPEpSuiNo7PBrmi/M7bUYa69essK/2
	 rLad/rHdc94t03CGNmmrxY/UlOFGh4RggK1vbWneegD+RqHQPrZH6hHbWloWopumED
	 kS9JJytw/KeEHOW1mUs1tExyDia0nsueM+PDA2JM0FcFWOPbdVCK72XlNEG9bM5FJW
	 WAkGs8UHx6KQWIA/1Xz/d+8NI7wjUwEGRaIytbx67m9+6D8A3lls14ip+a3gk0jlmO
	 59Xa7lZ1QunHbt8c+8GnJbORQTzV3i3uXB2E4nPNge54TyFp3iLM1K+OrQSWAx1UoE
	 ZGPsJIJTKaVRg==
Date: Sun, 14 Sep 2025 19:32:26 +0000
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 3/3] pinctrl: samsung: Add Exynos9610 pinctrl configuration
Message-ID: <20250914-exynos9610-pinctrl-v1-3-5b877e9bc982@chimac.ro>
In-Reply-To: <20250914-exynos9610-pinctrl-v1-0-5b877e9bc982@chimac.ro>
References: <20250914-exynos9610-pinctrl-v1-0-5b877e9bc982@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: cc28947cc7670583934b18b156f78d8b64f0d5c6
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_123233_593069_81FB0CDC 
X-CRM114-Status: UNSURE (   8.74  )
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

Add pinctrl configuration for Exynos9610. The bank types
used are the same as on Exynos850, so we can reuse the macros.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 109 +++++++++++++++++++++=
++++
 drivers/pinctrl/samsung/pinctrl-samsung.c      |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h      |   1 +
 3 files changed, 112 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinct=
rl/samsung/pinctrl-exynos-arm64.c
index 5fe7c4b9f7bd424f396082f1b1b16bfb65f26cdf..a100962c51c28e2422c61a67d20=
faf03486f4f70 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -1604,6 +1604,115 @@ const struct samsung_pinctrl_of_match_data exynos88=
95_of_data __initconst =3D {
 =09.num_ctrl=09=3D ARRAY_SIZE(exynos8895_pin_ctrl),
 };
=20
+/* pin banks of exynos9610 pin-controller 0 (ALIVE) */
+static struct samsung_pin_bank_data exynos9610_pin_banks0[] =3D {
+=09EXYNOS850_PIN_BANK_EINTN(6, 0x000, "etc0"),
+=09EXYNOS850_PIN_BANK_EINTW(8, 0x020, "gpa0", 0x00),
+=09EXYNOS850_PIN_BANK_EINTW(8, 0x040, "gpa1", 0x04),
+=09EXYNOS850_PIN_BANK_EINTW(8, 0x060, "gpa2", 0x08),
+=09EXYNOS850_PIN_BANK_EINTN(5, 0x080, "gpq0"),
+};
+
+/* pin banks of exynos9610 pin-controller 1 (CMGP) */
+static struct samsung_pin_bank_data exynos9610_pin_banks1[] =3D {
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x000, "gpm0", 0x00),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x020, "gpm1", 0x04),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x040, "gpm2", 0x08),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x060, "gpm3", 0x0C),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x080, "gpm4", 0x10),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x0A0, "gpm5", 0x14),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x0C0, "gpm6", 0x18),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x0E0, "gpm7", 0x1C),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x100, "gpm8", 0x20),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x120, "gpm9", 0x24),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x140, "gpm10", 0x28),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x160, "gpm11", 0x2C),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x180, "gpm12", 0x30),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x1A0, "gpm13", 0x34),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x1C0, "gpm14", 0x38),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x1E0, "gpm15", 0x3C),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x200, "gpm16", 0x40),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x220, "gpm17", 0x44),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x240, "gpm18", 0x48),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x260, "gpm19", 0x4C),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x280, "gpm20", 0x50),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x2A0, "gpm21", 0x54),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x2C0, "gpm22", 0x58),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x2E0, "gpm23", 0x5C),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x300, "gpm24", 0x60),
+=09EXYNOS850_PIN_BANK_EINTW(1, 0x320, "gpm25", 0x64),
+};
+
+/* pin banks of exynos9610 pin-controller 2 (DISPAUD) */
+static struct samsung_pin_bank_data exynos9610_pin_banks2[] =3D {
+=09EXYNOS850_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00),
+=09EXYNOS850_PIN_BANK_EINTG(4, 0x020, "gpb1", 0x04),
+=09EXYNOS850_PIN_BANK_EINTG(5, 0x040, "gpb2", 0x08),
+};
+
+/* pin banks of exynos9610 pin-controller 3 (FSYS) */
+static struct samsung_pin_bank_data exynos9610_pin_banks3[] =3D {
+=09EXYNOS850_PIN_BANK_EINTG(4, 0x000, "gpf0", 0x00),
+=09EXYNOS850_PIN_BANK_EINTG(8, 0x020, "gpf1", 0x04),
+=09EXYNOS850_PIN_BANK_EINTG(6, 0x040, "gpf2", 0x08),
+};
+
+/* pin banks of exynos9610 pin-controller 4 (TOP) */
+static struct samsung_pin_bank_data exynos9610_pin_banks4[] =3D {
+=09EXYNOS850_PIN_BANK_EINTG(8, 0x000, "gpp0", 0x00),
+=09EXYNOS850_PIN_BANK_EINTG(6, 0x020, "gpp1", 0x04),
+=09EXYNOS850_PIN_BANK_EINTG(8, 0x040, "gpp2", 0x08),
+=09EXYNOS850_PIN_BANK_EINTG(8, 0x060, "gpc0", 0x0C),
+=09EXYNOS850_PIN_BANK_EINTG(8, 0x080, "gpc1", 0x10),
+=09EXYNOS850_PIN_BANK_EINTG(5, 0x0A0, "gpc2", 0x14),
+=09EXYNOS850_PIN_BANK_EINTG(8, 0x0C0, "gpg0", 0x18),
+=09EXYNOS850_PIN_BANK_EINTG(8, 0x0E0, "gpg1", 0x1C),
+=09EXYNOS850_PIN_BANK_EINTG(8, 0x100, "gpg2", 0x20),
+=09EXYNOS850_PIN_BANK_EINTG(6, 0x120, "gpg3", 0x24),
+=09EXYNOS850_PIN_BANK_EINTG(3, 0x140, "gpg4", 0x28),
+};
+
+/* pin banks of exynos9610 pin-controller 5 (SHUB) */
+static struct samsung_pin_bank_data exynos9610_pin_banks5[] =3D {
+=09EXYNOS850_PIN_BANK_EINTG(4, 0x000, "gph0", 0x00),
+=09EXYNOS850_PIN_BANK_EINTG(3, 0x020, "gph1", 0x04),
+};
+
+static const struct samsung_pin_ctrl exynos9610_pin_ctrl[] __initconst =3D=
 {
+=09{
+=09=09/* pin-controller instance 0 ALIVE data */
+=09=09.pin_banks=09=3D exynos9610_pin_banks0,
+=09=09.nr_banks=09=3D ARRAY_SIZE(exynos9610_pin_banks0),
+=09=09.eint_wkup_init =3D exynos_eint_wkup_init,
+=09}, {
+=09=09/* pin-controller instance 1 CMGP data */
+=09=09.pin_banks=09=3D exynos9610_pin_banks1,
+=09=09.nr_banks=09=3D ARRAY_SIZE(exynos9610_pin_banks1),
+=09=09.eint_wkup_init =3D exynos_eint_wkup_init,
+=09}, {
+=09=09/* pin-controller instance 2 DISPAUD data */
+=09=09.pin_banks=09=3D exynos9610_pin_banks2,
+=09=09.nr_banks=09=3D ARRAY_SIZE(exynos9610_pin_banks2),
+=09}, {
+=09=09/* pin-controller instance 3 FSYS data */
+=09=09.pin_banks=09=3D exynos9610_pin_banks3,
+=09=09.nr_banks=09=3D ARRAY_SIZE(exynos9610_pin_banks3),
+=09}, {
+=09=09/* pin-controller instance 4 TOP data */
+=09=09.pin_banks=09=3D exynos9610_pin_banks4,
+=09=09.nr_banks=09=3D ARRAY_SIZE(exynos9610_pin_banks4),
+=09}, {
+=09=09/* pin-controller instance 5 SHUB data */
+=09=09.pin_banks=09=3D exynos9610_pin_banks5,
+=09=09.nr_banks=09=3D ARRAY_SIZE(exynos9610_pin_banks5),
+=09},
+};
+
+const struct samsung_pinctrl_of_match_data exynos9610_of_data __initconst =
=3D {
+=09.ctrl=09=09=3D exynos9610_pin_ctrl,
+=09.num_ctrl=09=3D ARRAY_SIZE(exynos9610_pin_ctrl),
+};
+
 /*
  * Pinctrl driver data for Tesla FSD SoC. FSD SoC includes three
  * gpio/pin-mux/pinconfig controllers.
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/sa=
msung/pinctrl-samsung.c
index 24745e1d78cec59c932ed57fdb8ca85410376ff7..2036212bf3d079cc61f1827847a=
37025c12e0961 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1498,6 +1498,8 @@ static const struct of_device_id samsung_pinctrl_dt_m=
atch[] =3D {
 =09=09.data =3D &exynos850_of_data },
 =09{ .compatible =3D "samsung,exynos8895-pinctrl",
 =09=09.data =3D &exynos8895_of_data },
+=09{ .compatible =3D "samsung,exynos9610-pinctrl",
+=09=09.data =3D &exynos9610_of_data },
 =09{ .compatible =3D "samsung,exynos9810-pinctrl",
 =09=09.data =3D &exynos9810_of_data },
 =09{ .compatible =3D "samsung,exynos990-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/sa=
msung/pinctrl-samsung.h
index 1cabcbe1401a614ea33803132db776e97c1d56ee..c711580a8729d05edf5057e0c0a=
7fed65d692c43 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -395,6 +395,7 @@ extern const struct samsung_pinctrl_of_match_data exyno=
s7870_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos7885_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos8895_of_data;
+extern const struct samsung_pinctrl_of_match_data exynos9610_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos9810_of_data;
 extern const struct samsung_pinctrl_of_match_data exynos990_of_data;
 extern const struct samsung_pinctrl_of_match_data exynosautov9_of_data;

--=20
2.47.3



