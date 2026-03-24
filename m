Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A12BF532DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 05:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WE9EB/AJhGsAQ2IQOKEBwLjZmu9qCQYkTkw3Ul7ABII=; b=3SNHKEQgCjQ6ymYNdoPb0swTxm
	v9VrlbcOh4+nlgkFzRFc7+5WDJDn0BurwsMhS1v6fh5zdyChQwmtlV3GutVit1gbe0WI4Kw/DRy5u
	nPQd773li94AyaJitQ1ra97IgpVwdHOhPXqbNooxq+Oer4KMjQ/XI4MetZ9oImwCiVRgyJQcDoblB
	GmLFY79XYcu/bTfmXeTLNWHnL+DvwDQRoxj+OtG+BXxWxsbA+5IZIbXwHC+hj7/hd9xgeUrElUuso
	eN5+3ma5c1naKBEESOfIeR8/wu7JJeIWZtGvgp1N1VJqen8phX9T5hd1cCABCJzQiNbksROVThTmr
	ec/2toLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uLu-00000000aTu-225o;
	Tue, 24 Mar 2026 05:30:54 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uLo-00000000aOg-1Yyt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 05:30:49 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-35c06831dd3so48256a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 22:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774330248; x=1774935048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WE9EB/AJhGsAQ2IQOKEBwLjZmu9qCQYkTkw3Ul7ABII=;
        b=ZQxKS4oriNBYMJ8shKZ5osQPXJeEAHonlZ+09hGLUtEDQKim6iwAxKx/I1Rw/f7d42
         fIbPHcqWzsUkM8tQp84mas6F2wzzTuSVe/JcKXPX27Q84z+EvHSg51qurZ7ZzlUisYU/
         3yqvjmt04gbftetV9e+iFFJUhAlKdYZz1w4Rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774330248; x=1774935048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WE9EB/AJhGsAQ2IQOKEBwLjZmu9qCQYkTkw3Ul7ABII=;
        b=kMzXYOkUaSk9Xdf19LsLPl+hS2pgxSdlU5AB/zdgxyRlZZ/6LgIDBPnVGcXT1tFy88
         w9h/kn9NL9rTB9o3+ZS4v+CZKThJSRrOcBvQvBupqJpQGVnQvTCt2Dv5trUGdb/rxTtQ
         2gBXNeLD2Aitaj6JC6aEXZP/mYDYs4AS/TazTJdFAxBOF8fS/KBEuK0tCBbUlFic+exf
         9QfHOc8YBrqqejzNkNm8+iv+N/+LFfmdslmEt8Os/FDEkMPvQan7ajyNrTSSxSoKTmrY
         vWNUCMPdiDokKV/GydAOj5stWzEG2e99kan3LRjEFqzaRN/ESufnQ/7Jus5TBsQ8fphp
         4CTw==
X-Forwarded-Encrypted: i=1; AJvYcCURhCoOOJbNp7SuDeOuQ6HLXP5PEtPebvN6J/zsmCPLFQYaQzF7i8MI5qBwg6ysx8QDryisEmF83HYcz7voY0pb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5KTpU1RUvnz+aVAnSDkuw4Tx3RTic2vks4JEIWCF/CiQtlGlB
	g8G4Fvlsk6SpnA8nL1bVNnXgfom6+agzhqASjgNRPfF0qS/p4e1uexyOy2hlYmypUg==
X-Gm-Gg: ATEYQzzKGBXwJXSZChcTXgv9ei9KPLJRN2vrKLsbDUVxMquwrDKCEjuU8w3oSIsAHH4
	FBFzFaDrGH1WQNjVfUZ5reNjg9BRV0E3cKXnJxKU6zAf3Tfrv3q35mB24Jpu7A0vdC6gVbNXjXB
	cQUewJgLxn7aZVkZZIvYhmDPpfNK2ckMXtVL3XWQNj583GAbMW5PobnhFY8y0WbpX+ChEWBznrL
	QEFsFnvEVSFL66UkJzUC68pbBqC2sD/NqOFLKmwM75NGYNQMFU8lJ59XLW9O0dp5HgL+CGiZ12H
	heVSR5ZvWXeTcum07+RErjfpDh2hrcDfCi7gzSQ6vO12Xi2YC7QU2BwIEQG/dhiv51chmdmeFmC
	OzAtGW5wNUoa4XWGHxpgSpD/I0CwjZpHyAel7h/UppAkK6hGC9R+hA7UWx8qFs+XPrRrvj0jAAH
	v4rX3BIGsAjyQxZ75StFRl4g6f25wbxbre2k7V0A1wdcvI065ow4JZOOV0a/82y4usI4ibHMc/c
	KipIUYt
X-Received: by 2002:a17:90b:2886:b0:35b:ea35:c3ce with SMTP id 98e67ed59e1d1-35bea35c476mr6485875a91.27.1774330247814;
        Mon, 23 Mar 2026 22:30:47 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:19a5:8f2f:d584:8078])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03211351sm953507a91.15.2026.03.23.22.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 22:30:47 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH RESEND 1/2] regulator: dt-bindings: mt6315: Add regulator supplies
Date: Tue, 24 Mar 2026 13:30:28 +0800
Message-ID: <20260324053030.4077453-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
In-Reply-To: <20260324053030.4077453-1-wenst@chromium.org>
References: <20260324053030.4077453-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_223048_414564_299B703B 
X-CRM114-Status: GOOD (  11.42  )
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

The MT6315 family of PMICs has 4 buck regulators. Each regulator has a
separate supply.

Add these supplies to the device tree binding.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/regulator/mt6315-regulator.yaml        | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
index fa6743bb269d..ba99a0d02bc7 100644
--- a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
@@ -29,6 +29,16 @@ properties:
     type: object
     description: List of regulators and its properties
 
+    properties:
+      pvdd1-supply:
+        description: Supply for vbuck1
+      pvdd2-supply:
+        description: Supply for vbuck2
+      pvdd3-supply:
+        description: Supply for vbuck3
+      pvdd4-supply:
+        description: Supply for vbuck4
+
     patternProperties:
       "^vbuck[1-4]$":
         type: object
@@ -51,6 +61,9 @@ examples:
       reg = <0x6 0>;
 
       regulators {
+        pvdd1-supply = <&pp4200_z2>;
+        pvdd3-supply = <&pp4200_z2>;
+
         vbuck1 {
           regulator-min-microvolt = <300000>;
           regulator-max-microvolt = <1193750>;
-- 
2.53.0.983.g0bb29b3bc5-goog


