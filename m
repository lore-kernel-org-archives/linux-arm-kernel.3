Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02BFD12D5E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 01:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbMy0MkSESX4PQjdE/j1NW6OIoNUNFGcz7CyKPirSDg=; b=NqLqhfqtu9ksyv3sGE0HW+5mpV
	xY5U5+vk7h0I2NKqIgczMWlEKI41XSv/MQplW9x2Eu8i1eNmV9phP1XEkyoPR+z42mbqNHyXTA17e
	o5MWCVLcKXqR395Xt4X6OhzgUEhv90AAQzifS31V8kYAMc1Db4Vlc79CfWsejQ1Ac/HvdK6rsA/uP
	SQoWAO8N2BPAdYY8tonsnJNDvs2rfCjtA6YTITN2y15z+ukwufQhzpU+RbJloonN9knHpgAUfc2t9
	FsC4EkKkR1qdGKkJCCMPyLA5DxEJ/xEeXTtgvfSIGBnKmRjye1+8UDpKmsqsCRDJJTBRpcRZSy/zi
	PUHh1pDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAJWB-0000000G48M-0JJ6;
	Mon, 11 Nov 2024 01:47:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAJGg-0000000G1tJ-0vVT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 01:31:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A48FB1CE0;
	Sun, 10 Nov 2024 17:31:31 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A63D3F66E;
	Sun, 10 Nov 2024 17:30:59 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 08/14] dt-bindings: usb: sunxi-musb: add Allwinner A523 compatible string
Date: Mon, 11 Nov 2024 01:30:27 +0000
Message-ID: <20241111013033.22793-9-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241111013033.22793-1-andre.przywara@arm.com>
References: <20241111013033.22793-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_173102_451559_BBE7BB2B 
X-CRM114-Status: UNSURE (   9.00  )
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

The Allwinner A523/T527 SoCs have a MUSB controller fully compatible to
the D1 (and ultimately the A33), with five endpoints.

Add the new name to the list of compatible strings.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
index f972ce976e860..57c17d5a62d63 100644
--- a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
+++ b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
@@ -24,6 +24,7 @@ properties:
               - allwinner,sun8i-a83t-musb
               - allwinner,sun20i-d1-musb
               - allwinner,sun50i-h6-musb
+              - allwinner,sun55i-a523-musb
           - const: allwinner,sun8i-a33-musb
       - items:
           - const: allwinner,sun50i-h616-musb
-- 
2.46.2


