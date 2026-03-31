Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D48FF60D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 07:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkbimkF7HoXE/Jf1vzsZkAfNbNEc1Y65ZFXjx0QhOzM=; b=wRBre2aHf4JXN3jVmas3t71jGi
	qA0d2G+1uzKY1xrGsuEo5QS+dnWX+7AOt9/KzMb2CX9DSv4W0t6+Rp4C5wnQkUxTMmJino30s5Knl
	ynl/ntIEN6qrjrioUNx2Hhe+cigH9dZN6AoO6tjqN2OEoJr5ojawO4sWpz0YueiUWdnJXcsAPD9j/
	gt+tIuBAws6b1992nv/T63Ih1uGVLY/28UxYWnvCWgJEBNjk78ZdrXZM05lOzZleirqn2JurK9TQf
	BtzZrIXOpN/UG5sAD1uwJI9nDO+hHUm17K8HXEDJ6Vuirpiug9e3kYvmoLa/N4SgHIfUx9GIG3NUf
	aNyUGQ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TLx-0000000CSe9-0uo6;
	Tue, 31 Mar 2026 07:17:33 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TLu-0000000CSdZ-28Ct
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 07:17:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774941448;
	bh=qkbimkF7HoXE/Jf1vzsZkAfNbNEc1Y65ZFXjx0QhOzM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NISHE6MXoK8tfRV9S8pt+leeucFZ70wxemyKXKi9pRF+a6WzkAGIquNAVMhKf2cnG
	 YN5MOUGglqn76zKkmoH/lrTvgp8y8TAQJXrZIOd3X/VQwwzBZWwBnHnDKY54P56KGx
	 XcB6sQ8EvgaaZQZkMHg5IsZzaH4wlCvxsA87d9poVrwV3A8tkMtbM4j6rgTVkkVLdi
	 TNjJawi4Hvre/DNptnvZk6d650ymJ9y+B5x7pjivv+j2W/GEJ6aEu2cemVW7T2VGaX
	 WTpk7L2R3bDnuaKMlcpG8Ff9O4/81GyOFLTUht1LMBFiTKMMjYE7AOQxcDFQzKDG2D
	 8CH2GwMt2fcoA==
Received: from [192.168.72.167] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3163E6002E;
	Tue, 31 Mar 2026 15:17:28 +0800 (AWST)
Message-ID: <72517fcf99a7453841ee75243dc54e735c10238f.camel@codeconstruct.com.au>
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
Date: Tue, 31 Mar 2026 15:17:28 +0800
In-Reply-To: <TY2PPF5CB9A1BE6EA5BABE55EB8A7003D22F253A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20260330-upstream_i2c-v28-0-17bdae39c5cb@aspeedtech.com>
	 <20260330-upstream_i2c-v28-2-17bdae39c5cb@aspeedtech.com>
	 <20260331-fanatic-certain-bustard-fb13bc@quoll>
	 <TY2PPF5CB9A1BE6F267C60EEC34B6A75400F253A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
	 <09cbc12bea5707f794e139ea1bfafac82c2d2c12.camel@codeconstruct.com.au>
	 <TY2PPF5CB9A1BE6EA5BABE55EB8A7003D22F253A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2+deb12u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_001730_739530_08681BE4 
X-CRM114-Status: UNSURE (   8.96  )
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

> > Sounds reasonable, but before you do so, how are you planning to manage=
 the
> > allocation of DMA channels across multiple i2c peripherals?
> >=20
> The AST2600 I2C hardware has only one can use DMA at a time.
> To avoid the complexity of managing DMA channel contention,
> I plan to use buffer mode by default for all controllers, which still pro=
vides
> better performance than byte mode without requiring DMA channel allocatio=
n.

OK, but your wording there ("by default") implies that DMA is still
selectable for one controller peripheral. In which case: you still have
the problem of managing DMA channel contention, but now it's at runtime
instead.

So my question still stands: how are you planning to enforce that DMA is
only enabled for one controller?

Or are you planning to disable I2C DMA entirely on AST2600?

Cheers,


Jeremy

