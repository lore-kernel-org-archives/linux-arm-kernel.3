Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB78C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 12:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y7ep0hNPkrPmj6OIlbqC/gwQgMz4kST08uKktVrdoyE=; b=1zk6ogPU+ZouhGG7M1put4pVE7
	W61KNV1J6hoA7TZ37KTm9JxKXnIYOnSib8ncHOJ71c+7Dgc5zBXDhvW2hX1Nb0XDrz1uy+rZ2UUkW
	DMWBpN8PMrjVdm3dE9XXI/8/xH92ifrYAilWvVCBKwi7rGV1XeVpBiaKCBHe6+6JaxEQ3+8pzmaPA
	A9R9RFek9WYMtfzjBeolt+8DVsYcx29qRO25lznCX5wZVJEKvHdlfJFmLRVWdwlBUPC7awo6OoCHg
	OvUhLywxMxPfKOwv1cDPt0Q99uqQvV8vgt9DlKx7tI+PhE1htrpCuG6liDIgz1VhqcVjSM+icprod
	e8wuJxog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6okG-00000009AZ8-1k0d;
	Wed, 16 Sep 2026 12:28:12 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ok8-00000009AWP-3Zpg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 12:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Y7ep0hNPkrPmj6OIlbqC/gwQgMz4kST08uKktVrdoyE=; b=4Ic8Dgppc1tbR5PSDRMXMpQz1T
	r0bsjEDlwR5XYOKBaNiBWoPfrtJ400vi0FqutE7vV+TLnMd0Pzb7xF2Ipi2htBH4T8LFBy7pAeVQm
	U1kiaIBuCgMPz7pZKXhWIwQDoUOTZdVAUkeVneTKyVktxruJYeoA8GZYxOCyMdOiUd9E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x6ojy-005TWo-HS; Wed, 16 Sep 2026 14:27:54 +0200
Date: Wed, 16 Sep 2026 14:27:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH v2 3/7] arm64: dts: freescale: Add Lino iMX93
Message-ID: <8bb9b763-4553-4263-b0ea-0129f5db0229@lunn.ch>
References: <20260911091952.96233-1-francesco@dolcini.it>
 <20260911091952.96233-4-francesco@dolcini.it>
 <42ed88a6-d208-482b-94aa-2e45b69c173e@lunn.ch>
 <20260915132806.GA226756@francesco-nb>
 <100eef7b-e1d6-411b-bac5-98790e8f9ea7@lunn.ch>
 <aqmG91HwmKe-enfy@francesco-nb>
 <95dcbf3e-193d-460b-b6b9-cd412394e4c6@lunn.ch>
 <20260916055706.GA20310@francesco-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916055706.GA20310@francesco-nb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_052804_971476_4AF092B4 
X-CRM114-Status: GOOD (  10.38  )
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

> I looked into the specific ethernet phy used here, TI DP83867, and
> I would say that the falling edge interrupt should be safe on this
> specific board/phy.

https://www.ti.com/lit/ds/symlink/dp83867ir.pdf

Page 7:

  INTERRUPT: This pin can be programmed as an interrupt output instead
  of a Power down input. In this mode, Interrupts is asserted low
  using this pin.

Also:

  When operating this pin as an interrupt, the pin is an open-drain
  architecture.

This allows you to connect multiple PHYs to one SoC interrupt, shared
interrupts, which again needs level interrupts.

So the datasheet says it is active low.

> What do you think? *IF* my reasoning is correct I would suggest to keep
> the code as it is now.

If you decide to stay with edge, i suggest you put a comment in DT,
something like:

# The PHY data sheet says the interrupt is active low, but the
# interrupt controller does not support level interrupts. Use it as
# falling edge and hope for the best.

	Andrew

