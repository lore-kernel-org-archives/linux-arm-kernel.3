Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3676C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 21:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kUjFgmSm1aq3i57OyhvioiCKoKiPrbZ5ktvNV9Nzik=; b=d7xJ/2bCtuLBcyHC10HlTwEcfl
	O5nWL8g21Vv0KMNERg6tXaFgFh/PCl8SS84/k9SX8gyl2UMMmimOt+CmEg3C5O0yAq0qJqMnM7q6Q
	LUlHETfNRSJoOYIP0e7AKwTH7D7n7vayqbm5No/VIj+NCIp9ThhCBNhHpkx7zu/JTA9GZMTofUpf9
	NrIpI4XtnUSH8Lmfrw2sMhnFinbTAkT1cYvpLYgcVo+NE/Ary6wD5l5nUCh11Ey4fFMMrwfe+LPz2
	SpSyLV7dNsOPsNGHAy0GWkh+erDCz1E9oMgm3GTEgO7S2bkGTKHwD1CAIXTkftVV61Hj3VKGCsM6+
	wymiTJlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEatV-0000000Akru-1a6X;
	Mon, 12 May 2025 21:41:05 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEahn-0000000Aigh-3FK4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 21:29:00 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5f7ec0e4978so1480284a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 14:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085338; x=1747690138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kUjFgmSm1aq3i57OyhvioiCKoKiPrbZ5ktvNV9Nzik=;
        b=Eftn3ogT4mZHEbMWZrZVnIWc0fHBCKeuL1/g6CcBVnQ9Y4aJ+ooC7iUrCo5YK2afLL
         EHjoksrhMkupH4gP4eNFgtUFJ2yUWDGvndnwHUdcMMOrr+nwdLURkYFeAD8UmIdjmVoS
         fkRtBKx+nzLKI66qnfsKUlOEPox5seOGjkwVdRPsTP+E2vpyxNTNy1qZaDRI4B8hgu44
         +X9a1PY2tGsI2YFvLBU9L4LFdDtIUQjAGVJ5JqTlYAztg+r5JbfSl6zzMzy8PGYKEYj6
         q4/9/5f2XqPXsG3C0jqnSjXkm+gGiW2Ey9/VK7//mylZuWSHkGN7FfQyEFnaNVnxn2qj
         5bYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085338; x=1747690138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kUjFgmSm1aq3i57OyhvioiCKoKiPrbZ5ktvNV9Nzik=;
        b=iPssYWNeKAImwmoqYnQ0Ws60Yf09376zGnRbk/l3gXKpTNDrmVWD/Jc+pOqbf09kEs
         h6X1eF3QdV6cdBFQEkHe4oabnFiD1oGpCkkgVUI9xW5Itj6SdqAabibqYsnXBw3i04Zp
         u5s68XY5Fus+NIo+bGcCFgThWahSfRtSySfjWwXASv+ZNGkcfpSi7qQg1K/L5//1Fyou
         otYm7e6HUiPb7RihSmZ4JzD94iQCvfE/A3zBW9sVXLnwdbZ6b+4JMnDFiHIbu4NcLUJa
         BB4Lvw6E8Qd4tE+aITjL9hcYl0Px6bD0c7m6Re5UUJZZP8juKSLBa5d+/T3Ai/11FqyS
         Tp4A==
X-Forwarded-Encrypted: i=1; AJvYcCVOwkSGwML0DzNWGx1UFA9YKbrPkGgCCJ002TaGyO5xPdLdwtbHjKy7hPUid1jbThJowy7bFX7SfefVNqUR6E3a@lists.infradead.org
X-Gm-Message-State: AOJu0YwUcB50b0vscpS0jpSofw+7A+4nPhHWheqmGUGlBSSmcHXDmu1a
	YeBNLaQgxcC/CqqodSs/mt05ziP4yBFB+cofby3u7t98+eFJJXaX
X-Gm-Gg: ASbGncsATUeocZaJ3YLMosVHjiNy52BonHeluV8EL3J1qddXphMMYfPyZHFRIVjcYgo
	q6IliYOSrE7UxAyT0Sw/6OS+hapj9hYGEimvT2D87mVRBpxkq6Onb7fSUySmXcRZLReaS3XZIaS
	VrKFLzukMOSuMzCIcvtKJg5l5PVTJkb2bFRVtRq7sHPbRy9dFlEXEcUJBU0hDybx9V85Y8EubZ8
	XR1paM9WmlNmyNn4wQODzvrSvBKjBVlpqP3atkM3DjbCXaYelxH4VDruhBO950sWRUfA7N0DFky
	WlZCXtDujzPnxL32m0w/RqVqHBebzwWHy/7rgMGvFyKIc4oXzmnsRtw8drHSBYI=
X-Google-Smtp-Source: AGHT+IEAPVafudDeKA7IZ+hp3781+KmAJJInbgDkuJoHFCm7mtISYKOW0uPGJOyF57LmU+R37Wj7OQ==
X-Received: by 2002:a17:906:4796:b0:acb:b1be:4873 with SMTP id a640c23a62f3a-ad218e54d32mr1432739566b.2.1747085338068;
        Mon, 12 May 2025 14:28:58 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:28:57 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 04/19] dt-bindings: media: i2c: max96717: add support for MAX9295A
Date: Tue, 13 May 2025 00:28:13 +0300
Message-ID: <20250512212832.3674722-5-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_142859_825668_98B68D09 
X-CRM114-Status: GOOD (  12.25  )
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

MAX9295A is an older variant of the MAX96717 which does not support
tunnel mode.

Document the compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml      | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 5998e2518be9..ab46a5f0bd7e 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -25,12 +25,17 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
+
   MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
 
+  MAX9295A only supports pixel mode.
+
 properties:
   compatible:
     oneOf:
-      - const: maxim,max96717f
+      - enum:
+          - maxim,max9295a
+          - maxim,max96717f
       - items:
           - enum:
               - maxim,max96717
-- 
2.49.0


