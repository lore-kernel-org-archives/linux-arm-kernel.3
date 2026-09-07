Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43146C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nmrLDUpli0xczKPjyc2UOxB5amey9DMtoKl7SwhodJ0=; b=VbbBxOxiTwa4S6c22ldnDysszN
	Ndr7LjW3cM34h1A1zWbfvhwalfZJZWaMl7T8PucTR9wAsOCxTltSelfKxx0Jxx5CXL4sk6ROezAY0
	PS8hzlsta6RTnCK506B3hFQ5MzP6JvLpZF26O97Qtd00Z5cla6IpbhGGZ7WtBIawWyUGmVVORxBli
	j2gjEXcZdhnpTKCDzQ30qkuiaZP6qvYbJ2tQRGNoPED7UEO1oBdl4Tb5viT2jhbfMCgVOTpdMP3Fn
	fmszYrLCpSC5LZ/b33Ong3j+ELcBpkQ7NcN5rKW8xISt0DRTQE4v1LZU0RhH/SKuhAUo1yWeqoEIh
	cRUiKXag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bxD-00000007GNZ-37Fh;
	Mon, 07 Sep 2026 16:12:19 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bxA-00000007GN8-2lpi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:12:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5DEB111D0D1;
	Mon, 07 Sep 2026 18:12:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788797528; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=nmrLDUpli0xczKPjyc2UOxB5amey9DMtoKl7SwhodJ0=;
	b=HRe2SpdeIkiqzutGSpDg/sMU7VSzFY79LU851PioylIIf4wkfK35btGVTXoCFe3gY6iLnd
	jnjg23KH4rxLoCBdWNnfJfH2nAiT/gZoFo4NF3MpVgpvoI7SlVJza3t9VMueZvfKOD3zVT
	Vz583TwOVHNKpPfng4RGXg5w4AqbH4Pv4g3jmvrX1BYAHw/xNAQT8qQiATZyq0t2L4hSbh
	VJSq3hobVML7/1W/6x6UkiZYgVZUFNi7LD0mBCkEnZlIJuQsNTYDUYwzpCZnUk0RnMBLQw
	lhBIhnF34jnnH5sCOq7NxMQXfiDdgKGy+FtWDfmmnjr082A6jqTH4UM95oD05w==
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
Subject: [PATCH 1/2] dt-bindings: usb: generic-ohci: Restrict access-controllers to ST STM32MP2 SoC
Date: Mon,  7 Sep 2026 18:11:53 +0200
Message-ID: <20260907161203.713424-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_091216_921714_D09E83F0 
X-CRM114-Status: UNSURE (   8.41  )
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

Tighten the access-controllers DT property availability, restrict it
only to ST STM32MP2 SoC, which is currently the only known user of it.
Once more users start using access-controllers, the restriction can be
losened here.

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
 Documentation/devicetree/bindings/usb/generic-ohci.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 7a8c3c2318153..cd9f51bbb445f 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -237,6 +237,9 @@ allOf:
       required:
         - access-controllers
         - clocks
+    else:
+      properties:
+        access-controllers: false
 
 unevaluatedProperties: false
 
-- 
2.53.0


