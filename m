Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFFDC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhbo3dWwgEK3uRwRq4Xx2zA/jDMc12TYdmm1e2oYkOE=; b=jVHlsdnTAuFbixtr7wSPS66HLY
	0LZgUiqyy/gslE8Gmhotl5OVWwBYArtGd8qzfCrDoUNImQAhDYHIPiCBYwMUEPAyI/bXC6wMBGl4s
	8cyBXe6oGWh6A8nAePTzQft76yjsSfpvZQucBvHBEbf8J83JPcumZ1gMAJlbyTXNktvuu0cYiAZgD
	um7Ek6fcToiA2v2I2lSQyU0uLjxTVoLo07kCRPAnd0oQf8a79xKucefd4C0EfZay6GWM4aOsk3azd
	Qvikr+pmuV31SEotW2a9lgNG5wu78gcPuQTxxcRWsDqi9vamVHcrTGsR5AD3qSNyxcEeEQRkH8Ec4
	LidsYizA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7usK-0000000DsaN-3MtA;
	Thu, 24 Apr 2025 11:36:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tlu-0000000DfSL-20ec
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 10:25:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fhbo3dWwgEK3uRwRq4Xx2zA/jDMc12TYdmm1e2oYkOE=; b=PIUJeCpDeN0wk4Ja3hYtcO8tRj
	qTcwLzsMawuFp9rFdOEAIsiBq4a9kzwgpRSe39W9aj59Q/+lxjX67UkWhGfqrn9fJT/5X/y8DfcqR
	inzW4iRUUrKsrpfQfQJcU2DDGV3PGxlfEu4A3e7egYT/15NsQ6sM7Q6vIsrZYpDfcelOAdIODeBE8
	gGqisZ+ekOu+5984BzzTgobTHyL85waouJEnkyQER8DFeqrd5jkkp4XzfDZtQsp7VAOKdMsDIHeYd
	ZKinMLH2GdtJKAtJ0wxzzV1jjP+FbxZUGd/uW/p3ZlyJsNgprAZ4lKsByziijCDmDuwj7Qo2g/lfW
	zxJxBJcA==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7tlr-0000000BjVY-2SDz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:25:33 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-224019ad9edso10954055ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 03:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490330; x=1746095130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhbo3dWwgEK3uRwRq4Xx2zA/jDMc12TYdmm1e2oYkOE=;
        b=U+dfhjOyFKcsHor10p281kSLATdfyq6U4U7ndhVUU9+Yo49eVFmBypUiTcyTNQcWzu
         fIwUsj4fZ72yZFCTz5NgSRDtYm7/38cE86TXY2EWDXYiQW2RzbervGs40duLppp6xded
         gltJeRa/brz2YdM+SWGtx+rYWJr7LySzxZenU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490330; x=1746095130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhbo3dWwgEK3uRwRq4Xx2zA/jDMc12TYdmm1e2oYkOE=;
        b=rT5tXf7samVeDLhMXmS/GoEUq6UvegC2KJNrc+YBFyi8R2tDp9wkywhMcj1bXfuODM
         h8v+RxPsbuy0hCSjTxsGDPBRZvdJGWRadsckhtZDtrnRSYmdX23dxvTb20FViYxCtdaH
         dcXep1CBpSPkcJhE7VGMApPkjUZ6DTlils4kjjNYZe+53lPvVLq7D1xKSvycEMOi7Apk
         5VL4sxQYFl1Qr09wM+YX6gFEt3baLc4H/UQzRBTrOnWYTShQBu/zWa9a7/jvTBQT3slK
         kLT7X3CzTGx2auCfxS2vKsJgiZQNFqTXTAmOAzV2ycul5nAhZ7ieUbCOMavzhR3oxsFk
         lX8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWMuLXFMkB0Aci/4dOOL3IgRqiDEBCwdlmEThiRuBQpqDxCyUirKeg2SMD5KN2GZekImYgYOSwf29aFBRpK/im6@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5H2hXL9U0NvV8LD/d7K42hqzLHTdCGYMlW8VLV4bgvVraZHoV
	StarHdLSSjg402/F5tezYoHMQ2tjun/CUkkX/4fmAq+CHTtIoaa1WDpdbsm9NA==
X-Gm-Gg: ASbGnctDM/7u1SuSruyLArGTe9oPfwqmyK3QyiH/qLxvgx2z/wgvtUbq6iOSMZZFWZI
	a5q/3M2fpMz04D7GOpDe012sPnRqIozHtFs+a3nBhxvCJ1F1xmdFdcW3PqWdaJ5mV6NgGeKey3s
	vRFLvteuU7O9WL2xI3bC6DRY1kY13h5C1SoiaK6inniaw2TJPShGi9apZ+PzOmApX+MgbFV7R+Y
	TqWpV//kr3tjBCBBe3QH1egy9oa+wlTlsys0rsAFbpZ9gt9X+dRlrgQtS9ipUaLVMWOqlfIkxm3
	YJpO2Lj5rer50Na8B5hdaJRiwAWeq4R6zEOXffAClt32u9xLJ7uDZI6txQ==
X-Google-Smtp-Source: AGHT+IELSxxaIrlWkT9p38inClLfKF8hG21EugY89NAyG2v2PsTI+Qb1Qw/gECNiLb039w0VJotWQg==
X-Received: by 2002:a17:903:90e:b0:223:f408:c3dc with SMTP id d9443c01a7336-22db3bb22c0mr25973895ad.9.1745490329723;
        Thu, 24 Apr 2025 03:25:29 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:29 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/13] ASoC: dt-bindings: mt8173-afe-pcm: Allow specifying reserved memory region
Date: Thu, 24 Apr 2025 18:24:57 +0800
Message-ID: <20250424102509.1083185-4-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_112531_909400_39DC3F09 
X-CRM114-Status: GOOD (  12.12  )
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

It is desirable to reserve memory for the audio frontend.

Allow the "memory-region" property, to be used to point to a reserved
memory region.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
index 666408d32f5c..d8993b5d457a 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
@@ -48,6 +48,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  memory-region:
+    description: memory region for audio DMA buffers
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -90,4 +94,5 @@ examples:
                        "i2s2_m",
                        "i2s3_m",
                        "i2s3_b";
+          memory-region = <&afe_dma_mem>;
     };
-- 
2.49.0.805.g082f7c87e0-goog


