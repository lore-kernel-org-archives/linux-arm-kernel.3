Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A3E606A328
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 06:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aX0Y8Kvh;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ika8H+2H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=z7uEkdCEHo6cGHNCskGF0mF+TjMw6lWg3MiymD5XnkU=; b=aX0Y8KvhYsZU9b
	avVVmj5GyTQS+vZJ83ABid5JEfY+t+eA4V2gxfI+eb7H5uxtmhZg9C7G7Ca5Co6nkrbm52MZht4mT
	SpU2HXwS+jzZOjx+fCIynKzACmXpNx4pseSZ7JXKdn5BbCrLFuFFOkhZ1SOrkGP/j2W3MnUtMVeoK
	LEW71uc/pPZ1erZjfFc1iZ0dK1353NOJUUZkHPeqL8MOm5Zj8DpgHwD9NCXAJXGhHmPRliREDnOEE
	2xwTNhqLZ0PX2XeZgeGz31ihdbDGnHg9HSQsRrz33T7x9AP7KiRv40LrnozGJfwgWq2lxue4hTsh3
	rAp6zRhF5kHYI4Q1jpeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPD61-0000000BJcj-0JGW;
	Fri, 06 Nov 2026 06:06:41 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPD5x-0000000BJYL-2cZV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 06:06:38 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so371048eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 22:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793945197; x=1794549997; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7uEkdCEHo6cGHNCskGF0mF+TjMw6lWg3MiymD5XnkU=;
        b=Ika8H+2HIcLAAkHNT2XA/MwfutCQjqXpJEwsLdZEx2tBeeWmFi/Bqahm3l9LmWcrzR
         pQPpvNF9/alQ1j5RudQKd7uy93OEFNIKCYSphNgqj73ZWCOYjFgWBVUHt46i3rKspp0k
         1hloqWvLQ9vw0wNU9dFzF/mHhMnMoqmfJ+WhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945197; x=1794549997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z7uEkdCEHo6cGHNCskGF0mF+TjMw6lWg3MiymD5XnkU=;
        b=KKs/x0kbMEC72h/ZQ43DiHQXZFaOPWL5B6c8ms8J3iUe67eOChXHXdSZMDuqNd3G6/
         SlZUQnebYxVbQQdseM6fw9H67s70pbEpzr4oK3KQAq4P09xeeklLTTMgQ6Dx4ItuDCaa
         +0l7yGrg1R6UH7M2ovPO3TV5ha2Q+RNUWO/Hg7EIy+/aS20UXObV4PvYU8dMGNqlnO99
         55ZQ8FuTQrvllunNB4Xq5pSuQIbGCAKynrQltpDVE55Y3lnO7i8JhR19MzOG9hx2SuBp
         PGvi58SuH4zlqbQuSsr57k5jj4ejXpQ3dbo3z3Llq9iChHOUYwherTEIjeuMYNs87j1d
         y1vA==
X-Forwarded-Encrypted: i=1; AL+hErHlW+siQe511Sq8gNloM65h1w6m/X6gQrJvvL3G66fu93bhMFfp1b4aN9nmzNFUX73JF971cRXdsCS4zvuZDiR8@lists.infradead.org
X-Gm-Message-State: APuU4Z8rmjvi0CQP4OVbnF06cJ27pCJLpxeFByO/1E1JkCymQ5M8G9Nm
	8mLC4pO1GX4xs/NXgizrYpLN7k7Amkja/Bt1yDGbfU5p3lrh9rwMV5wTMUReahaA2A==
X-Gm-Gg: AYBFou3syTq/WDAKJdXjIR9bGAaWrZjBtdmXGJS2I4QKwSZLdxx0H/40xFjJVH47xXc
	6slwRMjRO2SFVcRtU0lvAAIxlS9SEHdagqceORGLwb2altxwCxIak3E/ZKveASKmjWcnuCcBNQP
	c+JbZy7O9RIzhuyKrUPX3isUjgufpwo4rx6/qBI9Ea5oy3LzToarUHmEa7UXbJXbITMPcatANOo
	RLpNub1aNM36pi+Rxfs8TFGnkB5uuJH3sgqxN/cuSQiirVFjdXZ6gmf7hei9QP4tCjB+lF4vFIq
	hsIxqMcMFegWua8Yx+dhP5G/bavE4H5LG1VJSD5rAhjNy5ar6OwbEZ5tFiqcK6zave/d78KM5HS
	y/OJdGJuApxYf1WylIsjZBIcHGmZq2T9EIefFjcVMrztFZFl/mscdbW+tyxaILIWSLjr4OaYJYM
	9OCOHStHxTVG8XlXcTMSJZrpNnRGkFObZJUOqxGDknkYA76EUIkTjCT/oEGbsXDu9ZBnRObd4pF
	PAz2fdFiUl7vWtZFp5AGYthw9O7O2tuox8adYqIdckI6Ppjt5x/0o6A/OP0d0/ngd0R7MGnvnkk
	YltFbTAxWv+MtrBRGhOexJ9UZJYWQOy+w7ZdLIj+jgQfir/NzOorQqn5LCrpqfQUAnsIhFwo6cE
	Wor4EwBIaeUHt
X-Received: by 2002:a05:7300:b0aa:b0:36f:4d62:2884 with SMTP id 5a478bee46e88-36f7691a412mr1986502eec.30.1793945196453;
        Thu, 05 Nov 2026 22:06:36 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:f73e:d73b:c0da:5b05])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm3821809eec.6.2026.11.05.22.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:06:36 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: mediatek: mt8390-genio-common: Split out USB hub enable pin mux
Date: Fri,  6 Nov 2026 14:06:19 +0800
Message-ID: <20261106060621.2706658-3-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
In-Reply-To: <20261106060621.2706658-1-wenst@chromium.org>
References: <20261106060621.2706658-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_220637_687842_22B9D025 
X-CRM114-Status: GOOD (  11.35  )
X-Spam-Score: -2.1 (--)
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

"pins-usb-hub-3v3-en" listed in "usb1-default-pins" is actually the
enable pin for the USB hub's supply regulator.

Split it out as a separate pinmux node attached to the regulator
instead.

Fixes: 7982bf7ec2e3 ("arm64: dts: mediatek: add device-tree for Genio 700 EVK board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Compile tested only.
---
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index d10ee1603103..63b4af476959 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -216,6 +216,8 @@ touch0_fixed_3v3: regulator-5 {
 
 	usb_hub_fixed_3v3: regulator-6 {
 		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_hub_3v3_pins>;
 		regulator-name = "vhub_3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
@@ -1249,16 +1251,18 @@ pins-vbus {
 
 	};
 
+	usb_hub_3v3_pins: usb-hub-3v3-pins {
+		pins-usb-hub-3v3-en {
+			pinmux = <PINMUX_GPIO112__FUNC_B_GPIO112>;
+			output-high;
+		};
+	};
+
 	usb1_default_pins: usb1-default-pins {
 		pins-valid {
 			pinmux = <PINMUX_GPIO88__FUNC_I0_VBUSVALID_1P>;
 			input-enable;
 		};
-
-		pins-usb-hub-3v3-en {
-			pinmux = <PINMUX_GPIO112__FUNC_B_GPIO112>;
-			output-high;
-		};
 	};
 
 	usb2_default_pins: usb2-default-pins {
-- 
2.56.0.455.g6c5a503b38-goog


