Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F599C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 19:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p0Ac+WyyvZzgKaVOOpGDL89ciayObF3/GRMWEiWnmOw=; b=CkxlC6eRB07KLqsKlT2fE9DQQr
	EHsjoBwUHbQAiKHJwY28jsOnqUArXS/W20KsRi2ftg67rJFNDJiD4tCCcrztxDXS71DlfjGREeWZE
	gsAsPG6hghrMXFlSLl35rkt018esDeFssKPd7csWELU9GUqBQFv1DTkR9zfRkvCtzIt6zF7d3D5rF
	TuAlLtcE1d5nV0Vy8qnLECwUSvGJD2YydrZvrGp1Pcu01fWAfncFvNm9rlQ+Ctc+7Go/wuWuX+M5k
	zzjoznen23IzaKok6hJh+MVrGXWiqknKIfuWq6ZnECxp3nRpppoazaGxVbM7sbo/h0k0fzwm9vX73
	l7VvcmmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJGiC-00000007Y48-2QZq;
	Sun, 25 May 2025 19:08:44 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJGg7-00000007Xq0-2BQo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 May 2025 19:06:36 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5f6f86580ecso344831a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 May 2025 12:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748199994; x=1748804794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p0Ac+WyyvZzgKaVOOpGDL89ciayObF3/GRMWEiWnmOw=;
        b=NS89W1rkG4DIVoAQUVteQEZKVAUdQqQyyQI2LAMZ6/3zus3QQkmsS1zI6WB7LzIGyx
         WJx1CrwnQ9RITuSj6AeSya5nOneEOaW+monguO2+jLwYbtQ/ldkBm+HUFaKmBdpy+W2S
         c/ugQ2SNeK0q55RxZWujrU1RYvHDw+n7zUVH62ivvkDRt+chIIanKWDLdkMiWX0f67HD
         HLQ9sZKpmVL6W9qoLtdw2Wts1fwF88YkTqrAtHDmyg54tzhzHUjzN6WXU/T6jan9nWAe
         w1eBZfDcwt/F7zjOH78BZ8VX4urrjLeBCUVSb7HW+O0xLl1G473HqOGJ4hEYmqjPaxzi
         WsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748199994; x=1748804794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p0Ac+WyyvZzgKaVOOpGDL89ciayObF3/GRMWEiWnmOw=;
        b=aiht4fJ2DfxffyI/5R2IWTJ8ln/9BQ9MbIv/GIavsTlfUdlkPlNKZiJTeQxOWKreSs
         lV5nOmuN/1zfyTnUEijnXvryNd0p7CHRXkDuODigp/13NM0JGpIN+/bLF5P3X++4Tfed
         XLul+RxmuY2q566K6nU9tcgoj8zmgKyH0qiH8WIYzyypIyaN6/HqJoP5rXmWGcDpJu7A
         amFhDyIB65Zti2muUB0Lh6NNnXoec0Rd68ply5wxhisf3kN4naLKlAjDMj2EldXIlPb5
         Tr24IRQ9qU+tFwtiRsOPNQ2axmGvnJ5DhVNqvWEJbyVfe38ZnkgPhNt4jt200UkpAPZf
         UqPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVGQ4pJGWl3HA9nN6aOeMiGdjrL1dCTDvCWuiumGiDtipithYSopgBqyEUM2t8ly6v/AXBvQtMkTmHUwMRLeHQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwMqsvWjN01FZfUjK0BS6PwK76pKIAZa5IfAsgmi9kv1XP1ddGK
	luuC502Mfx45Ks7eYH//AZa31aE78eAmZK3iks9V7qH6q4SkQtjcYSmzutbona2lcBI=
X-Gm-Gg: ASbGnctIbo2zbZn3VXWyE+KBef5znfJT+hEoqzSzWyweQ8c8AxY7HQmbQVEHbBAx82L
	DCKnEadsMd5zCSODxz3Gs5tBz7B3Mo+D0Dv8Ed2u6RIdvtMtwWMynq5Z709+0uXUXSXWbT8HmTl
	10d9cln9iY7JU8g0w4k0BymLrBnWwBlg5tbbowsjAAzuEkgZ4YvoFLVS7OldhBBg8ANaC/Kqmfl
	Xo/6DMH89NXeEoh3ogHVHE7U81+OL1oqvEmrGjJsT1CMJVAZQs7xus0pgoO7JPbnd772WU/rosD
	UT9D8lP7e3QFGZCSHwfom1rkihjy+QTa77KoT3+93kvmmpL4Wk74cn2Z2jPm1g==
X-Google-Smtp-Source: AGHT+IF1ytVUxy0yTSnOyU3J5wIiT4fljHMLqV1rwc+JlbKe1QUVexTGhNkOuAvqkz9QFmk0klKpOg==
X-Received: by 2002:a17:907:7351:b0:ad5:76d0:4ffe with SMTP id a640c23a62f3a-ad85b15a680mr156583666b.9.1748199993680;
        Sun, 25 May 2025 12:06:33 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d277a2esm1563862866b.83.2025.05.25.12.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 12:06:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: soc: samsung: exynos-pmu: Constrain google,pmu-intr-gen-syscon
Date: Sun, 25 May 2025 21:06:31 +0200
Message-ID: <20250525190630.41858-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=837; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=3onmZshSspOtZwdRjF5R+KZacQlOFA9qC5Ok9p5ajBQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoM2o2sfBErBvCiBSO8rZEm0Oj8WqokUNHdzls2
 njdMxJ6ihyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDNqNgAKCRDBN2bmhouD
 1xcTD/9ORDhwOmIMphZfmjLWKYfBIueQ2BR1coOZs6pfI1Ls5H72ollgg0KYwTyI4D6DX0gOzyf
 6qDZWDIJjzx3MuFqn0KREZA6jH4WbIoJVrJnP3PPnuA43OrKcro3d69to0GZO6oAVJL4vytuLK2
 ldaL93C94RlOm8EIaNZfrQ6dlJDVbDLm6tM/WMkuYob9+uIyWKKGhW7FfFegEonv0ty66aPSRXn
 m10Dd+eVHfl8YlQdXcdn6NWdBce134CRTjTdR8wgfELEPWK7XGHjHUEZNsujD/gP1L5XZRMvKML
 y24Sn3/gn6Ek0Hj+bQ40m95RXge/Pic4IH3kP3NkaefdmnulLKW8JGasAHw/kJNFiGfR5asjtK0
 yBQR1fn5kwS8Qs8ch0JxcFlA1GBcd9s/tvuI3l34HrV4B7snOvC1OJxSwpnUQkdRRIxyzBvqsWs
 RLkPUIG+sMXgllOhkMslaC1Kg47e4wVOzmAo19o3JNFUVi359hUWnGasheNTahJE2kB046nBNNP
 hN0e9AviLhPzloPvVlbED2n1/8XY+mwFJFE5YfljIvGh6O0s58FMSBcoFhRoLI/UaYXS77iveLP
 Cn21xCtnyTNJHL/DZClux6U1ws2LTVVOoOfjwUz6Mk9Z8iRmIgOB+QNWMLZE1c4meJhMLBDSKU+ i/+a654QuS/hpFA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_120635_565862_21346615 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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

PMU interrupt generation block is not present in older Samsung Exynos
SoCs, so restrict the property to Google GS101 only.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 3109df43d502..f0fb24156da9 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -203,6 +203,9 @@ allOf:
     then:
       required:
         - google,pmu-intr-gen-syscon
+    else:
+      properties:
+        google,pmu-intr-gen-syscon: false
 
 examples:
   - |
-- 
2.45.2


