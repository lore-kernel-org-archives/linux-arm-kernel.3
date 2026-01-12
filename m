Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C509D25038
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 05:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=01nD1NQwyZhM5zOb9mDvKipq9kGSaxxU3jhC/1csX1U=; b=PNFaa35xENbkMnhA8I0tjnjMsE
	qJeI4XKVQF3W3PZHchOJ1Fj2dkyk0i1Nu1VgFfBOGgszhXT3E1otn9XH4OPgzu6JWMDRuF+4bLlMj
	wVXzaf2hEenbcm/qPvDAn8pcqmz1fN8dGh5PAqGUlKr6Tc3ZVEZqPBPf1LcfArX8l1hVWEjaX5SUV
	aRfCq1DWleS4+Gj8SHytOZu3Tv3mPhDilS85Q4b9PsSmDvOyF0Z4CE1GRb0oNTIFOuRBt8flo44oh
	S4djnte+Cvfv31C3qlR7DI9PZB1W8Z/0zG7TvRxaBESKGadKPjlVwoavZSB0nwc3WCdTxuxiGtx3T
	BwTOGFvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfAZr-00000004meP-1mf2;
	Mon, 12 Jan 2026 05:34:55 +0000
Received: from lgeamrelo13.lge.com ([156.147.23.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfAZn-00000004mdF-3aQn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 05:34:54 +0000
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.53 with ESMTP; 12 Jan 2026 14:34:47 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: chanho.min@lge.com
Received: from unknown (HELO localhost.localdomain) (10.178.31.97)
	by 156.147.1.121 with ESMTP; 12 Jan 2026 14:34:47 +0900
X-Original-SENDERIP: 10.178.31.97
X-Original-MAILFROM: chanho.min@lge.com
From: Chanho Min <chanho.min@lge.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Kael D'Alcamo <dev@kael-k.io>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Chanho Min <chanho.min@lge.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2 v3] dt-bindings: arm: lg: Add compatible for LG1215 SoC and reference board
Date: Mon, 12 Jan 2026 14:34:20 +0900
Message-Id: <20260112053421.3185738-2-chanho.min@lge.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112053421.3185738-1-chanho.min@lge.com>
References: <20260112053421.3185738-1-chanho.min@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_213452_228557_1B13473E 
X-CRM114-Status: UNSURE (   8.96  )
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

Add compatible strings for the LG1215 SoC and its reference board
(lg,lg1215 and lg,lg1215-ref).

This SoC is the next SoC following the LG1313 series, developed
by LG Electronics.

Signed-off-by: Chanho Min <chanho.min@lge.com>
---
 Documentation/devicetree/bindings/arm/lge.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/lge.yaml b/Documentation/devicetree/bindings/arm/lge.yaml
index d983ef7fcbd6..0d0661470eaa 100644
--- a/Documentation/devicetree/bindings/arm/lge.yaml
+++ b/Documentation/devicetree/bindings/arm/lge.yaml
@@ -24,5 +24,10 @@ properties:
           - const: lge,lg1313-ref
           - const: lge,lg1313
 
+      - description: Boards with LG1215 SoC
+        items:
+          - const: lg,lg1215-ref
+          - const: lg,lg1215
+
 additionalProperties: true
 ...
-- 
2.34.1


