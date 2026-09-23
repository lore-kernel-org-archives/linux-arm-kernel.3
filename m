Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83278C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zYMlFnqs2oZLg0x/tmHehi2Rm4IkjdjjLTJ9d7PuzDE=; b=t/O1CHUH0tbiZFuHNQg/2wKa5y
	gztAfRioVPWZbv6F03ny0wcd0tNyrFFvsuZ7Ci30aNm4V1nsGmd0nMmaAqMhXaubCBYuuWGo7iIRn
	JmFp+xjYYUWXwp3aUgeoWxDT4LDT6qwDl28+i0No9I5c/St7JKsOkJdmIdaJBF3DYKwDnnMm0Yvnk
	DewKowdBHl9KdsYyOl93PzmpxxLCrieYB0cpfnfEDTCmiI5g1uXHfX04mYpm9CF/YcUsxT/uYS+Oh
	9hfXvzp5VV6nM2zfGMDUHOD5jJW1O3EeZmXipY3etXItCQfRL0KVPx0lHmaodH6dtR0sX35L8C7Kn
	u9aILc1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LS5-000000087bx-19zR;
	Wed, 23 Sep 2026 11:47:53 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LRx-000000087Yq-0LdO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:47:46 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 61981240106
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 13:47:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790164058;
	bh=zYMlFnqs2oZLg0x/tmHehi2Rm4IkjdjjLTJ9d7PuzDE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=GQHEug6LBOTMrk1vm6jAKSEE8PeCr0ulAkeVjyzlxS7Kd6OcYg2ntcjLTizJHlLPE
	 yvI56vPunD9f/2jcOdyOiUIUCYuOE2BvIWk/B8WcereeX8+UgL8AN/KaEANhgmlwbp
	 XrE/75oaNxdNi84G58fwowg5i34Rs6xgjjIm39AYce+ncHXes8VTDI37UbNXWGR0kM
	 ea2/JmjTUi6ZK35Lq5pHf49oAsFAQUmt7IibvGOuyxVEZerEuwTaBdGTtQCLzfA9+d
	 DaT9R6FKaN9edsb5VxyAc3prAzPfcpMwhZyTHtWcFQvvs+kGji/oUMWzJfaPctEeph
	 6ddq5lGrzxsAA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hqZvq4bxYz9rxN;
	Wed, 23 Sep 2026 13:47:35 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>
Subject: [PATCH v2 0/2] arm64: dts: st: add eMMC support on STM32MP257F-DK
Date: Wed, 23 Sep 2026 11:47:37 +0000
Message-ID: <20260923114714.140842-1-mateusz.nowicki@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_044745_285827_C38DDC07 
X-CRM114-Status: UNSURE (   7.52  )
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

This series enables the eMMC of the STM32MP257F-DK.

The sdmmc2 node and the _a pin groups are already in stm32-next. On
this board, the _a groups give corrupted reads in HS200 mode at 100 MHz
without any CRC error. Patch 1 adds _b groups with the faster output
speeds that the datasheet gives for 120 MHz and 166 MHz operation, and
patch 2 enables the eMMC with them.

Changes in v2:
- Rebased on stm32-next, the sdmmc2 node and _a pins are already there
- Dropped the patches adding them
- Added _b pin groups with faster output speeds
- Dropped the vddio2 regulator range, VDDIO2 is tied to 1V8 on the DK

v1: https://lore.kernel.org/all/20260912204454.219606-1-mateusz.nowicki@posteo.net/

Mateusz Nowicki (2):
  arm64: dts: st: add sdmmc2 pins_b for stm32mp25
  arm64: dts: st: enable eMMC on stm32mp257f-dk

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 58 +++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts     | 19 ++++++
 2 files changed, 77 insertions(+)


base-commit: 2f92d900f262a16c8ae02daf53ae2910d07185f5
-- 
2.55.0


