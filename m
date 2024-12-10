Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA260E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 09:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddowXhuwglmCRJJ1mDPtPzYJRMWg7/PC5jCGfJElV50=; b=v7aIf4JGjm1WNVhoNEtl6hJ5kM
	td75n0AxccXYAOq+URg0+j0YfszQNI4IL0En2+A0UV2LLMn9xDJOfjP7jAw9E1TqzF05j399lusjH
	gI9a9nljRHPKJSZIkRO0HUbuJwnGIw2Yu09OAFFUrm7m7nLkh92ib2T3jh18uaCfuo/P/XYbqktsN
	bwkahkNxQdSxRbo0id9nP87SpRY/n5V8yeL93/S92zJYv3duMEAhd6aVYwMzBVGMNfEvNoWHOSSvQ
	fAMm9wyzD+8hfOVc5+mN3KIIph+801wePkEZHY14qHTvKqEeEt0wRuu0oVgwcFikUbOmJLHzGzpqk
	j01eyDOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwdc-0000000AuMg-189W;
	Tue, 10 Dec 2024 09:34:40 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwbs-0000000AtvQ-2lr4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 09:32:53 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tKwbr-00011X-GN
	for linux-arm-kernel@lists.infradead.org; Tue, 10 Dec 2024 10:32:51 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tKwbq-002fJY-1i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 10:32:51 +0100
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id 0424438A543
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 09:32:50 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id 71CCC38A531;
	Tue, 10 Dec 2024 09:32:49 +0000 (UTC)
Received: from [172.20.34.65] (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id ab1b1a1b;
	Tue, 10 Dec 2024 09:32:48 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Tue, 10 Dec 2024 10:32:27 +0100
Subject: [PATCH stm32-next 1/2] dt-bindings: arm: stm32: add compatible
 strings for Linux Automation GmbH LXA FairyTux 2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241210-lxa-fairytux-v1-1-9aea01cdb83e@pengutronix.de>
References: <20241210-lxa-fairytux-v1-0-9aea01cdb83e@pengutronix.de>
In-Reply-To: <20241210-lxa-fairytux-v1-0-9aea01cdb83e@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=CjTHBR+MROHxR79/okvi7tDY+Vb+yOt4fEPRaYt9NAs=;
 b=owEBbQGS/pANAwAKASg4oj56LbxvAcsmYgBnWAq6nuvrx7ZjBpHRG/Lu23Dp1lKKBfpQ/DIqV
 1oYAYh1IfGJATMEAAEKAB0WIQRQQLqG4LYE3Sm8Pl8oOKI+ei28bwUCZ1gKugAKCRAoOKI+ei28
 b4b9B/oDqCmrtmOFjzFGKPqZbZUTQozlfYxc6QiIxoly2xegdgXLINaMqMYyr3G4/jI59NXEbWK
 nshIs34MqweozmtIxCR669HpAdqa8GFw8eciaESH7zvo15dmbs3gdziZHrUmAhefc8kyvD3Ib9D
 QpobzLY++plIq2fv6Um9hCxtzCp9lz9MNlW3y2OIGr3miZ4iK5AUlp0OeKtpsXwcd2WabClA6by
 APecPTC6fdaYSgOrEmg4i6D4IzA9VgkXzXK3OLXVzZOc0y+4/y9F2kIUoFDLyoW2QtWlPFY7ByY
 LnwFiBk67vD4OS+wPRM/0/DlMq2gjimbMKhzi55SGEQv8Z7P
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_013252_695928_488BB06B 
X-CRM114-Status: GOOD (  11.85  )
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



