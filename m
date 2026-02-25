Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFC8FD3770
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 16:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytBKjXnIpZFlPj6k38mosVxqNhe9e+hzjAgkKDAFxus=; b=qSftEvDBAtlVr9sZQlk30NvUuH
	CSX5/KpbfoWchCK0GRD/DPAI3z0brbh7foKw9ONuQrse0xqknoYWeGBqfnskXHgs6yPqQodDBoVpU
	fKg26bDxN1XgeqCR9r/0nE0/bxbKm1mPZZsggjVUZAF76qXUBbAgQcLIZsXE09DOWebbx8Tz5oWEm
	tW6jpmmtZ5wYocxvcvRNbqf4kKBuiDmeriRyr9ZS+TKb4UlUQRcYpqlNhPmsUxxyOHA5k3fT+I2/1
	8NrS07IsjgmFW7CLzNoyLfIkwguY3PCeOvFGP8gsGU3Tnra2fH/41K4aMqQWi1X3VikYEG0/VxWjJ
	Zh/rFtww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHRK-00000004S2F-2RbH;
	Wed, 25 Feb 2026 16:08:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHRH-00000004S0R-2tGl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 16:08:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FEB5444C3;
	Wed, 25 Feb 2026 16:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F5B2C19421;
	Wed, 25 Feb 2026 16:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772035718;
	bh=/B2QfrFALKWSloUZN8RZMJ44JhHxgk0zEngrHRn7UaM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aQsusfUtp/W0y6R3mZUwfIRgnm0Py09Oc41jSqlIBiRdOFaivWvTWaZwA3bBLRwTX
	 zLLlHZ/tDHdGXtibR/a8LQKN6TBM1zNYkrWP938DRhAoU/R0/8AyqLS5LBDOhNrT2m
	 lR57E5htV8oJXTx4mo3sDu1us49zf6uKRmfE10bIelSOBcuBub7vpjoeQKp7a0vewO
	 ja21Wcnep40GXsNJlvUXQykzIlKLASpyLHOzDc78JVYE9XMwL919xSwnmDYpeeEKm/
	 mmSfDFSkqQ8131ghAI34gGG8kVlwlVe3ZA6Mj250PHFg+2DFsr6AtJtbf+XVrnCqQG
	 X37uKCpOkqa1w==
Received: by wens.tw (Postfix, from userid 1000)
	id A095A5FD2A; Thu, 26 Feb 2026 00:08:35 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: leds: sun50i-a100: Add compatible for Allwinner A523 SoC
Date: Thu, 26 Feb 2026 00:08:24 +0800
Message-ID: <20260225160828.1687643-2-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225160828.1687643-1-wens@kernel.org>
References: <20260225160828.1687643-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_080839_752882_A1E27AC7 
X-CRM114-Status: GOOD (  10.11  )
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

The Allwinner A523 SoC family features an identical LED controller as
found on the A100.

Add a SoC-specific compatible for it, with fallback to the A100 one.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml b/Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml
index 760cb336dccb..0b73fe5b662f 100644
--- a/Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml
+++ b/Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml
@@ -21,6 +21,7 @@ properties:
           - enum:
               - allwinner,sun20i-d1-ledc
               - allwinner,sun50i-r329-ledc
+              - allwinner,sun55i-a523-ledc
           - const: allwinner,sun50i-a100-ledc
 
   reg:
-- 
2.47.3


