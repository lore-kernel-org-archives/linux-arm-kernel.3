Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40450D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 15:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLfRbwTC+bp2j5hryZQgAnOdfY0AnY0aGYk7WBDuOlY=; b=HX7RFJWAgILzhgemyU7IPAIZ7d
	H3meaN7HfVc8jcHxGnoqvpaZxr1y4ezyDw37e5U+ptCFcUxBS1Xxcdn2jJZarcU5vXHYi+e8fQK3Y
	g5/B/1KiVSFYinorlkuHUW4+0cEI02iBw+/DUFGYasMfk+ty4WMbRrZsjeitNkjDSBflYqnOM2s6f
	6waUdoWrmz0bqFu01v6IWi4WUH4h89l776BAzm9lh/hQjcLAIDaXmIFCRSCVpiE9BH/EBR8XSo3vU
	FVL1GC42Nod0/pMq6zCUNfmxUIjQiR6s8ASwj6Ddbiio+ZTuW5Nx3WjOwhUTIlWQaSjyn0bBQ6pVz
	++JuKVrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSdUZ-0000000DGEA-2Exk;
	Mon, 08 Dec 2025 15:49:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSdUX-0000000DGCy-2HQM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 15:49:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9CBB860178;
	Mon,  8 Dec 2025 15:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AD31C2BC86;
	Mon,  8 Dec 2025 15:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765208976;
	bh=Xi23dNBeLnbyP+MfAVL3IQS68z/4ZfOXaIm5R1+0ooA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=R4LeTFCFJeunyEDGwSrc0za/kp7ona8ZwNpUzDXYau+WLhWjS5mMgrw7j4XSleCbU
	 VyMrDkSziwiZLF/+Oz5GJPfJw7hfwSXZEypTesCegX3Twz03nPwL+wL9q6WH7rfLZd
	 SSmwHhYPlldTkOPOL0ehaVqDd3NvetJYqEqfCqWPxxZGdxGtUyq1fNeWQj9JF54+OQ
	 fSdgZ2+7pClsmW8SDvCDt8TTf2tMbC1945oErfwtH5TypQXAXT2GMmPrZIMZULQaMI
	 b51tHQm8KhNgDD+yt93p9i6Dn8V88l0jrItL3JR8fAh43ydubyZYX9cl+BqfK/5p/1
	 pxVkqiW2fpStA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F4D3D3B7F8;
	Mon,  8 Dec 2025 15:49:36 +0000 (UTC)
From: Yassine Ouaissa via B4 Relay <devnull+yassine.ouaissa.allegrodvt.com@kernel.org>
Date: Mon, 08 Dec 2025 16:49:18 +0100
Subject: [PATCH RESEND v6 3/4] dt-bindings: vendor-prefixes: Update the
 description of allegro prefix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251208-allegro_dvt_al300_dec_driver-v6-3-128956555677@allegrodvt.com>
References: <20251208-allegro_dvt_al300_dec_driver-v6-0-128956555677@allegrodvt.com>
In-Reply-To: <20251208-allegro_dvt_al300_dec_driver-v6-0-128956555677@allegrodvt.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=984;
 i=yassine.ouaissa@allegrodvt.com; h=from:subject:message-id;
 bh=dwi2brNNC57NCpVLbkKs5CwBSDc3o/+yQYET7H88jNk=;
 b=owGbwMvMwCV2oHftXqU9jLMZT6slMWSafe61s7h1sFfk67F7rpIZ7F0HvPZmHdnTf3rKsnmHw
 tuPbZg5s6OUhUGMi0FWTJHlg8HSZ1/YanxmtLDNh5nDygQyhIGLUwAmcryekaFz8Y2vvSUNTPoZ
 i9s6/z3OftWxr0flcMyqtGijExeXTYhj+F8WbL7nxPwjdSoqQe4Xl8/61H021KdUKqVW8rkCS6/
 3cV4A
X-Developer-Key: i=yassine.ouaissa@allegrodvt.com; a=openpgp;
 fpr=B0CE218FC8E89064DAED6179042F935CFB3AD0CC
X-Endpoint-Received: by B4 Relay for yassine.ouaissa@allegrodvt.com/default
 with auth_id=423
X-Original-From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
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
Reply-To: yassine.ouaissa@allegrodvt.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>

Add SAS (Société par actions simplifiée) to the allegro of vendor
prefixe description to include French simplified joint-stock company
legal structure.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2aec2a..8376312dd9e4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -87,7 +87,7 @@ patternProperties:
   "^alfa-network,.*":
     description: ALFA Network Inc.
   "^allegro,.*":
-    description: Allegro DVT
+    description: Allegro DVT, SAS.
   "^allegromicro,.*":
     description: Allegro MicroSystems, Inc.
   "^alliedtelesis,.*":

-- 
2.50.1



