Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81126C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 04:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=swqV9OkZUZK5n8fVzKea7zlEh5+bBS1TUXycwoDYO2E=; b=d7ofLPCJ8hl/wuHgFUZ+T2uXWb
	ijdUVUCVcDUR+BktYJDoS3h8j+B9k9kyp5PUah/0LOOd/wTanA73WY0PgCTlQRvjdSzTvUIIQRr0g
	46441Eg55jIh1Ct6BT5rpGGsCus3B99odcWSN9XEwm440vhHOgLy6wp/nwdSAy1lLntK2G3r6XSVT
	6wqNeilbJxZcFMZD72o+SDjwGvn7TQKSNpTkLc2u+MXCtuplE+nUXIqiYjEhrPfB1/qTgL+ZRtPAw
	N0NysSSVuXVwoQXrH8ofaK1nI+LhrQPJI4mdJDpeizHiKCgk6pfhxS/ZBwQUgPyoxaUb6ce4qb+20
	7DquL3nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyirN-000000008UM-1HUY;
	Tue, 25 Aug 2026 04:34:05 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyirC-000000008Km-1KJj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 04:33:55 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-383cb94f742so4512400a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 21:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787632434; x=1788237234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=swqV9OkZUZK5n8fVzKea7zlEh5+bBS1TUXycwoDYO2E=;
        b=YzH7YQAb2sulk9vEgdRaLRR/BeKt1mw4x0IzzYaw9xGHxMC63X80ZlDoNJWbR8iXiT
         a4b2nD2eYdeQ/TaS1iSsYlpD3f5tue7kEBLEjrJkAfN6KW3Wxfh1yWsXpRktlsgPoBnz
         uY7VrueQxpH1pVOaa/bxUCbKKj9AbjWigKzQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787632434; x=1788237234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=swqV9OkZUZK5n8fVzKea7zlEh5+bBS1TUXycwoDYO2E=;
        b=tYPDkrJzN2Mnc83FpIrgVVl2qKKWXWLzhsST4VPeaDQXUKsLOgX+EgNFxryI00EZoc
         HcngcMBBm6UWgya0sZtiV/eEkGwv3vzzvthLD6SThXSO04g2hq+Hg/d8EDp6GgDohAC3
         FtnqK3hAm8wBUbpaLSWviDwcRpPWxbyDiLh9MUDljgo+osjExMLQMFGFBOnjzOcRi3qk
         F7z3rJeaeFs4bGN3T/jQhoRDYa2bYqin7J4SUH+PJwZB3nk7I6/4dY6rDpzQ3ESX2koM
         mY3win3txqKfdd3d67LfgxLufPPw3yJd+I8X5SQxU/ImCG9fpdw2I1g8HgOZmyxjpv/u
         4w4Q==
X-Forwarded-Encrypted: i=1; AHgh+RqBF3Bkww3kOT3+FoWiMHZe8edU5FghEhTfMwd0aBRON5V0gJd1pkO+CG6f8pRDnyGHpSn1YAzdEfkSWgn5/VaZ@lists.infradead.org
X-Gm-Message-State: AFuF++kiLP2o4QgTU9rv13MOqoYL6KtokTIebtOecqzs8KVmhNCFacCg
	/CtXwHDp5VwdaNxW/jwudTW1QJxMTeRl4KAP5G68F+2XJGmZe4gwnrR0BEnaXyrXgg==
X-Gm-Gg: AR+sD13hs1wsHhJsUiL7Qgmt3XzPpD4VEO/12LTDSjt4COwpnEzwcqRUUOrR1NRc2X0
	eSjV6+hQVBgp6Hv1oxLKdfcXqYIGBP5Gp6J/AAH0sayTa071iJi+fsNrwgOz2D27z1XFKbOYVz1
	VWWO1viRii5+cz/FNrEhZxWWPgc+fDpZ5Mrtc51wL2TsL+gOx5i13wJ9EaY7HBenCU5mpwF5ZRf
	ZtjtBxGGsONxAcwWIcEua9Ybfo6at8OPWCeVBIn6uqyWRPofjp2NztHY3ddprG6nYQiREnnh3LT
	uuGaa83XNQlBk2WsU9FMXnr2mFGYfEkwtIOIaDkl232VHBULjjEbTDsLJaJyQfe4Qqb2G22ICkU
	FaBi/W2W5t/7/OJ+1+Db9UWtSaMJzbCBy3LQ7tovJcdUzrD4he1QlA8HXBQ5lheOjrKPzda0UiZ
	asWqaQDEdjYjCwl3h+h3vme5lPNaQ2NrsKxRRKqBXludx3J8D1owatCg4U9iO31y/eh3f6+KuFK
	3E2V4YimHfoTxOjdGLByf2Zngi1WhioMov1+xhbU3KcCgI=
X-Received: by 2002:a17:90a:d44d:b0:38f:bbc:6a0f with SMTP id 98e67ed59e1d1-395dee7e2eamr44794746a91.1.1787632433680;
        Mon, 24 Aug 2026 21:33:53 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:a442:9780:24da:cb4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396458212absm2187823a91.0.2026.08.24.21.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 21:33:53 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/7] arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as always-on
Date: Tue, 25 Aug 2026 12:16:24 +0800
Message-ID: <20260825041628.988369-7-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
In-Reply-To: <20260825041628.988369-1-wenst@chromium.org>
References: <20260825041628.988369-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_213354_366108_E03B67FB 
X-CRM114-Status: GOOD (  18.08  )
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
2.55.0.860.g4b6b3295ed-goog


