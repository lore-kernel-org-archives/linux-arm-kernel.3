Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FA8606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 20:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KGlVeUp4;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ul1ibc7v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LpigthDqRLOISWHRwgH4ImOLHvejKABBaeVzOJU0yrg=; b=KGlVeUp4Cn9FGx
	SKUb3gs9faYS10+9eiYAezh87GuUsoX1NBzGpL+lcAg4hVSIwfgY9WDWYh9A+j+E5iacZBqKBpsLm
	JjOQd/X8ud+kB5q05HQ+TFukFkGgsTlyJ/mCAHQczFqbw+4z8fpxYwbbUDxtoFnAfVhGQzd9EYIld
	BqkQUffWNT6bXkcHCTyCoOj02cb1Ch0eglAQUPiBI9ZpOGkkxyC+XU7BoPU/OocZ/G2xyRiQRF0fx
	Pr6oagKedj8sWQje/OyvfSc8zZMBFpooXrYGi6aE/GbwN2dHUC6DpomFv1BBfIMGZB/TW021f0emB
	o2CT0zs2dp0FoDddlOJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLRW6-00000003EKv-0BFQ;
	Mon, 26 Oct 2026 20:42:02 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLRW3-00000003EJu-1GVa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 20:42:00 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so2093540f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 13:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047317; x=1793652117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpigthDqRLOISWHRwgH4ImOLHvejKABBaeVzOJU0yrg=;
        b=Ul1ibc7vjBnEjaZgKTgfFp3Mryj1ESlmH2mkEZKmlLxnWJqyzBPQXf9XQhZHEO9tiQ
         LmCTsqW57SrZnrXMwVpqZcSApu4u9GOUA1+OonFH/KfVL+Hx5S1MXGvRh+G/Vk1TCrxs
         p8KJSoHnN5Ds4N7GLBBBqGFvyvS7aR7ZkTHlW59SrNnnLunVBzxRjnd5+Q67qPHG7nuK
         YpAyp/txnx84yPCVU/recmo1sYDbS5hls4MwKFXY0NZ3NgDo1hAE0pQYkwV5J1u0u48R
         AIuOkqJ3l0nB8cfre7EJbE4tRSjnxVH/zMS01/50qmxhzsnLwJVFK3I17HLudEYFFL4U
         TNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047317; x=1793652117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LpigthDqRLOISWHRwgH4ImOLHvejKABBaeVzOJU0yrg=;
        b=sxJbUlGMneweOYDvXPheJv6WjPzw403KcGza6TCxUsUoeNqBpnmjOCJlW+7AP9TTcT
         9HpGPZWcdyHRdScwYsDtsdgfSL1X6fccBaqwjuIyXWQ4aYrTzMLUGfqJz8fULA7n8BZO
         EnlPZ4jlsm276IhPJ5QLzTkCDV7HU5mqn7YLQgogWki1tO2IzxAOsZ3/NxzQY31xMZod
         CKSqDRFjVAxaD5yu7mwhd8v6Cs36tLpwESKj96NmybnW02kSGggeA1ZF6v1b9V8XjDJv
         Dwy2dSMzMaBv7tWWJQU3rUVGVsYB6T/4y+ByzipkZnLRpONe2iIaI4JHvloz2NRwJefo
         bC6Q==
X-Forwarded-Encrypted: i=1; AKwUvBx2X7p8QMqVvdnLjO/OAXf66d5USUyBGbRa2bC0ndc/5fXYG1lSxoKjU1Fap6KyyB8krclBOcFRPpoaruignmfJ@lists.infradead.org
X-Gm-Message-State: AFq9FYJxW9DDeDQ0dOyED554l9qsL5wKm2Uf93QBFloeSX+64bFBjz5X
	SMpFrWeaQbObhkTzG7tDu4xnI2B5OX3FRYtoc5hUkd+46jnP4PsaTzit
X-Gm-Gg: AYBFou3pPmmFqJDWwX9t/8t0JwkZt4WzMlxgvcCcCwZ/bP7Hvm6hyakqPYVWXD6P+NQ
	jl3eVcI7mUPxt5we4yjTosBtphPFOTPx/gqfI7bGobs59jM0QJiopR2IYved2Y2raywOxPA1Q0f
	R0M5f0YCmz1xgF0y0zGZ0YdA6IDH+/MBdmgN+ihFr2EJ48FF37DMg2UEDpc9K//vBmlVf6kxHGW
	rrZakiRPeviS9WwfAZ7M5CrArAoO0x2GozIR64QmISyIIu+OJ/WYUVv3KOMulJLmYB0JLV23dHm
	P58GNeqdUw2uXf03JrViZ32zJ7KMUYUANndR0AhQUXZcoo5oQuXoVZKWP/MNYsMvC53IpqAjZ1M
	ws+qQp9xYmQl75oaqURd6308a1uCm1jeqvfozZqF8IUb9eqjH5ZE8mj/gfaOUbcEQa6WgAGCUf1
	aIwHzqKkav/1CJv5f6ioAVWfUBwrvfk77Pqg/sURHAiig1qPwP9qgidPmHRQ2ay/Ezs1bFo+yUB
	rkDVOo4zsFU713XWAXcTeAINM79WfhW1UwfcwZqckmOIVVZeAoBjoPLtHsnQB74eNkaFCUZnWCE
	HrcZnN+a6x7li/sRC5QKzmo5qL4lBZXnTCYJ71L9BoPpqyVgkSz8MO6UbPSRx64G8/EsTeJ2o2E
	/u4XILFWIOtaAdoOH9WJEDsdwfQdaiOk6CKUbQ8i76+wBnIhcVOgpoWIEZ3WhDTMxCX+xtXufaN
	qS3NLU
X-Received: by 2002:a05:6000:41cd:b0:48e:d36:59 with SMTP id ffacd0b85a97d-48e3eba9916mr13011096f8f.57.1793047317271;
        Mon, 26 Oct 2026 13:41:57 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-8ce1-bbf6-5949-b0f3.ipv6.o2.cz. [2a00:1028:8388:a84e:8ce1:bbf6:5949:b0f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm19053152f8f.10.2026.10.26.13.41.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 13:41:56 -0700 (PDT)
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
Subject: [PATCH v3 1/2] dt-bindings: arm: samsung: Add Hardkernel ODROID-U2
Date: Mon, 26 Oct 2026 21:41:53 +0100
Message-ID: <20261026204154.26378-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261026204154.26378-1-pepe.schlehofer@gmail.com>
References: <20261026204154.26378-1-pepe.schlehofer@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_134159_354856_2002FAC7 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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


