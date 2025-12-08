Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BADD3B7E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 13:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLfRbwTC+bp2j5hryZQgAnOdfY0AnY0aGYk7WBDuOlY=; b=taw6FkH9S/2hoMnxepl5CaC0Iv
	Rf4/ryvGaB30ruKoPBfl2tA/dvviZnA/V/BGRtHnxlFfPLouHs+u+IgcWQ7KyrO7JjIMObU89pVHj
	NhnGgKsJCeTTzCTUWQvaKBxUlHe1ki5KBVsKF1b1u4FkM+o6KEHz+206QCqTejBn5448Zc/yP2Mqw
	kR7aQD/FWHETvYU7p6UKyj4ATKBhiWFo3J75nmvTSTv9G4/dXnryyE4psmYkNj27NJVHBR3PldVgU
	pDXRroXqYYMQHbpX9XgMHI93CvP0wMu7zRrRY6CbvBcdsOzdLeB9J3HphZqrbuYZNQK1LaMO9BJhp
	BW/P2SDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSbUx-0000000D8MF-3IXc;
	Mon, 08 Dec 2025 13:41:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSbUw-0000000D8LE-143l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 13:41:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6AD3760177;
	Mon,  8 Dec 2025 13:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0C16C2BC86;
	Mon,  8 Dec 2025 13:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765201312;
	bh=Xi23dNBeLnbyP+MfAVL3IQS68z/4ZfOXaIm5R1+0ooA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nE19+gsPqXNRzQMB40dD/IYjbZ0CXRC3bAE6i1VxdXZgo1lFPBnb5wABu+sb0V9Gq
	 mObCJ3LHg8A1HV086OSBbazAvTDDGIDsRGkGBV39u7kAdQJNUjRWMCb5XWpcXM1IHa
	 K7g0L3yqrL+MpPUE7vddFUgmVUTQZeiXtkyznmXXmjAFtV9tWo6IUqmsFtnbPHVeAJ
	 FKaYD1yopiA9bO2n03jz4kXg3XhyuKQfSrH/wVMJqCQ5M4ht11h8YffqnwW+YhkkU7
	 zgwUZIwMnVMJ+UKeY+/j90v4P1ghoajqPPEHr0xZ3Es6AC2K9/c3XT7kvjj3mogPHt
	 XJU1TgM336rSw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B54D3B7E2;
	Mon,  8 Dec 2025 13:41:52 +0000 (UTC)
From: Yassine Ouaissa via B4 Relay <devnull+yassine.ouaissa.allegrodvt.com@kernel.org>
Date: Mon, 08 Dec 2025 14:41:23 +0100
Subject: [PATCH v6 3/4] dt-bindings: vendor-prefixes: Update the
 description of allegro prefix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251208-allegro_dvt_al300_dec_driver-v6-3-2e51ab2e4ce9@allegrodvt.com>
References: <20251208-allegro_dvt_al300_dec_driver-v6-0-2e51ab2e4ce9@allegrodvt.com>
In-Reply-To: <20251208-allegro_dvt_al300_dec_driver-v6-0-2e51ab2e4ce9@allegrodvt.com>
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
 b=owGbwMvMwCV2oHftXqU9jLMZT6slMWSaXZ3HyhP9aeV7sQX71I4ZXhH/GLYp/rBSPEfXhQ9fG
 uITzDl/d5SyMIhxMciKKbJ8MFj67Atbjc+MFrb5MHNYmUCGMHBxCsBEtu5hZHi7c9riY/OXGKVx
 HIh5oH47/LvBDXMzubUGXLNtF7tGabUx/GZtLWG6euRtKd97zr92DuFiRiu1HVU4jDS2Spbtz/F
 6xA8A
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



