Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4A6CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 22:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=13DnP3wRqU+zsSJbDDW+krsmHK5NNVJV3DHwW0NPTaE=; b=zD9SeVmZt4WG9WNKsI5BaBgsbr
	QxZJuXtzl/elb8qDJj+En+W2k+eEoL+zbfxxtRjdOlZuVRaM5DG35r+QBcn55IsRsLMmrtfpgam/4
	hjHNNZEfA1rEEij83LYb0BzagCPLlv3vzCkD/VVUgJ+HTQ4s8AD3xGofUNbuOlyjtzKPzPoXS7R3b
	OIXOmWNTDiyROQNOXd0hhy+raz2IXLeMA2Ca+ID/MDYuTLt42c9cxE40QlyZF/lCBO2we1S3ba0jL
	c5ibeQUdisqlQ4pP9qT6fPEcgFoHLCdgPrSYUzlv41ZVsQNGIrLtqcz5QkDQIcBLChWn/CNCkOfHF
	AH3xwzZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyHxt-00000005ozd-2YbY;
	Mon, 15 Sep 2025 22:46:29 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyHxq-00000005ozC-2XpJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 22:46:27 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b07d01fd4fbso487928166b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 15:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757976385; x=1758581185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=13DnP3wRqU+zsSJbDDW+krsmHK5NNVJV3DHwW0NPTaE=;
        b=DxtSd25YLYpGM0uAFAL6ffq+NTohHyo77CM6veVXgmV5pOtIRoSnoU7p6/dsEMCOrh
         9pQXdJBv/7DcayIeJREzzexP29ykRWIiaF7WAVcRkiGkkWMQTUV0p0jkBNPhgwz617cA
         olMI52i5ChthtLKE9F4U3ElMwromrM/IQfYFHLzflSMAbC6y9bbVGeKea5/Lo+B72tJ7
         i2IFbt/91IVX1rB3JklcW1d33TqZ8W0mnsxVGuCq4iBT4vvqYSLvNE0XN82js7EdTGKC
         C2JX9wo1JmaFjQ0G7WbUbn1Fa3aijx/fa1cpW2La2qjl1RrxTpI9ZK8KBeVspcRXQ/4U
         i8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757976385; x=1758581185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13DnP3wRqU+zsSJbDDW+krsmHK5NNVJV3DHwW0NPTaE=;
        b=A3LDGOfymfEmDFCmkZQSzl6+/d1qNNnAMMaR8jZajQIOxORkdcNleaevJx+eILntSo
         pEZNgTJzfs799wJhAVvxvEU31nisidzDl793YbO66fERZWk9+il14tlNrtfbZ8R4TzUK
         gOmuGC0GxGNtmnZC4J4ILRjD+jcnBGLsyFHCaE3dCJU+2SDxcWTREfHW42evXN9GQULY
         34ISQIPSsOuJDatWvXJ2OKwsSJALZAQXp2B0MY6VWj4TGA2IqTLrvSBlY+yWDYMimCJR
         JYVa+9Xe76hOtCZidF+msqvHoqxF+2GtpSDZnFKfRmkw57xQP9xqKbehQ0WKJWx9YO+A
         cgIg==
X-Forwarded-Encrypted: i=1; AJvYcCV5ayYzkOauX5QPoU1OiCnynH3bNPRkz2WfcwL6fGOghgUlBsF9V5a8+f/x9ldRiQQ4ak8cDRDdjwtExBDqhmMU@lists.infradead.org
X-Gm-Message-State: AOJu0YwW5rX+pe+N6s7Ns+YXqcuitXVNso+KhVfXifOQ2cNF8mBhMIGE
	czZ6gdKjyZVspBlp1Jf0HWoVOIJR5NTUEmgZFJjaZ+jIzyVMTxDbTCA=
X-Gm-Gg: ASbGncs0mBWfDQPoe1hNkDAi3734tNmHKgAvsUKnCevW6xuZvW7+lBobzYkN580iFnd
	/GAzDMkbRw2Dyz1a8F4rKrwavjkoyW/gFHQySEvILAEo9M4TbNKhVHU40bEIILQlHAjcCVffmLJ
	NCIgZDAMsq6mEhLt9TysyB9ZNFv+HuDoduRor0mdjUnE7t39RekNOHxfk3ucs9LWvInh0Pg4zbM
	UtpmPNlzCW03FRo7sRXVkIZ80YJBK+AfDYBdaXwAFvfEN5A6iKvPayl0A4e/g8w2NVBCIuR3MvD
	3CRjeBzVtVb464PydfUIER+jd9Od7aDyqpKh6k2/AqfxFXmKaZISCjDS1qR+rtjlHxbvnDBCfdY
	pJPJBGGDwCiw7lwOjosFn2nZj8asP4sMRq9UQ+rL52veGPJM=
X-Google-Smtp-Source: AGHT+IFC1RDAQdftftflM3IR9GIxbYxiAqxOMxHqEUoMHehF7YawNWtyqMfqbQIPOxJCVyY9vyzwnw==
X-Received: by 2002:a17:907:1c9e:b0:b04:5385:e26 with SMTP id a640c23a62f3a-b07c37a7fcemr1575363166b.58.1757976384468;
        Mon, 15 Sep 2025 15:46:24 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:214e:a6f2:7d6e:32b1:d615:2ff1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32dd5bfsm1011153366b.63.2025.09.15.15.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 15:46:22 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: robh@kernel.org,
	s.trumtrar@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH] ARM: dts: stm32: stm32mp157c-phycore: Fix STMPE811 touchscreen node properties
Date: Tue, 16 Sep 2025 00:46:11 +0200
Message-Id: <20250915224611.169980-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_154626_648481_29DB1A66 
X-CRM114-Status: GOOD (  11.92  )
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

Move st,adc-freq, st,mod-12b, st,ref-sel, and st,sample-time properties
from the touchscreen subnode to the parent touch@44 node. These properties
are defined in the st,stmpe.yaml schema for the parent node, not the
touchscreen subnode, resolving the validation error about unevaluated
properties.

Fixes: 27538a18a4fcc ("ARM: dts: stm32: add STM32MP1-based Phytec SoM")
Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 .../boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi b/arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi
index bf0c32027ba..370b2afbf15 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi
@@ -185,13 +185,13 @@ touch@44 {
 		interrupt-parent = <&gpioi>;
 		vio-supply = <&v3v3>;
 		vcc-supply = <&v3v3>;
+		st,sample-time = <4>;
+		st,mod-12b = <1>;
+		st,ref-sel = <0>;
+		st,adc-freq = <1>;
 
 		touchscreen {
 			compatible = "st,stmpe-ts";
-			st,sample-time = <4>;
-			st,mod-12b = <1>;
-			st,ref-sel = <0>;
-			st,adc-freq = <1>;
 			st,ave-ctrl = <1>;
 			st,touch-det-delay = <2>;
 			st,settling = <2>;
-- 
2.39.5


