Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42883C02182
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 16:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8RmtdttkoJNVKbZY9bzJvK0fYfAA5HCpLBkR7s33KWk=; b=SdlyUIYqyyq9M1A0LdWES6O77q
	zz2+RXbGhlDLU1KmRkqycyEoaTuAh2+shYzGOMe3uIkkuvlIW5uDkNFDPvlQJKoiu0fUHheMEzAqt
	XgmE52om8ZsFWav/GCTsuqGiimOtBxg76a31dUlpRGf+LpSEbOR6U17m981gcuNsTrJ6X9+m6BCcf
	vYTPAlHxXjfFe1fQxcBosJ1W3gtkkARDVciXiNLP/ppKKIGxeys24J2nlP68jRD6WFQKiwux7kZwQ
	qprFlNRKuAqYmR58SxQBJ77ktTmAyghFCMqhDY4uvDRRoq7+m5VTjk6ylRGEEYIbl23cIMCALW2+Z
	0YNnKZbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZuke-000000060ek-3HYz;
	Mon, 20 Jan 2025 16:35:48 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZuiy-000000060KY-2M6z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 16:34:06 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tZuiv-00032D-FE
	for linux-arm-kernel@lists.infradead.org; Mon, 20 Jan 2025 17:34:01 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tZuiv-000xrM-0p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 17:34:01 +0100
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id EA9323AD0BA
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 16:34:00 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id 340223AD0A5;
	Mon, 20 Jan 2025 16:33:59 +0000 (UTC)
Received: from [172.20.34.65] (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 20c0da44;
	Mon, 20 Jan 2025 16:33:58 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Mon, 20 Jan 2025 17:33:47 +0100
Subject: [PATCH stm32-next v2 1/2] dt-bindings: arm: stm32: add compatible
 strings for Linux Automation GmbH LXA FairyTux 2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250120-lxa-fairytux-v2-1-95f4a0eaa44d@pengutronix.de>
References: <20250120-lxa-fairytux-v2-0-95f4a0eaa44d@pengutronix.de>
In-Reply-To: <20250120-lxa-fairytux-v2-0-95f4a0eaa44d@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=nHqVbVztPOg4rqN4cb7rY9www086UjxiBiZ4nydhcgc=;
 b=owEBbQGS/pANAwAKASg4oj56LbxvAcsmYgBnjnrx/FRlp1txQr1NDmjA/Lt3a5qIcSpYRj4Dr
 6zR+kGBVp2JATMEAAEKAB0WIQRQQLqG4LYE3Sm8Pl8oOKI+ei28bwUCZ4568QAKCRAoOKI+ei28
 b4hCB/wOTgzesIXoKxq7B0VGu8I2Wum0QkzqH+dXRW2jjMGsteF728EvZ54kgkVtI6vu2RDEQWb
 nJqGMSIuDK4TLrC/QISlCKdzJf4Z6OVTBhAvBWDHz/4aH+Am1tBGoblhftVMcsN/hw/mZGNfna+
 nygfr9wJCWo7LDO1/wNiekq2iZFA2/GGf9P4YUikr8lB8gyxsR4WLY/j0IDW8zwVIDOO06/hy4O
 dQXKYwu/raUNIimEBHI5tbONXyntT8Ksg+A180MIzUBqUaMbsu/VrgSJfpCAC+vsDIrVW0URTpo
 9ABadjTfsuyrvdUWOW1h5xq7bCNt+7KzSDGqtFRVF0e7L+wL
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_083404_601038_D4DA003D 
X-CRM114-Status: GOOD (  12.18  )
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

From: Leonard Göhrs <l.goehrs@pengutronix.de>

The Linux Automation GmbH FairyTux2 is a small Linux device based on
an Octavo Systems OSD32MP153c SiP, that occupies just two slots on a
DIN rail.

Add compatible for the generation 1 and 2 based on the STM32MP153c.

Signed-off-by: Leonard Göhrs <l.goehrs@pengutronix.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index b6c56d4ce6b9515565fc05348896ba9f400643f0..6825d965da3daf2b508fbd88e8c9d40e20ba1f59 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -94,6 +94,8 @@ properties:
       - description: Octavo OSD32MP153 System-in-Package based boards
         items:
           - enum:
+              - lxa,stm32mp153c-fairytux2-gen1 # Linux Automation FairyTux 2 (Generation 1)
+              - lxa,stm32mp153c-fairytux2-gen2 # Linux Automation FairyTux 2 (Generation 2)
               - lxa,stm32mp153c-tac-gen3 # Linux Automation TAC (Generation 3)
           - const: oct,stm32mp153x-osd32
           - const: st,stm32mp153

-- 
2.45.2



