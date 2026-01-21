Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F521C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 08:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r18FX95Gy1+St6A2bMtsgn3QcT2950JmTo6var6SRro=; b=ueWGxGp0xhgtTac1pS4EoFcSXL
	vFBwckyLUxwjo78T6+0eG1o80Z5wfaSyUWcUnZdrnuPKqo7wVnsPtYimGkgYhWH/f+G3eDYrbA/oF
	B3Z+K3yysjHr0Xci8O5CLaUc6p/Z1OFd81m7W1iSeXr+B8s4iXvaYpPzpL5PlLjE+13NYV0iwlloZ
	GADCaHEAZzosLBgeygxF/4G4KFptvxMDjok1RBuDOA1BKyh31A21H8mcC1CPkUrlW1CeYJ9OOAeX1
	+ZhInQzdwQXjsJrGOTBFD/odNdl53krYP8GAptLEMDICyuZTRN3J6X8htZLoZmpoTM91wWrqtqVeX
	/daMjLGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTyc-000000058Fq-3yUc;
	Wed, 21 Jan 2026 08:54:10 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTya-000000058Ds-1B6f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 08:54:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8227210DEDB;
	Wed, 21 Jan 2026 09:53:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1768985640; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=r18FX95Gy1+St6A2bMtsgn3QcT2950JmTo6var6SRro=;
	b=NRwYxfegIgmMjNoGAqpQ3d7lv2FlY2RYnm04ddvp79w/R5pxKSNTWnA7nuJeMcIWuUJcqz
	IABC4/0PubVKshMgwJeCJQAAQyURYr6nur+0LGZ9CzMO1DF8TVjbzf+X3Cmm4g7SX4WOZG
	A0WpnLLbyBK3pypCuDWSglBxmdTetNoc2lxhaGunC1oh3HXg2wIJ36yBgNESbtNiiaGiHM
	qGmnVFMlosCpNcl3sQ3vlDdilqPTs4uLckD2N3fDHUbp9kbvPPWtDeh3M1JdPyn1bLqgE/
	ITl2jpf2MAREAMtBNo9H0XY5KWZPjpO5x14IJgYVEIOeguk/VrQCO3YYQfW1qg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 1/3] dt-bindings: eeprom: at25: Document Microchip 25AA010A
Date: Wed, 21 Jan 2026 09:53:19 +0100
Message-ID: <20260121085347.10368-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_005408_540550_FFE392E5 
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

The Microchip 25AA010A is a 1 Kbit SPI EEPROM with 16 Byte page.
Product page is at https://www.microchip.com/en-us/product/25AA010A

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 Documentation/devicetree/bindings/eeprom/at25.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at25.yaml b/Documentation/devicetree/bindings/eeprom/at25.yaml
index e1599ce109165..bb78e12b8823b 100644
--- a/Documentation/devicetree/bindings/eeprom/at25.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at25.yaml
@@ -31,6 +31,7 @@ properties:
               - fujitsu,mb85rs1mt
               - fujitsu,mb85rs256
               - fujitsu,mb85rs64
+              - microchip,25aa010a
               - microchip,at25160bn
               - microchip,25lc040
               - st,m95m02
-- 
2.51.0


