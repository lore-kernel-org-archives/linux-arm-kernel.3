Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15CACED639
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 12:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3QJ1mTk7kGA2Mq/qr+t1f9JBo1ERwQoZHJ3mtEtKdkE=; b=t+fAEkfnfbrRq9DPTg2TK0dQOS
	XaCQVN/w2i0pU9tn4GjjtydMYCW4/vQxnUjailR4VAzRSDvyb+pupI2Mhs+UZsJ64zO5f5ld3fAhM
	cEqjzwxmg4qUQzZG0dwVIXEhi0Zn/xS/MTh9HQ15GJenHhdmSqA8ypWbN9IkTpTQn5stYJmSVkUvn
	6N09/ppOjOf/nT6eC+97hxplD3XLDMO+nmm7QP7uYI97RwIl7lo4gvZP1svIvnkJi5Ui/0zseYAik
	Kwb15SDzN85+pjLqjGW/8oqf3NbERuvIeeMOCZ++4JEB2yBEcSxXjbNCGDhViyw+kh/C/9dsH+dj5
	TJm6Elxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKcc-00000000Ocg-2oXw;
	Tue, 18 Nov 2025 12:15:46 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKcS-00000000OXt-3x7Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 12:15:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 49A8B108C89;
	Tue, 18 Nov 2025 13:15:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1763468133; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=3QJ1mTk7kGA2Mq/qr+t1f9JBo1ERwQoZHJ3mtEtKdkE=;
	b=cM+IEsiFFxyPJrmXrbZfStiEXUKUwtHgZZ/o2gXEuujrADPdFBU3USY8tz0rzUQfn/ESCS
	+f6JpVmalPLjCTBEo7b93zLKIp0a3XVRokmJpvgyffxbSFslRSQ9GEAA2cuNa3XDI52kfk
	nZm9CCZWxdSonPRz4aFNaaJIaE9nssn4CKupE4ginl0QpzuKPx+WH76xoBwSc6qiisHdtX
	RyE8ToD5SVVsYrGzmVVticwiFgvkC4Hfyf6zhjMCMtnmvTkWfqHA0bJxmLEjj7VbY928F9
	HMxC03mF+vbrkvrXeUhKHNbK+iEGbIKgMWykPpGlMnCtjeMBDvfCRMdlxilXlw==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Christian Eggers <ceggers@arri.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: eeprom: at25: Add Anvo ANV32C81W
Date: Tue, 18 Nov 2025 13:13:10 +0100
Message-ID: <20251118121513.88352-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_041537_125069_28441742 
X-CRM114-Status: UNSURE (   9.68  )
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

Document the compatible for ANV32C81W 256kb Serial SPI non-volatile SRAM.
Although it is a SRAM device, it can be accessed through EEPROM interface.
At least until there is no proper SRAM driver support for it.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Christian Eggers <ceggers@arri.de>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Markus Heidelberg <m.heidelberg@cab.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/eeprom/at25.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at25.yaml b/Documentation/devicetree/bindings/eeprom/at25.yaml
index 00e0f07b44f84..e1599ce109165 100644
--- a/Documentation/devicetree/bindings/eeprom/at25.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at25.yaml
@@ -25,6 +25,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - anvo,anv32c81w
               - anvo,anv32e61w
               - atmel,at25256B
               - fujitsu,mb85rs1mt
-- 
2.51.0


