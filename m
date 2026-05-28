Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D03ECD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 13:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=If3vZerzEkmt6MVj4d68C5CUANYuXl80c3rpyuwJWkE=; b=FDnnqy55yXMoNpwUiFf5INYz9v
	0qRkGiRKCPgq9BknwKvNgloGWRlJhT33rHJ+y+3cXLN/X/BU5Zx7oW5WNiF8o6ZPCWKctRP7NocLE
	Z6wtdy+tOl9FXlRp6QcNMXIeCHfHB9FpBTCVlYqZnRkDlHydXNVepDgD46dJLiITu513BNstzPwbx
	FTZYtqTbDeoU7h8K02b9xoS5JVDeIVutClwn88gVWaqJIClOWhKKL9C2bagKrhxpkKYIlkAuiZrct
	JswRSJx39zYxL8S6lNhXHDsXG7WprOL1uY+/5uBm7U7g2cYzLkSsNLYvtVEL6tpr/CpfvzgULWR/J
	yYtqQjOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSb4Z-00000005oAH-0wgX;
	Thu, 28 May 2026 13:46:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSb4X-00000005o9q-0SeV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 13:46:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77C5C4402;
	Thu, 28 May 2026 06:46:44 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 201923F632;
	Thu, 28 May 2026 06:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779976009; bh=4nxponVIkOLb70m0Mgu402MDpADCLWcz77FHIclzLpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X4ThdaIGWzSUqrfe1ax7ZT87GKkBfa/VEc0dJb+qZTihywfTCY/CnF5/FTvlxHC9F
	 lUhKHoVY3IXASUr04y4kqPfISa9M5GRNWf7afRapCmJtIinj6khKjicZl5B147+YXq
	 WhxODfsa6beHZolWMi+Hn+G4YsFVPsxURa7cqpyw=
Date: Thu, 28 May 2026 14:46:45 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v7 05/13] coresight: etm4x: exclude ss_status from
 drvdata->config
Message-ID: <ahhHRXezTX4DC5nC@e129823.arm.com>
References: <20260519154812.254884-1-yeoreum.yun@arm.com>
 <20260519154812.254884-6-yeoreum.yun@arm.com>
 <20260528133057.GD101133@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528133057.GD101133@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_064653_198619_A7BDECB6 
X-CRM114-Status: GOOD (  18.30  )
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

Hi Leo,

> On Tue, May 19, 2026 at 04:48:04PM +0100, Yeoreum Yun wrote:
> 
> [...]
> 
> > @@ -571,11 +571,11 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
> >  		etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
> >  
> >  	for (i = 0; i < caps->nr_ss_cmp; i++) {
> > -		/* always clear status bit on restart if using single-shot */
> > +		/* always clear status and pending bits on restart if using single-shot */
> >  		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
> > -			config->ss_status[i] &= ~TRCSSCSRn_STATUS;
> > +			drvdata->ss_status[i] &= ~(TRCSSCSRn_STATUS | TRCSSCSRn_PENDING);
> >  		etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
> > -		etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
> > +		etm4x_relaxed_write32(csa, drvdata->ss_status[i], TRCSSCSRn(i));
> >  		if (etm4x_sspcicrn_present(drvdata, i))
> >  			etm4x_relaxed_write32(csa, config->ss_pe_cmp[i], TRCSSPCICRn(i));
> >  	}
> > @@ -772,6 +772,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
> >  	/* Clear configuration from previous run */
> >  	memset(config, 0, sizeof(struct etmv4_config));
> >  
> > +
> 
> Unexpected new line?

Oops. I'll remove it.

> 
> > @@ -1497,8 +1498,9 @@ static void etm4_init_arch_data(void *info)
> >  	 */
> >  	caps->nr_ss_cmp = FIELD_GET(TRCIDR4_NUMSSCC_MASK, etmidr4);
> >  	for (i = 0; i < caps->nr_ss_cmp; i++) {
> > -		drvdata->config.ss_status[i] =
> > -			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
> > +		drvdata->ss_status[i] = etm4x_relaxed_read32(csa, TRCSSCSRn(i));
> > +		drvdata->ss_status[i] &= (TRCSSCSRn_PC | TRCSSCSRn_DV |
> > +					  TRCSSCSRn_DA | TRCSSCSRn_INST);
> 
> Since etm4_enable_hw() clears the TRCSSCSRn_STATUS and
> TRCSSCSRn_PENDING bits every time, here is no need to clear the
> status bits during probe.
> 
> In the future, we may want to preserve the status within a session and
> clear it only when starting a new session. Clearing the status bits here
> still cannot handle stale status across multiple sessions, so we can
> defer this improvement for later.

Yes. That would require near future as we discussed in offline.
but the at the initialisation perspective, it should ignore those bits
since that would be random value after reset.

So, I'll remain it as it is.

-- 
Sincerely,
Yeoreum Yun

