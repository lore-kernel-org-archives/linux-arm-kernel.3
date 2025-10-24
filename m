Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F20BCCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 11:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdgEYQ9o3meIOtELwT6nrk4cXE1cCnCCV2E49nBgU1U=; b=3cfqMcfxaDQFQchlP0C6/6M/Uw
	NMt9mvgLXqkoDLCC5v7JditTQJK+yrO/BUeW0MaYjbMSBStWNpRH2KCEpHSc59oO9GSJj8gFRJbUE
	viISn8xhPGPljijyojOO8dqnygsbxV3BrQ8ICCjDRcXE/w9ieuMUPhe2G5TUsfBslJYQc6K8Eojvi
	VrDxC5BVp90ElTYaIWmmukxRsOQE0NdKLrzvjf40p/IcdMlxaBUKpKte6pd0Z+snPVv9I8B9Smq4o
	nVHnOfMlpnVc9ZPnnt2Eh1aGBX5vFWdfWk0Z9128mLjbo8fmG7d6jlkm0oo+gEokEN/rdE5dcTYsT
	poQFvTMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGJY-00000009GL8-1uEz;
	Fri, 24 Oct 2025 11:50:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGJT-00000009GI3-1ng9
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 24 Oct 2025 11:50:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=JdgEYQ9o3meIOtELwT6nrk4cXE1cCnCCV2E49nBgU1U=; b=DBKwqBb/6iKeMcIM5+kmYc8m7p
	WjfWgPnnylMWuZ2nHHPSMRBFgmu9f0iT36j5ndTbYZn0zOTk186qkTIU3c6FQNittoKdTAEp3S4zZ
	anaQHlMdWsjlHDY46cw8/bf7wkZBAxKc596LemFYuzYMD1uDkEG8I/DsCz+MoYfVpDhyvjGAEh8Ai
	HZHmTOLtPYo8Yfv6g46rt9+/BU4AfMkNtJke7mlvVfWXu7Ny2O+5PHsU5wfB+nfaNHKxm4Feso4wt
	xTZmI7CL5N9yr7+30Lu7KdYySjJNUokSRLRY/ofXWhKnhBT9dAeauG1FAAuQQqCc1031HAcVEcA5f
	dQEpwEOA==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFRm-00000002FTM-2t4G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 10:55:04 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1vCGJA-0002FG-SR; Fri, 24 Oct 2025 13:50:12 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Fri, 24 Oct 2025 13:50:01 +0200
Subject: [PATCH v5 09/10] dt-bindings: intel: add agilex5-based Arrow
 AXE5-Eagle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-v6-12-topic-socfpga-agilex5-v5-9-4c4a51159eeb@pengutronix.de>
References: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
In-Reply-To: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Matthew Gerlach <matthew.gerlach@altera.com>
Cc: kernel@pengutronix.de, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_115502_903676_272F6A5E 
X-CRM114-Status: UNSURE (   7.64  )
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

Add binding for the Arrow Agilex5-based AXE5-Eagle board.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/intel,socfpga.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/intel,socfpga.yaml b/Documentation/devicetree/bindings/arm/intel,socfpga.yaml
index c75cd7d29f1aa..3ab6058268e8c 100644
--- a/Documentation/devicetree/bindings/arm/intel,socfpga.yaml
+++ b/Documentation/devicetree/bindings/arm/intel,socfpga.yaml
@@ -24,6 +24,7 @@ properties:
       - description: Agilex5 boards
         items:
           - enum:
+              - arrow,socfpga-agilex5-axe5-eagle
               - intel,socfpga-agilex5-socdk
               - intel,socfpga-agilex5-socdk-nand
           - const: intel,socfpga-agilex5

-- 
2.51.0


