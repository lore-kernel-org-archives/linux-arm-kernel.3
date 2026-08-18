Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF5CC5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 08:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NgWdBFCBLseiBSl6XM4e9FMluiT3yCJkcVlKb8+Vu/A=; b=0uaOSOiWoAKQBcX7Hdxkd7RG0b
	E7ftvFPe0ydpOeSlCxJvikSGofcRzzTb9VfIUo3e/nWBAmh7RoOvh0K98hSOWetXieUzBJp944EyL
	PfhPEhh/21MA3bc+946qVnqy+jguokYYp8wi/guY71JRE04tnS8+1ubOEZYHnDJC16Zq+M9OCKJC1
	EbighT2WmRxDouURbEPG17QO9r1yNKwvreo4TvTECSBCUy6AMOlhc7yjzpgKRQUmHivgZ4s2ZYSRE
	/EYDLv/BRWzubuQGS4FM1PIn3w8H0gGJ7DuWZsv18mwVKAwI8LUZaFyWR67wiOYX+cCYFAH3qRghJ
	kYC9j+XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwFRR-00000007XpR-0JdS;
	Tue, 18 Aug 2026 08:45:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwFRP-00000007XpG-3HVl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 08:45:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 89CC3419B3
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 08:45:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 425681F000E9;
	Tue, 18 Aug 2026 08:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787042703;
	bh=NgWdBFCBLseiBSl6XM4e9FMluiT3yCJkcVlKb8+Vu/A=;
	h=From:Date:Subject:To:Cc;
	b=XWpoTsNUweyjd48vZKYbitbipNx8UoWm5NgnWdulIUyGHNXeTZcbydAjvTFI2B0tL
	 AFLTQMtW5AbxK5fq9ORLuB+G5v4dUjkZsIWmCjDZ0wbFj+Nk3TF4pOO8XoHsaSTXx+
	 LcBdCyo8KGBbAb/6MHwWym1K7tivcWbOQ7zD8IBjUE9LdCboq+EBdkqQRyES0xeoRe
	 fqlox+r9TEmtiUHNANItFHnEuH43nCJmK1Xp4+Xs+hSwSedNf6W4GB5mXaxWaWb/Qw
	 oRoEPW85dkYefN7SzkcwbnNYrRqIgtAgE7ZaEMxzl5tpT3aJsCvDe9RrlKZmm/PieC
	 a4B4tzKpaWydw==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 18 Aug 2026 10:45:00 +0200
Subject: [PATCH] ARM: dts: ux500: Harmonize GPIO key names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-ux500-dts-golden-voldown-label-v1-1-3edd581b09df@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQqDMBAAvyJ77sIaqKb9ivSgycYuhKQkGoXg3
 xs8DXOZqZA5CWd4dxUSF8kSQ5P+0YH5zmFlFNscFKmBdK9xP59EaLeMa/SWA5aGeAT088Ie9eI
 Ujy81GnLQIr/ETs57MH2u6w8UHPrWcAAAAA==
X-Change-ID: 20260818-ux500-dts-golden-voldown-label-8bf2e7927c0f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

U-Boot want to use the volume down key for activating fastboot mode,
however the code there relies on using the key label, and this
differs betweem Golden and the other devices, so harmonize this
by using the same label as the other devices.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
index f736888474e7..12f5a13ec77e 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
@@ -391,21 +391,21 @@ gpio-keys {
 		label = "GPIO Buttons";
 
 		volume-up {
-			label = "Volume Up";
+			label = "VOL+";
 			/* GPIO67 (VOL_UP) */
 			gpios = <&gpio2 3 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
 		};
 
 		volume-down {
-			label = "Volume Down";
+			label = "VOL-";
 			/* GPIO92 (VOL_DOWN) */
 			gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEDOWN>;
 		};
 
 		home {
-			label = "Home";
+			label = "HOME";
 			/* GPIO91 (HOME_KEY) */
 			gpios = <&gpio2 27 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_HOMEPAGE>;

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260818-ux500-dts-golden-voldown-label-8bf2e7927c0f

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


