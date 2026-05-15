Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0D9CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 10:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWCqvCsw488UrxsEEAVXsOu6HYtz2EaEDsBHVjiAQE0=; b=ZNLzDN5DyhwajfQUZnTbYaENUf
	sAemX9VScoNftvLmVA5HXSoTUbyKdjLGIgFqJZTaYY4XAwSr4aIB++zWxUm0/doopuzTqRlqMEO2Z
	LUcwaOAA3ksrNBH8ON1/8hzb2o5ZuBVei7CGQggBXso5y5eev//TUM59GO4thr1Gyd11PxJVt3FCg
	hpZqJfErA8RsUSTEf4045ni0FmNpz/gYjlACnjLiVeFujUOVw+QcDutHd2oTAIvF8pK1mnQUxASfX
	od6wkhP+2Z4NEDOsVFzCNIkNckTiRQPO6nsIVmv8iVyxRsYGYb0RuSTG1p7xvjc+ddG1bRaOh6vEX
	NR+PI9LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpQf-00000007zKs-2Noi;
	Fri, 15 May 2026 10:06:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpQc-00000007zK7-36BB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 10:06:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A54E52574;
	Fri, 15 May 2026 03:05:51 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68F4B3F7B4;
	Fri, 15 May 2026 03:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778839556; bh=jsu6XEXW/ycUYiQs2UGhLieyNt2HgGm38xKOuWtBQRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RyoTG2Ha473cFmGToKi56liP4pN/RaZunI+BPMGfIXANFiogOdrGTYE7HF9xC0XbP
	 IoiWz80170JW+1tC/FutmFKyXYlGleANET7nrAvZH83xY19ZoFOckm5dvjgxCX2Qtc
	 dTmS1UA8Jl7cYMd10XRtyHrqgeV8R3coh51TBOfo=
Date: Fri, 15 May 2026 11:05:54 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v6 04/13] coresight: etm4x: exclude ss_status from
 drvdata->config
Message-ID: <20260515100554.GK34802@e132581.arm.com>
References: <20260422132203.977549-1-yeoreum.yun@arm.com>
 <20260422132203.977549-5-yeoreum.yun@arm.com>
 <20260508152742.GI3778514@e132581.arm.com>
 <af8gp9rsY6zyo5r7@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af8gp9rsY6zyo5r7@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_030558_918970_DC2C6DB2 
X-CRM114-Status: GOOD (  14.77  )
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

On Sat, May 09, 2026 at 12:55:19PM +0100, Yeoreum Yun wrote:

> > >  	caps->nr_ss_cmp = FIELD_GET(TRCIDR4_NUMSSCC_MASK, etmidr4);
> > >  	for (i = 0; i < caps->nr_ss_cmp; i++) {
> > > -		drvdata->config.ss_status[i] =
> > > -			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
> > > +		drvdata->ss_status[i] = etm4x_relaxed_read32(csa, TRCSSCSRn(i));
> > > +		drvdata->ss_status[i] &= (TRCSSCSRn_PC | TRCSSCSRn_DV |
> > > +					  TRCSSCSRn_DA | TRCSSCSRn_INST);
> > 
> > It is fine for read these capacity bits when probe, but we need to clear
> > status when a session is starting to avoid the stale value left from
> > previous session:
> > 
> >   drvdata->ss_status[idx] &= ~(TRCSSCSRn_STATUS | TRCSSCSRn_PENDING);

> But, I want to clarify that the perf is one of exceptional case
> since the "etm4_parse_event_config()" is called at the "resume" of session
> for per-thread mode event.

Good point!

The right way would move etm4_parse_event_config() to setup AUX phase
(e.g., call it when build path).

> Anyway as we discussed, since now there have been no issue
> relavant for those bits, let the clear drvdata->ss_status at the
> etm4_parse_event_config().

I am fine to clear status in etm4_parse_event_config() in this series.

Thanks,
Leo

