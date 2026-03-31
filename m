Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6473FF60D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 07:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTmsuImCn3CtzefM7fomAbHA5I/f+UtO2YDEaei1OTI=; b=QAo2FgY8KxX/ohfr1rJGptEv1p
	EtaXlfF/K21WOHo9K9MtjYgPol+eaTW0ajonSIRYvRRcBH56twgwa+v0l4ntrE3f6PiiTSVoylsHR
	fhiFNbF7/fWtkK1mHXSSQeZsk18pCgT5dATS/SLNLpq192K4yRBhYATAy8MEyzWA46DOYu/PHK874
	CpJPnN+RstCroRGIlFo/wap0YTBRSDA2KCGAgwoQwTDH3rzY5zXPVdTOpKk36qGROjGNuLLb8j+B1
	D4QdzQGdoBPDzXkSdnoc3R651qbds0XJ/VWerxzqwWjAExaakYxlimn7ry6h7speH3F596qWFkkW8
	R97cu2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7T5t-0000000CQIf-22Yc;
	Tue, 31 Mar 2026 07:00:57 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7T5q-0000000CQHp-4149
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 07:00:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774940445;
	bh=RTmsuImCn3CtzefM7fomAbHA5I/f+UtO2YDEaei1OTI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QteUuSwewXeKt35dLgpxQsZXo5XcyHBW/48b/IrIeozShAmj9VPjbHWDFcv/7wrMN
	 EbUx9muoJkfo62g8yHdbEXleSmEM7DvOFC9FI9c4YM4maKbG5CbivJrN7I9CaVCD/F
	 od6I5UEuh44ELgSAxSMKT4cPTf1mkGetpkyAsp+5QMH5pkKIaJLJD3kudVjLBpwp4y
	 92WKhncfZ73BaknEFEK/ojuJhc5+qr9ztjoY/aKvdSk1ekZm2uqGCMb7taHI/WOwnj
	 KNmh+i7o7sjAYUZDtqWcP1Wg2GeKoZkRQZCiCI1Qh/5TjAbI/27q+jqbGF9E06udHO
	 2daLsjmnVJuqw==
Received: from [192.168.72.167] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5B5616002E;
	Tue, 31 Mar 2026 15:00:43 +0800 (AWST)
Message-ID: <09cbc12bea5707f794e139ea1bfafac82c2d2c12.camel@codeconstruct.com.au>
Subject: Re: [PATCH v28 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and enable-dma properties
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Krzysztof Kozlowski
 <krzk@kernel.org>
Cc: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
  Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Date: Tue, 31 Mar 2026 15:00:43 +0800
In-Reply-To: <TY2PPF5CB9A1BE6F267C60EEC34B6A75400F253A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20260330-upstream_i2c-v28-0-17bdae39c5cb@aspeedtech.com>
	 <20260330-upstream_i2c-v28-2-17bdae39c5cb@aspeedtech.com>
	 <20260331-fanatic-certain-bustard-fb13bc@quoll>
	 <TY2PPF5CB9A1BE6F267C60EEC34B6A75400F253A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2+deb12u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_000055_208461_4074AA2D 
X-CRM114-Status: UNSURE (   5.72  )
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

Hi Ryan,

> All AST2600 I2C controller instances have DMA hardware.
> I will remove the aspeed,enable-dma property and instead expose sysfs
> attribute in driver to allow users to enable dma/buffer/byte.

Sounds reasonable, but before you do so, how are you planning to manage
the allocation of DMA channels across multiple i2c peripherals?

Cheers,


Jeremy

