Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2968DC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 21:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ewpKNshFBS1pGdHpPMbo/Sgtgy9vH2MjEKkjJzB9Ygk=; b=brIUwi1e5jGgnGiPkNAzw8ZjVc
	KRCdf0EGOzBvGSQK0CIAlmOAiNAjNRajOab4ZffS93PPhGdPW4tInVwJWBWbmKl22EYOkV7Qm5gb+
	t2XS+so0fvS2H5yDWgRl93bLAqtAsexQENc4pNEXs+U00OJC8UNzRkc34Mn711HHff6uBxGcTNpEP
	ATptH1tth72awhiWGADkYW4lTlCfkOtUYl9/YfJG6jiURuLGaMqpOpbtH53N6pbT7w+MPlAkylVEt
	HkA2AhyTQWy1vUl9zP8JZJm+Bx8hTjU/0o4OBKEPQPpgBoiGl70wuQ8y83fsdGLm89QAqzDVUYcVd
	xpgfZIRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuIJg-000000044F0-2KIl;
	Mon, 17 Mar 2025 21:48:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuIHz-00000004474-1MJv;
	Mon, 17 Mar 2025 21:46:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B34FE5C5729;
	Mon, 17 Mar 2025 21:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1062BC4CEE3;
	Mon, 17 Mar 2025 21:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742247986;
	bh=0accdJFRM4wuKrCBKOEVJXqhkfwUSg1V628c8C8UWIQ=;
	h=From:To:Cc:Subject:Date:From;
	b=F9FWQx+R1+a3U7blCqh9czAaCATGyXzaqFTDP4g7fsXwNs+voCN7aea68gmBqXxFh
	 RdgerCAYsM9gyIzuj70E0/Eje5jb6vsQeOfCmlJxRIsF1iYjT+TVEYvRG8UFIYamMk
	 SbxUlahQ3qTQyp4jUi8ErTaF0whBgCR7rl1qfbLVvMiSTOuGTBwpYRe6WqnAzyK7Ui
	 Dm4GRXl2Ko6ZrCqBvi9tc70BDTbZg95PCguKmRXm9kMeVcoW/iIt3B1A0TTpqufCtw
	 XRTFP3G11drz7jQBC8LUrmFLWMyxsSHkF7LLqk7kqVEVJ44khmr7ZABYszDVQRboCU
	 PCn57/m6S5s4w==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: dt-bindings: mediatek,vcodec-encoder: Drop assigned-clock properties
Date: Mon, 17 Mar 2025 16:46:20 -0500
Message-ID: <20250317214621.794674-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_144627_417307_F00BFEA8 
X-CRM114-Status: UNSURE (   7.29  )
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

The assigned-clock properties are always allowed on nodes with
'clocks' and generally not required. Additionally the mt8183 doesn't
define them, so they must not be required in that case.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml  | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index 110e8f5f1f9e..ebc615584f92 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -41,10 +41,6 @@ properties:
     minItems: 1
     maxItems: 5
 
-  assigned-clocks: true
-
-  assigned-clock-parents: true
-
   iommus:
     minItems: 1
     maxItems: 32
@@ -78,8 +74,6 @@ required:
   - clocks
   - clock-names
   - iommus
-  - assigned-clocks
-  - assigned-clock-parents
 
 allOf:
   - if:
-- 
2.47.2


