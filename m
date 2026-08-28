Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F74C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 15:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dxEe3bwgfJv6BqUxPGodt52+sYVqWmIvkSGMdRVqqzk=; b=uY23tzQ2l4Cx1q+Eeav7hxOgCb
	+IFAb8eCV7TnzexpOEDjIjiCymoWlVuqFkIf1N2PUSvp7uAzC6EQIiJrAGXlNpPKJl2LKYvzV9Sd7
	rr1zPsfLl4vd5MWti0D4sojZDYLe8iugjdlfz+o06HPz0G0UC+aryzXhhSqLwRQTQ9ASOgHG8NQNM
	YtTP7oXDWZZOdS+gkFBOn8z2bK3+ok+8mzH/pso7Ho6Uw7egdt5SLoOBP6ammAUM33NrVdnKRlvyH
	8fW2+bRwF5VturKvXRVy97WU80yxc4ligRGHC41tkkH2mYRdWnNBtBwbcbZCECUAIsRwwmiSIqSgw
	mPUX/W4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzy5w-000000062gv-0ibr;
	Fri, 28 Aug 2026 15:02:16 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzy5t-000000062gE-3wNR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 15:02:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0286611AC65;
	Fri, 28 Aug 2026 17:02:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787929328; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=dxEe3bwgfJv6BqUxPGodt52+sYVqWmIvkSGMdRVqqzk=;
	b=GjQjpms/Mdhvu8RQK7EjU4hWFl1hFSUT0+BkxelB5dPTjaP6Iprs8sqZQNC+lI/eIInaps
	4tW7q8bTeQWZnzdjxfHftnmBu/dmS+W1tPvZYhIAa+teGkXNH86UkbEu+U4N3brZwcwe3S
	PIvG3fTTe5lYGltgxQaXKcRD7yfCkgI4ogOrbRQfsIrJXSQPLdSGg3ncIYhQxYf0rd3ydE
	M0Sb19ZgTI4zBEZ/eqybRAa9IXUAMWNJJkfudK4W4pn87NqH8R8NZ3enhjcH8QDp/0ooBf
	0e4G2RXNy3W7GmUDH9Rnn2JJT5aDqpK35nVbQhxQl1Z27Vd7tvWuOWwAeqBKmA==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-usb@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: usb: generic-ohci: Document ST STM32MP1 SoC compatibles
Date: Fri, 28 Aug 2026 17:01:26 +0200
Message-ID: <20260828150202.173109-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_080214_119797_7FDFF93D 
X-CRM114-Status: UNSURE (   8.93  )
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

Document SoC compatibles for ST STM32MP13xx and STM32MP15xx series of
SoC, so they can be used as more accurate compatible in SoC DTSI. The
SoC DTSI currently use plain "generic-ohci" which is not future proof.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org
---
 Documentation/devicetree/bindings/usb/generic-ohci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 322808aaa2839..474a84aa32d0f 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -49,6 +49,8 @@ properties:
               - ingenic,jz4740-ohci
               - rockchip,rk3588-ohci
               - snps,hsdk-v1.0-ohci
+              - st,stm32mp13-ohci
+              - st,stm32mp15-ohci
           - const: generic-ohci
       - enum:
           - generic-ohci
-- 
2.53.0


