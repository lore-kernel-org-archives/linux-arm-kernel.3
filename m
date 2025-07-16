Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E01C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 15:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7GdhfJi3/jq4z/wQ6zx9ne9sU27s5bz4Oc7UGTGjKmc=; b=R+YR5nL9NB79aDTEHFm8cEeGUR
	Rbb8M4YPW8DWYcxR1MbOfS3idg+TZ8fg4YDJ5/QRZiF7IQ7NZdlFz2dnGz8iKE1UfZZaTC4eyCWw+
	1R/IXsz4TV6KVfvkvAv738POxdMuhQ6DS6JA9vQTNReaejpd9TaL+lWbus2JbTcITm7mG+HQkE5Qi
	L38a58b5fQaEDbnCYu9uBOeBP0nNMaAxVi7+hMWcJK36YEAXmOEv/m3GA7HN8Sv9LZ4bl04Nehrnj
	3vr7gf25gOQoM8OYY39L+wDUumFpUYiXCty96WHROMTrTKDzWIKi1hmc3Toq2n518h198uE716yhD
	zDi6LcSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc3l5-000000080Eh-18aE;
	Wed, 16 Jul 2025 15:09:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc3Yq-00000007xsR-0NdN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 14:56:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 12065A5749E;
	Wed, 16 Jul 2025 14:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A616CC4CEF7;
	Wed, 16 Jul 2025 14:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752677800;
	bh=LG4GU43wxofeRrb1Kj/ne7psfJ9PXUNmhnVUN75A/vE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lAPv4bScG032rhIL+YPhJ5f877XpBWPY9z9C4DYicAyGXvt2hBKlJakHLI0xVMZbN
	 HLWn61Cis3kF9GfKezEDUGeFN1HH8Tj4XsY0KhI/19ow60QTHWRla6/lbjjSq26ifh
	 Lm6tUsKg8xu0S5tGRjJ1RKsNvgTYAnGUUGPkzSKI9q8iUZsuh0H/XH9OobqDexL6UD
	 RWg5crT7rOnzu4gLBiYoCDK6szRSnOmGEGA503WeFfYcMHoCMUGowLakfV3aAORX33
	 Bv9/nrXWEbSfdaJTeKFwNr9nHObUuDekqYwKEjB4rFP36HxbV5RyEs6XHUM1dxBU9l
	 eOwBQuvj0TuuA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C183C83F22;
	Wed, 16 Jul 2025 14:56:40 +0000 (UTC)
From: Yassine Ouaissa via B4 Relay <devnull+yassine.ouaissa.allegrodvt.com@kernel.org>
Date: Wed, 16 Jul 2025 14:55:52 +0000
Subject: [PATCH v4 3/4] dt-bindings: vendor-prefixes: Update the
 description of allegro prefix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250716-allegro_dvt_al300_dec_driver-v4-3-f87c01c9f7b5@allegrodvt.com>
References: <20250716-allegro_dvt_al300_dec_driver-v4-0-f87c01c9f7b5@allegrodvt.com>
In-Reply-To: <20250716-allegro_dvt_al300_dec_driver-v4-0-f87c01c9f7b5@allegrodvt.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039;
 i=yassine.ouaissa@allegrodvt.com; h=from:subject:message-id;
 bh=8o/phSRDVEyPtkg3r/C/TgOkCaTm11A1elPL4evlA4A=;
 b=owGbwMvMwCV2oHftXqU9jLMZT6slMWSU713Gdka0vnWmp+/MVeLO2po1KewG/5TsQnQf5X7r+
 vmjkflDRykLgxgXg6yYIssHg6XPvrDV+MxoYZsPM4eVCWQIAxenAExEvZvhf4ZdxYX0V9u4lKar
 9YoH6q+f4pR10uXawYs9c1Yk3mZXMGRk+LPaeZNujv2zlxGrFv1oaix4cCr/9+emHpX65xc2dvW
 7sAAA
X-Developer-Key: i=yassine.ouaissa@allegrodvt.com; a=openpgp;
 fpr=B0CE218FC8E89064DAED6179042F935CFB3AD0CC
X-Endpoint-Received: by B4 Relay for yassine.ouaissa@allegrodvt.com/default
 with auth_id=423
X-Original-From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_075644_206052_3748CFB7 
X-CRM114-Status: UNSURE (   9.92  )
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
index 5d2a7a8d3ac6c666c8b557c2ef385918e5e97bf9..827fa988c5af4b59cf71e4cf47163e38eb1aa4c9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -82,7 +82,7 @@ patternProperties:
   "^alfa-network,.*":
     description: ALFA Network Inc.
   "^allegro,.*":
-    description: Allegro DVT
+    description: Allegro DVT, SAS.
   "^allegromicro,.*":
     description: Allegro MicroSystems, Inc.
   "^alliedvision,.*":

-- 
2.30.2



