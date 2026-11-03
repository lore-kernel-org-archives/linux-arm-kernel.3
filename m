Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABBA606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ohyZIbyQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=E0Yor3Uh;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vEjPazWV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=z65FbJFnjWHxVaxQI8JGYbEaf36adoL6Hch5QBpP1Jc=; b=ohyZIbyQ/HPnY3
	QlkxNbJuh7kW3IfnCNcBp0l0WIhWIfWIJli4bqlceNuv0kJ3kebPEo8VxeYU/rlCoZOmlZXTO//66
	jeY5J+QEnrkx4lqShL0ZQhknfMtjvOZ7byMeI5LBsRTH/mcGeiALwt7kv3ZtzyrzGiihcDfD/JxZE
	EZ0U0Z+svLx34KDP4JrMPnNPbB9DkLiEnX7tjZAFWPpZHgSpCG/4oEepn599frHSnk34w+GJrc5uF
	ajVk7SxSat2Gu/A+158T3qXmx7AqfI+19JVwH0vUbRTEAs/LWl5/R8czyE+O/rbq2k5zUwkhbL+j2
	1V4PSe98UGRN9nZaLrMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9BA-00000001PMZ-0BtJ;
	Tue, 03 Nov 2026 07:43:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9B2-00000001P91-22t3
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Nov 2026 07:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=z65FbJFnjWHxVaxQI8JGYbEaf36adoL6Hch5QBpP1Jc=; b=E0Yor3UhPUlLauYMyTUjoZM0Nu
	DFxcgEcsrYNURLjt1364D9q62VYVTjiC4flgxgJxRCrd9kmSqBnm7IPZlKNZ/aA5SqNzULBN1wgcj
	dTK/wL2WpgJGFL7jDdbLGqp5a/opadU76WqGQJ1A7VHSKaTwRNRvuhGkKVLVoRbcfNcFXlG9X6HUK
	WjMjuAmUda3lVHKtq1iZykB/zYuFpoBtafIYIUyymY2810hA+WAhJoebVz+AEExlfSPBAhrbGWyq6
	Uj0CmAHr5Fx4wPs3sGWN+Vl76HbLR9Ja3QHlHwD3j46RXjVXOwua0N6lujDm3jmNVkKi2r4r9iNnZ
	0Qj0ovOw==;
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9Ay-000000007vl-0XFB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 07:43:27 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso1533365a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 23:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691802; x=1794296602; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z65FbJFnjWHxVaxQI8JGYbEaf36adoL6Hch5QBpP1Jc=;
        b=vEjPazWVwCqmzqQ4/BX6M70NNcCeXiPthTa9mrZ86JsxhPTxzcPqscnlfabWRPjo47
         FC594OVkI8lfaXCgQKx9+thi8ArUvZujCckRuD/n8wkdrcdzzrj0HQwE9KYuR+FSzCMO
         LMD9J768Us69tHO2JgHplotaH+Sre/kzMbVgPl1+NRC2KlwYSEZRafpIiw1tr/6CSU8e
         AdBHclm89s55dQfUQxIO7/R7R9X8h4WbwqF9nEyFSmSelW4OU0LdfsFvgwS3buKESIOi
         hxD4Spi0/Me+WA1xGlHrjvfWhDQM4hOVojUiohmwAe8v5UwwcJ4lfu+HdF7EB6Yb87qO
         pxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691802; x=1794296602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z65FbJFnjWHxVaxQI8JGYbEaf36adoL6Hch5QBpP1Jc=;
        b=YTO/fPDnk7Q86YKcRytIvBSOM5191Ul/OiHfIWKWgWVDmnyuUDpu4AJvt9NZL0yNsz
         5Wy08lkoDYiZ2BqS22TA5KfYhvCv5skV+M4dNt2uq1jO+NSIRZz2PQfQNoy2QldJulq8
         iV+s31tx9y1I8m+9DKjn4VhHtBkK7w4F7+Ee83Y+156/tyPaRW+Z2sv5AxbgeCVU2mK1
         /H9NzdBom31k0+I+5pOFHlyzI9UQ4GhxmbkEkoRi3JOvFxXrmzGdNHmSsWu0EXT+dKlE
         h7H4QeOnFLCpUxahF3rcxLlLtltilSC55kyrZ45+oFj7OfA9Y2v9zO8Yfx5SYmANsNQj
         vRNg==
X-Forwarded-Encrypted: i=1; AKwUvBzw8WjdO7vaqE+Digo2MlFp22tvBYA3CYmxibXpydzhIpnhlMMhWNJ5Q87q26iXOk/NhiHHvDyNcCY5+jf61jfm@lists.infradead.org
X-Gm-Message-State: APuU4Z92txhDDRaKfr20w8tg+cMZHYbaStImq8NzE6b+FM3Mckg1EViN
	FHWoDB8LejGF2uytikaAzpeKvIlEak5YEovPwUSP+mRzvLg2PGnxPz5k
X-Gm-Gg: AYBFou1fRXUR0eOJnMvYbpKsUIyZ71hiIrZ8cJafPZd6GZ46WADxx+2iK3jh2yuZHQJ
	zHOCCQH+rzQc0+319N/4a/nEpMLbDWYlizQ0WN8mKeRNyzMagr7e27HwbWg9NAd9p2M7KZBs9Z8
	D6LGm1u59MS/Xum7IIOD5k8+TbVNqpL0oKKAo1u2yZdAKF/9wO5JXEcHUq9IvhUnIYPiuwPUjb8
	7K0vG6SwPfRyt8VkCCA30YcVe1ON1UgoLqIR5at/P+K+bw2it3h0lEzrq7RU2asdZW8wrer8rBn
	wOPJkdgu1gt+ijDVKUJDXdYXgG+TbtDvBd+zcwOjT5vQTlGAequSMc124ueBgeNOZrzdKeFNxLA
	QhtQgr5gyI1AoVTpyJ3+c43C4o0DvKjtLpE2IxIRHU2HsOBVWNxEphJUf5tjSPDrTrM64+Jmlmt
	/LIo0EdwfFHZEgmJFQ9Hlq7uTPHs8wfD4erIE88jqFAWUw/MU1JSoS6mMd3/ZC89riRDKFuPPlc
	pYBvnoOwycZhPNW7hkubhacQWGiyphJNnxHRaPBfa7C9rvMVwVKEduwftmOtiZowciRmbd1BRJr
	A3xegzqMtS38BpfL3K27shJkJHPxA/IHeMmQ6SXmlw6inVsmJP4oUcyNj5y7Y3M8jpfpnZjcO7P
	AlOsw7Q07W/5PGErrPLd9GVrvx968Vd4zn5Rk7QuVVbpUBtZOFmdyMpvI0GMS8rwCqT5ApmFh7P
	OArRA=
X-Received: by 2002:a17:90b:4c44:b0:3ad:9ecf:2b88 with SMTP id 98e67ed59e1d1-3ae897356e2mr9451595a91.19.1793691801674;
        Mon, 02 Nov 2026 23:43:21 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:43:21 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:10 +1000
Subject: [PATCH v4 22/22] arm64: dts: apple: t602x-j47x: Add
 speaker/headset jack nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-22-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2528;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Mpa6Lyvo5t3WwDhLa15s7MQvnpQJvZyAGw7Ghv9V1tE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+y/cXfot+mNMjqG8VQGnwRn3EyJWLF0yd4RXtmu/+
 PuK4dLTjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFT7czD895M+e0r0trTbnV0nPsxR/+sWH2Zbxmy//I3n/ESnsJq4dYwMZ+yOvLw
 gwH4mdKdQWcjzb8U8nGvO1fbvNZLOyU+ekd/KBwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_074324_430918_75D9568D 
X-CRM114-Status: GOOD (  12.19  )
X-Spam-Score: 0.1 (/)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The M2 Pro/Max/Ultra Mac mini and Mac Studio integrate Apple-specific
variants of the TI TAS2764 and Cirrus CS42L42. Add these nodes and
advertise them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6020-j474s.dts      |  5 +++++
 arch/arm64/boot/dts/apple/t6021-j475c.dts      |  5 +++++
 arch/arm64/boot/dts/apple/t6022-j475d.dts      |  5 +++++
 arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi | 10 ++++++++++
 4 files changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/dts/apple/t6020-j474s.dts
index e3c2635d84fa..f39697490365 100644
--- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
@@ -46,4 +46,9 @@ &pcie0 {
 			<0x300 &pcie0_dart_3 1 1>;
 };
 
+&sound {
+	compatible = "apple,j474-macaudio", "apple,j473-macaudio";
+	model = "Mac mini J474";
+};
+
 #include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
index 9fe17f1f7f59..f8f776f9eb1e 100644
--- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
@@ -36,4 +36,9 @@ &pcie0_dart_1 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
+	model = "Mac Studio J475";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
index 32938a3bf96a..153899f1569b 100644
--- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -73,3 +73,8 @@ &bluetooth0 {
 	compatible = "pci14e4,5f72";
 	brcm,board-type = "apple,canary";
 };
+
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
+	model = "Mac Studio J475";
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
index 926bb4ab77af..7f1faefcf9bb 100644
--- a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
@@ -36,3 +36,13 @@ &hpm2 {
 &hpm3 {
 	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
 };
+
+&speaker {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&jack_codec {
+	interrupts-extended = <&pinctrl_ap 59 IRQ_TYPE_LEVEL_LOW>;
+	reset-gpios = <&pinctrl_nub 8 GPIO_ACTIVE_HIGH>;
+};

-- 
2.56.0


