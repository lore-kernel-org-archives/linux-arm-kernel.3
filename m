Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9906BC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 08:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJpSSWKODubMWDu6LS8hKhfIs2zxRW9+kSXB6f03nq8=; b=VVePFnk0gkL3NoLDzY2ZA8iIgS
	5b5V6NPxTP6LI4LV1pnCwi1rwPGQm0oiFElP3M7y7yXgtlyRxhQejA5wJZCKoCem2f9bAjsw0Csqe
	yRb0quxzEdHJJ4qWCkDkgJ4PCgO3A0ORFLL/zQKuU+2Fdw+wCx/gwJ06XzS5ryemCab0wKKfRJvKx
	4Q2pwWrVQPjxHnkBEqABcnSaL4IabdzZykbjYNB7vpaL6E3NzE9m+vY3CUauRxTcN6JZ1IKdOhEie
	E4DXNmelr8Gz7v9AdVvZVsVr2ndTxipdW6OyaHVuY7LOTPx4xbP1DxiP3Qb8QvQg6Wkf6k3Mh+k7X
	Fz4WMFtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRhK-00000006bYN-18GC;
	Tue, 17 Jun 2025 08:29:38 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRYE-00000006Zvo-3HX4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 08:20:15 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2366e5e4dbaso22499425ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 01:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750148414; x=1750753214; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJpSSWKODubMWDu6LS8hKhfIs2zxRW9+kSXB6f03nq8=;
        b=TilR68OSfe6QgY1xF8aNci5pe7ze7jh1O5UFUVH2R3g3bDCVm1cqEtPMzNwe4GUpP2
         LBCMorYB6CIkyn7x1fOKiqMHlqZEJ0rfHoPN1lysHAFG3JX8I8f0GCWOjGsOjk5mlxBl
         zZBK4fvUp6lKTWMkEj8SSp1Rhix6RUwtJpkqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148414; x=1750753214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJpSSWKODubMWDu6LS8hKhfIs2zxRW9+kSXB6f03nq8=;
        b=BM0/hhSQF8daFEYgFSHScsngHixcEp0eps59/dn+Ie2HI8AQfNsAbLsXLhmJ8jh1UX
         kDQ4ZRIbropsRwXoN8L4G5X6NMv842ugqDpH4lycERVDbza/4mE3Lu5rc4e50BwCQtCb
         NZjbsnOG7s5Em5IbS5u8n7J3R9rkXbWPnGKdS4ByUaOPKU1HqSs83jnrckROxTNjp2wh
         mEhwh+bTw/9vXR3El3fR+aEdaGvzLIByiLhvi9P38PBPqMKpdKesL9C1ZnE+p/C72RHM
         hWP7OoFT7jX+ToMwkl9ntr45tnd0LbAKqr0zUhn0/W0hoouJtGxm++rX7AxrOEmfbRi3
         XKxw==
X-Forwarded-Encrypted: i=1; AJvYcCVdKxhKFVr+WM7zd3efXDlzscNnmMSXoumR0YG/6Qs8aCc8bD2L9qluMpefQjzUPFgLZ64FRcWI4yyoB9xBEIxI@lists.infradead.org
X-Gm-Message-State: AOJu0YwR7UcAQW5IGI/6YhpUXe4qQai7BvezVX2f07xSw45yW5MsAhbA
	11Cf2ypX2KkFVZjkQ1c9mJ7WX3ZcNSlcnLv8BXQ8ySQnm+OZNCqZ1NGnMvKvWxEL1Q==
X-Gm-Gg: ASbGncuMIoFw9aaeqlyHIRLHvqGF0btVwBXer2VUbeaT5mnSRGYVzfygfitmztswuOz
	OKvXYMlwBSkCrUs4e+KeR8SAfI/4bslilQ6I2lCMFfYMqOn7Ctx0ANCz6WJBJBvpkX7KPOADuNP
	HXsdXSaZZB3MIHlN7nYzULGYIWAX5LOPYVaq3Obu1lxZcD9zNYzi7IDgIBcMsskBe5SQf8EgvCG
	B7STGaEKQJO4qTd0mwHI8EDIxyVxopC4/G+D/Ivpp69CFbm5PplgeF8mJF17EM2OtDQYUkP7ilx
	peaPLK6GWs+L8pB4UrJ4Tg+pWvla1det4/HsBTXQOO3FPFqjVMjeAiald6jyu3fzxS3NeEm/rDT
	4/UvSXY364HGrGDc=
X-Google-Smtp-Source: AGHT+IFfpg2r7E+A3hwnVaD8XvFL8a9eXnDD2HrKdh1NTx8ZQ0KD0SKLHARkzMHejSWGfoyIg/Kiig==
X-Received: by 2002:a17:903:4b07:b0:234:b3fb:8ed with SMTP id d9443c01a7336-23691bedec5mr30450435ad.1.1750148414061;
        Tue, 17 Jun 2025 01:20:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:24a1:2596:1651:13d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781f7sm74598885ad.110.2025.06.17.01.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:20:13 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-input@vger.kernel.org,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Benson Leung <bleung@chromium.org>
Subject: [PATCH v3 2/6] dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
Date: Tue, 17 Jun 2025 16:19:59 +0800
Message-ID: <20250617082004.1653492-3-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
In-Reply-To: <20250617082004.1653492-1-wenst@chromium.org>
References: <20250617082004.1653492-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_012014_824376_222A4ADC 
X-CRM114-Status: GOOD (  10.46  )
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

There are only two different SKUs of Voltorb, and the only difference
between them is whether a touchscreen is present or not. This can be
detected by a simple I2C transfer to the address, instead of having
separate compatible strings and device trees.

Drop the SKU-specific compatible strings and just keep the generic
"google,voltorb" one.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Benson Leung <bleung@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Added Rob's ack
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index a7e0a72f6e4c..2032b0b64ba7 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -350,9 +350,6 @@ properties:
           - const: mediatek,mt8186
       - description: Google Voltorb (Acer Chromebook 311 C723/C732T)
         items:
-          - enum:
-              - google,voltorb-sku589824
-              - google,voltorb-sku589825
           - const: google,voltorb
           - const: mediatek,mt8186
       - items:
-- 
2.50.0.rc2.692.g299adb8693-goog


