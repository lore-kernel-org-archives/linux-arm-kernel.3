Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33244C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 10:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLre0J7phx1M8RNlFf77e/G5IGuIZamAQ16l81/Lwls=; b=QuyUyoD+LhwB2bOVAF24c2CNHr
	q5bPBd/e5P2WfBKlvEs4LTAc897TPIQRgLELwhhQf8IfATH2TeSiZuc5EwoNV5dTy6+LrIawJ1y/F
	wDEgDKWzAApLyp7CuO5W3+fS6fOIfMGXqt4n38O5yke5HH18SLULC7pRmemD6ur26fglS+mNpOz5d
	agPsDXMAn2gHo3uSWyBMMpzxi9Zqc5fUpWp11o6i7WOKShzr340SgfptE1kTtSBx06VQ3D3ePxMu9
	OgGYCQpFv9e0nHIgc87Whtpf7qTm3YmdLploLSb6GiivHpPyO8u95XffBnZxoZnxuG43F6UiKq+v2
	/O9lJ1lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPfHt-0000000D0Z1-1j22;
	Thu, 12 Jun 2025 10:36:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPe5S-0000000Cnfs-1z7Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 09:19:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C2D7153B;
	Thu, 12 Jun 2025 02:18:45 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C22A3F66E;
	Thu, 12 Jun 2025 02:19:05 -0700 (PDT)
Date: Thu, 12 Jun 2025 10:19:03 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] coresight: stm: Remove redundant NULL checks
Message-ID: <20250612091903.GW8020@e132581.arm.com>
References: <20250611-arm_cs_fix_smatch_warning_v1-v1-0-02a66c69b604@arm.com>
 <20250611-arm_cs_fix_smatch_warning_v1-v1-1-02a66c69b604@arm.com>
 <28ccdeaa-865e-4e81-8a95-eaec9b2754ef@arm.com>
 <CAJ9a7ViTTVzXifBc0u_sB54Q71MDVk40=53TfK4OfXwy2vL3bg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7ViTTVzXifBc0u_sB54Q71MDVk40=53TfK4OfXwy2vL3bg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_021906_553784_DAB13D6C 
X-CRM114-Status: GOOD (  19.85  )
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

On Thu, Jun 12, 2025 at 09:28:42AM +0100, Mike Leach wrote:
> On Thu, 12 Jun 2025 at 06:19, Anshuman Khandual
> <anshuman.khandual@arm.com> wrote:
> >
> >
> >
> > On 11/06/25 8:14 PM, Leo Yan wrote:
> > > container_of() cannot return NULL, so the checks for NULL pointers are
> > > unnecessary and can be safely removed.
> > >
> > > As a result, this commit silences the following smatch warnings:
> > >
> > >   coresight-stm.c:345 stm_generic_link() warn: can 'drvdata' even be NULL?
> > >   coresight-stm.c:356 stm_generic_unlink() warn: can 'drvdata' even be NULL?
> > >   coresight-stm.c:387 stm_generic_set_options() warn: can 'drvdata' even be NULL?
> > >   coresight-stm.c:422 stm_generic_packet() warn: can 'drvdata' even be NULL?
> > >
> > > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > > ---
> > >  drivers/hwtracing/coresight/coresight-stm.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> > > index e45c6c7204b4491e0f879bc7d5d445aa1d3118be..464b0c85c3f7d3519169d62a51e9f8c6281b5358 100644
> > > --- a/drivers/hwtracing/coresight/coresight-stm.c
> > > +++ b/drivers/hwtracing/coresight/coresight-stm.c
> > > @@ -342,7 +342,7 @@ static int stm_generic_link(struct stm_data *stm_data,
> > >  {
> > >       struct stm_drvdata *drvdata = container_of(stm_data,
> > >                                                  struct stm_drvdata, stm);
> > > -     if (!drvdata || !drvdata->csdev)
> > > +     if (!drvdata->csdev)
> > >               return -EINVAL;

> I'd agree that the container_of() cannot return NULL, but what happens
> if stm_data is NULL?
> Perhaps the NULL check was on the wrong parameter?

The pointer "stm_data" should be safe.  The data structure is allocated
in probe and released in the remove, the structure "stm_data" is safely
accessed during runtime.

If stm_data really has NULL pointer issue, we should already receive
alarms for kernel oops :)

Thanks,
Leo

