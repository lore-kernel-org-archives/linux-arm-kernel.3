Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCD8E7AD45
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 10:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bk0rOfMw2htq0I/J9WMXZApsuJWmdAyLpTpuloIh10k=; b=MgzjCWPwTVyTWaBcbN5YF0fzYL
	WWPmuQvy+XkuW5BIswT+hXjcqmWwkR3a4R1xja8X9RfW0Zxw0Ku/AcInHvv30YYmQ0Bt+fAUhb2Tm
	wKKTDJfmCcpA2M3wL4S/o9a0Ga85CM5VNPpC8fviCuD1XswUO8tp1IZCOTzekmE9l+QAdJ8ZuTB0t
	rJ8VPIK1K6JVCpOY8Sm45ktmOKoYwsJ1Jw1Yx5anchVYnyMnIjGLnk0TJVPTuaW1crudgS6Cx3k3E
	GjcDc0zIHFTiBfgmXWbiPUXbmwAAoexyTJRNStbqgCi2Or0gxcrHSLUhgHFIzDanTF5x4rU1pypQz
	od66csRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYihx-00000000KOQ-2Bs8;
	Thu, 25 Dec 2025 10:36:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYihp-00000000KMi-1rEM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 10:36:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CEF1960149;
	Thu, 25 Dec 2025 10:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F97C4AF0C;
	Thu, 25 Dec 2025 10:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766658985;
	bh=ubywY0Cd6f05tTAqgCRIM7FpmCrB3B8Rsio5nl4gyuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kq1QTjvkZYgk/ImDvp5YiKcucNu6g05gsVwqUC3LdnhLrxiI/nfUgzKIvI/TRpPeT
	 6mqyUz5cOSTiwA1YuuRfJKkKbX8pz0x0oWhurq2FCb/4Yg9G787cjDvd8WeKTN1kJ5
	 nfCOQWshjvudaVTwpIKPqvXqd3bA5rlsNhSi2d4LAc/Jdj6Kp3S1PBJ987vZcqeEPG
	 h2/QFpGg7rS+krL/gjDEICEYhShK11jMLxe5rjpzV+8gA6zNbb9zrCS8PspIB2TmLl
	 xCaxf/A8OSme7k8wYxZftpap2foRuxo+/2TgFAjrHrIk5bbfrVb63PCNVuPFj4BG/T
	 cY4m6p3JJQ+3A==
Received: by wens.tw (Postfix, from userid 1000)
	id 661295FEC0; Thu, 25 Dec 2025 18:36:22 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linusw@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 3/4] ARM: dts: allwinner: sun5i-a13-utoo-p66: delete "power-gpios" property
Date: Thu, 25 Dec 2025 18:36:14 +0800
Message-ID: <20251225103616.3203473-4-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251225103616.3203473-1-wens@kernel.org>
References: <20251225103616.3203473-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The P66's device tree includes the reference design dtsi files, which
defines a node and properties for the touchpanel in the common design.
The P66 dts file then overrides all the properties to match its own
design, but as the touchpanel model is different, a different schema
is matched. This other schema uses a different name for the GPIO.

The original submission added the correct GPIO property, but did not
delete the one inherited from the reference design, causing validation
errors.

Explicitly delete the incorrect GPIO property.

Fixes: 2a53aff27236 ("ARM: dts: sun5i: Enable touchscreen on Utoo P66")
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

---
Cc: Hans de Goede <hdegoede@redhat.com>
---
 arch/arm/boot/dts/allwinner/sun5i-a13-utoo-p66.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/allwinner/sun5i-a13-utoo-p66.dts b/arch/arm/boot/dts/allwinner/sun5i-a13-utoo-p66.dts
index be486d28d04f..428cab5a0e90 100644
--- a/arch/arm/boot/dts/allwinner/sun5i-a13-utoo-p66.dts
+++ b/arch/arm/boot/dts/allwinner/sun5i-a13-utoo-p66.dts
@@ -102,6 +102,7 @@ &touchscreen {
 	/* The P66 uses a different EINT then the reference design */
 	interrupts = <6 9 IRQ_TYPE_EDGE_FALLING>; /* EINT9 (PG9) */
 	/* The icn8318 binding expects wake-gpios instead of power-gpios */
+	/delete-property/ power-gpios;
 	wake-gpios = <&pio 1 3 GPIO_ACTIVE_HIGH>; /* PB3 */
 	touchscreen-size-x = <800>;
 	touchscreen-size-y = <480>;
-- 
2.47.3


