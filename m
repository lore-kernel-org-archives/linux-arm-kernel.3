Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597BCC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 15:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DpZWxqTrqCTGeg6pxPrKsQ3LzIqoPDxLru+MtzRsehs=; b=KfboNY5150/rrcrugRv7Tepbc8
	G4jmxT9JsPELHhNdOsS4wEHQXy91UsBAPQH3VxJ3I5HEamwnWazrvRAOFQdsQiJLDOROx3eoHgxAu
	JETusFBEU3NaicI5cXRFU3Ubq0Y+rBY3VDqCKwBEx4rZpWL/UQuw5hhdZRtdWKIL4FBNBoKCTdcEs
	EKVWCLfwE1nxUKes8SgEYr5KI+9vBJi559pOGMLHsYV+hcUPUFgiYlX5PRDHGkZgnGerqsvmLrA4c
	na334fDjwXuh2KYOmkkQ0BFyYVWqO9ylo6mRplSjlc08mrvTlxUq5XB4YbIdr7HswXTp3DeAHP2xB
	DXDuohhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuIW-0000000AWSL-3sKM;
	Wed, 18 Jun 2025 15:01:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRs4q-0000000AA7g-1Rx0;
	Wed, 18 Jun 2025 12:39:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 747B5A52451;
	Wed, 18 Jun 2025 12:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD17BC4CEE7;
	Wed, 18 Jun 2025 12:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750250379;
	bh=WG7j8G6GOIk4GTEuTb80cckRD2B1MQmBRHVOT434W38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S4q4dPASMsbovjTlxIqD3yC4iPmDJDtuKDOHClUD084oQrFRwVfB5RPk9youEtp8q
	 LxAS8xZpTtBGT4/bq2CvIc+4tE9IL9uUx+hj+6mThaDE73v1VrPWjtifDEbDg5+5ie
	 KrAzDPUey8kV3gAK7upUCpF25Pr824GFimEjbkBJHf4gKXhgVk27I6Y64J3H+Sl3qZ
	 A6T3eIKgPlOUb8xuta5CHXlka1gbAAB4vbSKOh8aaBDjr1AmybJLydgHelPLRUuH8w
	 opgUL6KCNR5tlwkgzwz/etBVcsL/scCEh+5gkriE0bLX/AoCjwNo/LyIuiXvMo/hWY
	 NyBtEMBv9tnYA==
Date: Wed, 18 Jun 2025 13:39:33 +0100
From: Simon Horman <horms@kernel.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: linux@fw-web.de, nbd@nbd.name, sean.wang@mediatek.com,
	lorenzo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, daniel@makrotopia.org,
	arinc.unal@arinc9.com
Subject: Re: Re: [net-next v4 2/3] net: ethernet: mtk_eth_soc: add consts for
 irq index
Message-ID: <20250618123933.GP1699@horms.kernel.org>
References: <20250616080738.117993-1-linux@fw-web.de>
 <20250616080738.117993-3-linux@fw-web.de>
 <20250618083623.GF2545@horms.kernel.org>
 <trinity-86a5b58b-a74a-48be-80ae-aa306e95f214-1750238697100@trinity-msg-rest-gmx-gmx-live-b647dc579-2m42j>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-86a5b58b-a74a-48be-80ae-aa306e95f214-1750238697100@trinity-msg-rest-gmx-gmx-live-b647dc579-2m42j>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_053940_453421_D491D49D 
X-CRM114-Status: GOOD (  18.41  )
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

On Wed, Jun 18, 2025 at 09:24:57AM +0000, Frank Wunderlich wrote:
> Hi,
> 
> > Gesendet: Mittwoch, 18. Juni 2025 um 10:36
> > Von: "Simon Horman" <horms@kernel.org>
> > Betreff: Re: [net-next v4 2/3] net: ethernet: mtk_eth_soc: add consts for irq index
> >
> > On Mon, Jun 16, 2025 at 10:07:35AM +0200, Frank Wunderlich wrote:
> > > From: Frank Wunderlich <frank-w@public-files.de>
> > > 
> > > Use consts instead of fixed integers for accessing IRQ array.
> > > 
> > > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > > ---
> > > v4:
> > > - calculate max from last (rx) irq index and use it for array size too
> > 
> > Reviewed-by: Simon Horman <horms@kernel.org>
> 
> thanks for review and the RB
> 
> i thinking about changing the const names to this:
> 
> MTK_ETH_IRQ_SHARED	=> MTK_FE_IRQ_SHARED
> MTK_ETH_IRQ_TX		=> MTK_FE_IRQ_TX
> MTK_ETH_IRQ_RX		=> MTK_FE_IRQ_RX
> MTK_ETH_IRQ_MAX		=> MTK_FE_IRQ_NUM
> 
> because of i currently working on RSS/LRO patches and here MTK_FE_IRQ_NUM is used as name 
> with same meaning like my current MTK_ETH_IRQ_MAX (where max should be same as RX and NUM
> is one more because it is a count).
> Current IRQs also target the MTK frame-engine which is different to the PDMA RX engine
> used for RSS/LRO later, so MTK_ETH_IRQ_RX and MTK_ETH_IRQ_MAX are maybe misleading when RSS/LRO 
> support will come in.
> 
> can i change the consts like this and keep your RB?

Yes, no objections from my side.

