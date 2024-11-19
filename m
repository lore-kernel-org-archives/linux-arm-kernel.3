Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB30D44148
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 11:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAQ4ShP7HxMrnbHnCiYms9jHQTqzWYiayMg6e8Bs0GE=; b=Fwadbs6HzMjK64Jr0Ugf9mbA/x
	2izcVpK7uHKHDAjPBDfakbJKQZG9YI5mrniNNRczaS94xZDUVw4db9MIK8U2ddi3zaOVm2MAIdL4K
	/FGdmHXZoGLuVF1Kv0syt0adt+s1Ca+5SzXHASfLSYXsW1A6wISeRUoYmvyrgaLJjSz4P7zGA4W4g
	5Sz6UOi1yos9w8PUbJkKxBkbTmx/nwFG03vHERNI4F6zl2ke8lzg5ZkKgAnO09kmmbfNMaOODXQvF
	ajRcOtUl+dFfB5j9KL01zA6Z88sWF7H7IuiN4yk5NUAjCZn7wushO3AHcGeIEk5/kis444DTG6Xc4
	ySVfYcWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDMaM-0000000CFLk-3To6;
	Tue, 19 Nov 2024 11:39:58 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDMVn-0000000CEH7-1xfW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 11:35:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tDMVk-0004ew-8Z
	for linux-arm-kernel@lists.infradead.org; Tue, 19 Nov 2024 12:35:12 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tDMVj-001YeA-37
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 12:35:11 +0100
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id A4225377058
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 11:35:11 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id 1EBD5377039;
	Tue, 19 Nov 2024 11:35:10 +0000 (UTC)
Received: from [172.20.34.65] (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id b585d42b;
	Tue, 19 Nov 2024 11:35:09 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Tue, 19 Nov 2024 12:35:01 +0100
Subject: [PATCH 4/6] dt-bindings: arm: stm32: add compatible strings for
 Linux Automation LXA TAC gen 3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241119-lxa-tac-gen3-v1-4-e0ab0a369372@pengutronix.de>
References: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
In-Reply-To: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1353; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=OiGyC5hvkOyfhSJPitFX+JtgXZ73YWwikIJiBbUL5vE=;
 b=owEBbQGS/pANAwAKASg4oj56LbxvAcsmYgBnPHfo83L1ffukhGKoWDoL8tjex0fmM2FuiA8BB
 3HMT7tDq/WJATMEAAEKAB0WIQRQQLqG4LYE3Sm8Pl8oOKI+ei28bwUCZzx36AAKCRAoOKI+ei28
 b1XbCACWy17HQEJrXpAgn2wESy57lQ66WicbSnsYR9JWSmBp2ZxM9zyZ7dRca3v6b+4ddvmO2Io
 4l29BCkVvVMG2JHxWGL/6D0J6S2U2FiXNJT6vM1LOIzI3DWkjyt/zRArP3n+3095Tc43mKVl3rk
 DNLwzLYAVGWVgj0QbGaDiVmA9F4vHBxrEpAbwmBKDy9QYLd9qGaH2rjrHIkaz19EN/TL937XsiX
 NUDSoTydcE9hpbMKGAQ4DPxWqwr3AztBZObadH2/VyxJAwxEDgCd4Nq/zTzOCdWHubNpkykicTC
 qY2zYnaf/+alLbFoU3BPWPqc4XXlGQ0+sL+wBPjmuC+mhdcN
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_033515_501556_F41DB579 
X-CRM114-Status: GOOD (  11.62  )
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

The Linux Automation LXA TAC generation 3 is built around an
OSD32MP153x SiP with CPU, RAM, PMIC, Oscillator and EEPROM.

LXA TACs are a development tool for embedded devices with a focus on
embedded Linux devices.

Add compatible for the generation 3 based on the STM32MP153c.

Signed-off-by: Leonard Göhrs <l.goehrs@pengutronix.de>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 703d4b574398d2768924df8d4bd844e486aa5abf..b6c56d4ce6b9515565fc05348896ba9f400643f0 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -91,6 +91,13 @@ properties:
           - const: dh,stm32mp153c-dhcor-som
           - const: st,stm32mp153
 
+      - description: Octavo OSD32MP153 System-in-Package based boards
+        items:
+          - enum:
+              - lxa,stm32mp153c-tac-gen3 # Linux Automation TAC (Generation 3)
+          - const: oct,stm32mp153x-osd32
+          - const: st,stm32mp153
+
       - items:
           - enum:
               - shiratech,stm32mp157a-iot-box # IoT Box

-- 
2.45.2



