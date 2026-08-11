Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D650C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 12:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0/BWpZ1mHkr6NJqOIKhKHqUTotk7EFya8FeeruKRfI=; b=SgNr/WmFgUQ9nL1wVqwUhiTrx3
	rxrJMwUD1kECkmvGG9Wgmn65XRulGjU6d/o19piPAZIbJidvIl2tHosL3J5ZQ/1D6uKNOMlFoR4LL
	wLOpSbTtEZxxB3idwBzQ8a4QkIz/0t70HLd3V3MaJvdFsdT/abzYQET/KZl4ZUIHRcD8qxI+lPRBV
	bbF47RO8rIzsT6fMrCw1nZ+O5porjPAtOM6uH/aLFCCWt6sKjuNWMGxKPIJGhetUkJXqAmUEFBCsg
	HmDdELSQ8rP+uAKKUp66Ik9WyMg9cVI2XxjGQWD4N1a4Z2lnI8sLyFqLXSqdDDt09tRNuBZRcs9Yg
	AN7yvlfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlUC-0000000E0jK-0Ddk;
	Tue, 11 Aug 2026 12:21:44 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTk-0000000E0Oy-13Ug
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 12:21:16 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso2205091b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 05:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450871; x=1787055671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0/BWpZ1mHkr6NJqOIKhKHqUTotk7EFya8FeeruKRfI=;
        b=nvXcQfZNC2Klng8uez+pPdplQ+rCb7dVRzua1LOdHi/7mLViiaJjfAy114fcNiUt+m
         yJ0kXPA+c3j8uCkJMF0uO40IM9bgjcWoakPeJkwrfNdUIi6DUuIzNqFLciRGEE5M0hYv
         cuGlkFCPpEqOHwUphXQJf+5fpX1gAeOr7Hgao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450871; x=1787055671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V0/BWpZ1mHkr6NJqOIKhKHqUTotk7EFya8FeeruKRfI=;
        b=bQRJHzCRs8P+uUaiQ6YqVEf+bD9Xc3wlz0k3Art7sitxTV7H79XxI42DyDiF7GUnyh
         8qSwZ3ZgVPYACSW6Kh5qHfNvHKgwmArWC4WIsrCVpA/3LfRi8SFEZx9fGU5bXAPVL5B8
         YQXjt/PSD2WSu6j380rmPPHIUDnAwMNboZLTzVwe2WzyIaCprG/HTsq9nCSNVISk2Zwb
         +TRtbnld5z9WJKaq67nvPOR1kli3GdcUeZBTU/XiqvU2h+350z2XzaD0v5nBT9hTadjh
         2q46QmXU58Oxqx9J2HasQZAi21TRYgwHavEgp79TbpOdyME44T3XoRWIxHKTi4hpnntZ
         cjWw==
X-Forwarded-Encrypted: i=1; AHgh+RqVFMHpcPJtE5mnVVq+zVpeUYaTx+Wlf2wtPRdpatfE0QuD3uLNQQ+v4OOrrocVck+HPXEjvN066yi01DMzDtD3@lists.infradead.org
X-Gm-Message-State: AOJu0YwixDWnvOQgGbRvOn20SLKHKsyQvZ7o+uYNYrUXfav6lIo4O1RH
	zUJ6jbEzUcmY1uEm5aXYsb9SXI3uJYGz2kz5udAmH9+uP8mvqleORQqY71UDB6JQiQ==
X-Gm-Gg: AR+sD101hj/8EaTUkIYxdk+JtLM7Q1995VSge+Y0iiEnFlEiYfNMQB7xh5LIQUKH2UC
	W8S8YsF6OMBzUeTKCBLLIHo5lrJr059a8rfmaJ0R1WaytgF6BgHp05IvuYScNWVdCqNeKrf0Rx4
	Zj30Ui//ExQ88+rn99A9vjXes+AGBqxgoFi5N1h4GgGsUa/Bo7Azf7rXZ7Z2XimdtTRgMZdTJkZ
	Klrwte+memnHykl2m+cP1Y6itLWOyifQaMeZ1fdO1qitr7/UGlWchjQ3zIbRULOvZtkrvTRp4tN
	SMNGLnN63gdrFb5HY0v7MnHNDAwoDMDAA2gGIXFwfp9kcdFUbMkiT5CmxHxKjYEceWHS3X+A6dx
	zbDZD2bWvyTF29R4TXtMPI7OIWP/XwMtIV9AAU29OIg04XEUUTYICJkSixLptaS6aoAeb0yR+qr
	hZ5oHqjNdMHUw56A1B02IYsCitJh6/IlB1HFd4C+BtLB5iNIDVjlxvA+biht3Au4CoIhy+PDul1
	YEPYQgzE487kjxKpKPbuwznBYtkEs8dYh/gO7vd5N1Eyg==
X-Received: by 2002:a05:6a00:17aa:b0:848:2c2e:c79e with SMTP id d2e1a72fcca58-84fa86e19e7mr2769479b3a.12.1786450871439;
        Tue, 11 Aug 2026 05:21:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:21:10 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 8/9] arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as always-on
Date: Tue, 11 Aug 2026 20:20:08 +0800
Message-ID: <20260811122011.3539250-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
In-Reply-To: <20260811122011.3539250-1-wenst@chromium.org>
References: <20260811122011.3539250-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_052114_701134_05856BA4 
X-CRM114-Status: GOOD (  18.23  )
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

Up until now, the MT8173 elm/hana device tree has set the dedicated
regulator supplying the trackpad as always-on, simply because the Elan
driver was missing proper delays. As a result the delay for the
Synaptics trackpad was also omitted, as it was not strictly required
under such a model and delayed the availability of the trackpad to the
user.

The Elan driver recently gained proper delays after power up, with
opportunistic skipping of the delay when the regulator was originally
on. The I2C HID driver gained similar opportunistic delay skipping.
So has the I2C OF component prober library.

Now fix the device tree to have the regulator not be always on, and
let the I2C HID device have the correct post-power-on delay time.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 8 +-------
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi      | 1 -
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index 1004eb8ea52c..b9e311fcd9a0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -62,13 +62,7 @@ trackpad2: trackpad@2c {
 		pinctrl-0 = <&trackpad_irq>;
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
-		/*
-		 * The trackpad needs a post-power-on delay of 100ms,
-		 * but at time of writing, the power supply for it on
-		 * this board is always on. The delay is therefore not
-		 * added to avoid impacting the readiness of the
-		 * trackpad.
-		 */
+		post-power-on-delay-ms = <100>;
 		vdd-supply = <&mt6397_vgp6_reg>;
 		wakeup-source;
 		status = "fail-needs-probe";
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index a0573bc359fb..6b9f47f515c7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -1093,7 +1093,6 @@ mt6397_vgp6_reg: ldo_vgp6 {
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-enable-ramp-delay = <218>;
-				regulator-always-on;
 			};
 
 			mt6397_vibr_reg: ldo_vibr {
-- 
2.55.0.679.g6767b8d81c-goog


