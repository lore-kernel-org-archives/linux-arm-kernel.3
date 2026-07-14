Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E50FC4450B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QETVa7/EiIqTvvn2j77guxH/5vJlcjsNxn4OMO5PoXE=; b=BF5YeQVRmYQUE1HH5FLUtq76iG
	AfUVetX1OwjYWqfZIjsy1Sq9JIrqvHRGPJ4zIOnMBQ88xYiKwiVMcfCOb/27LqzjkgjV6F/mKQT+T
	LHcae8KW5gZUzWHeWbWIXIjQTiYnZN1imd4gEbKM8GSLL8B8I6DKVud/u8wNhGMrtk8VHgTiYrJrE
	uCwZlcJ4GxlcGuFkMq+oIPtjoWbWJhhIrw0CKByAyp40nsCm3r+Mq0A5EZ27Z4B365NHqlFXT94QQ
	2r4pI7Ad61vcCJXn9aBW5JkAu5RQUnq3uZqYkr/nHZh8cjkBUcsCeF7zYg8yhiQryLtIWKve62gh3
	QP+fYvdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjilV-0000000D2Z8-45ZP;
	Tue, 14 Jul 2026 19:26:01 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjilP-0000000D2VL-2reG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 19:25:56 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-4471b489240so1431034fac.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 12:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784057154; x=1784661954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QETVa7/EiIqTvvn2j77guxH/5vJlcjsNxn4OMO5PoXE=;
        b=d/PzqeK2b8ENogVrDObWtu5xu7oXz6U3KSdyTXxtNrv7IgkDtaC7UaOcGM1/+rM1NS
         Oa6j/MQTFov1lSOhHpKlsDrEAVMRUHDJOKQTeC4VBJFoy+JUYl6107R/0QBf8hkPnmlk
         t30zI3oTDpNhFGvYi/9+8JWZuTV2N4GoiIc5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057154; x=1784661954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QETVa7/EiIqTvvn2j77guxH/5vJlcjsNxn4OMO5PoXE=;
        b=IUatDj3j/lRpEhn/A14Q1DorWiSz97sa7yJDf4zvbjwxAHJaHVBY72fdy296/YABLu
         hlr+D+PlGtxwxyCWjzQs8ECMgLPGgvO47faKh/6bAV895FWLN174MWnZlcWDcGDw39pF
         6HRp0MSWYmZxR9HxfYK0beAdALlUTDZH5Uuqk2eZ1Gh3LJVuFAKza6q+65HBq4HCffDs
         D5SpLp6qaNfrCU4WbR1UjSQbINDwSFWD4ouGQA/CUBLa1en3sOIs7tK7MLMc2KTBmruo
         PzcM3dTuvhrFif+RjfNmeExGuHg5UcgANJsP4h937YPPIItonKeEVuH76Bd1z/hD/hjk
         pBcw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/RuEWeY1eOVM7POmaf13+waMNmn21A6Khh2kYHygg7LRkB+E8lbMYPmbT+So1OTaIrkSK8IxYE++P7+Mja6u3@lists.infradead.org
X-Gm-Message-State: AOJu0YytMXFlRCyNuIPaUtBE4ijAelKqOTeMQ986wWRuLqSv00ftuAyc
	mz+mFsGZHQs19+J9WmHbOhiCg4BoUnOXclgE9VfAWC4DfKvJz43YrIRjkzYaqvcgRA==
X-Gm-Gg: AfdE7cnZZgpak59m5QDxBDYvh85Ir9zRRerSBHjhZplmG8sigT8EYfOBt3H5K1uktmg
	/4sRKjKP4WwxMIYfScQGwdKCNmwhIIwWlAoVuif9H/0zs0AQFvsuu2fxRogDSIPonqlfl7bfbn1
	I7/xags4u1312AXKJBrFE3pNyiKrOtNgGgMOdB2uxm4ei7KFW2BcWHRPb86qdZn+1Ta4kBjSFh4
	49JJ3biDvw5FpRd6heg/qrxBQuC7dBfgZr3hPm6X0vGZe4wNfaEe1rAjKMXZgruKf6lDd7GHtBL
	JeNKZfV+dfnncjsuwYlIIET4R2H13HV4nMFA+9rBzvubgi6JSWbmmhckJNFGeBTmLq8reCbtw0F
	3rH+j9YctQTqCwxMJMZRWnvMdSV6RMMntqK9nsnRrRNnazyPKooT1W/yxoBXJXaiI5fhL6jpOxr
	io1Tk04fk=
X-Received: by 2002:a05:6870:171c:b0:456:550:95b1 with SMTP id 586e51a60fabf-4562b891d4dmr44356fac.28.1784057154639;
        Tue, 14 Jul 2026 12:25:54 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4519d89f7desm15759043fac.7.2026.07.14.12.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:25:53 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: gpio: rockchip,gpio-bank: Add rockchip,grf property
Date: Tue, 14 Jul 2026 13:25:29 -0600
Message-ID: <20260714132531.v2.1.d04a89a3849323a0dcee2c701cba43adbb0523b2@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714192535.2082729-1-sjg@chromium.org>
References: <20260714192535.2082729-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_122555_724888_CC92DC1F 
X-CRM114-Status: GOOD (  11.00  )
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

Some Rockchip SoCs, such as the RV1106, give each GPIO bank its own
IO control (IOC) register block rather than grouping the registers of
all banks into a shared GRF region. Add an optional rockchip,grf
property to the gpio-bank binding so that each bank node can reference
the syscon for its own IOC block.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Add new patch for the per-bank IOC reference

 .../devicetree/bindings/gpio/rockchip,gpio-bank.yaml       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
index bdd83f42615c..774e9c7de606 100644
--- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
+++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
@@ -44,6 +44,13 @@ properties:
   power-domains:
     maxItems: 1
 
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the syscon node managing the IO control registers
+      of this bank, on SoCs such as the RV1106 where each GPIO bank has
+      its own IOC block.
+
 patternProperties:
   "^.+-hog(-[0-9]+)?$":
     type: object
-- 
2.43.0


