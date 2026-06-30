Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D70BC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 12:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7GZzqWqKzIryiPQ20rzYH5fss0EHkLdsxXQ+MCLDJ4=; b=428KNrVophB64wiTfges5I43BR
	xIG7zCSI7Z0SRTBL1oVFi1fx53Qy5ZiKIlPUkZgdoWRk05RBbkP+F+7NvrOWYtSRnHveO+NyZE5/r
	IV/F6bSryZkpEkQaVkjvcaZUlGizYfsEVoF5r5a8ca31ulp+TpSc+Nc9AQZq1Xkt44KwR92URz9BW
	+DKPBsGljHmYEelEetuChLNYOZjkQpXT/mFati3xeUOABX8xQAHHUdCtdTEL1kEDZii7AZGS62gEr
	hYdTNSQn6WIzBtXghNkC4YwJMy7/q1rj/R1NoNGIhlTkwaUl0QJiTW3sMeFq33QBr1gJTNa/oG+LH
	DUQV/+Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXzL-0000000H4cy-0bW3;
	Tue, 30 Jun 2026 12:54:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXzD-0000000H4WF-0rGx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 12:54:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A63E643F86;
	Tue, 30 Jun 2026 12:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7388AC4AF0B;
	Tue, 30 Jun 2026 12:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782824086;
	bh=9XzjbYaBUsoOWcEt/akYK3mjOrj4my2NJLQ/VEcsXjI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nqMUR/eaOrw3tQzjrTkePZdxnmA3cdkEfwtNNFztLjJx9Kal+Hmp6orqbU3rdgJje
	 obRCLNr2M3YowCTQ/rKp3v8KOfbJzvchNndNRoYiLwmekhTGWng47aqBox1GMAOwdd
	 SV91RWaoehiffquNq/9D8XgTwUrG5YIfwnaGTEL8DrxqogGAX4Cy0DXbdrBmjQ61s1
	 mYoe0Tc0oqEhgp/ick4CYTaUjZopwCt8bZ3NTp17H99g5+7HURza537kSGujwfNfZU
	 kFIkxdM7gZw4ZsQCq9W5QSvHyXVzM6bJlSsIqzz4OwmpzojjbTrBt/Cr/sTl8eK6IT
	 VtZcx9RK6r4MQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 651CBC43327;
	Tue, 30 Jun 2026 12:54:46 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Tue, 30 Jun 2026 22:54:31 +1000
Subject: [PATCH 03/10] dt-bindings: iommu: apple,dart: Add t8122 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-apple-mtp-keyboard-final-v1-3-506d936a1707@gmail.com>
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
In-Reply-To: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 iommu@lists.linux.dev, linux-input@vger.kernel.org, 
 Michael Reeves <michael.reeves077@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782824083; l=963;
 i=michael.reeves077@gmail.com; s=20260105; h=from:subject:message-id;
 bh=y5JWfMxBJX2xwts+wGq01XJ6a6fA14G/VbJw916yMm0=;
 b=5iqh2NsfbrvbnnFMBUjNQ9JMWqmwkDS68TKoS3s6ZKyEuN8ohJJ4u5+rkTGBiNHhfR+95Ekiq
 ojKHCJikfWADnyTu62aZ30rMoFM5bYbdIPtKbGM4A7trN7HTSRd2pBQ
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=QIrgWBGCm3LG0YYc6MLCDkwuVXLTGGooVBdWX/KhSiU=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20260105
 with auth_id=591
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
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
Reply-To: michael.reeves077@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Reeves <michael.reeves077@gmail.com>

The MTP block on t8122 has its own DART instance for coprocessor DMA.

Document the t8122 compatible with the existing t8110 fallback because
the programming model is shared.

Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 Documentation/devicetree/bindings/iommu/apple,dart.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/apple,dart.yaml b/Documentation/devicetree/bindings/iommu/apple,dart.yaml
index 47ec7fa52c3a..e179199dbd3b 100644
--- a/Documentation/devicetree/bindings/iommu/apple,dart.yaml
+++ b/Documentation/devicetree/bindings/iommu/apple,dart.yaml
@@ -29,7 +29,9 @@ properties:
           - apple,t8110-dart
           - apple,t6000-dart
       - items:
-          - const: apple,t6020-dart
+          - enum:
+              - apple,t6020-dart
+              - apple,t8122-dart
           - const: apple,t8110-dart
 
   reg:

-- 
2.51.2



