Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5807D606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 23:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Epk8JIWl;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wBgvDz6l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=g63FfAzTLK8IBBMlj2c2vg7SELBaIEsEoos/xU6UVh8=; b=Epk8JIWluZZwjI
	C05NZoovd1x16TlmJgBvGpeS5Bf6IrSNlf8n2nQKQhPnPUwQ4bhFZZKl3Fw0XiEHkPURoUZMWhNDR
	g8QXBnb8xmMGHH7vJNiRFFt6fWtUbEgj5r+jH+HkZvl/g3ad3hHePftvBrO0x2UHgs6r1NRSh85AU
	C3tdU84ny+Yq3zllpL4MKn+pISBqDZHAVLeT2INNeoI5NUGzVKkbXZ7D7zf62imrr0Yw3hHoPropB
	ecEfl/c7JBz8eklmtlPEzh2jEvi+1Gc5+rhSnvy6X0CjUNR8kS1UbLciqEuTmHZTZ/A8w375l2ivm
	sMY9wGiwGJv+GYVj4cQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMZJu-0000000AWoa-1Pq1;
	Thu, 29 Oct 2026 23:14:07 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMZJp-0000000AWnQ-3cqE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 23:14:03 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so289803eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 16:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793315640; x=1793920440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g63FfAzTLK8IBBMlj2c2vg7SELBaIEsEoos/xU6UVh8=;
        b=wBgvDz6lDrpdCGshhxs70hJdtrCwTtcI8VjqSqE3cqJaXCpa5KRQHa1E4Vt9UIyl1E
         N3AlVWdbs6k26PwG5DkPt+lJm4zXFvgB9I5Z81c6Det4ZUxw46Wj8EM8dMwLYJGcPiZm
         RdxAigd5rQGqMpWIcvWIjGU0fGBPU8D2EV28l4F/4u12jLkin3cgHFJQYuo/3F9Fy0D+
         T+hA8TiIEwgMeKFKp9j5UfV5KHygsElp7xrF5r1uyFqIRETe8de/xz+x6ynPXzhUxEOf
         m+yjZ+tebTX9IG3UCfB7QounPSPvIdI9ygFoYL+r0clp7hc0+3r02cdW4qdxwIT5xVoH
         GPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793315640; x=1793920440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g63FfAzTLK8IBBMlj2c2vg7SELBaIEsEoos/xU6UVh8=;
        b=aGiZbXmARjRz9M2J7gbLCohhJaPwtHg78A9KtiUhpWnyt9Y4rGx+3QWMkXqqO4omd6
         qn+gzBAbZPHgu8fWWkHq/NFkl1FHRFTu+lQbFyNeU9NwG1vInMFJjh1kLZAisSKYV5c/
         5AwGOi7XKPVgYkoaEMLWuaYqvQlRz9ZEuGTGBOCRfG0AAc1/rbinY+/3PqAWf1aYaiBS
         C1ts3aV8MK0P6Y0E84WDnsNVJd6HoW2bgYmAIZzwVzO9p95J2mu3F7EteOowBtoNLESV
         qtqiGuF/3JQ0lLYcfh31v9+QXNxbgYpAJ6uxk2DyXDgkdqrLZaGjT+a0lZiANmPCyCNp
         wuwA==
X-Forwarded-Encrypted: i=1; AKwUvBxZ6yAE3AqStJsftuco40mQ8fFvBtbLgvcY+jyIOV35b3RDphv5IobOistV4pz0a/t+177yoYqw4OtSLFU7D0sW@lists.infradead.org
X-Gm-Message-State: AFq9FYLEznyp7tQidgDXfkznmBXOcJkq3elGNR+LcdeWlA5KG5oUQiyV
	TuCHJvDGwNdisegHJu46gMuzkLP7rH0LvoLE60XrCk7MAtbNz6xjrToB
X-Gm-Gg: AYBFou0re+N/w5T83Pgz9z1s++IKBgStosIwax+RgQhd3Qg3NsHVS/53bY2vYOqPPuR
	xDUWMUtU6LnzmGq8xThMNIJCz91EcDltjwvq3h0lm5LPlJ/1R3qj79/qO/IAzD4++j20tWf/k1o
	uA9chBaAyJyKIqKg+8n4wkV8miRUo6wJavwFdkdTM84LuQwKi0DER9pN6+9fJuvNY+q5RHhUV1P
	66ombz1vdtjWUQuI4bcR8prG/E6dlRiSMx6sRf/m4vv00yVX20Je6icMyVuW8/9Q2GFeX7dihi8
	D2PYRfOy5Ve7YaFjwhMbH0S23Qwv4kuaIfVCZm6XkbH/qNGXZ83vEB8BS8rdK+X/Fothegl5h75
	4PiO5oGIz2CfaVfKtmsRHM6yfaRHjc3KcnqpPWUcKwUCuNhsxk8DBVzg61kFw5W1Qpht3l//ZOw
	jVjhJbpcYLRL6is8gPnD2hlcyeYTcK8IiqX9gEJXNC1qvVku0rx9sC0hsP+zpcxhFQzVSt7e4zT
	8alA+xf4YtoVB8fG04P369CHC3uaeqVsyF/7DvxlC2zKlhE4jCaPGux+ITh5PMVIpTMNGtkZeIH
	u2qHunul1/ZXONBJbnCHk+Zr2KrhRILS88rXG5EbmmR7eYSz92jGXKcgegUX0xE18Q==
X-Received: by 2002:a05:7301:4246:b0:368:7c2d:a612 with SMTP id 5a478bee46e88-36a42345878mr1118524eec.10.1793315640398;
        Thu, 29 Oct 2026 16:14:00 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm1662742eec.7.2026.10.29.16.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:14:00 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	andrew@lunn.ch,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Date: Fri, 30 Oct 2026 04:43:38 +0530
Message-ID: <20261029231339.9497-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029231339.9497-1-prasanth.padarthi10@gmail.com>
References: <20261029231339.9497-1-prasanth.padarthi10@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_161401_978622_136B895A 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

Add the compatible string for the ASRock Rack B650D4U BMC,
which is an AST2600-based server motherboard.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
Changes in v10:
- Restore the original Acked-by and the alphabetical compatible position.
- Revisions v7/v8 already carried both; their loss in v9 was accidental.
Previous series and full history: see the cover letter.
Prior binding review:
https://lore.kernel.org/all/20260518-rustling-watchful-viper-b9c4b4@quoll/

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index b7e70868e..c2275d7f4 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asrock,b650d4u-bmc
               - asus,ast2600-kommando-ipmi-card
               - asus,x4tf-bmc
               - facebook,anacapa-bmc
-- 
2.47.3


