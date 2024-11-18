Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B44D4920F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 12:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dT0210/vTOZFYSLIMcONKk7Kp1Y49ER7EWvlsmiZEXU=; b=NL0bB/xNAJTpW6Vy99D7SWtF7N
	DSNEflqUMMoNJfDlKx+Cdl6jTLe4tLQsq7mqhrQbowAsCp5+g9W8ws1FXcYg257tEnzy+/3uC/kTD
	gKZuSwrc+mkYdIOVtCHk2TM4ff53/fmPvOW3u2NaU30ciBVRMY7JFZ2hf2teP8RremW7/1mU+RvPH
	HWv4Rq9Sd3UIRv1iypy+BbkgDcWYEdCBGMqIwPWu4I4ISRZNTUyy5BWVyL1hbl2N3/APYrrR8D/Ds
	wLTEEXfZouU2KO1aDys7PmCSgQYTVCJ8PcWYmOBIjZaUuNQAYziD3TPKLMbu0kOdQu0O/fyrj473V
	rggEiokQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD0Vw-00000009Ltq-1CW9;
	Mon, 18 Nov 2024 12:05:56 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD0Uz-00000009Ljk-3P2m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 12:04:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1731931492;
	bh=SJM0ho/3D4sWt0Ay5bp6OufDOilYcKEaL63lve+VGPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r9h46YPhvdrf0l1i4Wew5j1uXas2mF7c5Da2uX+xtlsnOclY+oEkXcZlky8i5RwxC
	 pmCShqYjEGsdHdlZDIfmAptJMAR4gEpQvsAVQA01BzcR8IaeT1ZQjmh2P4AjA9Y86V
	 nidui5IbPf5ufWtxc9dtWQtmOnYF5I9nNdVBoEdg=
Date: Mon, 18 Nov 2024 13:04:51 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] perf: arm-ni: Fix attribute_group definition syntax
Message-ID: <b09e1bec-f42c-4f36-8548-b912f59a88f4@t-8ch.de>
References: <20241117-arm-ni-syntax-v1-1-1894efca38ac@weissschuh.net>
 <fc308d9b-9b8b-4932-9f24-1756f5c089db@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc308d9b-9b8b-4932-9f24-1756f5c089db@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_040457_993198_85A57009 
X-CRM114-Status: GOOD (  23.00  )
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

On 2024-11-18 11:55:17+0000, Robin Murphy wrote:
> On 2024-11-17 10:20 am, Thomas Weißschuh wrote:
> > The sentinel NULL value does not make sense and is a syntax error in a
> > structure definition.
> 
> What error? It's an initialiser following a designator in a structure
> *declaration*, and the corresponding bin_attrs member is a pointer, so NULL
> is a perfectly appropriate value to initialise it with.

Yes, you are correct. The warning only occurs in my series which changes
bin_attrs to a union [0] and I got confused due to some missing and
inconsisteny build bot feedback.

> Of course that is redundant when it's static anyway, and indeed wasn't
> actually intentional, but it's also not doing any harm - the cosmetic
> cleanup is welcome, but is not a stable-worthy fix.

Agreed, it's not worthy for stable.
Actually I want to make this patch part of a series, so please ignore
it for now.

> Thanks,
> Robin.

[0] https://lore.kernel.org/lkml/20241115-b4-sysfs-const-bin_attr-group-v1-1-2c9bb12dfc48@weissschuh.net/

> > Remove it.
> > 
> > Fixes: 4d5a7680f2b4 ("perf: Add driver for Arm NI-700 interconnect PMU")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> > Cc stable because although this commit is not yet released, it most
> > likely will be by the time it hits mainline.
> > ---
> >   drivers/perf/arm-ni.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
> > index 90fcfe693439ef3e18e23c6351433ac3c5ea78b5..fd7a5e60e96302fada29cd44e7bf9c582e93e4ce 100644
> > --- a/drivers/perf/arm-ni.c
> > +++ b/drivers/perf/arm-ni.c
> > @@ -247,7 +247,6 @@ static struct attribute *arm_ni_other_attrs[] = {
> >   static const struct attribute_group arm_ni_other_attr_group = {
> >   	.attrs = arm_ni_other_attrs,
> > -	NULL
> >   };
> >   static const struct attribute_group *arm_ni_attr_groups[] = {
> > 
> > ---
> > base-commit: 4a5df37964673effcd9f84041f7423206a5ae5f2
> > change-id: 20241117-arm-ni-syntax-250a83058529
> > 
> > Best regards,
> 

