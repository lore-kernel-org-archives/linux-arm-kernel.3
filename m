Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296E8CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 14:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ki7EFu0Nl7B4/VDVsO/DBVKCcttxWy3Q8gg0aWtl8E4=; b=HsrRNg1TLPs1Le0PCjQrGFhDaA
	m98fdiZCvKcgNWojd7vzTsLNFBwpGd/TbQ26e44VdjOOYRZy9gfFhKDrPuKqfFtmi1G2H0Qu7PpbN
	SyEZbMxVi/TGBnf6ZspDfjOEjS4UH95P3d1JWTi+V2AozGob09Fl5y+SKxRFGixh1WrCXyoofi+2j
	V1ReejM1SpfHU0EDrEnEqCWk2IyUa6onFNd2KcTHql0naRBvjo0rETaA2xPbIjLMwuPFMn7W8OOUx
	bofsI/v7O8Ub3IxjMfwChFAIGPDkypZlpdda+1aO9MZw08o6nRNwgDYLRz6uRgXDjzdLuseiQpWgB
	71DLaMGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2VX2-0000000ACWF-0oaT;
	Sat, 27 Sep 2025 14:04:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2VWy-0000000ACSU-1xPL;
	Sat, 27 Sep 2025 14:04:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A907E444A1;
	Sat, 27 Sep 2025 14:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2BDC4CEE7;
	Sat, 27 Sep 2025 14:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758981847;
	bh=EYs89Jn2WO18lvHPSIvjiHZSODy76dkZb7stpKU2PPA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kyWQz9MDPeW4oJ+FpK16EgdYGzGud9+/rOgx6+zE8C6NshKuttiHoOQuu+Ia7Gx1y
	 KJovtAAJQmfLHhQasJMckkhgr7aaFQWahgUXq1aFVM66ZLVuS5XJ0GX65bW88tHRfP
	 G0q2v8oHVWgFAJA7eb/muxT1budaWIf8aYCdxNIxzWaOWKAwwj+7ceXXDCTo4+mpB3
	 936EBaUUrZ7R77gAlKg0j5d1iu562o7PSWfRK8yseosvDklXMxJodpuY9orNbZqQdi
	 PoPiaiScbTrIKFJ6WMo5J0IlWJJtaZ5x7CemH4QqaxIt7RH03YQA0dkxlUsxwXaS8r
	 rdMZQtqydosCA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 27 Sep 2025 16:03:40 +0200
Subject: [PATCH net-next v2 1/3] dt-bindings: net: airoha: npu: Add AN7583
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-airoha-npu-7583-v2-1-e12fac5cce1f@kernel.org>
References: <20250927-airoha-npu-7583-v2-0-e12fac5cce1f@kernel.org>
In-Reply-To: <20250927-airoha-npu-7583-v2-0-e12fac5cce1f@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_070408_520003_012C7030 
X-CRM114-Status: UNSURE (   7.40  )
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

Introduce AN7583 NPU support to Airoha EN7581 NPU device-tree bindings.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
index c7644e6586d329d8ec2f0a0d8d8e4f4490429dcc..59c57f58116b568092446e6cfb7b6bd3f4f47b82 100644
--- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
+++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - airoha,en7581-npu
+      - airoha,an7583-npu
 
   reg:
     maxItems: 1

-- 
2.51.0


