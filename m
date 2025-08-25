Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3090FCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 07:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6diibYp2tXwnL5maACfhft2HyoHkn3Q3aXxB54ydFk=; b=bw7QvWIiFQRp6gnBNPVrHmt5h2
	v2Tr2EKZCesMi7t2NM2Q7BB95fKtbHS3OCcgqNmNDFPzj6cu51i24Rq748Oc9YwuWivnIyMEmpM4s
	RxV68DjKyS+e3Zty8zsVysZCFg7eOWsx7hI85GdySqg57jzy1oVqdWxPJcflZmKJDEVt1oOnbD/3p
	niOrEUgLoEhqeKO7xrXRMumlRrlKzMjQOEMtLTp8tkdphqFfgf1fFbZct3+rSHGXRF58Lr3W4s/Xy
	BBxt8qn9ZdTOQ0Oi3ChoCcnLeZVjv1P96m7qjmKBkeeLs0+8BMFvrKP9b5sc+PAeuJLmLt3R3jfRB
	Lz/1knNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRJJ-000000077sP-0JlS;
	Mon, 25 Aug 2025 07:08:09 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqR4b-000000074hZ-1Oja;
	Mon, 25 Aug 2025 06:52:58 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-324fb2bb058so2572512a91.3;
        Sun, 24 Aug 2025 23:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756104776; x=1756709576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6diibYp2tXwnL5maACfhft2HyoHkn3Q3aXxB54ydFk=;
        b=e7brjXNvt7YY1WzvQgvHUyD54T2HRx5m0ko7mYXu9H2xOAI0Tz3ZZ7/D/KO2SlOBhS
         IsDrORr9AScC87CD5900RvftOfl9dZmWStv9QS265WnGdtaEjbRuJm9/enSLND0rXzxj
         2YbjiKga034FEeKHWB+vocMIkxsLSjGuG00QeUnQDdVhRVv/aziWctrxagxRcey3isPv
         eh+gQIkN+UqRqcb8mZvr2LpkisuxqfOTyPRfK7caWF8RBSXix7Ef+fY9Vonw1+c73PHG
         EbPadO8LtQ6uTXYleWesZjyHxRC5e4ipXR57EppM/k3z4OGix2xf03lpKkNKW0mW6TyD
         3ATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756104776; x=1756709576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6diibYp2tXwnL5maACfhft2HyoHkn3Q3aXxB54ydFk=;
        b=YC8hBdRlWmBfNVVweh46MfazrfEJhNNW9OytjLp0v9N8nkRQIg30ksqGDIwnk6C+gU
         Njc8QCazg2GUzM5aPLA416ppFMfylZcZP2lS9o6kx8HhwuxClH+FuRZlRTJxGIj/5V59
         Zm2P+bIyhRXOHZUYaWw2JVAwR5ezbIr8NBcIB5Pc2t8qRFYUgSUgFOvWZ8inhYWbNznI
         t7wVgpUk2a+s5nlnVqdu9Rj1+0KhemOoGq2oDgMGwqSmDMIIopsStRAzSLKmUhD0/eAO
         djhHltEKcyWeEKx8vIoREiN7/zTkIqQ+7m8dM/obd93CeQ25zmhI3MtyrEJxObFe1bVz
         Qsiw==
X-Forwarded-Encrypted: i=1; AJvYcCUMPJ6SqgyMmnefAfUg+UDRwRYtDBAjUl2NdO1KHTrR9JensoHHtFeM//Kcsyp7iMaqzRsTCF6FZRCFETnB@lists.infradead.org, AJvYcCVbvA8Ah+aaJzmWLrNB4TUpOKKBPKMiNMZlEuCm7dbpk5nFcDYxNL7cog0ZsyE8XhkBAL3Mwf70E4FlzpBHEgdLhQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzYPuD96iv+/jimaqIh0i3DAoTLjuwmHgO4C+HNaOM5XOBSP5Y
	vBgps1s56opx+TwN2cD5swEdAsBK5ETe0Vtp6+nRZK4VCrY1WOoVNZLY
X-Gm-Gg: ASbGncsLhnjcnPAdap/QTzQmRwF68gC8NduuX2z2RlqfLhJFhhATAW3z8zfKgnBYk50
	9gojjhrLsZhVz6W0QOxv06vLosau/rxVx8pj8S6j0iLn3G964l4vw8/HJzwB/8yN0kYp5hfn8RU
	MTgL2ORe3f1DbuAQBQD4cYSiW+XUKDoOasv3XKka+K4NNOzK0K7cx1puAaJV4cct2X69nstzB6d
	FOEMUWFGAl/780+0Au+t4Cjq8rwCIW0zfI5W/W2EU6P+7/xWS+GSmzNIGm3GwvnRhGHm8jtkvs/
	2ps+Cm6rcBKyEAY6dghAk+2+rwJRUHKV2LbnoKuzxjukWvnaIzeCkEuSfqLBsOcCW6dIPuoSU1t
	IsblbeksJ5/n258XN5GqH
X-Google-Smtp-Source: AGHT+IGdW8+4UA6TxuzS2zcTt+SptsBG8WqDGXv/MJl0gX98YtWpcNTjXhO3HSlIWSEsMxekGESFvQ==
X-Received: by 2002:a17:90b:5343:b0:314:2892:b1e0 with SMTP id 98e67ed59e1d1-32515ee3bcfmr13043918a91.34.1756104776447;
        Sun, 24 Aug 2025 23:52:56 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401ecc51sm6604072b3a.75.2025.08.24.23.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:52:55 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v2 01/11] arm64: dts: amlogic: Add cache information to the Amlogic GXBB and GXL SoC
Date: Mon, 25 Aug 2025 12:21:41 +0530
Message-ID: <20250825065240.22577-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825065240.22577-1-linux.amoon@gmail.com>
References: <20250825065240.22577-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_235257_375182_C65EE891 
X-CRM114-Status: GOOD (  10.53  )
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

As per S905 and S905X datasheet add missing cache information to
the Amlogic GXBB and GXL SoC.

- Each Cortex-A53 core has 32KB of L1 instruction cache available and
	32KB of L1 data cache available.
- Along with 512KB Unified L2 cache.

Cache memory significantly reduces the time it takes for the CPU
to access data and instructions, leading to faster program execution
and overall system responsiveness.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 7d99ca44e660..c1d8e81d95cb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -95,6 +95,12 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			clocks = <&scpi_dvfs 0>;
 			#cooling-cells = <2>;
@@ -105,6 +111,12 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			clocks = <&scpi_dvfs 0>;
 			#cooling-cells = <2>;
@@ -115,6 +127,12 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			clocks = <&scpi_dvfs 0>;
 			#cooling-cells = <2>;
@@ -125,6 +143,12 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			clocks = <&scpi_dvfs 0>;
 			#cooling-cells = <2>;
@@ -134,6 +158,9 @@ l2: l2-cache0 {
 			compatible = "cache";
 			cache-level = <2>;
 			cache-unified;
+			cache-size = <0x80000>; /* L2. 512 KB */
+			cache-line-size = <64>;
+			cache-sets = <512>;
 		};
 	};
 
-- 
2.50.1


