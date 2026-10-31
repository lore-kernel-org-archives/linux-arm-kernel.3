Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E39606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 10:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yoFLpRwM;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0RpEKKU5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=n5fn2TQdNGCA2VZcSuyjatq9JArIEf2Cj7b3OdvPmrY=; b=yoFLpRwMzRQPOqU8Bwu6sJONIG
	og/fNXGi3sM1ckSkVfDjKNV6T+/HImHcWrDpNFQ5JLNlbmjkR9PyqrqJ17pjI0m9qm9jJb1dC4LCj
	FsuzJ6afgZJ32B8Ow4/SGjfoxNbAikPok2LNbWlmjpt3QScXxVIbLlkBZHSLosnu2+8tpcHZXj8C3
	YSFrz+h5LqCc2411lFOMpOxZf5OcMZD20EYHc3iOl9uUoi6XcI6iyf2UMUxH6hjiTJv/EDDgHuY48
	sL3z9/smzj8DepzQaHpgvR2A7ld/zaOJNfK/iuGNIFvYC79877f7wqXxT/DU86XFWl/F7bNUq6QdM
	wminX1Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN6IX-0000000DDAh-2akP;
	Sat, 31 Oct 2026 10:26:53 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN6IU-0000000DD9J-1d9v
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 10:26:52 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so11280915e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 03:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793442408; x=1794047208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n5fn2TQdNGCA2VZcSuyjatq9JArIEf2Cj7b3OdvPmrY=;
        b=0RpEKKU5VdfNrA3iQvErwSF6Aus962Di0hoeivZ7LaVX69BFlvUiJ7gpAHNy0eH5I4
         EdSzcZGl7QcBPJ8GyrOn5ATvLIErczB8yw9XB/o+p/0WQqmKDB/AjJvn8AehBnjxN3j5
         vOhKKB5KS8Z5KC52YRUr20At/LU6QLfBOC05yljaJ7VzkDGGHHMpAO33RyLoBNhipXnY
         P9jy3n4dqtNVfXvo1d97L8+Xg9oB/sa6NhzWUopcIyKJPR3MaY7bQXZHIjmroCMQMU17
         mySYDDu24685DsOShVZVtH6LoUJsG9Fydu7UXVzF/g5bc71RMF96+xoPyTNaWNNge3HC
         gz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793442408; x=1794047208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n5fn2TQdNGCA2VZcSuyjatq9JArIEf2Cj7b3OdvPmrY=;
        b=P5JsMJWNp36JlzOYbSTpiZha+RohZAvBJY4ADEFCPXzgMvJ+A5V9SYDfUvl3AOr7+d
         AChw1jHJbMkY1RTUc/D0cxIR+A30+Lhj+rLTe8uWbUSNLaDsybSTw8mOJFSOwbxnrmA5
         Q2gru7qhWmz8ZyzNE1DNgRhUP59qNBb4BhsWcMU4c/yrBMjBIAA+51/qtQHQmEFQgD1A
         cDAIkWo69vNmpC9RJaCa13ulo4TwrA6vAw4JvIxbXpAvgYwhlOn0KwIsGRsrWoKlJe4T
         DjYZbbUs71WpnFJdhxcZY0ia/JmGUY/Pm0Ahh3bMyHvGiUuN6CyUlCKO2SebZamNtXQF
         zoaw==
X-Forwarded-Encrypted: i=1; AKwUvBxHY+90bkjNLQa1ufjBsaYzicU6oazPmll+tM+RQvNFdzTSdXVpQI1lS+D8vp+5BnNavhci6YTfWwctDK8rIlhN@lists.infradead.org
X-Gm-Message-State: AFq9FYLhlyHJCR+3lshjwKOaDuixwcrpPvTWa3GccbAhupCwZvIdF7k0
	ioZOINF/E3+OSZjQhi3jxXXnM7Odh1BESJBg4YxQ2lKS+qLu8zbVUOy/
X-Gm-Gg: AYBFou06ezGxwMwYFPcQH4KLqkr21UneAikZw09D7q4/0YfJeY4s1y2zAHIfBuxVsiT
	59Oz+kv7YcK2PhCmqUWgpdU0pLaAtSTaOzl+6V6CPD++gXsR/sThZaQJGPUCnWPbyIw6axMTJas
	eHZ3N9YGp0/1jctUFV4Yv9XbLo2MsDx8j8VxD6oysg6lGlMOyaxDH78708FE+NDnGcV73/Mv0BB
	rtdSW+3HjiMA/U221tp/4L3SyahTQwwhfnhQG8A41inqeBPEefhtgZ4QI8qEO3Th5LOV2/5Qg1S
	lGX4wRzJQzzcIp2ftsgraY7CWZKnrrIYGHe5t28qOGXlX1JvxcVMEjwzs2+L71kMegdRcAW9U+/
	+ufLdagSguJiRUSO/rxSBp73qBnf3DYc8EDS3t0Bja20+6sKIlSQSN1P2poM5sP4UqyLf48uR81
	IuVAzOnxtHRupAfRt5SYpiIXG9U7Xkr9Q1EK4ouaeJmmGV//AKw8DkLyHV4uNIf3Fn5lxGJoX3L
	RIl9hJQMpbnM91y2ZmRK/nF8385WbU+HCXDXHmkk9Xmasxm+Ofd4FNdmjG+sdAoMm3mQWyn0lp1
	XUFIRvDGhmd//MHp7ojo3v08oJGHgXNYCZGPXBZispnbOXWzmH7IUTLxR1WdbM7cNYRhW1bYXAd
	xUUpXOFe1Tanj
X-Received: by 2002:a05:600c:4e13:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4ac1228978cmr101856105e9.0.1793442407739;
        Sat, 31 Oct 2026 03:26:47 -0700 (PDT)
Received: from Ansuel-XPS24 ([2a0d:3344:54ec:1210:f1b7:9ece:c6e2:5df8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abebe33e79sm90903535e9.2.2026.10.31.03.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 03:26:47 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: i2c: mt7621: Document an7581 compatible
Date: Sat, 31 Oct 2026 11:26:39 +0100
Message-ID: <20261031102641.12649-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_032650_439634_08ECE9FB 
X-CRM114-Status: GOOD (  10.55  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Airoha SoC implement the same Mediatek logic for I2C bus with the only
difference of not having SCL_STRETCH bit.

Add a dedicated compatible for the Airoha AN7581 SoC to abbount for this
minor bit variant.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes v2:
- Add ACK tag

 .../devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
index 118ec00fc190..e6ea5bc1c681 100644
--- a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: mediatek,mt7621-i2c
+    enum:
+      - airoha,an7581-i2c
+      - mediatek,mt7621-i2c
 
   reg:
     maxItems: 1
-- 
2.55.0


