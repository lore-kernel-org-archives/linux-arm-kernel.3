Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9848CCF2D3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 16:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQB2rmCW29JvpU3qGm2v4c/LJ09qeYiDXYkMOh7dsnE=; b=PGREfj9+I24ebW7t8DAJ/i4aff
	w2SZpXjxJrgJGrn4K1IBMdQ0JX5ogwOumeS7zNjpI++yHBumLPSB7/tqJEjnMT0U+S+SY+5SG/CJt
	0LxjGGR/CfwVq9e3WGiKMIwGItkUBn1NgAPAH6IlA5YaXeuvJYmUcUmA0ZxEzY/BhMMm/2dVAiLhk
	62h6/HYzdftOxc08h/1LjWvqriiMvx5YLO+aYVGYmjtO6FsMOWeVKeUJMhdP1yEpc7oiuESP+EErG
	rg/8M/5nGSAxs6QcGk+IchisQbrISWyE7IyXds7qAVqmGVkW5SQyXrbTfQp8UjMKZnaeVSu+4aAMG
	csonYgjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xITQe-000000061VW-3Tgs;
	Sun, 18 Oct 2026 16:08:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xITQX-000000061Tb-1ppI;
	Sun, 18 Oct 2026 16:08:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BQB2rmCW29JvpU3qGm2v4c/LJ09qeYiDXYkMOh7dsnE=; b=QHuqUhsv01jz2MnR/ITX1i/cKk
	ti2sJIS+dvS7BAr8vg3rxAFyvNmgS1zsfUTVv5LEpTtdEQZ0/vqAUi3uI8O9F2jQUo58uBhnTt584
	SgmWBTNe75aBGvd7WENtRjJDMI6uQ4TmPM/wBfB0PcCYbnswqR/9v0uT4djAkBc9fcE6zjj+dKC1w
	2gCPYPQMKHBxSCaAG/gosJFqABjjyntKWrNxOCX0h2JsdmD/sWAfo1iF8lp9Mz7UeiQk0AEnzpaqo
	5oNhc5NT67NZiiOaMK93a9sT6RyixsB9ivNopgVlwiKQ/eNW6pqMeeU/r0FDiAE39ZhZWZHBDH71g
	QDlaIbxQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xITQS-000000031Bb-2Fe3;
	Sun, 18 Oct 2026 16:08:00 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69IG6rQnA1115122, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792339613; bh=BQB2rmCW29JvpU3qGm2v4c/LJ09qeYiDXYkMOh7dsnE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=rgnQagsu0GCxHWcE9rJgR1Nbbf6WnkqckNib8WKDFtaLHL9CMsXtri6SQYiEDoAZe
	 zL9VSiMiz5AkxhLTwD9yJoV7/3Z7MTdrm4lvV0I9p3sGnDdsgA/qSVJ132wxv9e8OL
	 mHRFV//X/4t1jSV1ZSVTqieQ/vcK5voJF41eR3FDZ1AqhxlE6ZeBknT1C9WW1MG/EL
	 ml8VDKsIuA6gaStAHDqVsyZUP5Ps050HZgFSiqnkebPPPlKu9jmTjPQ1P5kNWPNZ9I
	 jQa5eykDdlsmu4Bv9M/v9N3t07gYOpa2s+TXX8DhaRdbbnML5ftfLDKH9/28qNHP1/
	 /DM/DO2uZaDTg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69IG6rQnA1115122
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Oct 2026 00:06:53 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 00:06:54 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 00:06:54 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 19 Oct 2026 00:06:54 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <tglx@kernel.org>, <radu@rendec.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lee@kernel.org>,
	<afaerber@suse.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<mfd@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v5 2/8] dt-bindings: mfd: realtek,rtd1xxx: Add new SoCs
Date: Mon, 19 Oct 2026 00:06:47 +0800
Message-ID: <20261018160653.3940371-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261018160653.3940371-1-eleanor.lin@realtek.com>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_170757_340682_B73439C4 
X-CRM114-Status: UNSURE (   7.23  )
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

Add compatible strings for Realtek RTD1619B, RTD1319D, RTD1325, and
RTD1625 syscon registers

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 .../devicetree/bindings/mfd/realtek,rtd1xxx.yaml         | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml b/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml
index b0342df0e32a..717e29c37b36 100644
--- a/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml
+++ b/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml
@@ -28,6 +28,10 @@ properties:
           - realtek,rtd1296-misc
           - realtek,rtd1296-sb2
           - realtek,rtd1296-scpu-wrapper
+          - realtek,rtd1319d-iso
+          - realtek,rtd1319d-misc
+          - realtek,rtd1325-iso
+          - realtek,rtd1325-misc
           - realtek,rtd1395-crt
           - realtek,rtd1395-iso
           - realtek,rtd1395-misc
@@ -38,6 +42,11 @@ properties:
           - realtek,rtd1619-misc
           - realtek,rtd1619-sb2
           - realtek,rtd1619-scpu-wrapper
+          - realtek,rtd1619b-iso
+          - realtek,rtd1619b-misc
+          - realtek,rtd1625-iso
+          - realtek,rtd1625-isom
+          - realtek,rtd1625-misc
       - const: syscon
       - const: simple-mfd
 
-- 
2.43.0


