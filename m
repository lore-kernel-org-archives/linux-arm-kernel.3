Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016EAC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 12:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRKNwu0qUMhMEVtzhNeUXWP8gyNuobvhErbR/qGrZbs=; b=O8FUtDbo2Gir+UA4GANg8D7pW2
	t87Mo26wHYDVpsZ21juBjKl0U1zlU+wywPTZjnm9rvRhSBXWAQMj5MhVb+gFlDDRJvW5eKj+VppCd
	dtcjOvNs6AXNn3xaZ+Qkx0fiw0zNKJ7omggKdRUURJU/EzdV8HaJMBlKwezkbihW1oci313HcMh1K
	xRVynoNokCXwS8x4p0pzv0xfwnPtiIsQTX7fwR8UCR0ULD9u99qWZw4WoJJroYCCDKkb0pZJhSkaR
	SidswVKRYOelOxeRnPt8FhvOCAttQh+Hm4P+O3A7JBapn5GK+bGRqezD4CNjVGNkxGfTkIIrTQRNo
	KRetkNXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN9n6-0000000FUHW-1y8l;
	Thu, 05 Jun 2025 12:33:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN9ga-0000000FTRU-0HW4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 12:27:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6BAA8629FA;
	Thu,  5 Jun 2025 12:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7EB58C4CEF4;
	Thu,  5 Jun 2025 12:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749126426;
	bh=7FsO6SeXMQrOR6nvT3kc1qeC6bIkhiQ0CJg3aCAVrRk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aZcuRc+xgzFRLxO/6CHIydmdwZCu6GxXHgjtfZHrsSDFdArTC9YJTFhmpeCdZTvyJ
	 pbUIkfBn+hVdFykBs3fHpoZv+TQfLF3Blmd3IFYFk4q2uJ6j6VltcKMLaT5Zj82lkj
	 CW2T7gtVMRQYlauT5ipXBubwmCGOJ/vunJi81rUwPZmPriRW9CNNBuQNTwLwaI+qyk
	 dw6Ylhs+eG7IAHk9vHTwcbg+5OwDNqNT7DJl/o4midh4fxTX7IQtdepREk6Ueoin2u
	 QY87prJc/eb3VWbhyiNsfsioLIUkkwOs5a4j1epALeiwCiMlgnAf2p7G+6z4gbI5/j
	 QpexJ/DyKi/vQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7097AC61CE8;
	Thu,  5 Jun 2025 12:27:06 +0000 (UTC)
From: Yassine Ouaissa via B4 Relay <devnull+yassine.ouaissa.allegrodvt.com@kernel.org>
Date: Thu, 05 Jun 2025 12:26:58 +0000
Subject: [PATCH v2 3/4] dt-bindings: vendor-prefixes: Update the
 description of allegro prefix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250605-allegro_dvt_al300_dec_driver-v2-3-1ef4839f5f06@allegrodvt.com>
References: <20250605-allegro_dvt_al300_dec_driver-v2-0-1ef4839f5f06@allegrodvt.com>
In-Reply-To: <20250605-allegro_dvt_al300_dec_driver-v2-0-1ef4839f5f06@allegrodvt.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=986;
 i=yassine.ouaissa@allegrodvt.com; h=from:subject:message-id;
 bh=5iUhKAdElKhwIW7fDAYX2Kf2zk0pHavOIAas+qtjgcA=;
 b=owGbwMvMwCV2oHftXqU9jLMZT6slMWQ49kqY7c/qa/z0cMPmoBwvk9ecxwKDwl2nP/nLabf8v
 Gr8zzM1HaUsDGJcDLJiiiwfDJY++8JW4zOjhW0+zBxWJpAhDFycAjCRs6aMDBfyryvVXv4y68aL
 oFen13N27P6wP8D4SEqXbmjbWhXeN7mMDBP3Nv1avPnKT6O2f058KZkPHVkFg6d+1Z1nc3G5Vet
 1Q3YA
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

Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c01adbaacbbbcafa3e174153cdc5d2ca28cf703e..02e70a31477d742c606d63228b97037375442e49 100644
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



