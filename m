Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E6AE92FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 19:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dlBkIkIwmLP4XaJLbd5cT08BMuNuxJZeyyiPyluexDg=; b=oGhMBoKq+KpwFpqIUVGDBWGdYs
	p8OC+fk0wWrFLnDZLGsxVWpOPKo3s9ZpUHSk95WPy4rC62Yc0xoEy/wczs462V+Q95q7us0z97Nmy
	XYp0Tyi826rHvzz7wmj7eMtWmHidpgJa+hoEo8KH39HBE2Mi+kinUmRRby97gDwT1xivd3fuq8iDt
	wKY+IlQJq++3nrM5vzFlVAyLzNZUEvhYuPjbkVB6Tw9I4ScRr/a9Rr7AVfPjT/3XQoEajCTHN+snU
	9205CoC7toD6UyCdkaXcnQJs0VfJ4yQ7jdAZUwHZar72by1F/5ytCzdP/eD5FPuOAxOo6rBHNM32S
	p4wVfLsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaJ3z-000000040wN-07kc;
	Mon, 29 Dec 2025 19:37:55 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaJ3x-000000040v7-0KVW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 19:37:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81F3710C945;
	Mon, 29 Dec 2025 20:37:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767037063; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=dlBkIkIwmLP4XaJLbd5cT08BMuNuxJZeyyiPyluexDg=;
	b=Igk+UkBfE/uGQo8BqCGV4BGjDzVaWoYp9+4kijhlLKRiyJPVwZJrD7pXeTty3DuUkw2Bwp
	+DIkgiY3axR0idIcMn6iYDdn/EnncE7r4c2icNluEBFndFu3P4aA2ecDgTm3v+tnSGgp3u
	iMn6DGlrPjFbyZBR4sZa8bfeKHid327H2w/1i3UJEh/hYQiCnjRNrCD236+bor0kGpBXkv
	06ZsutgtCCkhtQCw91ReJ0Rtakin9G74xIdOGNIxJemBSG9xoYNd/6+4NG+DAuxuxeaiJl
	Uw3GNehfT88it9Z+2Tn61BhQp+hGDgIS35m7KsSNvekiXv4vhMFofLKDsYsB5Q==
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
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Document ifm electronic gmbh
Date: Mon, 29 Dec 2025 20:36:40 +0100
Message-ID: <20251229193706.73564-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_113753_337372_16642DC8 
X-CRM114-Status: UNSURE (   9.21  )
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


