Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CB5EE57CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 03:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BmPknBa7EUoDVTpeNE+XfDt8WIjV/AuJhnQGvVdFuSM=; b=HfK4cK77TpPNWselU/cGeSjicC
	flLyGS+cDCwvCjsbipeIgkzgeLRWcVMqrOfLmbYKkm2mV2/kPW5268nIoVhUKmbBoYt9p70yE15bn
	bjLv0ICKKQBlLmICf/gpzEtIFZtgVheiOpozVI6mRTlPD4IMzLiSTevKT5Z3wzvVK0L0MW4OnRxKc
	uw5yz1sEKVjn/L/HztLsxoKOrDloCEW3fN1fhn8eKQo+WAxpfzhMYLIsqhgKaNS5Ir+bLLT02+/Xs
	EIHaitodo7ICKN7EfOFHteXzUkXae07K5MXEJoIelCIJVkAq+YsJloXtDh/GN225wMcZmHJb6QnMf
	cdauQ7cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb9bS-00000006Yx5-1cp9;
	Thu, 01 Jan 2026 03:43:58 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb9bC-00000006Ypk-098z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 03:43:43 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a099233e8dso93998525ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 19:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1767239021; x=1767843821; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmPknBa7EUoDVTpeNE+XfDt8WIjV/AuJhnQGvVdFuSM=;
        b=CX+oVtJKyjNz8exDvwNOK3/ojUPMsjJM0XlWKlSiW/ZPwBrAEejBJmYvBHazk5aG7r
         T526H/sD4xzI6u60MhOD+BmcGO8My7dgoR+i2P6F5kwJ/m3rnAKNCEQxlIJOX3Vp6XhM
         /Pxdyctt9W8ZX/Mn1Mx+vX1bH0+ZZNDo94zzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767239021; x=1767843821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BmPknBa7EUoDVTpeNE+XfDt8WIjV/AuJhnQGvVdFuSM=;
        b=Le7wsbL7UJRv9alrA0Y0NOumumit3lovRD4m26Z8k0v7C44kPq16mZ3OJzUYzIh/kB
         hPRvTICsyx7fXilyKp5qPvOi1GhCVY9jhGDUnUA6ZEoSAoFOgSfxrRHg+DADPFS8iTmt
         uVeJm8EtEAZgb+DK+jYubHDUk+r2O3og4lnjZPadG2xzKgqkgm5Zw53szGyOXsN4by6Q
         9iJrQeziz6UnH+RDrLtbrS6FbUBKgw1Viy9XCPZB2ceRkkuN8TPBQp2ESHU96/gEF0KY
         zbAIPYauMrQV5hJNUjOFFpR7oEO8ryPkik7H02D4aVzMAPdH01wCjZcwozK8YWZufEq/
         6JTw==
X-Forwarded-Encrypted: i=1; AJvYcCWzF69LRzfyDDmRFFHK+nsAIH/DlF7gtg/FJl0JK8Nrwyccz+5mu8uSyEsgvyFcb1/5XjOuDvzb+E4yoZGCrkRI@lists.infradead.org
X-Gm-Message-State: AOJu0YzGDjIH7uls6/0UkTcVwEe87QryZHEwvQek4mrnVIQXVOXeyyBz
	nY0/rl76uS8qA1sCdPgxBcHgrin72ZKqzftKNvEWIR/678uogzsaXXBUVf6894Cwi2E=
X-Gm-Gg: AY/fxX7C69GBo/bVIefe0HJXXP7nwoIY430PnNlJ5JEYtnfmIJASW/nt7y5fyaTQ8+V
	+sjHsZ+6okpxsD+AKz7sg7ghf8eVCPARnvbOXIjRW+4nwx7woU3/KIj5H44s0V2FSxUVtxu0yxU
	nGgpmKUDgXKVPkwH7aIjfQ8hHMslYG2EfiYd+CyyGAmQi4YoDX31wmw+yQ3+U7AsNfhKiAJhU6m
	Ov8/m6tbp+ZuhQCxNSy1PTeJ0yxU/zKwIzY2kgkZXfLYvF3sotSIgyZNoJPvvZ6DlHMSDA6503t
	ohk7cjn4xXbaZfbcS04hUaVcsCPa76fOPhUZqv0gK6PjbBd0xxbhgNo7x4j0OPMCwhguuOnYodJ
	WQyirqdH+wob6vvt60g5LOhh7uC0NINWiH3O1q6vd8rBvT+rl0b+FoixiSR5gvOz9o4f4aDzTqY
	XQql+PXoxqGF1Ebk+Gfy/LE5CdnIsvqS/NM4xQc6KkjWtQ1XeFFxcR
X-Google-Smtp-Source: AGHT+IGRu58uXm2DHJ8VgNh5qWG/ekglaXXYjNdXsytwCBSs2FYBPZ4rNVRhi99TEkrsAnoWzlvp3A==
X-Received: by 2002:a17:902:f607:b0:295:9e4e:4090 with SMTP id d9443c01a7336-2a2f2a3cea1mr398407675ad.52.1767239021487;
        Wed, 31 Dec 2025 19:43:41 -0800 (PST)
Received: from shiro (p1536247-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [122.26.212.247])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3c8286esm340437965ad.33.2025.12.31.19.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 19:43:41 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: krzk+dt@kernel.org,
	romain.perier@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 6/8] arm: dts: mstar: infinity2m: ssd202d: Correct memory node name
Date: Thu,  1 Jan 2026 12:43:04 +0900
Message-ID: <20260101034306.1233091-7-daniel@0x0f.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260101034306.1233091-1-daniel@0x0f.com>
References: <20260101034306.1233091-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_194342_071927_1270A499 
X-CRM114-Status: GOOD (  12.62  )
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

Memory node name didn't include the address which was causing
validation for all of the boards using the dtsi.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d.dtsi b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d.dtsi
index 176e10a29896..74621a7628b2 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d.dtsi
+++ b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d.dtsi
@@ -7,7 +7,7 @@
 #include "mstar-infinity2m-ssd20xd.dtsi"
 
 / {
-	memory {
+	memory@20000000 {
 		device_type = "memory";
 		reg = <0x20000000 0x8000000>;
 	};
-- 
2.51.0


