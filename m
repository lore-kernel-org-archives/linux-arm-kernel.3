Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33596C02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 16:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C1ITcjxUsGNJ484CbCDRRmSq3s+QzWWe6i9jPz5B4Qc=; b=Cc9qfPUFxN6n6X
	c2F2NaV25NVc1DIbVevJ3qQdZeIIYZ7rWGtximsgY5aRS5LBCM2a2iES5Bc9P0yayVhqyqxWwqkxt
	u3C8zzAWFux/dJq0dSXxET9YsMclTGb08/lAweReOT8vIb4FwI6hMG3CIyZ/vV8x+0tv03/1V/c/R
	eUnU+ETvi8B3Qs7y5GFKL1lglDswW5FXEd8VX29IpiRbzWwXfObBcrukeIDR3nriuc1+ax0imjrd2
	ueAVzv+pqfH8Du8rySks5rSwUA73s0U3jvHxu5bN66Y3uKiMnEc9LmsW2yKc8E0QY2I+mI2gu7T4W
	LHVM+G9u8VhiI2kBckjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZulu-000000060lI-1go7;
	Mon, 20 Jan 2025 16:37:06 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZuiy-000000060KX-2RiQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 16:34:06 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tZuiv-00032A-D1
	for linux-arm-kernel@lists.infradead.org; Mon, 20 Jan 2025 17:34:01 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tZuiv-000xrK-0c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 17:34:01 +0100
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id D60A43AD0B9
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 16:34:00 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id 178193AD0A4;
	Mon, 20 Jan 2025 16:33:59 +0000 (UTC)
Received: from [172.20.34.65] (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 6815eb50;
	Mon, 20 Jan 2025 16:33:58 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: [PATCH stm32-next v2 0/2] ARM: dts: stm32: lxa-fairytux2: add
 gen{1,2} boards
Date: Mon, 20 Jan 2025 17:33:46 +0100
Message-Id: <20250120-lxa-fairytux-v2-0-95f4a0eaa44d@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOp6jmcC/22NzQqDMBCEX0X23C35KVh76nsUD6nZ6EIbJYkSE
 d+9IeceP2bmmwMiBaYIj+aAQBtHnn0BdWlgmIwfCdkWBiXUTSop8JMNOsNhT2tGarXo2s5qqx2
 UyRLIca66F8T01Qo95QR9ySaOaQ57fdpkbfyXbhIFdoaMkIN93zU9F/LjmsLsOV8tQX+e5w/Df
 f8/uQAAAA==
X-Change-ID: 20241210-lxa-fairytux-e730979d3d3f
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1407; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=QUCrRzfLcrv/sEz8FJ6qxQC7xNYnscNmjk0UmAB32rk=;
 b=owEBbQGS/pANAwAKASg4oj56LbxvAcsmYgBnjnruIewAenRs8HPGcmEcVef/zd9aynU0vqWRz
 VLz1pEpsv+JATMEAAEKAB0WIQRQQLqG4LYE3Sm8Pl8oOKI+ei28bwUCZ4567gAKCRAoOKI+ei28
 b1G5B/9zTvXY8tCoJoS66NDPZKaTcf27QLsgnAajtyBe9rkh90y1LEof04jBnpEjiyKuFLxRQJR
 NLUoxcmTwcp8AENowO/iA+GF4GqBoIDZLfP6dH4wARvaMwoIMn2RxnAjiD9+f0QHv6pdudDlfbk
 0POFX/NAuiFBal5Gm1DUa3g7Bs7rtatWkGp0ItppGS5Objix6m1NgUo4SUCi9WM0255I5Ahcf32
 5o7n5rufPc2hvuN/sxEgeptRHPfvvjMiQj0c/cFNB0twpZReDA+ToinTt7Azcp14ka6/7/H3t8W
 YP3rHfeWV422oaYrAP8x0dotq89xBAqGHXjsdR18B7Ml3PZr
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_083404_616630_4CDC1EE8 
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

Hello,

this series adds support for the Linux Automation GmbH FairyTux2
boards generation 1 and 2.

The FairyTux2 is a small Linux device based on an Octavo Systems
OSD32MP153c SiP, that occupies just two slots on a DIN rail.

regards,
Marc

Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
Changes in v2:
- 1/2: Added Krzysztof's Acked-by
- 2/2: fix alignment for gpio-line-names (thanks Krzysztof)
- 2/2: only use color:function for LED labels (thanks Krzysztof)
- 2/2: use generic node names for external GPIO and USB Type-C controller
- Link to v1: https://patch.msgid.link/20241210-lxa-fairytux-v1-0-9aea01cdb83e@pengutronix.de

---
Leonard Göhrs (2):
      dt-bindings: arm: stm32: add compatible strings for Linux Automation GmbH LXA FairyTux 2
      ARM: dts: stm32: lxa-fairytux2: add Linux Automation GmbH FairyTux 2

 .../devicetree/bindings/arm/stm32/stm32.yaml       |   2 +
 arch/arm/boot/dts/st/Makefile                      |   2 +
 .../boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dts | 101 ++++++
 .../boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dts | 146 ++++++++
 .../arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 394 +++++++++++++++++++++
 5 files changed, 645 insertions(+)
---
base-commit: b7ebfb84a09de6b44492974339654d8ffc5ad9e1
change-id: 20241210-lxa-fairytux-e730979d3d3f

Best regards,
-- 
Marc Kleine-Budde <mkl@pengutronix.de>



