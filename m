Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187D4C79FBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 14:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBPzmlCg+pA1yBRm8LZsOW5MfSNjVeQLA5Whqc6P6wM=; b=Ebxetcn91Qu+Qut6knrkYljXl+
	ddtFxyFp05+kaBC6Nt8/C+PCjanZt8O+byH92wqmtNCdTLMXTcClM3FKbY8SxD2mbyHPjPanlMDbZ
	I5PH5/+gTvtlLiw7jUQV2MCufxoKBOC3M5MHLdrJxqcyGSroOsAb+8hFjP5gBs3hcXYXD0WrtACdt
	kaQPYGPuyYeSon9AG3dgKzVVplOFwksLI5ITRiENuxPaPfZv0pdT/CbbeK1faYsPytTyhsGhnwXOJ
	onZgKV20XwcvB/lo2ZXd5L48oCG4sGIX1uu3SE7ZNEtCFVP2M/Tr6rN00iJWrkTb7W8bDP7TOYIYr
	8d8p6jQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgkhO-0000000EFSo-0m3k;
	Fri, 16 Jan 2026 14:21:14 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgkhL-0000000EFSG-3K03;
	Fri, 16 Jan 2026 14:21:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=mBPzmlCg+pA1yBRm8LZsOW5MfSNjVeQLA5Whqc6P6wM=; b=iDkurxCPyzhBsZsmRZU8E6OPGm
	/GRhjBxf63ELXOLdG09Kd2N3VvDk1xqq38gwGuNRGX0O5IXMUCPA3TivAJAAJCVLjvo863aUmCgGt
	55IahhnhJdM9vo+A8Zc4aj1b3xvXPbHwCJCob11sXv35xdeZMH6Jv6UJRQkAp+/Y+WIk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vgkhE-00359Y-5p; Fri, 16 Jan 2026 15:21:04 +0100
Date: Fri, 16 Jan 2026 15:21:04 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: Sayantan Nandy <sayantann11@gmail.com>, lorenzo@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	sayantan.nandy@airoha.com, bread.hsu@airoha.com,
	kuldeep.malik@airoha.com, aniket.negi@airoha.com,
	rajeev.kumar@airoha.com
Subject: Re: [PATCH] net: airoha_eth: increase max mtu to 9220 for DSA jumbo
 frames
Message-ID: <f0683837-73cd-4478-9f00-044875a0da75@lunn.ch>
References: <20260115084837.52307-1-sayantann11@gmail.com>
 <e86cea28-1495-4b1a-83f1-3b0f1899b85f@lunn.ch>
 <c69e5d8d-5f2b-41f5-a8e9-8f34f383f60c@genexis.eu>
 <ce42ade7-acd9-4e6f-8e22-bf7b34261ad9@lunn.ch>
 <aded81ea-2fca-4e5b-a3a1-011ec036b26b@genexis.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aded81ea-2fca-4e5b-a3a1-011ec036b26b@genexis.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_062111_852761_740F91FC 
X-CRM114-Status: GOOD (  20.80  )
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

On Fri, Jan 16, 2026 at 11:48:30AM +0100, Benjamin Larsson wrote:
> Hi.
> 
> On 16/01/2026 02:08, Andrew Lunn wrote:
> > On Thu, Jan 15, 2026 at 08:10:20PM +0100, Benjamin Larsson wrote:
> > > On 15/01/2026 18:41, Andrew Lunn wrote:
> > > > On Thu, Jan 15, 2026 at 02:18:37PM +0530, Sayantan Nandy wrote:
> > > > > The Industry standard for jumbo frame MTU is 9216 bytes. When using DSA
> > > > > sub-system, an extra 4 byte tag is added to each frame. To allow users
> > > > > to set the standard 9216-byte MTU via ifconfig,increase AIROHA_MAX_MTU
> > > > > to 9220 bytes (9216+4).
> > > > What does the hardware actually support? Is 9220 the real limit? 10K?
> > > > 16K?
> > > > 
> > > > 	Andrew
> > > > 
> > > Hi, datasheets say 16k and I have observed packet sizes close to that on the
> > > previous SoC generation EN7523 on the tx path.
> > Can you test 16K?
> 
> I probably can but it would take some time (weeks) as I dont have any
> current setup with AN7581.
> 
> > 
> > Does it make any difference to the memory allocation? Some drivers
> > allocate receive buffers based on the MAX MTU, not the current MTU, so
> > can eat up a lot of memory which is unlikely to be used. We should try
> > to avoid that.
> > 
> > Thanks
> > 	Andrew
> 
> Larger packets will consume more dma descriptors (a larger packet will be
> split into several dma descriptors). So you dont allocate more memory to be
> able to send jumbo frames.

So it 'costs' nothing to declare the actual maximum.

For the moment, 9220 seems acceptable, but please include in the
commit message that the real maximum is higher, probably somewhere
around 16K.

	Andrew

