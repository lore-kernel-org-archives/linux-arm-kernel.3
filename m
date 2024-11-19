Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758E1D44146
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 11:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TC/kE1NNZ0K5ktV+dFrdbkxBN3DRluUPvobckOSLKls=; b=F9/o+/33ubIg1O
	HJXT715M2DAPU84n7izhb1MmNybNzyZPVIE9p80XgMfJkqySy8IyCwbgVwhoNO387keQb/2q92jbK
	lPe0mAbDZnsapK9Z8TEqD09FFHIAw2DamZ6i07RbWWMISLuaD8PJNzmXLrIGkw7VJKOcmJeyvV6GY
	MDvjE9Y6dqKVvSybcgAdfyH8kn5UZz8lbHyMJVwUlkYiNbyFoUMyYntRA8r5G1G0jFkRmxCosj34s
	Av9h76Os1jM9xnMuLVG5Cv7uXbs8yJCD6MnDdqP0cl++JxTVgiNX6rDS9J7UtDcQq5HxWfESRRcoe
	HbV32tKrH6mPYISHrYMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDMXc-0000000CElT-3Z19;
	Tue, 19 Nov 2024 11:37:08 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDMVm-0000000CEH3-4Azo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 11:35:16 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tDMVj-0004e9-QA
	for linux-arm-kernel@lists.infradead.org; Tue, 19 Nov 2024 12:35:11 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tDMVj-001Ydb-1r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 12:35:11 +0100
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id 3D93B37704F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 11:35:11 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id 976C6377032;
	Tue, 19 Nov 2024 11:35:09 +0000 (UTC)
Received: from [172.20.34.65] (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id e1a4d7b9;
	Tue, 19 Nov 2024 11:35:09 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: [PATCH 0/6] ARM: dts: stm32: lxa-tac: fix gen{1,2} boards and add
 gen3 board
Date: Tue, 19 Nov 2024 12:34:57 +0100
Message-Id: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOF3PGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQ0Mj3ZyKRN2SxGTd9NQ8Y12LlKRkYxMLw+RU80QloJaCotS0zAqwcdG
 xtbUA6TzJgF4AAAA=
X-Change-ID: 20241112-lxa-tac-gen3-8dbc3481ce7a
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1390; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=KdVStOdD/uuuDQWXB4cY0gjv4M2fNzhz+/kAvPe2m7o=;
 b=owGbwMvMwMWoYbHIrkp3Tz7jabUkhnSb8kdLP2pJrPOQrGCSeFot5V5/u5Pl7BuFG8X7Weu+u
 ny6O7uzk9GYhYGRi0FWTJElwGFX24NtLHc199jFwwxiZQKZwsDFKQATsZ7B/od7gUFrsF+RgFuz
 qcmhkEALhmrR3Ev3j/r8mmCvf1SQr5nT/4qWqrnzx3v855O0S2+eX9Tr8bEzX0aap6Jt3o/ffhw
 vjr73CzguLF7i3rArryxf6SjL+l0lAqLZG7SlBD5xvG//JLbpx+ev5pW3VczmTJL7M2fFd4+aT/
 f1XmhNnJF9c5dxlGNbuv1Ci4Q3HUuzpkqFcxrk6BkYelzZk5F7Nn9Sa8N2TR1Gu9X7jM5+yb0nY
 RMl0DtBbHaIeOLKB+uqumzvqmX65D7yPs2vfp/p1BJp/2kGSx+tnKp3c636U4WkCKElHW92V1w8
 yZlmLnHqmYa5gKHncf+Ii9FX3hUnBE//fuJY0aSOl/89AQ==
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_033515_039340_F361C9F4 
X-CRM114-Status: GOOD (  12.76  )
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

this series fixes some problems found in the lxa-tac generation 1 and
2 boards and add support for the generation 3 board. It's based on an
STM32MP153c, while the generation 1 and 2 are based on the
STM32MP157c.

regards,
Marc

Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
Leonard Göhrs (6):
      ARM: dts: stm32: lxa-tac: disable the real time clock
      ARM: dts: stm32: lxa-tac: extend the alias table
      ARM: dts: stm32: lxa-tac: adjust USB gadget fifo sizes for multi function
      dt-bindings: arm: stm32: add compatible strings for Linux Automation LXA TAC gen 3
      ARM: dts: stm32: lxa-tac: move adc and gpio{e,g} to gen{1,2} boards
      ARM: dts: stm32: lxa-tac: Add support for generation 3 devices

 .../devicetree/bindings/arm/stm32/stm32.yaml       |   7 +
 arch/arm/boot/dts/st/Makefile                      |   1 +
 arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dts  | 267 +++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dts  |  84 +++++++
 arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dts  |  84 +++++++
 arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi      | 100 +-------
 6 files changed, 455 insertions(+), 88 deletions(-)
---
base-commit: b0191a5cbc222fc7af3f9511b44d1f330ef980e9
change-id: 20241112-lxa-tac-gen3-8dbc3481ce7a

Best regards,
-- 
Marc Kleine-Budde <mkl@pengutronix.de>



