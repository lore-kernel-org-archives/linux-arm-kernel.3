Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B65CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 11:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u9gLtNICG7GXvdDj0CurlevSJS7RrSBqLBBlNByEBoE=; b=gFsbBkXgjIJwqh/0Auht6s9z5x
	BRkLgn4KbZiYHJt76Bl+q566hW2eMaasDRDb7ybpD6CuaOYpmZV4TxIU+MGtJeRszqDFxlphvD6wl
	Cgeztxzn3+O1CRTMvFZB96SxNDnqejaqvncw4VA2qW8ECnt/dK7aKpTa1E4LevqMu5GkVTbsGxKZg
	VB+zU6lpW11FfQJ4u7kSiUpV27KTsbAsz8wyJIYZonu+J/iqqjBBlP3uMJMb0BLcmAQVmK3J9+e7P
	PM6ymsYVHTcjvCrVZ1OUsgkGSqxx/Rej5TlpcTyaEkQaHkJSsyqptAH5TsywcQmu86ImuJKtN88wB
	A8WJcNrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLgHK-00000008sb0-3AB5;
	Sat, 09 May 2026 11:55:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLgHH-00000008saK-2hoW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 11:55:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 138C52454;
	Sat,  9 May 2026 04:55:18 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E45B43F763;
	Sat,  9 May 2026 04:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778327723; bh=JKDorVrqgPYt76T47+Dr9mhHeScyJUMoQtzohtWxRgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FPFd+mrFRP4jVNf/a5pNTb1XKaHS0bbRi/TOMaBCm104UhyBCwXaIwFWbly7xv5JR
	 CK589ANcjMbiPIGL9hxz9MB8PFHWQ6R7CT/51Qln5M7VlekA8/vr8lZuIStmIlmO03
	 GOLiG7YaPimdJPyRG2Ucrae8QDpYQlWZ21TTrCgs=
Date: Sat, 9 May 2026 12:55:19 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v6 04/13] coresight: etm4x: exclude ss_status from
 drvdata->config
Message-ID: <af8gp9rsY6zyo5r7@e129823.arm.com>
References: <20260422132203.977549-1-yeoreum.yun@arm.com>
 <20260422132203.977549-5-yeoreum.yun@arm.com>
 <20260508152742.GI3778514@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508152742.GI3778514@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_045527_961743_E31B0C41 
X-CRM114-Status: GOOD (  20.87  )
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

> On Wed, Apr 22, 2026 at 02:21:54PM +0100, Yeoreum Yun wrote:
> 
> [...]
> 
> > @@ -573,11 +573,9 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
> >  		etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
> >  
> >  	for (i = 0; i < caps->nr_ss_cmp; i++) {
> > -		/* always clear status bit on restart if using single-shot */
> > -		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
> > -			config->ss_status[i] &= ~TRCSSCSRn_STATUS;
> >  		etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
> > -		etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
> > +		/* always clear status and pending bits on restart if using single-shot */
> > +		etm4x_relaxed_write32(csa, 0x0, TRCSSCSRn(i));
> 
> After confirmed with hardware team, we should preserve status bits
> (including STATUS and PENDING bits) during a session. So here we should
> set drvdata->ss_status to TRCSSCSRn.
> 
> > @@ -1503,8 +1501,9 @@ static void etm4_init_arch_data(void *info)
> >  	 */
> >  	caps->nr_ss_cmp = FIELD_GET(TRCIDR4_NUMSSCC_MASK, etmidr4);
> >  	for (i = 0; i < caps->nr_ss_cmp; i++) {
> > -		drvdata->config.ss_status[i] =
> > -			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
> > +		drvdata->ss_status[i] = etm4x_relaxed_read32(csa, TRCSSCSRn(i));
> > +		drvdata->ss_status[i] &= (TRCSSCSRn_PC | TRCSSCSRn_DV |
> > +					  TRCSSCSRn_DA | TRCSSCSRn_INST);
> 
> It is fine for read these capacity bits when probe, but we need to clear
> status when a session is starting to avoid the stale value left from
> previous session:
> 
>   drvdata->ss_status[idx] &= ~(TRCSSCSRn_STATUS | TRCSSCSRn_PENDING);
> 
> We can do this in etm4_parse_event_config() for perf mode, and might
> create a new function (say etm4_parse_sysfs_config()) for preparing
> config for sysfs mode?
> 

As we discussed in offline, those bits should be cleared at the begining
of the session. so clearing drvdata->ss_status at start of session
in each mode is fine for me and for future integration for cpu suspend/resume.

But, I want to clarify that the perf is one of exceptional case
since the "etm4_parse_event_config()" is called at the "resume" of session
for per-thread mode event.

TBH, We don't have some specific usage how STATUS or PENDING bit could
be used with perf session and until now those bits are always cleared 
at the time of "sched-in" though we need to keep those bits theoretically.

Anyway as we discussed, since now there have been no issue
relavant for those bits, let the clear drvdata->ss_status at the
etm4_parse_event_config() or when setting a active config for start/resume
in this patchset and let me fix this with another patchset.

-- 
Sincerely,
Yeoreum Yun

