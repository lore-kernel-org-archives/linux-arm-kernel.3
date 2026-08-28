Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757F8C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 15:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1Lhf28p1KpUv8PgegBMsP1d1gnOFYTeDBzEP/RItsI8=; b=s+BujStjxpP5vj0Sv8lIEBxjSq
	d5JEfa40+sB1g5sWdkGN/JK6Yp3vBulpu/kZ3hHlG0AceO2SKPxx5CHudPBFE25rz1AYtva7X/iz7
	tHOe+Y0dKBRYKZ8SaNph2qZ5ykvT9RoEKz99TAQQRtdo56zqEATN4tvWsN9UabcRGfMyaWepIAn9q
	oUAmigEO5b1WQziNiT3aKcyQZvnMu+646f9lKw0CLY8WllHTuGVfunZLNZ8HVq86GPMyktQpH/jPb
	+QFpWO+qmUzsxSu9+lsgun7XbreIr6eZC6F0j3/MyAuW3/K/8gw1jjoIQC77QOgcJkUemaBfyY9AU
	J4mJ8uNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzyOm-000000065DQ-2XLI;
	Fri, 28 Aug 2026 15:21:44 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzyOj-000000065Cf-2QRY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 15:21:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A85211C69A;
	Fri, 28 Aug 2026 17:21:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787930495; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=1Lhf28p1KpUv8PgegBMsP1d1gnOFYTeDBzEP/RItsI8=;
	b=iyYX//ECqZvLfseXzTmTgvjkD1MsiuGO7BUIVM0E+5/rABdyJaMbg1N0SCYf+mvByRPOzb
	eTc4lVLeacXAZPJHydblJGzbs6vn7pRv8044aXC7QfeueocOGYX/hAldtW6DF71fFwcnlr
	C1gUJqjXtGeocmqQ1KEcGxq/UufdEBaiXVqdDoyhfocAPXS3DeGGh0kiGBXZpqpb5wvoAN
	q+5Ve+Pfsod7xHrWqJh4vIYmdWaukA5UVkweftd6eSiI7Lc2kBnYdYnFH7MXvQjWx7cjrQ
	d7S8T5YD7wUUeIEyPi0eeR+SeetPdk2IxdXPDpqajQdfhiVZefz03FWyt20YCg==
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
Subject: [PATCH v2 1/3] dt-bindings: usb: generic-ehci: Document ST STM32MP1 SoC compatibles
Date: Fri, 28 Aug 2026 17:21:15 +0200
Message-ID: <20260828152130.176171-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_082141_751880_D64F8759 
X-CRM114-Status: UNSURE (   8.94  )
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
SoC DTSI currently use plain "generic-ehci" which is not future proof.

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
V2: Place ST below Socionext
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index ae9fb70d0212c..5d9dfea8e2160 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -55,6 +55,8 @@ properties:
               - rockchip,rk3588-ehci
               - snps,hsdk-v1.0-ehci
               - socionext,uniphier-ehci
+              - st,stm32mp13-ehci
+              - st,stm32mp15-ehci
           - const: generic-ehci
       - items:
           - enum:
-- 
2.53.0


