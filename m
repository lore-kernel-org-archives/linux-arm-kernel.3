Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0471AC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 10:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/hX8oSvFUyuhu4tR+/Ory9/CKObIkADXSdAe0S4swE=; b=IuwDtx2qv1//CXmbjRLECYvW/n
	wWaz0bc9quscCP7DnlXajzbYvAhcUULc7qD0gV4O/W5J4aXvcvzr9XgqzaaYwqRqahZxoEcr2zurw
	08lWPxEK460vK/HT1welfJheOG3MAKtSXHTCQvW/PrNxrprsA5D0drrn1FqWUVetadRRPrU1/HNp4
	WAnR3D7BgKMCkmlaSr5v/5TqtHQ6AhQfovwGGnpN9hSGlM2uytyzpmWJn1UNgSpgoLqu9prcMXmaS
	IDkOU3oSecTuYGyXzOC4QWzgDVeoNSpIfS/55ox8c338C/PNGxANrN2n8ahNtFU/EzLv3BTVLTEHd
	m8mHMBYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8Op-0000000DKHH-09xJ;
	Wed, 13 Aug 2025 10:08:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8BC-0000000DHpB-0sIS
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Aug 2025 09:53:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=S/hX8oSvFUyuhu4tR+/Ory9/CKObIkADXSdAe0S4swE=; b=f6geNSYQQf43OHr8gV6FHRVRwU
	BpTX45IKxbfAaLfBUhEviA2x/uOXxt2o3nsdHPi/fFYH7HfGQIklc1kXtpTU3G2krU9NZc59SzhIk
	rc8QAwRHDfhBVqEQ5jx4qKNcgYzpIuSoZoENWoksz5uf8IlPyGeZTiYk52vdpTeYgIWve4KMbbMIV
	VhIIscfuZ/K4tojL+CPgpSZzd1xjbrNgEDvWC2FdC85R4/mq1VvJxZqKkXIuPF6vKIFW3apleYZ7b
	glaviHRt+4QqVK8B6U6SLJNWDNe5RbdWc+eyJJ5wI0IvdImtVE1DHomNP+zX+zCLNtnTLgkOi3k+N
	8eLf8c6A==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8B7-0000000G3JQ-3Iw9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 09:53:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E0DAB5C6C0E;
	Wed, 13 Aug 2025 09:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C498C4CEFE;
	Wed, 13 Aug 2025 09:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755078830;
	bh=bXEF+XbzbkFRg4UMKvH4CuPRLb5qyqp6nFkhHxPfZQU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZsKHchELJM+GSpNFEosBUzYgbBoRaqHap7E2S4wmUHOxLBCtc8yaWZpSUXPB83LG7
	 d2dCOePaJZaCCHu7ziwTON2SkrRvSSJIcfjl0dS9S5KYRpNyxk4PT5rt4dar9heWNV
	 zDwrDyg9+o8a3pNKy3QHPbZEAyMcluvVCPTGrYZyNpqro7hsymjIq8lzXqgGPLRu6q
	 xD1QaZ5F3JAM9GQoHor6+2TzqYkmf+zswDP9L9xFTbh71GgLBJBI6q3QYPHvzcAVTX
	 P7qAe5VHNWyRZD5LoXi1cF+I89nffOloVGryvVBPeA0spuzSBm+ZuMjdQWihcaY2jN
	 hKeE7L1Yx813g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5440BCA0EE4;
	Wed, 13 Aug 2025 09:53:50 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Wed, 13 Aug 2025 11:53:36 +0200
Subject: [PATCH 4/5] dt-bindings: arm: apple: Add t8112 j415 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-apple-dt-sync-6-17-v1-4-209f15d10aa0@jannau.net>
References: <20250813-apple-dt-sync-6-17-v1-0-209f15d10aa0@jannau.net>
In-Reply-To: <20250813-apple-dt-sync-6-17-v1-0-209f15d10aa0@jannau.net>
To: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Hector Martin <marcan@marcan.st>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=ED8ImSi3bhM4BQ6UPMffQZiVekSQkM/K2v2LMg5RCM4=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhow5CWueyDyPnp71I75zK0s8092b1S9MzW/du7XgH2c94
 x57F8/3HaUsDGJcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACYydzcjQ/99CyeGynWTK+Wl
 GwzOmS98cexHd2BnQZ0mY/jRxaqHTzAyPJgS7hbf/qiF48KP9F7xzZFCv5mFplxZ9D4m+fETtuC
 FXAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_105354_231229_43C1F654 
X-CRM114-Status: UNSURE (   8.49  )
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
Reply-To: j@jannau.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Janne Grunau <j@jannau.net>

This adds the "apple,j415" (MacBook Air (15-inch, M2, 2023) to the
apple,t8112 platform.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index da60e9de1cfbd0151e973c3aafba6d0880fc21aa..3b90b5df60507b245de387de104a4e64f234139a 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -93,6 +93,7 @@ description: |
 
   - MacBook Air (M2, 2022)
   - MacBook Pro (13-inch, M2, 2022)
+  - MacBook Pro (15-inch, M2, 2023)
   - Mac mini (M2, 2023)
 
   And devices based on the "M1 Pro", "M1 Max" and "M1 Ultra" SoCs:
@@ -279,6 +280,7 @@ properties:
         items:
           - enum:
               - apple,j413 # MacBook Air (M2, 2022)
+              - apple,j415 # MacBook Air (M2, 2023)
               - apple,j473 # Mac mini (M2, 2023)
               - apple,j493 # MacBook Pro (13-inch, M2, 2022)
           - const: apple,t8112

-- 
2.50.1



