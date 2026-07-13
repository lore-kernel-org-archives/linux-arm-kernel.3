Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F47BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 23:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D6FpAA0f5GvH9oji0ZuMNzR+AIzfJerxYl2OMl3rvs4=; b=Ks1Hj9XnQcADja3kx56CyLXF6e
	Fx05/aclJBMoCRgmfbA6dB4JBr2TmExTb/yx/9YsVX5rPIUi9mDQaF/9dbnZdZ3AaX/8mee/TKoVL
	/A7MEOwNXeqpiTYcnHnFYqAQnJVRqPCEgPfuuU7yToZVQgfKKLPz+0ZJEarA5dM+aka4ggs2TJ+XE
	MXyAF2QSSXuoF+/sd0Fr4iMK0GYnGSVUT6oydJ6IDo//BNiiwyizJPvlkC0HSa2+y43z1mSUqFOMu
	ZFBHIPQ4MpC5U8wV+NUpLAQJ4D1c0GttIB1v8W8Rhlvh89K2juraG/mUVMOWpGfHYIZixxmjHg+2f
	2p1+bRNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQ1B-0000000AY0M-2Xv0;
	Mon, 13 Jul 2026 23:24:57 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQ19-0000000AXzx-13oe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 23:24:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 561171196C5;
	Tue, 14 Jul 2026 01:24:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783985085; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=D6FpAA0f5GvH9oji0ZuMNzR+AIzfJerxYl2OMl3rvs4=;
	b=U5795kMQb/YxqVlP+VrW8AAHX91phweIR9P+oF5Zi4J2ZNwbVFi/W9JQIiIa5M2T7pwcII
	2FmHPVyl7Ga4sGFUcqU6k0GvhOQJLj/OoBFJ7ayu/vtgkzMD5HYzwu0alcS72yuUebP45m
	dnDLHYNbeJunqcRatGdBHgTNKUpvQxDcf81SJXkh+BS2AFyXiB8nFSFPK/Sh2HMpYQycxd
	BGzx8rzweg+pilbP6CvVEy9baJHrv1AOL2AXOP/ddmiI4YLKifucKp9MwkKH2e7x+k62vH
	x77xyTVztxhxFSQILYN4IZy4lJCU/jm+uQBp3osJ4dVT9NSQBZQCkz+R/5vaQw==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] dt-bindings: arm: stm32: Sort the document
Date: Tue, 14 Jul 2026 01:24:14 +0200
Message-ID: <20260713232440.120352-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_162455_612325_C43D96AD 
X-CRM114-Status: UNSURE (   6.55  )
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

Sort the document, place STM32MP21 before STM32MP23, and STM32MP23
before STM32MP25 . No functional change.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 .../devicetree/bindings/arm/stm32/stm32.yaml       | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index c6af3a46364fc..af87661ccca41 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -193,28 +193,28 @@ properties:
 
       - description: Ultratronik STM32MP1 SBC based Boards
         items:
           - const: ultratronik,stm32mp157c-ultra-fly-sbc
           - const: st,stm32mp157
 
-      - description: ST STM32MP257 based Boards
+      - description: ST STM32MP215 based Boards
         items:
           - enum:
-              - st,stm32mp257f-dk
-              - st,stm32mp257f-ev1
-          - const: st,stm32mp257
+              - st,stm32mp215f-dk
+          - const: st,stm32mp215
 
       - description: ST STM32MP235 based Boards
         items:
           - enum:
               - st,stm32mp235f-dk
           - const: st,stm32mp235
 
-      - description: ST STM32MP215 based Boards
+      - description: ST STM32MP257 based Boards
         items:
           - enum:
-              - st,stm32mp215f-dk
-          - const: st,stm32mp215
+              - st,stm32mp257f-dk
+              - st,stm32mp257f-ev1
+          - const: st,stm32mp257
 
 additionalProperties: true
 
 ...
-- 
2.53.0


