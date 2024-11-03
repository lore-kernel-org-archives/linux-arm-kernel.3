Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF3CD11188
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 18:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KoeC812BJC1qP0utpHBC083qksYwLvvWXbWjSDq4s+A=; b=eE3sQ80rprV1w7wHcxQGrpcBE9
	epO1mQkdWGRsAf4UK+bogReVfQ2n5Sy4BRJh9pEyZ4EMHSEm4GcMZ/l9+gKUn1hE+NwdDIs138xPm
	1M/M2yg/jjVNR5mYTvSa6uq9bY8apLROX0ZmHgdNTPe/wKH5p1sx6xd871FWLrc9XMI0HNJiKz7HH
	K1PnE1p74PcriJfR9CRKCMbsGUcj+DhWMiLalUrdQ76q/bd3cIrVz4jEFFC7P0V0z1hxhwMeBles3
	7+gP1H4UFJuyQTrI9XNLGA0ILqU6oTEYCQFA0Z4q7MmJq5/e/t+Y8Ds2KdDSYLjcrN0INOxtCclkq
	GOos3WbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7fEl-0000000BqmF-0GrB;
	Sun, 03 Nov 2024 18:22:07 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7fD4-0000000BqeI-2qya
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 18:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KoeC812BJC1qP0utpHBC083qksYwLvvWXbWjSDq4s+A=; b=C/l/HTtVqwvFuLNKkM/AW0KD3u
	uVlWTzNtla+1d01nLpVzZP7bYItGm9/y9ZnSsmMHGpAccfccOcpzMzFT/sf21s4QmUeWUpvoNOPy1
	2L9+4DHB/lUyGyFR+S1OqrgwUyGLNBIoqcYvC0mqihwvqGadJLAjKf7mtLzKUedyOxcE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t7fCv-00C202-6c; Sun, 03 Nov 2024 19:20:13 +0100
Date: Sun, 3 Nov 2024 19:20:13 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lothar Rubusch <l.rubusch@gmail.com>
Cc: robh@kernel.org, kuba@kernel.org, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, peppe.cavallaro@st.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] net: stmmac: add support for dwmac 3.72a
Message-ID: <0b64d49d-b0a0-45ba-aecc-febcdc557679@lunn.ch>
References: <20241102114122.4631-1-l.rubusch@gmail.com>
 <20241102114122.4631-2-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241102114122.4631-2-l.rubusch@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_102022_743138_28DFD0DF 
X-CRM114-Status: UNSURE (   9.10  )
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

On Sat, Nov 02, 2024 at 11:41:21AM +0000, Lothar Rubusch wrote:
> The dwmac 3.72a is an ip version that can be found on Intel/Altera Arria10
> SoCs. Going by the hardware features "snps,multicast-filter-bins" and
> "snps,perfect-filter-entries" shall be supported. Thus add a
> compatibility flag, and extend coverage of the driver for the 3.72a.
> 
> Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>

Does what it says:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Dumb question. What does the 'a' mean in the version? Or is this
actually hex?

    Andrew

