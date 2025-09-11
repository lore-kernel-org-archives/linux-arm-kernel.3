Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8BCCAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 14:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X471W6C5BJj+29v84eIqNLNrrNpVlRO4QaYvcFi48zE=; b=rd1UP82furqh6S692CeWqbEXXk
	DDrX1WPcyyqe5XQobDl2mIkd0rChZFtC/EmlgY3aTTEXsOzVJUjvZcRUTjO8Sl18DkciI5jZXzkDg
	TdjfkN1pEuZVKq+EL1LdNbb9dgIfVGTw93stnx0x3M5scIAf0CTqtC4+9oc/Bc8AcrhvdIqzM1aR0
	+ZkjtnnIPsfI2/fPJ+2aB2neRAiVtG7kp+9qHe6A6jVPHp/wGKNAJhzpHgQcsGQmLVT05oSy6L8Fo
	W+thsSFIbxeaqzD0GFQmg4h6NniIKv7bUGKKi7dvKTA/+JgV1gOX8EqEb0/hoQjS49bcQMMpiPCcH
	/fjG/eoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwiXG-00000003dn3-1TvQ;
	Thu, 11 Sep 2025 14:44:30 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwiXD-00000003dlZ-1GI9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 14:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=X471W6C5BJj+29v84eIqNLNrrNpVlRO4QaYvcFi48zE=; b=sQpF3d/z1GhHDsLdbG/bw/wEgu
	3mVTMTS+Ablfa3ymbUs2jnkxJvB3GfJFmDtxD8gobIGumsD4ZSBhlxsHZU6AxQeQW9wMbi1SWEESH
	vs7N0PKwIHO84viHz6oQ9OixJpRRgWYZKDcY3g0trVR1Nd59Foi0Sgs2Q+eFDUTLFUik=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uwiX2-00862T-QQ; Thu, 11 Sep 2025 16:44:16 +0200
Date: Thu, 11 Sep 2025 16:44:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Suraj Gupta <suraj.gupta2@amd.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, michal.simek@amd.com,
	radhey.shyam.pandey@amd.com, horms@kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, harini.katakam@amd.com
Subject: Re: [PATCH net-next 2/2] net: xilinx: axienet: Add inline comment
 for stats_lock mutex definition
Message-ID: <633175ac-97c8-42d0-8f3b-767e89aa4132@lunn.ch>
References: <20250911072815.3119843-1-suraj.gupta2@amd.com>
 <20250911072815.3119843-3-suraj.gupta2@amd.com>
 <0dc424bf-c19b-4eeb-82db-88bff4f85d46@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0dc424bf-c19b-4eeb-82db-88bff4f85d46@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_074427_336501_B1AE5DF6 
X-CRM114-Status: GOOD (  16.95  )
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

On Thu, Sep 11, 2025 at 10:35:22AM -0400, Sean Anderson wrote:
> On 9/11/25 03:28, Suraj Gupta wrote:
> > Add inline comment to document the purpose of the stats_lock mutex in
> > the axienet_local structure. This mutex protects the hw_stats_seqcount
> > sequence counter used for hardware statistics synchronization.
> > 
> > Fixes checkpatch warning:
> > CHECK: struct mutex definition without comment
> > 
> > Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> > ---
> >  drivers/net/ethernet/xilinx/xilinx_axienet.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h
> > index 5ff742103beb..99b9c27bbd60 100644
> > --- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
> > +++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
> > @@ -598,7 +598,7 @@ struct axienet_local {
> >  
> >  	u64 hw_stat_base[STAT_COUNT];
> >  	u32 hw_last_counter[STAT_COUNT];
> > -	seqcount_mutex_t hw_stats_seqcount;
> > +	seqcount_mutex_t hw_stats_seqcount; /* Lock for hardware statistics */
> >  	struct mutex stats_lock;
> >  	struct delayed_work stats_work;
> >  	bool reset_in_progress;
> 
> NAK. This is already documented in the kernel-doc comment.

Agreed. checkpatch is just a guide, it does get things wrong, and we
don't insist it is 100% clean.

And the existing comment is much more specific:

   Sequence counter for @hw_stat_base, @hw_last_counter,
   and @reset_in_progress.

This makes it clear exactly what it should protect, and what it does
not protect.

    Andrew

---
pw-bot: cr

