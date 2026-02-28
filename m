Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E601048924
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 00:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IEfhQhdiYhE0fENV1tojswm7xf+GxGwp/QGlnih7E+U=; b=0IVerv6QnFYh0djCQgej3osMt3
	fcSJ43/WEovdC1IBOTDtZoTgL4Ef5jUgTUK6qV30TOpE7ocybolznwGh5dFIzp04JQkVXHSJ0q3mD
	dNZCyKzD6A3RaaUu09IlxfhYpL6AWuycX070eBPmeoHXWecAcbmJzM8wQhu+KawUESA9WtJNliyg7
	iGUqFqeQaQAbKpJkdvSFMnQz0m3uyKet1+kJ1jJrJP2jkMuZoZ2jD6RH7c/DQeyoWTMwzdOqwF1eC
	8kfUYu7HU5sz6qHA1xkKWk+PATlvvADxTF+kPmSTtSxqoB2gRHBcj0iQaNvlcY4uJvaeafpcXXYQ2
	U3lf91ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw7qS-00000009IR6-2fQa;
	Sat, 28 Feb 2026 00:06:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw7qH-00000009ILS-01v3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 00:05:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1793740360;
	Sat, 28 Feb 2026 00:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E6FC116C6;
	Sat, 28 Feb 2026 00:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772237155;
	bh=bYrh4Mfc4OHSJajtdA4/Qg5Qu7LbvFsAaDkEV5wxqOY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ieehTOMHxRJXpGMqym8QB7fseBLnoDmkJQbbsoxXSgWyFUCJ5oT8oPWjB2PCs3PGs
	 HdWEKTNooeO9E2zQZBfoYd/DExGcgcH+JKhfvXPR4rBAq91bm7Q3jj6/63EoQtC1tp
	 2Uol5xkrJeSaK2fh5cUCVctVz3VGtHUYsnpQN8HSK9lQ+DeeMDDjIv5iIAtB8mSg/q
	 jl4B1lGGeaS7e9QHq7ElBp6qKFY+5NBi2SP8ZE0Kl9LW7ax/mYDqqc5TIVepEZ4jl6
	 1hqedSrUeM/KaBPaCUfOz/4Cwi6+lla3dBjTEhoz6rLceGT2zltFGzr1liX6YmNZG3
	 1+FNe1PgXUS5A==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 28 Feb 2026 01:05:45 +0100
Subject: [PATCH 5/8] dt-bindings: arm: Add two missing Gemini devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-gemini-dts-fixes-v1-5-0c6f6d0fb4bd@kernel.org>
References: <20260228-gemini-dts-fixes-v1-0-0c6f6d0fb4bd@kernel.org>
In-Reply-To: <20260228-gemini-dts-fixes-v1-0-0c6f6d0fb4bd@kernel.org>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_160557_135712_387E69EF 
X-CRM114-Status: UNSURE (   7.76  )
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

This adds the Raidsonic IB-4210-B and the Verbatim
S08V1901-D1 that were missing from the bindings.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/devicetree/bindings/arm/gemini.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/gemini.yaml b/Documentation/devicetree/bindings/arm/gemini.yaml
index fc092962ab56..dfb11244b57e 100644
--- a/Documentation/devicetree/bindings/arm/gemini.yaml
+++ b/Documentation/devicetree/bindings/arm/gemini.yaml
@@ -55,6 +55,11 @@ properties:
           - const: itian,sq201
           - const: cortina,gemini
 
+      - description: Raidsonic NAS IB-4210-B
+        items:
+          - const: raidsonic,ib-4210-b
+          - const: cortina,gemini
+
       - description: Raidsonic NAS IB-4220-B
         items:
           - const: raidsonic,ib-4220-b
@@ -70,6 +75,11 @@ properties:
           - const: teltonika,rut1xx
           - const: cortina,gemini
 
+      - description: Verbatim S08V1901-D1 NAS
+        items:
+          - const: verbatim,s08v1901-d1
+          - const: cortina,gemini
+
       - description: Wiligear Wiliboard WBD-111
         items:
           - const: wiligear,wiliboard-wbd111

-- 
2.53.0


