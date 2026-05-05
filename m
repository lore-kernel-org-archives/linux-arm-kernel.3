Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48AC0CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8Eah5020XPyWcD+00bfEGevAL0MUbbOqWk8LFNDCIU=; b=d1oIE8NMUUy8WP7AbebCn0uyD7
	ASERkYLD9nWcdUx2+N/kArzit2De0GD9pWFuskMWVQ5y+/Paj+CX95vA44lBkTBAdnxt4piaGfFqq
	XwulR799cKp7GkegEghtH0yW6FDx64anQS5QiCcZIn5TADFFmz7X6kzbhyxgtKMTsW1c5JzZ2h9Z2
	isqyh9X1GxMqhnjV8599DivZA3jxGeXJ18RavI4rWWvxcPEE53I8HYjQVJuwjgYy9cec9VBjJXd/c
	hGI8/C0yKsYKsEsWAEbFdIjZID4pNHfjYilB9ubJj0Bso5VFTeyQJJZ0v9fspklm1VV+vKrHj+9bw
	0ylPYHAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnv-0000000FrVE-2uAD;
	Tue, 05 May 2026 10:15:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnu-0000000FrR3-0Swu
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 10:15:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=l8Eah5020XPyWcD+00bfEGevAL0MUbbOqWk8LFNDCIU=; b=PvYR3KuMKAj0BvWvK/3b5VC9Pc
	pIvFJAzpXH5fcHZ6LPqxXzEKQWrqdaqlfwhsv7d4R3JDjvMlWqzsFJ59vckONXIvkoheAYfckjO6h
	4WRkpxNotcwydMVNm9ndG7fpav+iZoCs69z9Ihb0GtyI2nmIYxnixgXtn1qTmmAGfSTTNPyJ+5C7S
	gmlGHnprRFcgW86hmktThoTW00R9O3NPvSoSfAR/06D9jDPlTrM0sXnPGZJyewUzXk63gVPdsfu6i
	VDat0rtS+06a6esMIuQuAQw1i/GKPjXmnWBdHNqDDgO5/wxqgWADsW0sdnUgZS4960cC2PMzxHRhk
	DTw/7B6w==;
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnp-0000000D9fE-2EiH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:15:00 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-834f1075805so3353854b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976096; x=1778580896; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8Eah5020XPyWcD+00bfEGevAL0MUbbOqWk8LFNDCIU=;
        b=K9VCMVdfEfA8YfP7TSO1Xbq5ZviccTmumeH7BhWlpiPBGbasfBIGoodccGCbVYTHmu
         v+eZkA0m03QE0i8LrfAJwvPuzlncWAppsx0puWHX1mzrbQbMLwPJggEKGy8PqbtL2//V
         79jZ75dMkOTT8GKbe0MdUsG1QNNaRjqvBbblM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976096; x=1778580896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l8Eah5020XPyWcD+00bfEGevAL0MUbbOqWk8LFNDCIU=;
        b=AU21KiyePjOg8kQiipKXjWI5QfE8/QalUVUaqduysxcms5TirvkSTUfPD5jtaQJdRn
         AoJjPvTjG6XvpAbVSjffe3Zn08uVhVKwNi4v0FSpciuny8TQ6KtxyEobKl2vUbicwxJU
         G3lHYh8YFrMuQK/dwzdsxb8TyCpSKn+8Bd1QdwEbu6FXtZKJ4dfwQI1Z1dhLUzmfDtZq
         XnwVMzmAUpB25bzqAv4m8rLPYWeiC5OItil5N+pAv+FPKq9BPSQXpAhHjzRyn0yj5iVw
         YtLPXz4TgHcagEbynsoeiiUSEOymPJHtx5ot2uIgxtJlnHIn/bLzWtZXKUUWfGLEsMQa
         Reog==
X-Forwarded-Encrypted: i=1; AFNElJ8R7fHoS2mE9K0EwRdsVzmm7EFxpgHESH0L3LsysAMrtGREZvG5ySS6VhNV73mJ+HLgUbnQp+jyybJWrq/vXIsg@lists.infradead.org
X-Gm-Message-State: AOJu0YwefejFPXNpq9X6Rr9p9oIKwoM0Slz28iciohAKosXHGUMd0cw1
	p6KTBXfg2Sy4qzEJ8ckC6fKbghy9y/6pF9e3vQfvZaaywKnRZMwYCks3ID3pCoPliA==
X-Gm-Gg: AeBDieu7xPEbhA+B3YOa7P21Vuvk4MdleIOarmI8BEMJT/zZHSNAWqrzgNwC8EQUZm9
	7536srw2zYiLAhIAR+99ijfcHJWyfhOaggUi5Vd+3JEHh0Wl/YJOMONsYQpPdoYMAbW1WUY+/0E
	LIzY/XNXU401zy3UYxvWphKUu4ApwyfhGGW+i4Yx8p3i/l7URuebNX1tmAlG46ZaxzFzFFj9ZNv
	0ajwJYYTff7NO6uyRyF1aJThDwIpRq8Pl2sozErWqaEH1cd8LHV+A2lmTTC+CQK4Pwjw5KkF3Jd
	6d0gllcJ8Mm/r4UNw8Kk8gYNoHEB6sVaH0tp2aH8A2Xw6zxL/+lawyZBGIr2F7zhz2pIYDiGjBw
	R/KG9MsCmuwfz9JFkFjukpSxKhTrLS3QZ1uZzHDHnpEUvKXNFwiPlZGWJJYHCErRPFAR/WQB0JK
	2diTtqy2VYMbRFdpGtdZ5ytFMydK5S8hcsBnZYcEbCHJaY96+vW81W9Xsod4AOYEZwPohaNfjoW
	Z4q8hPvFpbKNp921rs=
X-Received: by 2002:a05:6a00:2d9d:b0:82f:425b:4c27 with SMTP id d2e1a72fcca58-8352d16ed31mr14109597b3a.14.1777976096134;
        Tue, 05 May 2026 03:14:56 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:55 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/16] arm64: dts: mediatek: mt8195-cherry: Add supply for SPI NOR flash
Date: Tue,  5 May 2026 18:14:03 +0800
Message-ID: <20260505101408.1796563-14-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_111457_664037_EF659955 
X-CRM114-Status: GOOD (  12.37  )
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

The SPI NOR flash is powered by a separate "always on" 1.8V LDO
regulated power rail. This rail is fed from the system 3.3V rail.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- New patch
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index dc1ba143ccf2..62e2d7616f20 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -47,6 +47,17 @@ memory@40000000 {
 		reg = <0 0x40000000 0 0x80000000>;
 	};
 
+	/* system critical LDO 1.8V power rail */
+	pp1800_ldo_z2: regulator-pp1800-ldo-z2 {
+		compatible = "regulator-fixed";
+		regulator-name = "pp1800_ldo_z2";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&pp3300_z2>;
+	};
+
 	pp3300_disp_x: regulator-pp3300-disp-x {
 		compatible = "regulator-fixed";
 		regulator-name = "pp3300_disp_x";
@@ -762,6 +773,7 @@ flash@0 {
 		spi-max-frequency = <52000000>;
 		spi-rx-bus-width = <2>;
 		spi-tx-bus-width = <2>;
+		vcc-supply = <&pp1800_ldo_z2>;
 	};
 };
 
-- 
2.54.0.545.g6539524ca2-goog


