Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5F7EE57C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 21:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/Gjn3oqy9OjFO4s5fRfwjo9zSIrIF7mEfoAx2CsF2kw=; b=iYfop2u1/Lcx8cq+QvcoaxpuZy
	3D5/vR2zDl92EVSI5+kf209somw9MVoFNydFbymOn0mRDyeuEtPP0vQvWa1KJApx0ibCBZhQiF5nx
	1ZLz7Cnn3ktEy7Jm3Cn10gAdscfUMAXk39mXPXzTreKipTjUnpxCXnMxw/AgHf4xZPXd0ddkyl1ZP
	3ijnDPIWCKkL82CDvDlTlQnxIzU8EBy9AkEQQ+BqXj4LPV4JroKFOjCj6i6r05/MGtDahIerKUPx9
	4Mr64j44uKy4C+G6F63UlULXmzXrrD69G0Cr5S2tspQTRBCSkyq8hpSnduF22GGmuGjuBQoFeTX1/
	33sm6tbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vahM6-00000005Jgi-2OgC;
	Tue, 30 Dec 2025 21:34:14 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vahM3-00000005Jg4-3u2f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 21:34:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E06C10CE10;
	Tue, 30 Dec 2025 22:34:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767130448; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=/Gjn3oqy9OjFO4s5fRfwjo9zSIrIF7mEfoAx2CsF2kw=;
	b=feCyRv8g5EkrySN3oN+JxpI/pWsJeFp6Jk8jH4aUwgpnjfziTvcDGABcUVPJsgOxX7ZVGz
	ERSzCRBS8s/fHEgY41wDlgzDNjZAbc9fLEAtBCoxvtjZO2Q3Ja1ibJ1qkYvLXV8RjLfwx8
	IqGY+0yiXRZqGvZj37VFwYLSbvMyoIWX1XJTnfAiWJkWDRVfIp/fMr2pOKGNjC8zfKsjtB
	9jJoeQysxkv5RFlVxt9EyvKdl8s9vuNMDOXJs1cAtjG3nfyxY64FENKEuLPrM3mFz2tEvY
	MdhQu0qfigJyWiBrMzRTkuK1V4NoYYsS62bn8SyYNJc+JLdZhbJvm75Y/NpuUw==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Christian Eggers <ceggers@arri.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Document ifm electronic gmbh
Date: Tue, 30 Dec 2025 22:32:31 +0100
Message-ID: <20251230213401.219808-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_133412_136602_72CF81FB 
X-CRM114-Status: UNSURE (   8.74  )
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

ifm is a manufacturer of industrial sensors, control technology and
automation solutions. Document their vendor prefix, which is already
used for ifm,ac14xx and other powerpc devices.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Christian Eggers <ceggers@arri.de>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Markus Heidelberg <m.heidelberg@cab.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V2: Add AB from Rob
V3: No change
V4: No change
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b7c6c528e0185..70d99ac01aa34 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -755,6 +755,8 @@ patternProperties:
     description: IEI Integration Corp.
   "^ifi,.*":
     description: Ingenieurburo Fur Ic-Technologie (I/F/I)
+  "^ifm,.*":
+    description: ifm electronic gmbh
   "^ilitek,.*":
     description: ILI Technology Corporation (ILITEK)
   "^imagis,.*":
-- 
2.51.0


