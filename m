Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F358BCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 20:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oc/47/1dd6kNw8SuIJr6eu6xyRGuYNnkjOosnL9B1s0=; b=vWqStlfqacjWMzDLwDvn18BeEB
	E1Y7qIRy0JJ8LXJEPoKq2pHIETvADRgd2iSixxdx7xKmtAvbm4fzROw+WWdeAJ5Zn0w/0ZmnNaMvF
	8pT67PTa21zA7woQsDeMiFU0oCbtc3/7g4482Lu8YT04x3rcwQ8aQ2F12o0WpeNU/bq9933gKW09U
	lyk6pr3Fi8popAsYLiozsR0GRg1/yAtqs09AqDlEDRFLg57zCYrF9VbNzr1GN8VaplI/1v7nDKt1g
	C12YfcFaZHhByArBhek+hUVdIcoEwSyYVTlMsmv70l5a8JjpJDsDp+RZZ7HJLndjI5ydhHQWT0QwI
	Xi30RKtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw52b-0000000A4Se-45ie;
	Tue, 09 Sep 2025 20:34:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw52Z-0000000A4Q9-16uv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 20:34:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F78B44212;
	Tue,  9 Sep 2025 20:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E3F4C4CEF5;
	Tue,  9 Sep 2025 20:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757450050;
	bh=oXUngVSXwtqWUoFqNHj98nN7zNafzIiNipH7sJ0NKww=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d7tEzaihs2X+8mMtdObtk21raqXsD8mbi9U2crL6bqScy59U90QtJCQSQXWDpSUjL
	 Zk4aMtSBGqxA8pERQjgVx0itr97f/rrjP6cUD1qVBcH7aX4NxPq7ktESruSnyuw7Um
	 lOk84Zkq8LCXtkRxul1GdKw8Jfi1rJoYHY93MZyjT3vQigsSkNw+P/T8YySGo9OjjI
	 iEx2FF3gKfo/iGrW4olOYxocUjJ9OS01vZ4Tr2QWp2DLNWkDb5ryJBhHKMJs00g+bS
	 DE8Ejgg7EubvYTwZLFuSupcmh5UISGBjj9EMzoslEsQnC9YbMzuOhLTRdnZcZis7WH
	 y6FTBLDfR886A==
From: Andreas Kemnade <akemnade@kernel.org>
Date: Tue, 09 Sep 2025 22:33:02 +0200
Subject: [PATCH v2 1/3] dt-bindings: mfd: sy7636a: Add missing gpio pins
 and supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-sy7636-rsrc-v2-1-cfd9f44fd259@kernel.org>
References: <20250909-sy7636-rsrc-v2-0-cfd9f44fd259@kernel.org>
In-Reply-To: <20250909-sy7636-rsrc-v2-0-cfd9f44fd259@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alistair Francis <alistair@alistair23.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Andreas Kemnade <akemnade@kernel.org>
X-Mailer: b4 0.15-dev-50721
X-Developer-Signature: v=1; a=openpgp-sha256; l=1411; i=akemnade@kernel.org;
 h=from:subject:message-id; bh=oXUngVSXwtqWUoFqNHj98nN7zNafzIiNipH7sJ0NKww=;
 b=owGbwMvMwCEm/rzkS6lq2x3G02pJDBkH+rXL8/ZxyXNGmQXn9sbYnHjFxPZ338VH04s9bvPMP
 HUszTOio5SFQYyDQVZMkeWXtYLbJ5VnucFTI+xh5rAygQxh4OIUgIk4OTAyzHbKX7e941PEb8Nf
 xopN9d+Od7DPmKm7IoNXR5axymanKCPD1vNtM7qu6ypNj5WxElvy2vHWV7v9N3WPCRe6uMbYsLi
 xAQA=
X-Developer-Key: i=akemnade@kernel.org; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_133411_332372_1724B8C5 
X-CRM114-Status: GOOD (  12.79  )
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

To be able to fully describe how the SY7636A is connected to the system,
add properties for the EN and VCOM_EN pins. To squeeze out every bit
of unused current, in many devices it is possible to power off the
complete chip. Add an input regulator to allow that.

Signed-off-by: Andreas Kemnade <akemnade@kernel.org>
---
 .../devicetree/bindings/mfd/silergy,sy7636a.yaml         | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml b/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml
index ee0be32ac0204..054b97dd0c5c7 100644
--- a/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml
+++ b/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml
@@ -32,6 +32,22 @@ properties:
       Specifying the power good GPIOs.
     maxItems: 1
 
+  enable-gpios:
+    description:
+      If EN pin is not hardwired, specify it here to have it set up.
+    maxItems: 1
+
+  vcom-en-gpios:
+    description:
+      If VCOM_EN pin is not hardwired, specify it here to have it set up.
+    maxItems: 1
+
+  vin-supply:
+    description:
+      Supply for the chip. Some vendor kernels and devicetrees declare this
+      as a GPIO named "pwrall" which does not exist in the datasheet,
+      disabling it makes the chip disappear on the bus.
+
   regulators:
     type: object
 

-- 
2.39.5


