Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA29C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 20:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWzlAEG1kZyVlC3vTzcpmOzEgekoUudSO53s2QvuU+U=; b=2GtSDCzFRFogCkyxd4C8aH4aqK
	Jnq37gW95dexcYlUj0UlpFYYlhZBosjHEjVnX3Gf4Oxxg2xjs+CQ2i5U2zXbdJ0MkcBnevKuQGwXR
	RA5Z6gPbK6Fmrz51XaJnwuf4kZftq4cYCpFC3O3AttC22jJRcvNsnCN8LNE1G5JMQBr4U59qVXZEO
	uTHsSzjLIawx2nE/7MCviOOOOPvQUq+Od71H5b342kaU8LjwzkTV6E9xDQowGgMAIsfrmb3oqYI94
	caNaHG45hILfkuZrc2KRr33HXJUTW76Xi1Xt3G/l+R9UHGCoEMspgb7DDJZyZceyCyxLRQFER5RxH
	aDqNZsvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUX0v-00000009uSi-3fZN;
	Wed, 25 Jun 2025 20:46:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUTWj-00000009PrV-1UZy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 17:03:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 76C92A52CEB;
	Wed, 25 Jun 2025 17:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0E2C4CEEB;
	Wed, 25 Jun 2025 17:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750870992;
	bh=R2ys2tdAkGhb2p11OPXkd5n53kwZkob3IDlhROQoduc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qhUlDfOvKkvAcRx0Im/EG4SGVu4aIoZZNzNgkcuP8OaY08OcOY4nO8XmWdWgWneB+
	 WsvqjMEaLe4K718UamBa4a7jjaejQ3P3iMLQJw+IwSNTt4w/D5QSA3PU0S28x94/bm
	 a5FeCzuXlXGEvZD5YvewEkzp2d3J8DO7kqOUnvmVta6dlq4hg/KQlBvBBYQXEV61UZ
	 kjWFenc8ptyK39MXNGAHX5SgP/j1I25cQDyNEW3D6g8MdvNnaB8A+G15f1YmTBraDd
	 wNbe7O6Rfg4oAjrqt92N0aDAYeBfiX7dHNEZGTe76rLDbRPXrlc+WKc42ymChEtQIH
	 WRyd6IMTwDf4Q==
Date: Wed, 25 Jun 2025 20:03:08 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: sudeep.holla@arm.com, peterhuewe@gmx.de, jgg@ziepe.ca,
	stuart.yoder@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v4 2/2] tpm: tpm_crb_ffa: try to probe tpm_crb_ffa when
 it's built-in
Message-ID: <aFwrzEPUAbLaOAgY@kernel.org>
References: <20250618102302.2379029-1-yeoreum.yun@arm.com>
 <20250618102302.2379029-3-yeoreum.yun@arm.com>
 <aFs02ZgVyGTg2cJx@kernel.org>
 <aFvRePYyX/Xuxe8N@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFvRePYyX/Xuxe8N@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_100313_466861_5AEA9EFE 
X-CRM114-Status: GOOD (  19.80  )
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

On Wed, Jun 25, 2025 at 11:37:44AM +0100, Yeoreum Yun wrote:
> Hi Jarkkok,
> 
> > > --- a/drivers/char/tpm/tpm_crb_ffa.c
> > > +++ b/drivers/char/tpm/tpm_crb_ffa.c
> > > @@ -115,6 +115,7 @@ struct tpm_crb_ffa {
> > >  };
> > >
> > >  static struct tpm_crb_ffa *tpm_crb_ffa;
> > > +static struct ffa_driver tpm_crb_ffa_driver;
> > >
> > >  static int tpm_crb_ffa_to_linux_errno(int errno)
> > >  {
> > > @@ -168,13 +169,23 @@ static int tpm_crb_ffa_to_linux_errno(int errno)
> > >   */
> > >  int tpm_crb_ffa_init(void)
> > >  {
> > > +	int ret = 0;
> > > +
> > > +	if (!IS_MODULE(CONFIG_TCG_ARM_CRB_FFA)) {
> > > +		ret = ffa_register(&tpm_crb_ffa_driver);
> > > +		if (ret) {
> > > +			tpm_crb_ffa = ERR_PTR(-ENODEV);
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > >  	if (!tpm_crb_ffa)
> > > -		return -ENOENT;
> > > +		ret = -ENOENT;
> > >
> > >  	if (IS_ERR_VALUE(tpm_crb_ffa))
> > > -		return -ENODEV;
> > > +		ret = -ENODEV;
> > >
> > > -	return 0;
> > > +	return ret;
> > >  }
> > >  EXPORT_SYMBOL_GPL(tpm_crb_ffa_init);
> > >
> > > @@ -369,7 +380,9 @@ static struct ffa_driver tpm_crb_ffa_driver = {
> > >  	.id_table = tpm_crb_ffa_device_id,
> > >  };
> > >
> > > +#ifdef MODULE
> > >  module_ffa_driver(tpm_crb_ffa_driver);
> > > +#endif
> > >
> > >  MODULE_AUTHOR("Arm");
> > >  MODULE_DESCRIPTION("TPM CRB FFA driver");
> > > --
> > > LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> > >
> >
> > NAK
> 
> If you NACK with your comment on the cover letter,
> Would you check the my comments please?
> 
> Actually, this wouldn't be fixed with the Kconfig.

I got into the same page (see my response to your response at 0/2) :-)

Thanks for the patience.

> 
> Thanks
> 
> --
> Sincerely,
> Yeoreum Yun

BR, Jarkko

