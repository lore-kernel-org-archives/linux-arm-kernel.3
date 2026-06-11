Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8883DCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 18:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VTh5sl/xa5X9UqJ48t6WjvGEBNGhdjnXh6jtW0x0aCQ=; b=Pa9qsctfJzs2US
	Cf0gWgD2oegR0mMLftO3ZIf4HKKeBBFbpEKfWr9JrjioQsAKWSxcEc1nAeVXxW9PUdn80OEjyWEDW
	iYOjddx8sCJSvDGloxXAkBx+rQUxhIHsZs2k6mwu0GKfWd3canoYr2qIoVYXTXfx001Gca+ra3B+9
	lSm9KcOthowCiv9cHpXGhTAlSZlpG37aT785e7mkqewQl79yRWId+fNNtRervdGTGrJcpF4Axxz1d
	Ziy9a0gYdM9E5V3hUkHq0RjQZRYbSCV7rWsZ43p6ZQu7RjG4UuLLkc9akUPKBeQbDoRAiIiUpxU6M
	5cGuHY5DR811xTx7IFWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXjtV-00000009sFr-36lD;
	Thu, 11 Jun 2026 18:12:46 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXjtT-00000009sFM-2Big
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 18:12:44 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wXjtM-0003nU-U2; Thu, 11 Jun 2026 20:12:36 +0200
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wXjtM-002Fqt-14;
	Thu, 11 Jun 2026 20:12:36 +0200
Received: from [::1] (helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wXjtM-00000003Ffp-10qe;
	Thu, 11 Jun 2026 20:12:36 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH 0/3] ARM: dts: stm32: lxa: change stdout-path baud rate
 from 9600 to 115200
Date: Thu, 11 Jun 2026 20:12:32 +0200
Message-Id: <20260611-lxa-stdout-path-baudrate-v1-0-59b60a5069ff@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJD6KmoC/yXMwQqDMAyA4VeRnBdoxSnsVcYOsY2aMVSaVATx3
 dfN43f4/wOUk7DCozog8SYqy1zgbxWEieaRUWIx1K5uXes9fnZCtbhkw5Vswp5yTGSMXRiaexM
 iseug5GviQfb/+vm6rLl/c7DfD87zC2FpymF8AAAA
X-Change-ID: 20260611-lxa-stdout-path-baudrate-7cf454cdae07
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
 Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_111243_563493_62DF10A9 
X-CRM114-Status: GOOD (  10.69  )
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

The LXA boards are the only STM32 boards that set stdout-path = &uart*
instead of explicitly specifying a baud rate.

This would mean the default of 9600 is used, but it goes unnoticed when
booting normally as barebox fixes up a console= line that includes a
baud rate.

When EFI booting GRUB however, GRUB will not pass along the console=
line and thus the board ends up with a 9600 baud Linux console,
confusing users.

This series fixes this. As the device trees were added at different
times, they are fixed each in a separate commit with its own Fixes: tag.

---
Ahmad Fatoum (3):
      ARM: dts: stm32: lxa-mc1: change stdout-path baud rate from 9600 to 115200
      ARM: dts: stm32: lxa-tac: change stdout-path baud rate from 9600 to 115200
      ARM: dts: stm32: fairytux2: change stdout-path baud rate from 9600 to 115200

 arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 2 +-
 arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts        | 2 +-
 arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
change-id: 20260611-lxa-stdout-path-baudrate-7cf454cdae07

Best regards,
--  
Ahmad Fatoum <a.fatoum@pengutronix.de>


