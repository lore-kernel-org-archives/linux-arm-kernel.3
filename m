Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB51C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 22:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VG5cehrtufXwn4wfPCnhMmY2L2e7CL5Ke+/7kjeXz58=; b=H5Zr5U5F+OO6VfWaqSHiX1v6cl
	bn3fGz6nmi0TLw+tbpUSo/Bu8YpnjDWVHCaMzBzAE8X30u5ZnJiZNDhb5wdDv2PN9tB5JIoOor+oV
	nM5LO3oGCOUwTrwwZozzlhq10k+RF1Z6LVjI7HZET28KqW1KHOyf0za6SX7mWivDpL+g1o9ymInyS
	Af4v289Snlmnd0LL0L/UQivKl8hcFePkg77BklNs7OyQ9rV6TSQC4sTXubhvtQCYf58UjSwRVOIKB
	zisJF04ZktEDspyo9ptdUYTfpcQ8edLhUGrIoUoN7dBl2HcLt8s9X1YSAzJcCgFrQo93wzCN488xz
	dEnWLA2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOkfh-00000005JjT-4AXy;
	Mon, 09 Jun 2025 22:08:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOjao-00000005E1I-0Qdb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 20:59:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 091AE4A8D1;
	Mon,  9 Jun 2025 20:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897AEC4CEEB;
	Mon,  9 Jun 2025 20:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749502780;
	bh=Q8wlcxSfI2C49/3WlyqJcY/1pWE9xD8JeXXXOkS61Eg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UvJlV8FkqEHOwffmigf9MVhomFOyzEqxs99x41Zi6PcTsgfOcCp/7yI7ZrFQHgjHM
	 sZ77HvPjPHRMgjGRhKPqfeB6jl2H+x5cEX9Zufj00QY7aiRC6qKfmCsz0+iAkalLd+
	 oUKf7OKBQ+bfJhct2DK/RPSdhefLG3Arng8x7b9E5migJp8p8Ij+BtaWWk304522Ww
	 GyIZtLDWA316nC2c2o2kfmtHK0EOCKfH0Z9St6VmTCNIcpC6qtZAda2notHVQndouY
	 n0iRb/Q6xoT00NoFbfb67cyC6mfOEfUwUJLTS5fcWmD7/eP26e1zJoQdcabI6IyDTN
	 c46/LMxGH/vpw==
Date: Mon, 9 Jun 2025 23:59:37 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: sudeep.holla@arm.com, peterhuewe@gmx.de, jgg@ziepe.ca,
	stuart.yoder@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH 2/2] tpm: tpm_crb_ffa: maunally register tpm_crb_ffa
 driver when it's built-in
Message-ID: <aEdLOb3V3EgBZJof@kernel.org>
References: <20250606105754.1202649-1-yeoreum.yun@arm.com>
 <20250606105754.1202649-3-yeoreum.yun@arm.com>
 <aEMdGXXBSym7cXmK@kernel.org>
 <aEMvm2MW9bBXf2gM@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEMvm2MW9bBXf2gM@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_135942_165538_B02C142C 
X-CRM114-Status: GOOD (  17.10  )
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

On Fri, Jun 06, 2025 at 07:12:43PM +0100, Yeoreum Yun wrote:
> Hi Jarkko,
> 
> > > To integrate tpm_event_log with IMA subsystem,
> > > tpm_crb and tpm_crb_ffa driver should be built as built-in
> > > (CONFIG_TCG_CRB=y && CONFIG_TCG_CRB_FFA=y).
> > >
> > > However, this could make failure for ima_init() gets tpm chip when
> > > each initcall function deployed like:
> > >
> > > 0000000000000888 l       .initcall6.init	0000000000000000 crb_acpi_driver_init
> > > 000000000000088c l       .initcall6.init	0000000000000000 tpm_crb_ffa_driver_init
> >
> > The only failure I see is the patch 1/2 which changes init call level,
> > and leaves kernel Git to a broken state.
> >
> > It breaks the famous "zero regressions policy".
> >
> > BR, Jarkko
> 
> Sorry, would you let me know what is broken more detail?
> IMHO, by changing the init call level for ffa_init()
> it's called early than before device_initcall() and it seems not to
> break anything.
> 
> What breaks do you mean?

Your description in the cover letter and commit messages in unclear
and convoluted. Please describe exact causalities instead of something
not defined could cause "failure" (which is also abstract concept).

I'll check the next round.

> 
> Thanks.
> 
> --
> Sincerely,
> Yeoreum Yun

BR, Jarkko

