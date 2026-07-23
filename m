Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E5AC531CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 19:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=muvQnjrD0lZ97lHGH/9/vXL1MMfZ4a+cyU2MgUNnBpk=; b=xy/Q5EDMpiQ37uIt8VhlOURART
	jJ+ey4x8haAd1GOd6kPcaNfcQVxi4GU2xlPzjOdOdA8c4OE6BDjVyRfONERfcKC9OFcSJB8mTfoP+
	oPOKN+L4epir35gYmsU7pt3nmTP43lSmAN0hbjYYNPGNSjJVISMuPrF1Vz3i2HcjkDaOHdGhrluN5
	1hl4CpTDYN5RGkd/YOYCx3CeY4a6BAa7F8xY5+vX7T/rK7qEjO45MKj/775zNylBYclgO3zeO2dBm
	Hq9b7I5gNtgLZ2W03zva6abjqx9k3+3mEF3fbjw8pDK5HIIWsG4XOPU94G5tgHodNpBYbj2AQC8xL
	8mGgANMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmz2k-0000000ExbT-1ODb;
	Thu, 23 Jul 2026 19:25:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmz2i-0000000ExaM-27xa
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Jul 2026 19:25:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=muvQnjrD0lZ97lHGH/9/vXL1MMfZ4a+cyU2MgUNnBpk=; b=TmfS0eCnq5CwaEZrB3Eck3Dy32
	bFXoKBJW0xCHZw1bMuCpR7vxnfNse+oPHjf4Wb7Lk0A+/InniAOpaFioxw0PcnAGuUqwEDg0nz8hG
	Zq6HIAs6Fi5TOhI+zlmAPjRmqXQSY9YM5po0+v7dPoqxaeGqZcsTShQs8XiNgioRsX4vtGhTCUhnD
	8odyfNMNZA7dZywg7yo/gyLHouNjUW0TJjaXK5Qe9bXtMZyBWxms/MpllM/o2e/MV+ONWCPVac3Ks
	a4z7c9Y6k2Rr4SPHOc2N8/CLAZiS0S6cwOsmS6yVsSH/sPg/Nmew2jQ6fHphNRPtdyPLrTCRR4p/T
	qmEPQH4A==;
Received: from layka.disroot.org ([178.21.23.139])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmz2f-00000001LAr-27gx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 19:25:15 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id BB82586176;
	Thu, 23 Jul 2026 21:24:52 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kx9-QDcAPgB7; Thu, 23 Jul 2026 21:24:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1784834692; bh=oP/7/X7LVlKSo31gPcRHpIls0+Y5eEnnq2IMVb1d09A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cJX8wSixDcZlYpafzz1Ajks9wZevumryo+7OSeGV8H+BHiUtZrk1ioDb5lePCUcZv
	 27jaZTXPeKF4c2L+9uWympNTpInMLNT4j3HeXCey192y4EHuU1bkRU0jW7b+uEXIoc
	 quv5pX5h8lX80Z3ib5rhGuMx9E9Xnal/T3Pnh4EhbHSweX5ge9wwMrwvCh2T5RnTmv
	 rDCG3t2iGd4f8RvLLz/WKyEl6EVLimHiTsJSHgRmQ1ymc/8/uE2SXHIi7EeMLBjkzb
	 eN58TVDBLMSyZh5o9I3FrTZHq+qWrzc3aiqOGKDcBS2yHOzLtOEuqICFmnm7V1FQTf
	 qHd34NCs+xp8g==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 24 Jul 2026 00:54:06 +0530
Subject: [PATCH 4/5] dt-bindings: input/ts/zinitix: document mode 0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-zinitix-modes-v1-4-f6df7d86a878@disroot.org>
References: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org>
In-Reply-To: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Srba <Michael.Srba@seznam.cz>, 
 Linus Walleij <linusw@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_202513_637663_0D486A88 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

Zinitix touchscreens support three modes, numbered 0 to 2. These modes
differ based on their event report schema.

The devicetree schema does not mention mode 0, thus does not consider it
as a valid state. Add it.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../devicetree/bindings/input/touchscreen/zinitix,bt400.yaml          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml b/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
index f1ce837b16df..9b51212ea9b9 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
@@ -76,9 +76,9 @@ properties:
   zinitix,mode:
     description: Mode of reporting touch points. Some modes may not work
       with a particular ts firmware for unknown reasons. Available modes are
-      1 and 2. Mode 2 is the default and preferred.
+      0, 1, and 2. Mode 2 is the default and preferred.
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [1, 2]
+    enum: [0, 1, 2]
 
   linux,keycodes:
     description:

-- 
2.54.0


