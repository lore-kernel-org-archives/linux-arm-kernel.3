Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D834CED635
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 12:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smDkM+qnkx77goobsmgyagOx751WJE7WAfknYflgUnY=; b=HwTgYfArnmuEld6pR03YTjtSCM
	9z6AeMUmki03cRbVA7PXy39vxyPioBHqvgK+R5BDcxEY5x54rn/KILyvXGTKdl+gf9KVMxVzCJkM7
	Cm00sqy0lSr1EwjpqNa0nchPCwF8KqT1vooGcd54/PJGBnKZz6SnF29sYmqkZBMNUnUUIxEeNzNHE
	cgQ+c0CEZCcW9iOA1+7LheqW/pZrJMyJ3cY3k4E6EvumEvX9lKlB4jiYAPal147Tv7DeAG/+iRFPK
	+Ln/6M9hoN/LdekCgbVTet39LuQHVkm3AeOjzoQzq4JRMyKHssHJYjafFTriBw5GswfOsocs572NG
	35dC1kWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKcW-00000000OZz-0EL2;
	Tue, 18 Nov 2025 12:15:40 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKcT-00000000OXx-0CRr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 12:15:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 691AF10A4DE;
	Tue, 18 Nov 2025 13:15:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1763468135; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=smDkM+qnkx77goobsmgyagOx751WJE7WAfknYflgUnY=;
	b=bQEsztg6GSwWEDqVmlDRAkMDvjkPSlFK7ey9Pm6WyC+bsVg4RUVKQa+Ur2DsC0QKZpzwtH
	9aOSj2eRBysrii3G2iVp7ONqM8nNwzXJL9khqLdwQZvHsvAGSRqwrsRJfzb1MHUTKl/4CA
	OdrvS3ymoOhTdnWjZPMpqnh3RVyvAfmAYJdeRTMLwZFh1BKPHLco1jOAR0PMF0PTjp2KqA
	iEakO/XKc2Qiw9HFxcmNOX4o+bbAvz+DgRfLZp5L39Ow7UmwHp/UYBxpgsgQLf6vWew5Zx
	BeB+CQ1NFsFDWGY2qBcbiKAYM9oiCgPSIZnlSki/Z/RNdEN1IkKCUab1LhKQLw==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Christian Eggers <ceggers@arri.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: vendor-prefixes: Document ifm electronic gmbh
Date: Tue, 18 Nov 2025 13:13:11 +0100
Message-ID: <20251118121513.88352-2-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251118121513.88352-1-marex@nabladev.com>
References: <20251118121513.88352-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_041537_230013_621959A5 
X-CRM114-Status: UNSURE (   9.84  )
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
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 42d2bc0ce0272..375682063f53a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -749,6 +749,8 @@ patternProperties:
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


