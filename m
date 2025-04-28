Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79ED0C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 14:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aIpoS0ND3fqgX9y156pe5+DTr/v2sx0BpH1llI6WOd0=; b=cZmHV6GnBGPPinbi3v+Va1h5kR
	rCO04yygToI3ycCOChod+4ib8vHWT+h7RROWW5YhP+66LT/GyFeMHUgiJ0Kz+XoiGJvavyBkBAh81
	bmgDJiJ3yUw+HlmyDIAz3qmASLJbpV1rpZSZYGXmA/2xehNPmanSvT6EJjyitUr3CSp/zcxW/kKIs
	0E8zaUl7gZo/9ZVUMBYnhqq/K33bsQh0qrMPMa8bj09IxHra5yRHGwS3ZVozJXHdz4arb0fV63cqc
	35sQfYsMF47+qyzxZvvwAF8KDPnwjhE9v3WaLTDvFfD8DRQVrA6k+SLn5GWA2sctquVZHdrludGrU
	GH6iTmSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9PBu-00000006ab1-03pk;
	Mon, 28 Apr 2025 14:10:38 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9P9v-00000006aJs-33Gq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 14:08:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=aIpoS0ND3fqgX9y156pe5+DTr/v2sx0BpH1llI6WOd0=; b=skb4qs5GVkbEEle4HYIM/yPAtD
	2wnqyHXOICSwi0UCqYjBEO3Mr2FyKKapL7KS1cf8RfobEAdNTs1diMML0dUhuOKZ+PkYas6k8h4eV
	gvAG3s8P1cP6asKazO8WG/M0XtoSyIOok25LS48Gp/bGqPv/+keIUJJJ2TYaOR/1TirI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u9P9W-00AqR4-GB; Mon, 28 Apr 2025 16:08:10 +0200
Date: Mon, 28 Apr 2025 16:08:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>, Tero Kristo <kristo@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: ethernet-controller:
 update descriptions of RGMII modes
Message-ID: <9b9fc5d0-e973-4f4f-8dd5-d3896bf29093@lunn.ch>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <218a27ae2b2ef2db53fdb3573b58229659db65f9.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <aAaafd8LZ3Ks-AoT@shell.armlinux.org.uk>
 <a53b5f22-d603-4b7d-9765-a1fc8571614d@lunn.ch>
 <aAe2NFFrcXDice2Z@shell.armlinux.org.uk>
 <fdc02e46e4906ba92b562f8d2516901adc85659b.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fdc02e46e4906ba92b562f8d2516901adc85659b.camel@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_070835_773256_176F18ED 
X-CRM114-Status: GOOD (  16.79  )
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

> > However, with the yaml stuff, if that is basically becoming "DT
> > specification" then it needs to be clearly defined what each value
> > actually means for the system, and not this vague airy-fairy thing
> > we have now.

 
> I agree with Russell that it seems preferable to make it unambiguous whether
> delays are added on the MAC or PHY side, in particular for fine-tuning. If
> anything is left to the implementation, we should make the range of acceptable
> driver behavior very clear in the documentation.

I think we should try the "Informative" route first, see what the DT
Maintainers think when we describe in detail how Linux interprets
these values.

I don't think a whole new set of properties will solve anything. I
would say the core of the problem is that there are multiple ways of
getting a working system, many of which don't fit the DT binding. But
DT developers don't care about that, they are just happy when it
works. Adding a different set of properties won't change that.

	Andrew

