Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430A8C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 10:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSCgs0lQLqQsikPfdXK9PGRbuAiA76T18Sx7NNxX49E=; b=ThRQociZxWPJP3xWZTmwZKFuM5
	piYq/JZVDIvd0dOfM6bEj96U/zzTvnC/ArtMGipEri4L6V4sSDtbtguyXl8o643U+PgZusb4nOnWr
	8VTAGk5oAtywnQSrw/RpU367CYdFpm6W6ma7lAut3k9uL4dvhcJY+m5d8wA+RvzB7uSYOZK2Y8Vmy
	vPA/KecTWwFPw01LgFdFsZfwbeoIdSN5E14tIWX9q6xl96tNqfEpQmZ2Vz2RYdEy1wWi5Mo09eZn7
	+oJXqejTtyCfszspk4kqBQY2ccoy2cdq2POcizlDQ3nLElvY7LzEXe1qkg/PmQEQlt7x6Qfll6+AM
	C6wWvZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyohu-00000000dNr-3aak;
	Tue, 25 Aug 2026 10:48:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyoht-00000000dLN-1LBR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 10:48:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 73063601DE;
	Tue, 25 Aug 2026 10:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15BDAC2BCC7;
	Tue, 25 Aug 2026 10:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787654920;
	bh=Vj1DHrmGR0tyVO+ZlDxsQgZLtvtVuNtuX+cbxrGaewI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Wlu61ztGYvIiCAkcwKONvj5YgDAk45PsbLBjX53+IlGR8L02chPEMJZoBRrI471D1
	 rKMyU2cMFHhaiWMka6lqdkFwz6qf/fhvJIjv36I2fIIEtcDz2Xb+OSRrBGe929upDY
	 N2wv92QH/fDYwliDSd72/+h5rBc7UQaU1OQWkKnZyPpEL7JyG/TpUcIOzj1/8Z1q5D
	 HzuaOeyJ2FlnY7hftrm4+T32EfLUH6Tcc7ZaElS7mfY46vwb1ejtfK00QaPpN/P5Rq
	 oPcGkbXIbFkKrYR+y2cX7nrMD1sLWVk6XmK1W1qjVTmze75jOLC+zj9Ukbel90HECB
	 CvVfEQcdPHOmg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69AEC61DB6;
	Tue, 25 Aug 2026 10:48:39 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Tue, 25 Aug 2026 18:47:42 +0800
Subject: [PATCH v6 01/12] dt-bindings: arm: aspeed: Add Anacapa EVT1 EVT2
 DVT board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-anacapa-devlop-phase-devicetree-v6-1-9059a2a279ce@gmail.com>
References: <20260825-anacapa-devlop-phase-devicetree-v6-0-9059a2a279ce@gmail.com>
In-Reply-To: <20260825-anacapa-devlop-phase-devicetree-v6-0-9059a2a279ce@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787654905; l=985;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=Sw+OWK3YcWaJDMswc4oOvzoue3GKb6ZepbG6V99kpbc=;
 b=4A0y8x/hf3KaXM3cEV4tdE3POr/Pbjc3QPcf3gzD6S1OIXiqLc1psKaEhE352IbNumiwWyrXF
 8tYTg9zCqU4BkQWdDFtOJ9M/T7H/tKeYNOY8xhej553QdnkEf1SzRFg
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
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
Reply-To: u8813345@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Colin Huang <u8813345@gmail.com>

Document Anacapa BMC EVT1, EVT2, and DVT compatibles.

Signed-off-by: Colin Huang <u8813345@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index dd7996960de3..1c1570143bd9 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -84,6 +84,9 @@ properties:
               - asus,ast2600-kommando-ipmi-card
               - asus,x4tf-bmc
               - facebook,anacapa-bmc
+              - facebook,anacapa-bmc-dvt
+              - facebook,anacapa-bmc-evt1
+              - facebook,anacapa-bmc-evt2
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
               - facebook,clemente-bmc

-- 
2.34.1



