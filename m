Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78599D12D5C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 01:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=160EcdKb4zdEvoYGIGuRUDe/8wcMZ7jXvAKiQuJGmc0=; b=PGiGhiMAxXjtA/qYxjdn6t3PLG
	rAvsFKwkLmvp10Qgxl5J+fwcy4RwQVUTLdoZzSnZaHTIe21f4kECQ1ZMJ1ZhpYhy4qyubjBrDteHY
	FWC9aRQiPgBEAGcsJYwGmO0+V45+AlsUb2HJq2YKVxkBjdS5mV7yM7V4EiEoI09gYKzwutyHvWTEs
	lGX+EgsQabZoFQLNUyWlRwrqdv6oez2lt6ubf9NwyQDhKRxqD6LEtMhsI1QCwNPHSVS/SrJRsu3U5
	/9rpDwSLBodS7mEwSsMHR1HUWkkYSFfT6Rb+FjNl/YzUeY1Ro7tac9Xt4BG3AYHINCnRvoT3ebYbH
	25Rq1ESw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAJXu-0000000G4Jm-2brn;
	Mon, 11 Nov 2024 01:48:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAJGh-0000000G1sQ-3UYu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 01:31:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E2D913D5;
	Sun, 10 Nov 2024 17:31:33 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04A193F66E;
	Sun, 10 Nov 2024 17:31:01 -0800 (PST)
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
Subject: [PATCH 09/14] dt-bindings: usb: add A523 compatible string for EHCI and OCHI
Date: Mon, 11 Nov 2024 01:30:28 +0000
Message-ID: <20241111013033.22793-10-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241111013033.22793-1-andre.przywara@arm.com>
References: <20241111013033.22793-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_173103_933424_2C1C621E 
X-CRM114-Status: UNSURE (   9.76  )
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

The Allwinner A523/T527 feature generic EHCI and OHCI compatible USB-2.0
host controllers (in addition to an MUSB and an XHCI controller).

Add the new name to the list of supported compatible strings.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 1 +
 Documentation/devicetree/bindings/usb/generic-ohci.yaml | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 2ed178f16a782..9c5884c1e7c53 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -31,6 +31,7 @@ properties:
               - allwinner,sun50i-a64-ehci
               - allwinner,sun50i-h6-ehci
               - allwinner,sun50i-h616-ehci
+              - allwinner,sun55i-a523-ehci
               - allwinner,sun5i-a13-ehci
               - allwinner,sun6i-a31-ehci
               - allwinner,sun7i-a20-ehci
diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index b9576015736bf..f1ae45aa4c86c 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -18,6 +18,7 @@ properties:
               - allwinner,sun50i-a64-ohci
               - allwinner,sun50i-h6-ohci
               - allwinner,sun50i-h616-ohci
+              - allwinner,sun55i-a523-ohci
               - allwinner,sun5i-a13-ohci
               - allwinner,sun6i-a31-ohci
               - allwinner,sun7i-a20-ohci
-- 
2.46.2


