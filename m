Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC34C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 22:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4dzNG8eUGsRD43PwCQ61XFGX/P3BBHz9X4ch+L0XMs=; b=3n2w4SmcflTyjaZQ0515JXXow8
	ibhZW1XtOWBzz5pRY5f0IAvFlqn+GlpDSkXtFve82FNk00cgWPNfhfT0h0A9LD0lj1mwEEDPbhUdo
	WBphLVSlK+5VT5Q4J/3p1p5t5SToSsNjli3Hhp6DuFw2fQSEEav6S91CTEWkU+qH2DTtNiCTWTUWg
	ROPauGengamQjY9ElN7/exmDH4AWiK4GusPRd39T1RVZHXTHBGNAsKO4ptJ3ybx0ztiLpAY5QZwOE
	7M5yiQpCG8kXUwOOHVTh7b+nvmEfSQYp8c0d4iIGgkhwkjPjC9CWZvVoCSSao5v1/A4IQdVDkOiaQ
	zwd/gz2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5uz-00000009hhI-3VDZ;
	Wed, 02 Jul 2025 22:27:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5sd-00000009hPD-3OAx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 22:24:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CD9C4429C8;
	Wed,  2 Jul 2025 22:24:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54111C4CEEE;
	Wed,  2 Jul 2025 22:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751495078;
	bh=niWlz20tCdvY2IAP/jwLYa/1jI8eLqw71ef/KVXD2TM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WZNYA4/pyZhk90uFI2BciJ771zPo+7ojpTqvxp6Msu0pMkRuRqAAlh4q5BzVPRYRQ
	 nXqorJBWrRTr8C78bgAJTJYugk3Dxk2/PfflxbA8IAuLZDGTghrg99+SbdAUYkEB6d
	 B9NR5EYnFhgTjGhPay11DBzViHas1e4XAlTzJX1eZy63dlnwrdK8T3oUi4U3saPbDP
	 SV5QFk/1oa/YNFJuJIMvtWsyBd4Q2wFuX85vx7Cacnb86h3uHpq2o2i+c/8N1OVFdN
	 KtfWpBYd9AqUGsM02sL0/qNqr4ZxOYVUaVLmAZg5vZZVG4j3K0b/a6qOWye2ZeZIM2
	 4iWs51C4dN70Q==
Date: Thu, 3 Jul 2025 01:24:35 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, peterhuewe@gmx.de, jgg@ziepe.ca,
	stuart.yoder@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v4 0/2] generate boot_aggregate log in IMA with TPM using
 CRB over FF-A
Message-ID: <aGWxozDE4-qbQqg8@kernel.org>
References: <20250618102302.2379029-1-yeoreum.yun@arm.com>
 <aFs0of3uZdoMEJXc@kernel.org>
 <aFvRI5OwSLLKz300@e129823.arm.com>
 <aFwrBU4H0w9AXyQM@kernel.org>
 <aFwrf1HnsilrASzX@kernel.org>
 <20250625-chital-of-infinite-proficiency-fee4dc@sudeepholla>
 <aFxuZV3lwd2Uc90g@kernel.org>
 <20250626-busy-hilarious-octopus-47c2fc@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250626-busy-hilarious-octopus-47c2fc@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_152439_868258_2DE01FEE 
X-CRM114-Status: GOOD (  17.25  )
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

On Thu, Jun 26, 2025 at 08:53:39PM +0100, Sudeep Holla wrote:
> On Thu, Jun 26, 2025 at 12:47:17AM +0300, Jarkko Sakkinen wrote:
> > On Wed, Jun 25, 2025 at 08:35:33PM +0100, Sudeep Holla wrote:
> > > 
> > > If you are applying 1/2 too, feel free to add
> > > 
> > > Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> > > 
> > > I was initially thinking of taking it separately as there is no strict
> > > build dependency. But I am fine if you can take them together.
> > 
> > Hmm.. Yeah, if you insist to take them, that's fine for me too.
> > 
> 
> Ignore me 😄
> 
> > That said, I'm also happy to take care of them :-)
> > 
> 
> Yes, please take them via your tree.
> 
> > I'll append your review.
> 
> Thanks!

OK cool, cool just syncing up :-)

> 
> -- 
> Regards,
> Sudeep

