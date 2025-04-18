Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF860C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 20:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khDOK1TjxyxAROtr0jQiZ7X4aZm0qTO+vpHmUfS/7KU=; b=huDL5n3f9D5Yb4SjDkgHYocbGo
	m6+ESrsidhizwdQSuFVyiIz+MY17MgGZ2vmgbbAZKHoe1sI6zo3vlvSYK2h6pXwSfzp8ZPkHU6vMr
	Is/x4ImBuo7/zjtN5iE1AzQs/2ZIs2zQdV50X2pES3cOqiIj/i8LeIXoxrJXz/3jQ1eKxDADwOq7g
	xgfP7HOLr3nIWf8jk2JYChApHVmb2pUA7nJ7ZQOjfn8Jmr1kvtpZ/4qWZFkdtxWo8yEAnv4JfRUMp
	/MC4Vd3yEk3W+I8TAMJg9KlsmnaDt3Ni4QqrT+OANFHd2RDDO/+xEyMrIjXDN7WaKfogbpE0J12m7
	1qVqpE5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5sYM-00000000CPp-1m8c;
	Fri, 18 Apr 2025 20:43:14 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5sWP-00000000C1v-1c97
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 20:41:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=khDOK1TjxyxAROtr0jQiZ7X4aZm0qTO+vpHmUfS/7KU=; b=Wm49iNZ9jPThjxDvW6abQGQlHl
	i6NvOCO2JcGJxCwhEfQkyIcsF95AM8MBK7Ze5tB0l/FqDXBgsIyuwnSgG3N1GkedBt1a22B/RuTzw
	DRsNSZGIDjkUn6FyQ2cuLiTWGbWijRIIen2SciJlCh3D6e/Pe6fVDY3wfjGewOEYRhms=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u5sWB-009wGv-6K; Fri, 18 Apr 2025 22:40:59 +0200
Date: Fri, 18 Apr 2025 22:40:59 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Roger Quadros <rogerq@kernel.org>, Tero Kristo <kristo@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: ethernet-controller:
 update descriptions of RGMII modes
Message-ID: <4fbcce38-0a74-48d5-9802-a430098eccf2@lunn.ch>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <218a27ae2b2ef2db53fdb3573b58229659db65f9.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <6be3bdbe-e87e-4e83-9847-54e52984c645@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6be3bdbe-e87e-4e83-9847-54e52984c645@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_134113_423292_76D4C9E5 
X-CRM114-Status: GOOD (  19.76  )
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

On Tue, Apr 15, 2025 at 04:06:31PM +0530, Siddharth Vadapalli wrote:
> On Tue, Apr 15, 2025 at 12:18:01PM +0200, Matthias Schiffer wrote:
> > As discussed [1], the comments for the different rgmii(-*id) modes do not
> > accurately describe what these values mean.
> > 
> > As the Device Tree is primarily supposed to describe the hardware and not
> > its configuration, the different modes need to distinguish board designs
> 
> If the Ethernet-Controller (MAC) is integrated in an SoC (as is the case
> with CPSW Ethernet Switch), and, given that "phy-mode" is a property
> added within the device-tree node of the MAC, I fail to understand how
> the device-tree can continue "describing" hardware for different board
> designs using the same SoC (unchanged MAC HW).

phy-mode describes the link between the MAC and the PHY. So it either
needs to be in the MAC node, or the PHY node when describing the
board. I don't know the history of why it ended up in the MAC node,
but it did.

> Since all of the above is documented in "ethernet-controller.yaml" and
> not "ethernet-phy.yaml", describing what the "MAC" should or shouldn't
> do seems accurate, and modifying it to describe what the "PHY" should or
> shouldn't do seems wrong.

What we are really saying here is, does the PCB have extra long clock
lines in order to add the delays? If yes, the MAC/PHY pair does
nothing. If no, the MAC/PHY pair needs to add the delay.

DT however says nothing about how the MAC/PHY pair should add the
delay. That would be configuration, and DT should try to not describe
configuration. Hence the binding description needs to be neutral to
MAC and PHY.

Linux has a preference, that the PHY does the delay. However, other
operating systems might have other preferences. And since the binding
should be generic across a range of operating systems, we don't
mention Linux's preference.

	Andrew

