Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A7CD31A38
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jlJd04IJAS1HvHJY+KzvdyuK4R/B+6CWZR4nebThois=; b=4B7H4VMyatg7pY9DtW+V9Nonl4
	iyX0MCYG5MSeueioScmB6z4NCSvNI4ZxC/SLANihiAiL/AwCYJaoijkdx+sIlHLhfszKO8mZ/YOLP
	XLmOOczeNBzaWlA6AnqE1tvPQHka9pOCO3ZMBtPQGAP/lTofnGc0T+/DGRIDka4knYwFI8c/a2fcm
	wlozoLnf5RNQbB6TB9QLJdqnOV3SgIyMDVRDDiGDffXhIGi2LTdYQg4QNa6w1WDcBCv1oIUxah0ad
	cph8o/HdIa+DC/Gzh+BBlXJPfI1VIl6M3dW1HxSFtmR0sNKSB1Z4fXgo+BQ+OzBtlLNLFQmpgKHgN
	/PsuJ5ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxop-00000008hca-0e8K;
	Wed, 14 Jan 2026 10:09:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxog-00000008hVG-2fJO;
	Wed, 14 Jan 2026 10:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768385368;
	bh=kzz1stJ/eG8rdi6weyOcBPC+8rDtte6uRtWAAV5e9pQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oab1aactIrGMSI3JwCXPVsqN7dTfh0347oBjUsOOxVtvswc88KEmgVqaxHFYYVC5t
	 v3m93YY8zcZJ1RAHtXffzO9urKECL1ztur8ogx2EGDWGx81Kq99tGY3YNEKEjeblfV
	 SskMKasELF/gWKFkYWxGOccTJ3TC66f1UfB4beVrAd4nvdOhdlPYin0dOb/XZx1+cu
	 ECu4Q+RtDcSFHVHQ5R/8Nfg4SIoMS1ubDPVVQ+I3WdrSQGJwMk08b7+jv2OuDShmgG
	 4Ip5JNQY7aN5WJFSe0wRbJIEIOLATxeC/7k2CeoUNO9nqh+eUt7oMCVvBq6q36Vq0/
	 chgv2mT/e5OPA==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:1dad:60e8:7174:bd20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E935F17E1355;
	Wed, 14 Jan 2026 11:09:27 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v12 1/6] dt-bindings: vendor-prefixes: Add Verisilicon
Date: Wed, 14 Jan 2026 11:09:13 +0100
Message-ID: <20260114100922.149187-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114100922.149187-1-benjamin.gaignard@collabora.com>
References: <20260114100922.149187-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_020930_828896_F5C2E81D 
X-CRM114-Status: UNSURE (   7.74  )
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

Verisilicon Microelectronics is a company based in Shanghai, China,
developping hardware blocks for SoC.

https://verisilicon.com/

Add their name to the list of vendors.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2aec2a..ce5c413948b1 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1745,6 +1745,8 @@ patternProperties:
     description: Variscite Ltd.
   "^vdl,.*":
     description: Van der Laan b.v.
+  "^verisilicon,.*":
+    description: VeriSilicon Microelectronics
   "^vertexcom,.*":
     description: Vertexcom Technologies, Inc.
   "^via,.*":
-- 
2.43.0


