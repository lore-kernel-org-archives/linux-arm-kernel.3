Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127EF606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KaWxJ/eV;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=b5cvYoPA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EmoljQi0147YiLUFunyMlClRhQm9winwcBqrIvSVOGU=; b=KaWxJ/eVYOaxgy
	5nEM7p+OXWGnflR6Bhhn8KC28uxrL7ZVKqoAEPvpzzd1M+s5yqFlg+a2f5iPQgBuTxR6uYcsR3ZPs
	a/wIwi/yHGqdNFyeX7aQ05qbUKi2djxBLXaWePinwtYCcxJ0zcjZwM5NVwY2dSCz8waWie8/e1m2G
	TW+6OQ0Vs/gmK9sboRb44EjSWdWq0N1QACt7Y2AYkK+64nTKYjJy8s6DV1+jFMQJHOyfr5oMeucNy
	RnCfSL6RNvwAKaHq7Wu4Sdwn19aIFjZYuLU9mD4L9qcWwfZb054NbbrG7knZgB6HCZ7LB8Nne9oQe
	eSNZ41xfcDaUBd6+mG5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9xn-00000001Z5Q-3sCj;
	Tue, 03 Nov 2026 08:33:51 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9xk-00000001Z0y-3M5m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:33:50 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cc147d86bebso293551a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 00:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793694828; x=1794299628; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EmoljQi0147YiLUFunyMlClRhQm9winwcBqrIvSVOGU=;
        b=b5cvYoPAeY4kMBcmxFRjNXeXNBa+AycGI9pp/Rr9fGBpGqah47o6I9E9i46rwAvcgi
         OqfW5FA3a3m/YrIr+11uAv0qbN7qLR9zeyiBXu3GqW+cqMP4/J12kFF4TbXZ531OMT+8
         8RRyVjdFIJIm/Vi+SV1DszYcm23ZPL54v6ZKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694828; x=1794299628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EmoljQi0147YiLUFunyMlClRhQm9winwcBqrIvSVOGU=;
        b=ePFTb6q3XGOowGpUsv9KFC72yfN/X3AbEVmENWUH40Ue7KXAEqkWWPwrPv7/dJT6P+
         0nv38l2bqHkWGPVZvk3nn65JDleE9TsjhFFIaWqDbMsM41GrtqyzsAX2+Q6q7YiwrQNF
         85RdWqINbQoMyQo2KZYWh9mgfgTyvw2VVuoDGuBefMbt5A+4Lk7kDr+AbcZCHFLWp6hD
         nDRJoiJ4TuTwa4k776fIyilIs/W2sPpDCLV34Jkvx+TAKsiuUqzEoSn8IemYWojCsybj
         WHl8GBY7xEmr8gVOfdhtkGai5KMAyN3CaQhvbn5a5lmwnpnqmiEMQHLFpq6F8MJNPMyB
         qv1g==
X-Forwarded-Encrypted: i=1; AKwUvBxNsXBT0tFAe0BFpeu6kMcQxwvbU0ViDge5dxnhzgXpMOt8xUjR9bU7+wHmZuKDvBqBhYESDo2/xN9fICSZLZpH@lists.infradead.org
X-Gm-Message-State: APuU4Z+GfG7NpENo4MRymBZESpek6ij2VlzPdaE/1fGpgPb+thQCVy8a
	STEEKbB5Mj4xfA0o916Q/urKGDD7BWZq8eM65Ns9Vlv24P28pcjA/H39l/pYztwJ4Q==
X-Gm-Gg: AYBFou3bVh08lMvVE+iUi4Mw61pArkKEH57cBJ0HSmyTDuTiol4I0ROPjUEroUUh9x3
	JFHREisQarK2B7dkV66y5q4h6cVz6kZvqUnf61QUNs02HYMNfPufgL9n7KIcbuLeLpvWlptzOOM
	gSJTW2veKyGVgChjYsf5Ob8axyU6I6NtA1hT6W2ffaVKxRKvSuWW6W1JlkHAf1+dbS4M+i60cOD
	YeBd++fDeNxeAT+bRFREAkPcAPNUtxDrlOribLzxfWTVBN33xVrUf5XBM6mZYAAKoZ6dEfGfCpr
	8+TW0Lelhl5hKcfsWO9r0JlX+Ff7Yd9/4AGmeeXTKhmJQ3seI+WQ/EEBlKOU0U7dzPYxkWlxXGs
	MetXyxPTrRqdaBicjUg1aZ+J3TNnIL9R2nydKSlnkXkIwUjkgbJdXWcuUgRfHL1XMoyRqnZ4Fkz
	kDqjl2giQ6bau8hE32Us72kqskJ0juBtMtAIFWfjlf2dYIqRWya/HLCXJKWZBUgZAahXAdidKZ+
	ZZV4jDQXyCQ0dheOR0N/hUY0ylP5lK6D4hW0BlxbZzagZJE06kx5OdjCtyzihxuRRMJit3l5A80
	VNmasfhQ3oQ7aGrH8LX5vFGBQTI4OxLWwwxEv9l62zMdqt3gYcD3ZC5XAqI5d5CKhKCpGD5FlzX
	VVk9/m8ZATxAY+k6YLSZdkmMh8ooYjAe/0vU=
X-Received: by 2002:a17:90a:e7c5:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3ae89559886mr6852208a91.6.1793694827794;
        Tue, 03 Nov 2026 00:33:47 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8329afsm3192790a91.8.2026.11.03.00.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:33:47 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8390-genio-common: Split out USB hub enable pin mux
Date: Tue,  3 Nov 2026 16:33:33 +0800
Message-ID: <20261103083335.2944847-3-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103083335.2944847-1-wenst@chromium.org>
References: <20261103083335.2944847-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_003348_841009_32D03810 
X-CRM114-Status: GOOD (  11.48  )
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
index 821dbf9d3fc5..5f41d78df685 100644
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
@@ -1256,16 +1258,18 @@ pins-vbus {
 
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
2.56.0.385.gac671c819a-goog


