Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB89C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 13:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxF16l3zt8tY8sRNrzE5FLjqAdbnZlfk++/RmClHsQk=; b=Zke7lFTIjRKNwHjr6pUwpwarEx
	Ttx2xGrxk35n6FuvdXrF/bd6vHBIh07syKM5QwC8edJEo/4EXAwpAAnSkx/kjG2+IDvj4FujavmZJ
	rLIJewf+AMtyBO1E3tUyRio8+7Wg8fm1YZFHTvojuiidSsBPt+0/4teAYimYyCoLfK8UrtS0s7ga8
	9OTYOy0A1hdZygaEYD8QqVr/5+5pBQ23ogOoNEx1vhAlLBMetdeD3Yx2jdTe30fzcqH+kvQwyqeuS
	zzIVmRWvUN/VCCWX5Dgt9BvfSDoLwE75OEFeQoRYFUG7x6wR85z6pvUDxyyt1jzj7Db8eZgKFJXdr
	P3bsqiPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud7JT-0000000EHlD-3kv1;
	Sat, 19 Jul 2025 13:09:15 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud77D-0000000EGUE-3nMr;
	Sat, 19 Jul 2025 12:56:36 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-455ecacfc32so13387295e9.3;
        Sat, 19 Jul 2025 05:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752929794; x=1753534594; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZxF16l3zt8tY8sRNrzE5FLjqAdbnZlfk++/RmClHsQk=;
        b=ctPnpRAJJoHr/343HfRRUt865nsOUvx6WhF5zz7aZiCWe8UddDSMn/5jg20UX/vxxJ
         E45yAZ0dfbFGyh6/Ya0P1VJyHU04ztmwvPdC6x1X1ixiDU2DS14vuBSKKB3xqTwU3KAy
         2srX2dLPF2KGVTDxfMKS6fxufy856NCYMRAcFl/czQw8BefzG7Xrz7ek5LlFuJUwOocR
         goqxIXk7sq6tNa1AhdioaYPeuonTP2PEiUOS/Ir1A8/uhF5jx6bUOeVk4iMwmIsScVWw
         USpSdcqlY3SYNZOre3YnAUDZDacyH4gC/00SX2moiX9aMLMOHr3dhS05Ep2K7PODOqOp
         WbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752929794; x=1753534594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZxF16l3zt8tY8sRNrzE5FLjqAdbnZlfk++/RmClHsQk=;
        b=cHZhQgf4kgyid/OhnlCDq1T116FcGjHpzR3JuzGzfqLrtkxXm33G3gACgRttVylkrl
         rYJFjJgr0iHnhcjqUJe+9pfur3G9jUQkqQ12lJu80801g4htxeLb9oE7eKGBwexOvOjz
         nH9mKFZbYhVfUk8VQqbtLMGa17vXTFKvuuCOebUwpSvyv6rFHP/+r3VYh/v18HH2PTjg
         TAvs0p7TTYrHCRjGzvgApLBE9hALERAr5zEEDUEZLcfDwKHL3S2/iyvmLMxtTMfC6FVD
         F5IK++h/iPFXbUBLLpnsXclroa6qCD5HECcQzIjpfpnN+YFBtqotQpfIxafWGAL9YVnl
         9mmw==
X-Forwarded-Encrypted: i=1; AJvYcCX0n6y3Y0xMoXMtKRMPn6ucfu8TuPDpmiQVNTesrFYo6/4QbxFITp6LdXawrhX+22M6ptk/rjLybCWSIf1kJuF5@lists.infradead.org, AJvYcCXSprpa4t9sJlJkAKarSHko5Gx3mE655BAINnfyGRVA3f2uzJ+PfQNkQrTMC3RgK5oKMoE2sV3XiY3Y94/jIbc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxzE9BEQDiL5+dU4LQtCrhcUf4bMLntQo48Bc13x0zruvNBxQk3
	Aj9fNg97A0jrCj3KNHgOo847VB05/pxD0cblDTtVPOlck7VgrNmrLGkx
X-Gm-Gg: ASbGncuHCBuq2J67f9WzSVBBbabwgskHZj6SWerQFX8gfI6ifBe7jkACaE0DNt4uAUN
	tAJ12Atvz5wqmbU+afVmVTn6Pf07KBraAn0MTsVCJJ1w0IwqEFjRYYuq9AVnfvgrbqT3h/gyUqA
	HWHyFL0UlI5rfvzmE9Pmr8i4Y9U5OKY3cYp8WUiCIqvpvXjLhPb/1SYv3GoYMkJwpBBhpAUCMgB
	wwLOKXKfhTxwRYZ/6Qo19JNwjLTwn3Em6XlIIK0tv5broOJQP1SkSfYjJDIvrLIQE3BJZ+t0Q4Z
	8IXdjfUSYlSLm4L/2xdVJSIiHQN+TovFHeCx0MwToZ2MAlm3EmfFQtCqXoPFX1rAFuY9nrxQBLc
	CtM7KLB49FbPfYcrudcSweZbq5DbRmen10oH3T+ECk1q0HfUrOPc1o0Nc1RKX8Kt1g1JKGbs2Ta
	/Y
X-Google-Smtp-Source: AGHT+IErHyd8wFBnJDF+WNgRh9G5CvxgmcOoZYRsh1TvapWmYxtxbpcLIUSOUNS+UJ/rCtM4NIuATw==
X-Received: by 2002:a05:600c:310d:b0:456:13b6:4b18 with SMTP id 5b1f17b1804b1-4562e2a59a6mr156638375e9.31.1752929794405;
        Sat, 19 Jul 2025 05:56:34 -0700 (PDT)
Received: from Ansuel-XPS24 (host-212-171-170-230.retail.telecomitalia.it. [212.171.170.230])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4562e81ccb4sm106688005e9.17.2025.07.19.05.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 05:56:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 3/5] dt-bindings: i2c: mt7621: Document an7581 compatible
Date: Sat, 19 Jul 2025 14:56:13 +0200
Message-ID: <20250719125617.8886-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250719125617.8886-1-ansuelsmth@gmail.com>
References: <20250719125617.8886-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_055635_959203_E96709AC 
X-CRM114-Status: GOOD (  10.23  )
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

Airoha SoC implement the same Mediatek logic for I2C bus with the only
difference of not having a dedicated reset line to reset it.

Add a dedicated compatible for the Airoha AN7581 SoC and reject the
unsupported property.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/i2c/mediatek,mt7621-i2c.yaml          | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
index 118ec00fc190..38118007b601 100644
--- a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: mediatek,mt7621-i2c
+    enum:
+      - mediatek,mt7621-i2c
+      - airoha,an7581-i2c
 
   reg:
     maxItems: 1
@@ -38,6 +40,16 @@ required:
   - "#address-cells"
   - "#size-cells"
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: airoha,an7581-i2c
+then:
+  properties:
+    resets: false
+    reset-names: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.50.0


