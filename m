Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F114DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 16:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8RgrGQ/ocn8tZoKv1E1Vh37vzngNMjydYpe0maR/z+w=; b=Dsu9Q1bMK5QosPgLF6OZER1Qpd
	8wWUDTdkVCqF2pdKMBka+h/N+cy9bExZlzgdOK/SZO+vzEtmupxUpLngyeU2Ldb9hPs4DXAoDAzKW
	veJs0We6MSrYK5v9Oe/oXlwXQsJMzA3IZWcyv8lQqvb0ron7H2Sk/z6h/nOexP6xoBRvQ0+G7HBwW
	Al10lAnQ0r8R/fDfhueO2Xm3FKcGbbvDPlwHeeXS7RkejGn8PXjY+MxIW0aIOhS7C1fubmBzI+uvI
	J5UYTB9NrgY8fT54kgZg9pwxbecq1H5Xb0orBGvKOPEYwMifePS74MEnlFlYxkTcmCoTh1/8E1v2k
	FHBl6sYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3Zl-0000000CBHc-2kRa;
	Tue, 10 Dec 2024 16:59:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3XD-0000000CAyq-1kK0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 16:56:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A69091007;
	Tue, 10 Dec 2024 08:56:58 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 917773F58B;
	Tue, 10 Dec 2024 08:56:28 -0800 (PST)
Date: Tue, 10 Dec 2024 16:56:25 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev
Subject: Re: [PATCH V2 5/7] arm64/cpufeature: Add field details for
 ID_AA64DFR1_EL1 register
Message-ID: <Z1hyueAQJTroNIRW@J2N7QTR9R3>
References: <20241028053426.2486633-1-anshuman.khandual@arm.com>
 <20241028053426.2486633-6-anshuman.khandual@arm.com>
 <20241210164144.GA16039@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210164144.GA16039@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_085631_503286_6A585050 
X-CRM114-Status: GOOD (  16.33  )
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

On Tue, Dec 10, 2024 at 04:41:44PM +0000, Will Deacon wrote:
> On Mon, Oct 28, 2024 at 11:04:24AM +0530, Anshuman Khandual wrote:
> > +static const struct arm64_ftr_bits ftr_id_aa64dfr1[] = {
> > +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_ABL_CMPs_SHIFT, 8, 0),
> > +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_DPFZS_SHIFT, 4, 0),
> > +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_EBEP_SHIFT, 4, 0),
> > +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_ITE_SHIFT, 4, 0),
> > +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_ABLE_SHIFT, 4, 0),
> > +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_PMICNTR_SHIFT, 4, 0),
> > +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_SPMU_SHIFT, 4, 0),
> > +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_CTX_CMPs_SHIFT, 8, 0),
> > +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_WRPs_SHIFT, 8, 0),
> > +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_BRPs_SHIFT, 8, 0),
> > +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_SYSPMUID_SHIFT, 8, 0),
> > +	ARM64_FTR_END,
> > +};
> 
> I think I mentioned this on an earlier series, but it would be useful to
> see some justification in the commit message as to why some of these
> features are considered STRICT vs NONSTRICT and why LOWER_SAFE is
> preferred over EXACT.
> 
> For example, why is EBEP strict whereas other PMU-related fields aren't?
> Why is the CTX_CMPs field treated differently to the same field in DFR0?
> 
> I'm not saying the above table is wrong, it just looks arbitrary without
> the justification.

FWIW, Anshuman and I discussed that on the v1 thread, after this v2
thread was posted. Anshuman promised to provide some rationale and make
some updates in the next version (i.e. v3):

  https://lore.kernel.org/linux-arm-kernel/8efe902c-8b9f-494a-b9da-430d8ced32ef@arm.com/

Mark.

