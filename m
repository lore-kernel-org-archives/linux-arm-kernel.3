Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAB2C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 11:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZmbawQr+MX9kiAJHFUIfqMOCr+vlsWK58TWGtKwQ/YY=; b=F4O+JYcN1whHOJ
	JVEtzEKzo7bJr/EYu9oRAWXJH4ZeWNWjy9huuBGPmkPHv/OvDsi7Scp6bV8h+63VAHmSzCtGj0MjE
	FgsQgja1Jq0aNS2XzcU/NjPtX47c2Hpy28wrDyFQiJrc/EliPO6DVOO/b87V68qDg8e9iJG4QK4Pz
	96/b3lQFEu/Vfk8g8iciKXJR+YBHrVAwU1ngWVxGZrIhsARj3vDcG8bKyD3XEpeKMycBnhFYrBM2U
	9QN1nx9pQLvCrv+Lab61uhKF0dU4yFFvQToGJ3yM9D6Wx51WzLWB279EQ/0iWT5w9tNkzD5Ztzbn6
	I6MTxW4aD1hPEFn+LnRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taCFg-00000007jDK-01PE;
	Tue, 21 Jan 2025 11:17:00 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taCD7-00000007iLj-3fj7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 11:14:23 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1taCD6-0000Wx-OG
	for linux-arm-kernel@lists.infradead.org; Tue, 21 Jan 2025 12:14:20 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1taCD6-00168r-1l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 12:14:20 +0100
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id 398F43AD9BB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 11:14:20 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id 6B8193AD9A6;
	Tue, 21 Jan 2025 11:14:18 +0000 (UTC)
Received: from [172.20.34.65] (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 21fefb3e;
	Tue, 21 Jan 2025 11:14:17 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: [PATCH stm32-next v3 0/2] ARM: dts: stm32: lxa-fairytux2: add
 gen{1,2} boards
Date: Tue, 21 Jan 2025 12:14:04 +0100
Message-Id: <20250121-lxa-fairytux-v3-0-8d42d7d232fb@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH2Bj2cC/23NTQ6CMBAF4KuQrq3pH0FceQ/jotIBJtFC2tKUE
 O5ubeJGXb7Mm+9txIND8ORcbcRBRI+TzUEeKtKN2g5A0eRMBBOKC87oI2naa3RrWBKFRrK2aY0
 0sif5ZXbQYyrclfjwlIJaSIHc8m1EHya3lqXIS+M/GjlltNWgGe/M/SThMoMdluAmi+looGhRf
 ISacfEtiLdQ90oz0Fop8yPs+/4Cfsy2Q/sAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1759; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=gLAGzHCTBArIbQ78yvJWJOpUrAVjiYKWUXHS22nGDvI=;
 b=owEBbQGS/pANAwAKASg4oj56LbxvAcsmYgBnj4F/deGvqvVVtXYvv0rwry5wbUPLKielpr2KH
 dvQPMDOmSyJATMEAAEKAB0WIQRQQLqG4LYE3Sm8Pl8oOKI+ei28bwUCZ4+BfwAKCRAoOKI+ei28
 b2NsB/4zlM2Qsoh2apcCOK537lddCEmvs86JylIVLspPQ71D+YNReCP9s5Mtz0kke/zhv/m37uo
 IkT/2YA2tlPgp/C0MHrMeCPoQdhzHnN3pZeYhZakMN556wLcviDsIdHsorjfyf2+jOoiT9zKqPj
 YalcIGcf4ARs6H7MmMV+6neee1CZCg4Y85tno7p5KQbM6siAS2JdbgvUPh9zrdOSh+HwbtfwdAY
 cNZPelfUtXFaRiA5NeOWpEqCQ4wxPNO9sVFdwTUpHggQfy09hDXnVU7znw94sp9m3uqXy+jhaxK
 ucwJOME+2T7ptVUIDCwsRQ0GWWVpABUHPrWuyDphsYkTRmHW
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_031421_920117_2F84F69D 
X-CRM114-Status: GOOD (  12.06  )
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
Changes in v3:
- 2/2: fix use generic node names for external GPIO and USB Type-C controller (thanks Krzysztof)
- 2/2: LEDs: replace label by color and function property (thanks Krzysztof)
- 2/2: gen2: sort nodes of i2c1 by address (thanks Krzysztof)
- Link to v2: https://patch.msgid.link/20250120-lxa-fairytux-v2-0-95f4a0eaa44d@pengutronix.de

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
 .../boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dts | 103 ++++++
 .../boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dts | 147 ++++++++
 .../arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 397 +++++++++++++++++++++
 5 files changed, 651 insertions(+)
---
base-commit: b7ebfb84a09de6b44492974339654d8ffc5ad9e1
change-id: 20241210-lxa-fairytux-e730979d3d3f

Best regards,
-- 
Marc Kleine-Budde <mkl@pengutronix.de>



