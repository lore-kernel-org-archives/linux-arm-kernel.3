Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4997EC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 06:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=; b=ippwYlqgRVsOewRUxJeP6IoPbS
	UeP4fYjAFuGppBGMbxWVp/EUdGgrQdHQobWUX2bfvYGddaUNpO4xmfYhjEqFuGocBOTn5dG4kTPgu
	r9L5K35H0wjZRJZZ6yzZrIJL2PJG4kKXYv7X1zb0AJ3EdDCVluFIb9dhYd/1rRroT0NOPoAOWMtFL
	w2o/tBjwe/7CboqTWJ4TSP0NXtf88zHpL41+YoT7Qo39+X4+s8pjS0l8Xx3HFqOulBOi8GiTpFH4b
	vwDDYHREQg39WUid1+8Vx9FI8KUbiCHvCTpYKWE2voho4RijAkYkHFEjSinz5uix0C2WFc+MZRoLv
	2KxgGrfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt0g-0000000DsJ6-025j;
	Wed, 15 Jul 2026 06:22:22 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt0a-0000000DsGa-04ZB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 06:22:17 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-69c20ba892eso432382a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 23:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784096534; x=1784701334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
        b=ZuatQNwubC7rOS8NVCZ27MNGhrCfX65dXiLUiJydjTVrwparw/q57DgIcxNudbi75H
         SWN27UFr+WvtEZu/bapstuP90u3Kmwhn+3td1lU7+QzVc3TaMW3sk/WnfAzkmJHhw29g
         XdTedYSTqOteElvHPoviqyzP0KO6sRPbX4/k4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096534; x=1784701334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
        b=WQpnMv5+mi/sA5gbGK8etebfzKg2ychReYkODBj9cdR/t7DPOYICuXr5xCfWI7Q9Kd
         mlcVk/FtV9ZYkTqcgVyyLkadmbWP9H+gP2elLHpegNTHkXIjzkQ5gL5fUU6uupXK6ulS
         ZyHxNPmTQW2lHoTPV4Z1q2/ok6sMYmBJv8wlewIfJIQy0BhIEaTAAt9gWGICGVLMPuXd
         iEGtDFnDfRp8yib4b86w/1+lbv471RxEkxNHRZXVpWgUf+7Ac1ytsCcLBS8zNys2u3Zj
         pbgvvKt2YRlJiGp2V9TBVAcIsTA85UcCDhCImpHfcotprjwOMyiCygpJWJ0Nos90yOnu
         pF7g==
X-Forwarded-Encrypted: i=1; AHgh+Rr20hFs1i+UGy0I/0lLNmj7d1KdxttCjc8VeaH0MnAAmjEnvUWhhcI/ssoWYJsBYp1SGiqIeFFGgNmphNxAbP7p@lists.infradead.org
X-Gm-Message-State: AOJu0YwyffiygtwFSeULWZUtlXVhH7hhQJHqcXPe8kIWrMGvdUjswT/N
	EuAEoOz4UQHMhWdOZndLIOPMBFqMU57sfu4br1VfUCncZdO6VK40vFokbalnUTxQmeM=
X-Gm-Gg: AfdE7cn8MajkiBKkGZJ5oQ/CM0WhlklZHv/BIzRNnLZGVhTWFHLmTnjiOjoEBSSRLlL
	qcd36v55vVVEJmrk+mxXiJMhSmJcfViO/Api41BrhKOB3D+4xhv1W6/ek3TW0wUuGntYjRVG6cm
	LlaGUDAUiqH/ZdEvBhWocFtR8W8zHTCw2Mrbt9sUuWmyTqbB+quuz6YNia/eWz9KXGio4n5WGTs
	I/qmEQopqJtoT5qMxtNxnwIWNXGjjEtpWYKIityhskbfy3Mu/gC5qXucDO/kDKmI+JctTBHvpGo
	uCnG/43LSbSxW5LXbbKfH73tFtfGDzjS4i3rmxeOLfwa6GCraBmE4TugmAEgK3m4txJkJZs4hvF
	DsS4b5el6CZGA/yYAvQewTzDn4z3mMHi1dNkvbxRdiuFTS02JpqgxxcF8kp2/vhsxG/j+WuKuQR
	2Fo2okrDra9SH7uz//i08kebMtpy686+B+Ibdc3jdjFlIfAQ547EcIrPmhwyzQcuKxP32YIWwOS
	edPHccTY5uz
X-Received: by 2002:a17:907:9610:b0:c12:4133:39ba with SMTP id a640c23a62f3a-c161ea2ad17mr949555566b.26.1784096534178;
        Tue, 14 Jul 2026 23:22:14 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:22:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH v7 01/16] dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257-RMM board
Date: Wed, 15 Jul 2026 08:20:18 +0200
Message-ID: <20260715062201.3599458-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_232216_071320_C02A3986 
X-CRM114-Status: UNSURE (   9.64  )
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

Add devicetree bindings for Engicam MicroGEA-STM32MP257-RMM board based
on the Engicam MicroGEA-STM32MP257 SoM (System-on-Module).

The use of an enum for a single element is justified by the future
addition of other boards based on the same SoM.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---

(no changes since v2)

Changes in v2:
- Add Acked-by of Conor Dooley for patch 0/1 "dt-bindings: arm: stm32:
  support Engicam MicroGEA-STM32MP257-RMM board"

 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index c6af3a46364f..c5ce81e3ce45 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -203,6 +203,13 @@ properties:
               - st,stm32mp257f-ev1
           - const: st,stm32mp257
 
+      - description: Engicam MicroGEA STM32MP257 SoM based Boards
+        items:
+          - enum:
+              - engicam,microgea-stm32mp257-rmm
+          - const: engicam,microgea-stm32mp257
+          - const: st,stm32mp257
+
       - description: ST STM32MP235 based Boards
         items:
           - enum:
-- 
2.43.0


