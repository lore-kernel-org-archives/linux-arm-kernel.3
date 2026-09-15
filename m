Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858A6C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 14:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=de8dK4GS7VwXyA73g76QueaQ8BqePWsZI4huThE49ws=; b=rqOi6dpLfR24u1TFSR3y3viOdo
	CD8nVF5lRH7brfv935HDqETeL/c7Tvm2+03KLhTKeQfoTFI3o1BkWxqtkFBSBTat9n2/XRVbdYEO0
	AeepG5rLwwwZPkBN4gKsgiXujpMhov6mckGA+8EuRVFp8ha1W6Ome1l+LiqlFVwx07Io0n6xrkx9O
	Yrvlszts0YANXG1eduwOWQW4FOIC9tw71kGmjSrqwxxmrtmXwVsdepHKjoBQ/pJw4IVAQn8wcETfd
	vnnUplBN2GlYtNFQTRx5XQBmVnLOrhUcMQtBqw3EXs1KkMpX4Kl2hoj9Kh/gMR9zouZzqMqw/O4iZ
	w6XKvpCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TCv-00000006jVV-3bj6;
	Tue, 15 Sep 2026 13:28:21 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TCp-00000006jQu-0qkm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 13:28:17 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 8E3BE22A45;
	Tue, 15 Sep 2026 15:28:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789478891;
	bh=de8dK4GS7VwXyA73g76QueaQ8BqePWsZI4huThE49ws=; h=From:To:Subject;
	b=Y4Wrh/yMbgyClId/aHdNNhAhlmAvvACMB1nx37CLU72/PqBGhxahOV+VwBeb9VJgW
	 +Nhx/zORle9RUPYZ5ns1R+rV5zWofZmPcI9/akLauYpqoqOoUL5e3FC+4apQZVUEhX
	 BeJ5WDLTQmlMDuDYWCv0DWrO55VFdM+OquEc+GX33XeUtjFTWf9OCstYvkuYg1wgMm
	 IdvkKsNiOKvuptw95mgRkM+IMm8mL+//xyx80gnjt+NoSFSQ7ASYLXsEk6fboEV9ah
	 9SO19w9whSUGkUd3JS7BGQPbDPj9PcWsyrKdbZ8UYfSiOeBnCoCnCHGX4EkBn3xyfw
	 lDXOKhBUzfvlg==
Date: Tue, 15 Sep 2026 15:28:06 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Francesco Dolcini <francesco@dolcini.it>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH v2 3/7] arm64: dts: freescale: Add Lino iMX93
Message-ID: <20260915132806.GA226756@francesco-nb>
References: <20260911091952.96233-1-francesco@dolcini.it>
 <20260911091952.96233-4-francesco@dolcini.it>
 <42ed88a6-d208-482b-94aa-2e45b69c173e@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42ed88a6-d208-482b-94aa-2e45b69c173e@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_062816_287523_4B7BB0FB 
X-CRM114-Status: GOOD (  10.37  )
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

Hello Andrew,
thanks for the review.

On Tue, Sep 15, 2026 at 03:19:45PM +0200, Andrew Lunn wrote:
> > +	ethphy1: ethernet-phy@1 {
> > +		reg = <1>;
> > +		interrupt-parent = <&adapter_gpio_expander>;
> > +		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
> 
> Falling interrupts is probably wrong. They are normally level, active
> low.


It is wanted. The I2C ioexpander component used for the interrupt
supports only edge interrupts. We tested it and it works fine like that.

The linux driver is now able to emulate the level interrupt in software,
however ...
 - the DT is shared with other project, it is a HW description and it is
   not supposed to pair with the specific linux driver
 - when we tested it, the SW emulation was not really reliable, and we
   prefer to play on the safe side

Francesco


