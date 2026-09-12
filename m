Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A81C88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 20:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=va5DYBu2vUOwC5NHKgWZaSsI06SaL+sZeAaoSpAlKxc=; b=mfkre1wHB2FJMxu/1DSHFOgUiz
	o5Kbbwb8HYam5rU22WkIsUgUYEsC1JjrExhanWcfGSynMkJJNPPNEqMW/ZynZUDIP5pOb6NfclJXR
	wWYhqmjGRpSYGVY1/3kDY++XqS0TmlMd7lq0gYEVZJ0XznmLkmTpIugRM0imqg3Vn4FDPjh7yfMI5
	r5vb8OK39vUZ+aqMxTh5HGk8pkw3BiEjFCR/pfGFZMM2VEiP6KPCcVavTrx6X460T6nGQS4noLiVC
	pvFCqY0HD9vn5tudN9p+VhcbOL2U43PldkJ18UEdYCva+EjF0q/oLEOcl+2S7cYfo6CeigRh6KQkS
	OdAsXGZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Ub3-00000001C7U-26u0;
	Sat, 12 Sep 2026 20:45:13 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Ub1-00000001C66-37pr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 20:45:12 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 6EF56240101
	for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 22:45:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1789245903;
	bh=va5DYBu2vUOwC5NHKgWZaSsI06SaL+sZeAaoSpAlKxc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=fDCgS+4REl5KgxgSmYJhCkBu7A3e2lsVPV/12PgGbIOvbiHmMsBKCgx0v2+FsqwmR
	 PHyLeTSZNMo8u2NcE05l0APEo3uI4a12vWKhHbXXnuuvjWNwXkVlneJ0rS6rgZbEMO
	 zQ9o3GhoktidxAZsKVkON8xHoUavnM2T2fGTw8DGHjKVu1iwI0Z+EoacEhJ1XunKU0
	 19n9qjwvNzjHtINmian7oP/zgqP4vElTN72C89JetY39+xIkE/8Kd/pg/ORVMyn0fq
	 58ZQ/bil9NCVFq/tUACL6KJcDFyy6cxthDf9xCsvBQnRB3ymQLzYonx7sAZ2JcZfvA
	 fpL2+SNxFt89g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hj3M0750nz9rxB;
	Sat, 12 Sep 2026 22:45:00 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: alexandre.torgue@foss.st.com,
	mcoquelin.stm32@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: st: add eMMC support on STM32MP257F-DK
Date: Sat, 12 Sep 2026 20:45:03 +0000
Message-ID: <20260912204454.219606-1-mateusz.nowicki@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_134511_930202_79846B7F 
X-CRM114-Status: UNSURE (   5.67  )
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

Add the SDMMC2 controller, its 8-bit pin groups and enable the
8-Gbyte eMMC of the STM32MP257F-DK. Only MMC High Speed for now.

Tested on STM32MP257F-DK.

Mateusz Nowicki (3):
  arm64: dts: st: add sdmmc2 node on stm32mp251
  arm64: dts: st: add sdmmc2 pins on stm32mp25
  arm64: dts: st: enable eMMC on stm32mp257f-dk

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 69 +++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        | 15 ++++
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts     | 21 ++++++
 3 files changed, 105 insertions(+)

-- 
2.55.0


