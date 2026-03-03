Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A7CE67A8D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 07:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NULLX2iolgwYZJfuyIP0A4xGzisbQ7Uy7A2Y4Lanth8=; b=tBU3X8MusUrOYbiBr8RvXN9IrU
	FY5qahS5+b9FHdI4uRmBK9j5UGtBzakQjHp5rjZRMofJhRF1NJCapjvkCzlrpyPkeON8ReN1Pwc/T
	u67ulMo+ehGVQ7ydaztkFgsB/LyRx/kfggJUF866bUUSuETMZNmOPbk9O1PK+HQuHy/5CTc9aPlDp
	sVJFqNE0Z7ErUDhN6If/2kyKjX58DqSxI4T1ZT/4PEKzQ6+4iHDKxMxSU7ekvyKG5suk/LWpqWbxC
	jPgeVNuxkHsocxVObAOJWQvhC+mny9LGR1RLR0isitKDSk0M0JefBJJOx2yaLRIB3tTU3/QXaED7V
	JzsHTSUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKCU-0000000EftN-2wuQ;
	Tue, 03 Mar 2026 07:29:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKCT-0000000EfsD-26RP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 07:29:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EC01E60126;
	Tue,  3 Mar 2026 07:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485E4C2BC87;
	Tue,  3 Mar 2026 07:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772522988;
	bh=4lz9jAz1mUMdwvzLCEynZVInvtB2J4gd32k/guztaU4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GR+pv/CHaFTUH0JO+oc9A4hKb5IfKoFV9qbS+oWjkfsv7fg9eqasjcoGhcOocOPEl
	 KuycUBQu/vb878MsWd8aoycLtofYrGCd+iMj9jS8N07mkH+eskyw1v3XriApvXRAVP
	 7YyJ0Ogh+EWhN4WcGH+40C3FUmoWoAinUJDXgf1wziw09DnX5xUsSesOcZs/jmlGmB
	 QXiz4pdY9lPvk8oDrI9eXre0+WokjuZqHnkOzW8E1sqyNivFZhqAZY8yIcf2G/RHdn
	 kqbUHfNcAF4U2GmBVeUvkwo/9PAs8etznxuiuQ+Zdmlv4brl/jG0FdU5qE51YV31cj
	 GbdO1K95665hQ==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 03 Mar 2026 08:29:36 +0100
Subject: [PATCH v2 4/8] dt-bindings: vendor-prefixes: Add Verbatim
 Corporation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-gemini-dts-fixes-v2-4-5b92ced841ce@kernel.org>
References: <20260303-gemini-dts-fixes-v2-0-5b92ced841ce@kernel.org>
In-Reply-To: <20260303-gemini-dts-fixes-v2-0-5b92ced841ce@kernel.org>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
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

Verbatim Corporation has manufactured a few electronics items
over the years.

Link: https://en.wikipedia.org/wiki/Verbatim_(company)
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..46ec1d935a93 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1761,6 +1761,8 @@ patternProperties:
     description: Variscite Ltd.
   "^vdl,.*":
     description: Van der Laan b.v.
+  "^verbatim,.*":
+    description: Verbatim Corporation
   "^vertexcom,.*":
     description: Vertexcom Technologies, Inc.
   "^via,.*":

-- 
2.53.0


