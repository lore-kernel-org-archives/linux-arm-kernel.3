Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C5FC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 19:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kRgZzjPDxUsOZkrpQ66HXkRaP0ywQYyfK2o+++cNpXM=; b=DwgkUkj6BJ5Uv87FZrbzFqE2MU
	X3dSgw72bmYKllbOh/noFfQ5nKif1tnKCGfG/z4PjLlOInBHEnA+MVOB9UrUZ3YNYi1zTG6t7yQQe
	KwVI29lu+UuV237d5fNFA7iqoICnRcZXGq8TqtXBGaVgkwGENbXeGirn4qWu1urjv0tWNCwxapyBp
	LQpRp9cFVOzPVIrf094vBddwCeEN10vo0xiP4BMugDpoUQK9ZOwix1RzWltjEdcGQMYDjvMKMqABw
	LRAwSRCQ1vwCaTRsqUXnNK8E4XmUNL7tdquIIWYhrCpe3mNZcZv459PupvB0y100Pf4YRySgfIEEs
	/D65HWcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9p2M-0000000C1bH-20oW;
	Thu, 24 Sep 2026 19:23:18 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9p2J-0000000C1Zq-3Bjz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 19:23:16 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 5D279240028
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 21:23:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790277789;
	bh=kRgZzjPDxUsOZkrpQ66HXkRaP0ywQYyfK2o+++cNpXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=X9/jM1rsvyLSU49znepuQ9lH1cdDU96YAD4yxC2Tc4gV1kLUAdXilFaUHhDdNagEX
	 6PSxPkJOpoN5pFvQSvIa/gg8eQYQ5FpWzTEq9P3V/80Ttj4QRuS/8H836s2wwc2sD3
	 rVqQP+wD8zSdA0MshQmdHOSGoPCrzan46ta8wTVRXRfm7MYhyfji514e8XdhR5usvf
	 AKp62nAivGU2ggL8GV9bKky5E4AoFekh5nvAj47gFoPTNZEWCH2ZLrKoXWlt6nrCDT
	 IZsl+WGlg6iVaBedds34DQ/1AnCPVf0U3KCG8w/LZx01o2tnXb2RbijjVFSI2cXbXu
	 PLvHzAmFNC81Q==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hrNyz1nWVz9rxD;
	Thu, 24 Sep 2026 21:23:07 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>
Subject: [PATCH 0/2] arm64: dts: st: add digital temperature sensor on stm32mp25
Date: Thu, 24 Sep 2026 19:23:08 +0000
Message-ID: <20260924192259.20517-1-mateusz.nowicki@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_122315_959380_6F623509 
X-CRM114-Status: UNSURE (   8.36  )
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

This series describes the digital temperature sensor (DTS) of the
STM32MP25, a Moortec MR75203 PVT controller, and enables its hwmon
driver in the arm64 defconfig. Thermal zones will follow in a separate
series once this one is applied.

Tested on the STM32MP257F-DK. Temperature sensor 1 follows the CPU
load. Two voltage monitor channels, in0 and in2, read about 815 mV. The
other 14 read 1 mV.

Questions for ST:
- The process detector and voltage monitor blocks are not in the
  reference manual. Are they at offsets 0x180 and 0x400, as found on
  the board? The downstream kernel places the process detector at
  0x200, where no register responds on the DK.
- Which supplies are connected to the voltage monitor channels? With
  this information, moortec,vm-active-channels could be added.

Mateusz Nowicki (2):
  arm64: dts: st: add digital temperature sensor on stm32mp251
  arm64: defconfig: enable Moortec MR75203 PVT controller

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 15 +++++++++++++++
 arch/arm64/configs/defconfig           |  1 +
 2 files changed, 16 insertions(+)


base-commit: 2f92d900f262a16c8ae02daf53ae2910d07185f5
-- 
2.55.0


