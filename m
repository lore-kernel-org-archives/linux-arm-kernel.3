Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994E1CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 11:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q1bivzFpeOn6zdj28AqutzvHysf6y4+jJdipsjR0D+8=; b=BFnY0cZYQXQZJD
	HPpMyOYcVoBa0YKSFoHSxqsTnVbKS4HWGEC3uGWmODAaIcWGXdCCfQpemeThT24R6rhHt43gQbB0t
	gOgxMqGFW/jglzJs+DoyB6KXAsNnaZbFZmmlpibzmUvQVGi4mU2c7RLmeKgjQn4HtBDHmxBONlX1z
	XP6ocML0PzYHdJ2HeHudrcBtyCZHee3pHM9OzsPEFPYpii4x3FUgh4xvSsRhXXZGmXRuLIPe0TdzW
	zqLEv+VHrhjScD5OyxCxYQCaMpGhZEa8Uwjt6MxbqfyAjthEjstlV8WrcnDmoQBg1nCIncJZNlKRx
	r3IOtHim8dJ7mp0Rn/7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJWz-00000007nE8-1iie;
	Sat, 30 Aug 2025 11:14:01 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJSu-00000007mrr-3GkJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 11:09:50 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-61cbf01e472so507681a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 04:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756552187; x=1757156987; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q1bivzFpeOn6zdj28AqutzvHysf6y4+jJdipsjR0D+8=;
        b=lAx6t63td3Rrul8EyKS3QwVZ1yn9HnMRBl+ceLQ0MdGydPz878Nf/NcUlSqyoEvLbF
         zugmZXQiVaPsqZyFfUr4UlChVGcedNv1b58/GlTby62bu2tZIMzRd63QmNLwKQxyyK42
         53rqXlSP+HT35lCrjTSWK5kVxDn+G6cz4JRnqpbStH018G21d/yJO/TjNlRxII6QPakK
         lqaCDVhfTTxyYw2d6gHiA9/NsauTfkhFF0OeTAec2BpqSowF81875n9qHVxhqKXDYuCT
         9+sdEWIbsCElbsq0a2yLz+359O7uyu9m5101xRe+7TgWTmJP0XSpwWIQTaS2kXbSA3U1
         9Gyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756552187; x=1757156987;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1bivzFpeOn6zdj28AqutzvHysf6y4+jJdipsjR0D+8=;
        b=GCifxXJptc8zYJBkWnjUNXM8Q9d8v1mjwhahs1Ux36x6p4b8RXr+yVGoPuZx8czPn8
         ZVceahgPZ+chKLpcvgKYSVgXCH8OzLRDHzL0hKDh65q9iufgjabSylNDbegDHFj1VSgz
         BdU3JEM47irvXgNVzYI3jDpo/mNRDyfxToeVJSQ/dXgUmZ4RJplrb5V0Zg5lBX0rGSEq
         Pi+A8xeg/QlJjWyjStsYPBn4gXOLAxmhe8gkTUOiBsjmnwq2c5eoztD6CcK10SCdJN1l
         rSBgl2qTjlpDgBBm2l00YTnkbKOujryr1s4zrvcJ+MpKY2miKQl2IqRKP0zVGEBPEt0O
         eaAA==
X-Forwarded-Encrypted: i=1; AJvYcCUWWhAg258otgsbb9gp4gPCBzt78t+AEzHIcKNxWwPDqnAmjLWjrmIctEXIWjAF2hVfCHP41xO00tphaSe6/UvU@lists.infradead.org
X-Gm-Message-State: AOJu0Yzzag6Ny1Xa+cGo08rq24eX9rYcNfu3i5VUDvjjkT+sCKCXt+Gp
	dLdxoZQDvZFCmASGpVJNxMk7WkKdzyG2cmB9tsmIV7hjK0JVIgxX7uUJXgujDAFxY/s=
X-Gm-Gg: ASbGnct+ra7o/kH4DfjkQManv99NCKTW4eW46QQbwGoIhgMMHjjEN4TAZ603cxx+PQ2
	2/hl2VjdEI0zP7XwQOJt9ibknxWZQ+TrOA4TMlf1iZPbL7fYIHWJQhZ8LhwBZi/NLCu4oUQpFNt
	3Pep+fdEcmQimJaFhXfSY6ncKxrBQRfjEz9lgdutb4yExM7GFwyBSkns6LduJRmQz9hAc/BOfsF
	uWHdVnd/NgO90FHUX2q3a8PNqcMZAkTQvytibRQbUeDYeINB4hiVwV/wlRoDsbMP/myp5JQSGYp
	H3/ILYzEPbgkMrv88HC3TVyNfp/RFBLVyd8qHmXyW+o6aP7aU1RDv9cxKgwJxkTFDa+23Lqw3XM
	ww4Fxv9G7n7qbYTX5PLbZAuXU2tjgrq+1MsAgH9U=
X-Google-Smtp-Source: AGHT+IGpcs58MTRBzy8QSSt3KOW9IS8qh2Op0/WrgMhV43qjpLPuJ3b/P2nf8GBfY6hwmjebLcg+qg==
X-Received: by 2002:a05:6402:13d0:b0:61b:6c51:4005 with SMTP id 4fb4d7f45d1cf-61d0d5f33e1mr2017383a12.6.1756552187107;
        Sat, 30 Aug 2025 04:09:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc21542asm3285666a12.18.2025.08.30.04.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 04:09:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/5] iio: adc: samsung: Simplify, cleanup and drop S3C2410
Date: Sat, 30 Aug 2025 13:09:37 +0200
Message-Id: <20250830-s3c-cleanup-adc-v1-0-de54dfb1d9ea@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPHbsmgC/x3MMQqAMAxA0atIZgOxUlq9ijiUGDUgVVoUQby7x
 fEN/z+QJalk6KsHklyadY8FTV0BryEugjoVgyFjybeEuWXkTUI8DwwTo2sCe+qct4agVEeSWe/
 /OIzv+wEe2WmDYQAAAA==
X-Change-ID: 20250830-s3c-cleanup-adc-71ac80978520
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=823;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=MPAHQXQUpXiLCTcNCqhvtB/HRnhI8NNTl4O+MlOI1ks=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBostvzlCuQP5FPquq2lhYn0JmEK8niYeKAbQ7wN
 pTrsnpP9/iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLb8wAKCRDBN2bmhouD
 12FBD/9nHRQw5vlITMhdnscAzkVchRhGAmmUR0TsJVYZWXUEaliQJvfLbtxlpMeVMjuKYp0I3pA
 bucWOuH6Ru1FmVobvchYI9wYkYN/bJbW/OrqEW0da4IFhoc257hS5IfAxMI8MPFiJ8FS72/Pnqq
 EFadIC0BdIb7wuTUBCsrjCwVK3qiCEl9x6hHgvr41iX2PXgh++T/iQ+g4ahIohcjpEKxqMEvZpN
 gPr54LMn0PJQfjpDQB7GleIm79NEzeWsE8Mr2dZ0J83ScSPtGfTkC7lM2iVexgp+rVvImGVnEwE
 lBPOiFT2/qDlh7Wo0ENT5OoUPG0ExHz8SKPOInwTgtKcQkv2/SwFc8ATWh+cDQApu5gUAp+wkMu
 ta/FWCmlApsWAqbrikqJ+1s94VlIUvF7YOE0Xhk2fIDSvGEYyVDWTZddzrR40IvAVRFTQAwJaHo
 uYuyL8iZWiFRE9lQkoeSBLVwHwIw/iWoEkTnxYdl17Q2tXXycUhEEk37c+tyOlySp+WVnvcjbkg
 6Y1zuMGNTygyiy+nbBP6cip/YYpNYxyHnsw7G11ysixC0kyoIQo/6Qfitz1RZTZjLE4m0qZ9bTp
 DiOYn1YxdktqnDSox2RwMIYtrNSpoPuoeBDLBCdEOJw70Mx28pgx92gz05qDEGKsTTBQXajEYx9
 5eOIUs/+TCK/y4g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_040948_831123_E88AD95F 
X-CRM114-Status: UNSURE (   7.54  )
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

S3C2410 is gone from kernel, so we can drop its support and remaining
related pieces.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      iio: adc: exynos_adc: Drop S3C2410 support
      iio: adc: exynos_adc: Drop touchscreen support
      iio: adc: exynos_adc: Drop platform data support
      dt-bindings: iio: adc: samsung,exynos: Drop S3C2410
      dt-bindings: iio: adc: samsung,exynos: Drop touchscreen support

 .../bindings/iio/adc/samsung,exynos-adc.yaml       |  23 +-
 drivers/iio/adc/exynos_adc.c                       | 280 +--------------------
 2 files changed, 4 insertions(+), 299 deletions(-)
---
base-commit: 3cace99d63192a7250461b058279a42d91075d0c
change-id: 20250830-s3c-cleanup-adc-71ac80978520

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


