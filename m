Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65857C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 16:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0bnROaWvCcaygqjX5kuN3Xy7PkaB0JzSWi3o0PEyWIQ=; b=yV8yuOhMX5qECoZOTaqFL+Kis0
	R8Flq/cx1p/o1kkx8QFyNZzIz3mO6oDY7qq1aJYoy+qzVoga9Rp6SjcmHNatrvCrE4vMpgNN4/9kO
	L9wdxsJvKj3W3ADhGQVq4K9KGAuLp6wZyOiQ4DluLTurjyy1b2uWlLgp3H0aI/2clsTxw9v7FdoI+
	FwKYbeBpHqTWvF2tdcECc+DYJLDC/UPsqYOHOKYhiVqaM6SoPZfrq2prLsJVbtjRHyQS08ihUotJV
	wWLktnjRUD/EHbwf1I1WCUPYrWy59pD+Uv352AWcOwOD0BensJYv3t6RdEnJdB0gGqQL2wVD7q/3B
	Mk5mbYPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9nrX-0000000AG3c-2GbZ;
	Tue, 29 Apr 2025 16:31:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mFW-0000000A0SO-2h50
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 14:47:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0bnROaWvCcaygqjX5kuN3Xy7PkaB0JzSWi3o0PEyWIQ=; b=n4b0RKLJdumk9kbGDqKBoR57nu
	RzvDB2SwwgWaQILKhwREDITy/abiKa+0ei18FTbqTH8hmFBp77Fbpy2mPSX+VxNrSOm4r13jeBH0R
	8EcUHPBzpVoq2y2hhFpvBJ5dAkBs4CRPN8cgRu0bMSu0xeatcJSPFLNgzBnLQLl0qvwmCrsAxDfbI
	vNmvT6UlAgvHygvQxG7KumpOqHhJNSNJKVHC0JeJBoMm/pdVo37lueb3jwPFi7R7ijI4PUK0Lkxqs
	2af4rNObA55SK8Fgl5RqnMazRnw0HbEzIV2qXZPRhT+levWvn97rxgQ15ZKVU6BYCRdjwO0Xt+Gnc
	i+KaNBeg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9mFT-0000000DPIJ-0F6L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 14:47:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7469944D59;
	Tue, 29 Apr 2025 14:47:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260D3C4CEE9;
	Tue, 29 Apr 2025 14:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745938067;
	bh=MkI4ziZBimRv816hWldVx0OhLFYQifsD85oE9/WnLRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WounUNd0eulkbpb9nJFmNARDRgOJTxWgeMgzH+GDzDf531FCG9u/sJRkf8STQXOoL
	 83QzAImFpqMM1G17D15FJtTsD5R2wn2IrUxESFrKXDJbgRag1YixTQUbloDXDL9vKP
	 7G03r2CI8E4gKGRiQ2KUj7OqbcnX67iSeTmYaeXJnCIRD6WXVycSpTGOnKf9z7zxW7
	 0ki19ufPc6GaekIxi0XTBarycL659yJyvh5/dyGEXVjOretV0Lvgt4QVrAkrJLFZjY
	 K9ViELGkkrG+xpkBX8ccC4JkJra8R3/p33ncT5agcM8OUBX+ecboK5AhAil73NpKrg
	 N8zBNzVv/l9YA==
Date: Tue, 29 Apr 2025 15:47:40 +0100
From: Will Deacon <will@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, catalin.marinas@arm.com,
	maz@kernel.org, oliver.upton@linux.dev, corbet@lwn.net,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	yangyicong@hisilicon.com, joey.gouly@arm.com, yuzenghui@huawei.com,
	shuah@kernel.org, jonathan.cameron@huawei.com,
	shameerali.kolothum.thodi@huawei.com, linuxarm@huawei.com,
	prime.zeng@hisilicon.com, xuwei5@huawei.com,
	tangchengchang@huawei.com
Subject: Re: [PATCH v2 1/6] arm64: Provide basic EL2 setup for FEAT_{LS64,
 LS64_V} usage at EL0/1
Message-ID: <20250429144739.GB26174@willie-the-truck>
References: <20250331094320.35226-1-yangyicong@huawei.com>
 <20250331094320.35226-2-yangyicong@huawei.com>
 <957ccba4-2ae1-4358-b62d-3b5c44d7f1ca@arm.com>
 <a520bb9c-839d-fd96-7ecf-365371e65e44@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a520bb9c-839d-fd96-7ecf-365371e65e44@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_154751_330471_A4428AEF 
X-CRM114-Status: GOOD (  19.82  )
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

On Mon, Apr 07, 2025 at 11:50:45AM +0800, Yicong Yang wrote:
> On 2025/4/3 17:04, Suzuki K Poulose wrote:
> > On 31/03/2025 10:43, Yicong Yang wrote:
> >> From: Yicong Yang <yangyicong@hisilicon.com>
> >>
> >> Instructions introduced by FEAT_{LS64, LS64_V} is controlled by
> >> HCRX_EL2.{EnALS, EnASR}. Configure all of these to allow usage
> >> at EL0/1.
> >>
> >> This doesn't mean these instructions are always available in
> >> EL0/1 if provided. The hypervisor still have the control at
> >> runtime.
> >>
> >> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> >> ---
> >>   arch/arm64/include/asm/el2_setup.h | 12 +++++++++++-
> >>   1 file changed, 11 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> >> index ebceaae3c749..0259941602c4 100644
> >> --- a/arch/arm64/include/asm/el2_setup.h
> >> +++ b/arch/arm64/include/asm/el2_setup.h
> >> @@ -57,9 +57,19 @@
> >>           /* Enable GCS if supported */
> >>       mrs_s    x1, SYS_ID_AA64PFR1_EL1
> >>       ubfx    x1, x1, #ID_AA64PFR1_EL1_GCS_SHIFT, #4
> >> -    cbz    x1, .Lset_hcrx_\@
> >> +    cbz    x1, .Lskip_gcs_hcrx_\@
> >>       orr    x0, x0, #HCRX_EL2_GCSEn
> >>   +.Lskip_gcs_hcrx_\@:
> > 
> > minor nit: For consistency, could we rename this "set_ls64", similar to "set_hcrx" ?
> > 
> 
> IIUC, set_xxx really touches the registers and skip_xxx should just check and prepare
> the feature bits. so here using .Lskip_gcs_hrcx_\@ should be more proper and consistent
> with other places in el2_setup.h, like __init_el2_debug/__init_el2_fgt which also use
> .Lskip_xxx for skipping an unsupported feature?

fwiw, I think the label names are fine as you have them.

Will

