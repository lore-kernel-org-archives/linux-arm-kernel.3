Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DBCE85388
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 17:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aq6TmnrR7Ef3Tvsh0k9fofGPjr1Ma2be3M/ze9tPBAw=; b=U2VidIhCC/RTRrYXbboKGX8C8I
	Uqi1NMKdF+360fJ9nkm68T7e7i0f59AUyfRrH8ngcgWWIdXv4D2pBNfDcq1UmwsBOMIgEe3kpNody
	axkH74aw5hVnBQdNMEqo3OTIXcNEDROuxo2sYoeWYBj9EeyHifoV3vcBWlg1r6LOR1qEXhbnGGQV1
	7ZStYFKfypG6xNx0s+2STNviyyytFwzwNn2ERcBINDKGVaHYSQqIu4LWxnAbk0ZFMV11dd7U++ggd
	LthL6vnnkAdBpvoPZNBYuzT+12yKch/BYqSDjh2HkkmQorekob8j9CPMt3j24mewq8RxWeHADhN5d
	IJ2trg2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8i0i-00000002MrL-0iYB;
	Fri, 03 Apr 2026 17:08:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8i0d-00000002Mmt-2Q6m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 17:08:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B505445BF;
	Fri,  3 Apr 2026 17:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F1DEC4AF15;
	Fri,  3 Apr 2026 17:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775236118;
	bh=htLSa/pFYIGLX2V/bgi6ZPOMIyGWL50VFCX7LC8EdCc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Kw0HBVkNvo1rL7xouYmn/pqJM1cbhU4yv7F+MEBUMa8wZrSmaUsGS5BIdUm61hq6E
	 KYIMnOJ+NnYa19XMIgLVsKKn3T60/cXp4EkPz7XIeqqH/SfDaRb+yOQDcZacEMhRiI
	 Bo3ospQVK+XF6YXuxG1EZPi2gMIQPINsY2DPcHanglZKUxAvC2j8ir6/81iHt9l//I
	 6qxsYGWS0QcRwSXBCerdKpH1KMY/7a0NbnZIFJoQ9GyZBkTqmM+WACq2mc62/RMamy
	 +/ZhmDyf8A4iIomcFiB+okvqPJfzehHbzzTPhYa1LB9IpBhrD/0QK3Vbs6FrjZkOU1
	 UPEOx6mIAhd3Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C82E85389;
	Fri,  3 Apr 2026 17:08:38 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 03 Apr 2026 19:08:38 +0200
Subject: [PATCH WIP v3 09/11] dt-bindings: input: touchscreen: st,stmfts:
 Introduce STM FTS5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-stmfts5-v3-9-5da768cfd201@ixit.cz>
References: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
In-Reply-To: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1224; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=ghceD3FEXE+XcrRARnEBBTznzq4UXU11eu6mo0R07f4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz/QQhvsLT2ghVPtEcPOErYK1bc52pLTCthXwp
 ayNpsJ4oM2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/0EAAKCRBgAj/E00kg
 cmWjD/41YbgUbGKSLEOxiv4PEGfIIQ4wktekQFoSv6iBkVkiPTHmNUqUjbL3wgSp1QZ7Z4ipdSY
 mrPrBwC4BKYZVtdpkhHIhYBLxTmTl70bVUKx9WUhKM+Fx9nDbtkRS0JErFzje16MgXsoWS7CYE3
 twq13rtFuLVjiTnTvq1wXh48nUjMq0ye3TMTGNhdJPXAYT5XlAWq3GaX1GRaEmqB1kgwRiquDhM
 BentjBlfrkUrLLi3gGy+dz4kZO5YlOQ3rE5kza9WQh8CMdiFv6bfjxvwHN1ox6760pWlY1yOPN7
 fHUIxflF5Szx6O+Lo2SrZx2oAgvn8CDIZSFNJRJhTTHuAvxpj48Vu7StI9g08XgGbQxRVhogeZK
 z5DO1v3hKn0EPl+Z0AHM8hTj/oDIvRKbNCFPp2wQvbUhIDmxAAGN48sj2ij6fdv/mPB9G7mWD3M
 lVODfOzLol/wxgiJ+s4KzHLIAOI4cQErRtA59LYQUBChNKuEIzmFguF0y7WAm/o+PfxWoMvQKVc
 416VuonE3Ex/+kqeBRoRW5ryV+5jpa14SwcbQLAsoIAG936TePuvV+A+yUCnZXHwOQP/N98wCtL
 9PRFpdi/vhSg2tVMftRkFJ7At5cisCuwspm1zc+XwjpEA3XLjrOOSsKQox9Qk0mhqGgcEdEMpp9
 vhKhmH8u+AqfWtw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_100839_692012_5032AD86 
X-CRM114-Status: UNSURE (   8.59  )
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: David Heidelberg <david@ixit.cz>

Introduce more recent STM FTS5 touchscreen support.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/input/touchscreen/st,stmfts.yaml  | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
index 64c4f24ea3dd0..441fc92b9a4ed 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
@@ -16,10 +16,19 @@ description:
 
 allOf:
   - $ref: touchscreen.yaml#
+  - if:
+      properties:
+        compatible:
+          const: st,stmfts5
+    then:
+      required:
+        - mode-switch-gpios
 
 properties:
   compatible:
-    const: st,stmfts
+    enum:
+      - st,stmfts
+      - st,stmfts5
 
   reg:
     maxItems: 1
@@ -40,6 +49,10 @@ properties:
   vdd-supply:
     description: Power supply
 
+  mode-switch-gpios:
+    description: Switch between touchscreen SLPI and AP mode.
+    maxItems: 1
+
   reset-gpios:
     description: Reset GPIO (active-low)
     maxItems: 1

-- 
2.53.0



