Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532DD606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 04:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=azsDktKb;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=q7kxIaTA;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MVscMG3x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zgiOgJde8AO2Ant4XAq57iC2YxxS16EtAa2Unl+I3/g=; b=azsDktKbOjCrPD
	jXsp4eZYRXQbJCeMFV5tscFL9oD7ARgw5e1hNuXFAtgYP7D9xubD3ltXD/XcElp2lRa0vFJ+9/XGv
	Vjh/YtgiCbw8SmWCrsNXRGjsScSsBn6pwoQnP8wPwME2/INLi1YSbwSkJDoiNEGzS2YniSa6aLTnz
	vDJMQhOFRDlb+ljqXABag3iiTK+/DVz0fZ7uaYOdCTLnToFz4pEnmXOwrgcQfEWYXTYsFg1iEU4pA
	NMwrdPwZB88fDikMxvc5NatgUcdkccEx1Cuzn002HtNKFFzIkbiS63SZU9eGdRFehISk3UfnCdA9E
	/HzicgmYjfV6LySn4oxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6Ht-0000000146V-1Fgw;
	Tue, 03 Nov 2026 04:38:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6Hr-0000000142k-28cG
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Nov 2026 04:38:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zgiOgJde8AO2Ant4XAq57iC2YxxS16EtAa2Unl+I3/g=; b=q7kxIaTAH+aFJfFqctu8t3NmYH
	ABkasPBGJNEQtqejCg4CBsSulTEfQyoXm7No+0CQoqBXZtCt1TCBvedjkxgMXxEQdy4coxm63wHJb
	nJKBgKSDqI31fsED6RoDJc3XX+URughDwJ3pRkyRu2oJAZeepwuZyLnAwFUH7M8UMUlBoDMysbePF
	lX53KA6Q7GHiC19kDbkrBN6LNxKZhZBAbkZrZJb7hiO+TFeMwRdVhaIF1p7HqDbPnBfU2ec561PQz
	DluTvt3cmvSMhV40X6RktEXW4tuL2nmfSPEv+PV4WkqZCQIssNUKdnelIWzGjSmxGvXH+t/o6dapp
	zegrdCeg==;
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6Ho-000000001BA-3cRB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 04:38:18 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so2716989a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 20:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680694; x=1794285494; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgiOgJde8AO2Ant4XAq57iC2YxxS16EtAa2Unl+I3/g=;
        b=MVscMG3xT9WJE/zw6KSMa0hq5lt5xNUhjF2yaM/l4YUqFWDsmUCurBbnAQ/p2dYYBO
         St76AFStE8CRxH0uZ94nQ4FI0bLph24I48pBudPxx3CL5O7HysN3+d+Wu1VlMYcGoY/9
         xd3wU9PG9FWr+JP9FkJOebvqcVirVsnRLbjTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680694; x=1794285494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgiOgJde8AO2Ant4XAq57iC2YxxS16EtAa2Unl+I3/g=;
        b=Ly6VxK5AqKeC7ZNaeH97QmtsZxVpOHfb7UG7qPXetA4NZOSZD0tvOC8gjrw9qsfhCB
         ubuVbIuLAijseU9Usp/JTQuR1Q+zaQDe5pDLkX6GhWrMS0fDgHGMkNEoxJ8i2AoktxKT
         NY8X+HE9IlnRn4HGOjTMPkxz30v3DD+UK7xpdqCRvNcYDwCnoeryBFHncrYRsigazq2S
         rVwMnsoSfyiQY3VVr7CzSJJqV9avVG37K9PyNHpPJN+8t4OVEJs8E6BL8MsILfOYnA2F
         hMG4GhLB6zctK3yFQ4GEo7n3LSDtn01N0PncgwCtpOTznknEQ6xBp5iGSsGf59SW12FP
         +pcw==
X-Forwarded-Encrypted: i=1; AKwUvBzv7t4+4erR48NF+Cy0ClN93blEQoRd2YEt3OazfQV6fhHOvo0I5Kf37CQaZ+Z+YYfxVEbCpDWCM8E7LgBY2lLF@lists.infradead.org
X-Gm-Message-State: APuU4Z/Ntgk99hafGhoS5rX47466VbuL2ryA5B8Lz8g9EBW8RFfvHeiR
	t+XsizkWYRR9O4X28h1Ls37XM6BMBBr2aa+WUNwW9iXs5O95fQRRMW0ZNSYwgCoZMA==
X-Gm-Gg: AYBFou3FUPGp9yuCc86AkJkBm6K4ud19rx4nBLdWr8P7eA14hwU40QFPUW3/MG3cPd5
	+YZ5iKcsyEXt5HWNboeLU5+Egjlz9zdqNB6ktbwo4TXsPF3HTpkCj6j8YxB4fFKwDeNCNLIzNrW
	XoTXFhp80VvUPXW5OeLAN0hQnTZ1Wuz6a79SDxck/z8IIGIp5POW5S+ze0egeGlA3O16xwtMZnx
	ghA1iKbkff+QtGW+a/ZrONtOKsBot2QrLj3l/mp4Q6wgNA2XGnxdFc1heOfuqMeC4nqOPQrseuL
	SbPl0JAIPibWvJDRSpM0s7aH8YIAj+iVEApnwf4MMGu8tkoBMcKYOs2xac7do34aeYKZDTlXZqC
	5yV9UYu0uWKMxWzCqVzysPKmJkXqCiFjsIgOuzRT44lVO/+Pwegh9ajEzSzqIKo1p5f/aTPi3+m
	CbnTnjGGcL4OF0znQj8d7lUkN8bBgLq1mt8+WdVWHQT/pV16QaABurWJoTg9KvkxHwJi9aOwjJt
	uRi6gbJcnWJFzZJRZoHEzpfyQppSofz2oY8RyuvxBt9+qDOlhFkyhI6dYpCgjwRESCLp6Up/7Bo
	g+NcAjTLf+U2fIRbsjy6PAC/upMC80MHTk77KAL5w5Ku7QSpocncYo+cuFGpruAIATaVIRaC7IZ
	RE/Rr1WW1GIsw
X-Received: by 2002:a17:90b:4b10:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3ae89724b06mr9920661a91.10.1793680694591;
        Mon, 02 Nov 2026 20:38:14 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:38:14 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v7 7/8] arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as always-on
Date: Tue,  3 Nov 2026 12:37:31 +0800
Message-ID: <20261103043734.2179858-8-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103043734.2179858-1-wenst@chromium.org>
References: <20261103043734.2179858-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_043816_800247_C7A28DC1 
X-CRM114-Status: GOOD (  18.95  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

Cc: <stable+noautosel@kernel.org> # needs matching driver changes
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Added noautosel tag
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
index 777da2129e77..2c6ec714e117 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -1098,7 +1098,6 @@ mt6397_vgp6_reg: ldo_vgp6 {
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-enable-ramp-delay = <218>;
-				regulator-always-on;
 			};
 
 			mt6397_vibr_reg: ldo_vibr {
-- 
2.56.0.385.gac671c819a-goog


