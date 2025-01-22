Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7BFC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 13:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJXkNjhw3Aw/eM4XePKe96UikbQjmvVIAHBl8Bw77+Q=; b=bvFwD4Pctjkt3Ar1ngoyX0MXsY
	kYxQoJq0UI9TThATBqm/htVC0PoVut9wmha+vi+I54H7n+PnblGgVObz06evVLtwPdzCKtj2sRkvH
	gjwj2TJZOWKytp+xSAA3bTNJx9MDcvAHfC6HIWlx84yXpzy26yX0Oq+oJRhbV8W4nLooBi5rmFXzG
	L8eh7I1D2xnBukJIrbju0ZxBRoM+w+BTNBOZLazeG2VLLm98UYQ/+PaDHDEBQ5KwC0HGjAuRDvMrX
	qpmzimi6GCnl5wybGnk0yUsponTPL2ekOlPqxJzmOvBwT2m4GqS+5Z/Aq9V6x4BG2SFc+uoSzX/y+
	X2xZHd4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tab3G-0000000AJv1-0KFH;
	Wed, 22 Jan 2025 13:45:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tab0j-0000000AJZf-0yjC;
	Wed, 22 Jan 2025 13:43:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YJXkNjhw3Aw/eM4XePKe96UikbQjmvVIAHBl8Bw77+Q=; b=B8GfoPTfvztONar6kUdDGB6Dln
	7QBlQaOUSNpq42nxCfsTaoD3g3hgp47FjRCIS6AU2SKA/m/CrcaVKKcqG9b0JqCGmLYeX/U1X30qD
	94jcupitsrV3UmMeENlw+nIXGNaQvv4/Oi516Qi9D1zrSIK77B6nbt4uH5Gnu0mnmPR8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tab0X-006xSm-6T; Wed, 22 Jan 2025 14:43:01 +0100
Date: Wed, 22 Jan 2025 14:43:01 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Basharath Hussain Khaja <basharath@couthit.com>
Subject: Re: [RFC PATCH 01/10] dt-bindings: net: ti: Adds device tree binding
 for DUAL-EMAC mode support on PRU-ICSS2 for AM57xx SOCs
Message-ID: <ef90ecc9-7bb1-4f18-bd14-c5a82f07021b@lunn.ch>
References: <20250109105600.41297-1-basharath@couthit.com>
 <20250109105600.41297-2-basharath@couthit.com>
 <7870d1e4-074f-4dc5-aae5-ac5fc725cc43@lunn.ch>
 <1556294138.382514.1737552374554.JavaMail.zimbra@couthit.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556294138.382514.1737552374554.JavaMail.zimbra@couthit.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_054313_268404_D8A493EC 
X-CRM114-Status: GOOD (  16.52  )
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
Cc: nm <nm@ti.com>, vigneshr <vigneshr@ti.com>, tony <tony@atomide.com>, edumazet <edumazet@google.com>, krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, Rob Herring <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, praneeth <praneeth@ti.com>, m-karicheri2 <m-karicheri2@ti.com>, jacob e keller <jacob.e.keller@intel.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, richardcochran <richardcochran@gmail.com>, prajith <prajith@ti.com>, rogerq <rogerq@kernel.org>, ssantosh <ssantosh@kernel.org>, linux-omap <linux-omap@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, rdunlap <rdunlap@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jan 22, 2025 at 06:56:14PM +0530, Basharath Hussain Khaja wrote:
> 
> >> +          ti,no-half-duplex:
> >> +            type: boolean
> >> +            description:
> >> +              Disable half duplex operation on ICSSM MII port.
> > 
> > I already asked this in the next patch, but why have this property? Is
> > it because the hardware is broken? Or is this some sort of policy?
> > Policy should not be in DT, DT describes the hardware, not the policy
> > of how you use the hardware.
> > 
> 
> This series of patches enables support for full-duplex only. Support for 
> half-duplex will be added in subsequent revisions. We will clean it up in
> the next version.

So you don't need this property. All you need to do is remove the 1/2
duplex link modes using phy_remove_link_mode() and user space will not
get the option to enable them, not will auto-neg advertise them.

	Andrew

