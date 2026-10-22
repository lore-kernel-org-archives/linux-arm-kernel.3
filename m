Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CF5606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 05:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IGctBShd;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nQB0HnyP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LpigthDqRLOISWHRwgH4ImOLHvejKABBaeVzOJU0yrg=; b=IGctBShdu4jrzUfGEu/w4YZpRD
	69OOJbxQzgXp4MSdImwobtkSOTSeyEW6+rMUTNAjPE09Z93qklsQMbUhHUqdJZ2QXlwBVUNSvF4QJ
	jjF70xp3rZq6/cEv2SUfQqYFEo2HdZoc0ySGqbMBehG5a9LhoHpH0r+9epULvgUYbL2g6Fzdun9hX
	zXFww7mCgidRF7yttYVLvwVyjXRM6WOWz/C37CIbKUnRUmslEOec1jROX8z4L/sS93LMHXsvXFHjO
	jlB0eSDFSle5pi6eDaMzvVIM6SLyNnSg+rowKWa/eH69eB1MdqUAJB5RCYTGxtIJ5iXopCH5N8wrj
	H1iuVqXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJliv-0000000DQKv-1zY8;
	Thu, 22 Oct 2026 05:52:21 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJliq-0000000DQJJ-1D06
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 05:52:17 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso16181115e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 22:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792648334; x=1793253134; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpigthDqRLOISWHRwgH4ImOLHvejKABBaeVzOJU0yrg=;
        b=nQB0HnyPSAUg7JUIC+B81b3ajBtSmi3X10EuGM3lrdO0EywQGWoFqhWrEocXW00t7V
         Njl/sb0QqIIPo0IuaEUU6cu8ReLdTo36RUU2NaitvcDGFDWlpHVKK0PijCQrnsbXO1vW
         O1aGBUrvmgKpIWzvZOpuc6tsCUfTZrzbFxSvTFyCglIlSnnPx+lcUkEz+7kuFSXgoGDQ
         y0moHuWBqT9K/MW1g3WW+UBTwKnZwejk60JwrDieCAl0O+ALE6n9tRdlkScoE7ZKZyYN
         ms6fotxfS1gk+3X9hswDL8PW66wWQayzOomshjEg9EyBE3OepNqvhy+hL4iEWe9GhiAO
         kFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792648334; x=1793253134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LpigthDqRLOISWHRwgH4ImOLHvejKABBaeVzOJU0yrg=;
        b=OmJcd4tOyVbYH8TAC2pQn1BXtIUa11zW1ghGQ43DZRIXTG9c0y9fovR3K/W8YSUQcg
         etrA2UTtaUFhom13qMSMaeOy8qT+HsauqjYdrowTGK1c5LFhv5s5vDVxX3WXTCicRSXn
         HjkrNkFNn4sINIQ3DjTeBL+Jn0On9IsmBh4PiAPpMUv2zQLXM6IfK4v3gduPPy5u4wXi
         saNUFTFHbaYw1JJaHuhx9Az9+Adzdhp5GzeJLKtSwjrto0XGywLfrRpFp24XnIoa44Vh
         0YzrNERQeU//fW8OVz9NNxB/Gke3UEEM4uVZbioq8AwJSTOAWQJ1j+ouOmXbKdWdtE8K
         JiEg==
X-Forwarded-Encrypted: i=1; AKwUvBzzHB4896uWZ9PRUrFPn1+5tfeIXkvkOPoe0qgAxeJ0Ya/kp/yoehhpQXv1b5VWj3RtFsIccTnGvPt+0tyYayRp@lists.infradead.org
X-Gm-Message-State: AFq9FYLKVycRJ7Za2VHqVsRO44pH6gBSu5mQNv/rlQltRCU45RCmiBaX
	6+fMXtG+RfSfIHCjTSaH08fqRQ7MUF++0jUSUX2ZiRucdkr23xMon2MqCYxuFj3A
X-Gm-Gg: AYBFou0+X9QV9tkTGPUp+Td4DWmMKSEdR6bGPnCKy4+IARBAEbwX1RC1xauXe74ElQ3
	pyR1lMUb2ZpjG0pVLbK8rE0QgLN6IqUjXcBQRrPNC85hzet03DhXqKeg9U2Bc4QOg22GKF8Euh7
	IaBGkbj/3Ij3oid0bc7ca8Npe19VJJRTojXUSxucAHltToi+ef2OPxYuwMbEWmpPW9DveXkzjmV
	ii/d9ofiEsUBQDWEnhxdUsUhg2MtvN9PIzbLbEc7+Pgo0tiYmLB4PeLKnBtyv8tFgbgr6WAZREC
	8D+GnIx0hsKMWIIcbFYJD6ZN+2OHVwwonXE1ce4ggKVx675Ts5FwcrR9arFpYKSXcwnjUBItXQI
	jljU29jVBRvxNbgrZfZP375UU3sWsxpFaBf4OaLrvb3YC3580TdCSMJrsE3TPhUBQ+Ps6BpqmY6
	2eHPYzOJ15EHZTg/TIZ0uPhgNWhtR9j1XYPg7K1EKA3kcpFl4fgfX9sgjobdlDim+C7a6XFTUp0
	jcIu1BuCUl0zBQ+57n69Z/EB7dA05Uohsml9AHxPmr1X3PMlIuu7TuK+beHZMvL5i/8wr/7yk1E
	xe/GhAzaBsxpp/VKOubQf8RlFPCywKY5t1oObpjnMm9MvZl905I3LYww41EgWIh2BYWj0qWPpKn
	bcd9AV7jqwul1RoDODCUXBoc2H0eo1eZZNl8xcveYdDbHF9UCDXDMkzaH8EqgsXFyhi9/AHzf3h
	JJo0FUCshezaTItCmcqLvE7k0skw==
X-Received: by 2002:a05:600c:1f95:b0:4a1:e722:a0a7 with SMTP id 5b1f17b1804b1-4a1fdd19dddmr91581465e9.30.1792648334182;
        Wed, 21 Oct 2026 22:52:14 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-a0a3-b57b-feb7-50dc.ipv6.o2.cz. [2a00:1028:8388:a84e:a0a3:b57b:feb7:50dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm41312875e9.0.2026.10.21.22.52.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:52:13 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v2 1/2] dt-bindings: arm: samsung: Add Hardkernel ODROID-U2
Date: Thu, 22 Oct 2026 07:52:07 +0200
Message-ID: <20261022055208.17746-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261022055208.17746-1-pepe.schlehofer@gmail.com>
References: <20261022055208.17746-1-pepe.schlehofer@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_225216_347874_8625E123 
X-CRM114-Status: GOOD (  10.11  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add Hardkernel ODROID-U2 board compatible string.

The ODROID-U2 is an Exynos 4412 Prime (Cortex-A9) based single board
computer featuring 2 GB LPDDR2 RAM, SMSC LAN9730 HSIC Ethernet, and
MAX98090 audio codec.

Reviewed-by: Henrik Grimler <henrik@grimler.se>
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 273464400477..f863803c84f8 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -86,6 +86,7 @@ properties:
         items:
           - enum:
               - friendlyarm,tiny4412            # FriendlyARM TINY4412
+              - hardkernel,odroid-u2            # Hardkernel Odroid U2
               - hardkernel,odroid-u3            # Hardkernel Odroid U3
               - hardkernel,odroid-x             # Hardkernel Odroid X
               - hardkernel,odroid-x2            # Hardkernel Odroid X2
-- 
2.54.0 (Apple Git-157)


