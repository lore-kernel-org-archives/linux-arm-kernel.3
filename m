Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1444C0218C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 22:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gvg/dHn4jWNsUL9rUhZU6ggD5o/Pe6Fj4E9aLL5kQHM=; b=URPUCaavXGFCbwtUXTUDX+WwJb
	LnoyjBy4FS7L/7y9xSpGPper8vS2x6aljHeouj6S5iPk182mTdgs4BxpJamSmweR+19GCOMF6vsLL
	0v5C5PnrCkRdMWEsxS2ZQOg0PjeierNr1g48REQp8mzrFQbNiZCi3SxgEPsjt43rOsHhcO/n3uDfW
	Va060tNUidmQ89n/eqqcsWut5L32YAC3QMuzhquC2r4F8DrVJyR9+nwv06WpYze/H9YBisqzbl7ri
	0N47ycPCnFeeBmpDBSBhGcpnkhhwER2cltuiKVLpkZaUQcC1K3ulsXb9huTChCUP3K6vncTsNtrdn
	1MtB/xJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbSDg-0000000Fctn-2shX;
	Fri, 24 Jan 2025 22:32:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbSCN-0000000Fcci-2eJU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 22:30:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8DE585C5816;
	Fri, 24 Jan 2025 22:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 632A4C4CED2;
	Fri, 24 Jan 2025 22:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737757846;
	bh=FgB4LXpxo6geqsVUx2MuopKecF2NdlgS186UjbPa+r8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eztnz89xMtKSacfX/dv7YPIkQVuORAibDekeNZl6OhA8yZXPAEEJwwjCN3E4D7uxs
	 eb7abgbKCnfhWrfemwHBNPEwUP6FReJ0O292DFJSneXlFex+xTar55/cnkMrn/h3il
	 o0JY/k7E+z7QCMncJIiGq0vuZlAev6GfA1NAb1LC5ETmiqG9Mh+Zexx2UpMUZG5yb2
	 Hc/Kyi0YygXyR0pTAieteajWiD16rVXz+hDr+cmA6iLtN9b3OJX3ySJuNqK7AnqHJL
	 ewniUkmhEMTnfJYtcTKXi88AxGx/ICiU2GFvgdx+91HqahS5lCHGjJXoYwvluH9vDh
	 8gkC0mF49JKuQ==
Date: Fri, 24 Jan 2025 16:30:45 -0600
From: Rob Herring <robh@kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] firmware: arm_ffa: Setup of_node for ffa devices
Message-ID: <20250124223045.GA2512712-robh@kernel.org>
References: <cover.1737441631.git.viresh.kumar@linaro.org>
 <0e863a4baea59865aff0d1b5657f548bc0aa8d2a.1737441631.git.viresh.kumar@linaro.org>
 <Z49v50epNMm6YvAr@bogus>
 <20250121100946.ouzeuh5fopkgmf55@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250121100946.ouzeuh5fopkgmf55@vireshk-i7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_143047_717771_CD16AA62 
X-CRM114-Status: GOOD (  22.64  )
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

On Tue, Jan 21, 2025 at 03:39:46PM +0530, Viresh Kumar wrote:
> On 21-01-25, 09:59, Sudeep Holla wrote:
> > On Tue, Jan 21, 2025 at 12:26:39PM +0530, Viresh Kumar wrote:
> > > Match and bind the of_node for the FFA device.
> > 
> > I am bit confused and need more details than the above line 😄, because
> > 
> > 1. We don't have any binding for FF-A and compatible "arm,ffa" is not yet
> >    defined
> 
> Realized now that you weren't cc'd on 1/3. Bounced it to your email id
> now.
> 
> > 2. Even if we have binding, we will not have vm_id and UUID which are
> >    discoverable from the firmware
> 
> Hmm..
> 
> > 3. DT maintainers rejected the bindings when it was initially proposed
> >    as it is discoverable. If we need it for a valid reason, we need more
> >    info, this patch doesn't provide full picture to change their stance.

For background, go read this thread[1]. :)

> We are working on FFA based Virtio bus/devices. The
> dma_alloc_coherent() helpers for the virtqueue (and other DMA-ble
> memory helpers) end up calling the dma-core for the parent device,
> which is FFA device in our case.
> 
> We want to avoid separate mapping for each buffer sent by the guest
> and keep a reserved mem (via DT) for the specific FFA device. With
> that, the memory can be mapped at once at the host (shared over FFA)
> and all the following DMA allocations can happen from that
> memory-region.

Well, that's a better explanation than the patches have as they just 
appear to ignore all the history here.

But I still don't really understand. I know next to 0 about FF-A. Sounds 
like OS specific problems to me though.

Rob

[1] https://lore.kernel.org/all/20220329151659.16894-1-abdellatif.elkhlifi@arm.com/#r

