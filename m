Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C94CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 09:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=283VyeDOYN6khzf+AS7zjUfNyo5I57uL41Xqvi4jTEM=; b=3ZhcuffXbqQfFBAOcXFfEBBlbD
	eG+wvbHsjgxQ6Q7v0gtu3r2dqRqsDLuMKFxgfGMHPJ4s4PO1hhgBr2b0EjLj8SpfdEjue7DTcpaVP
	OgdGQDHWL1OrgU9Fxb4/e6YgcFN6phBCKODZl2F+XhlpUVJiZjxscl2ojPA542tO/QKZWMgGnStVY
	MXyDM3MlUQ20puJtxQUTnFUSf3EdMRxEkKaE3a3hVc4FhzgMB1u58em1avNpEVh4ALvb/SPTl+gRi
	mzXbyGYhV/oL+jSWG0yARWRPoV89+dY0GnON2CAzq2eZwsq0PDuGH4SDYALKlmOofvfHjgcdenh+e
	JW9tu0Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSPg-000000054Y9-3Izk;
	Thu, 14 May 2026 09:31:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSPf-000000054Xb-09JH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 09:31:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A91844151;
	Thu, 14 May 2026 09:31:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CC8C2BCB3;
	Thu, 14 May 2026 09:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778751086;
	bh=Szhi4DCrVMTbowBda72sF3jcnYffCJVUI6kqx9OCt1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aj3J/mC3MBuxwesfKfl/BkZQvEqu+k+Bsu6C+HEOTcZNSnxk391cxb9lFWCjPMZrV
	 Z4VZjipmw65C/6E3zUZuUSXA3OfYicv+YROnQOqMp0QGteYeZFmbhNcqcV3mVXpwRg
	 N8zj8PGeFegC18eLapnUYsICSKwGubJn2nVpeV/ULp/ZQUbu4ZPYCzJ0guTsNfHEiv
	 BQ//00RZyQT2n/YaTn0PoloinP/FIRXGSELbqDBoImyJBrEIL2LBJ2okD1fTskUbmG
	 55L8c3FO51RqxtEbbXrP2TCJ+UTdJa/IpZC0/rG/gzi8q9q4OPMTOmEBONNVbmu2oM
	 8r7qG5QsMAMuQ==
Date: Thu, 14 May 2026 10:31:23 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jamie Nguyen <jamien@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH] firmware: arm_ffa: honor descriptor size in
 PARTITION_INFO_GET_REGS
Message-ID: <20260514-generous-undetectable-mastiff-cc43d3@sudeepholla>
References: <20260513032800.68807-1-jamien@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513032800.68807-1-jamien@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_023127_110665_901D8640 
X-CRM114-Status: GOOD (  22.00  )
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

On Tue, May 12, 2026 at 08:28:00PM -0700, Jamie Nguyen wrote:
> __ffa_partition_info_get_regs() walks the response with a hardcoded
> 24-byte stride (regs += 3) even though the SPMC tells us the actual
> per-descriptor size via PARTITION_INFO_SZ in x2[63:48]. The size is
> read into buf_sz and then thrown away.
> 
> That works while every SPMC returns the FF-A v1.1 layout, but it falls
> apart against a v1.3 SPMC returning the 48-byte descriptor. The loop
> strides over half a descriptor at a time and ends up parsing every
> other entry from a slice of two adjacent ones.
> 
> The FF-A spec (v1.2, section 18.5) says that the producer should
> report the descriptor size, and the consumer is supposed to stride by
> that size and ignore any trailing fields it doesn't understand. The
> non-REGS path (__ffa_partition_info_get) does this already, and the
> REGS path should match.
> 
> Use buf_sz for the stride, and bail out with -EPROTO if the SPMC
> reports something we can't safely walk.
> 
> Fixes: 7bc0f589c81d ("firmware: arm_ffa: Fix big-endian support in __ffa_partition_info_regs_get()")
> Signed-off-by: Jamie Nguyen <jamien@nvidia.com>
> ---
>  drivers/firmware/arm_ffa/driver.c | 35 ++++++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> index c72ee4756585..b712e8a03dab 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -321,6 +321,22 @@ __ffa_partition_info_get(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
>  #define PART_INFO_ID(x)		((u16)(FIELD_GET(PART_INFO_ID_MASK, (x))))
>  #define PART_INFO_EXEC_CXT(x)	((u16)(FIELD_GET(PART_INFO_EXEC_CXT_MASK, (x))))
>  #define PART_INFO_PROPERTIES(x)	((u32)(FIELD_GET(PART_INFO_PROPS_MASK, (x))))
> +
> +/*
> + * FF-A v1.2 section 13.9 Table 13.40: registers x3..x17 carry the partition
> + * descriptors, i.e. 15 u64 of payload per FFA_PARTITION_INFO_GET_REGS call.
> + */
> +#define FFA_PART_INFO_REGS_PAYLOAD_U64	15
> +
> +/*
> + * FF-A v1.1 partition information descriptor (FF-A v1.2 section 6.2.1
> + * Table 6.1): id (2) + exec_ctxt (2) + properties (4) + UUID (16) = 24
> + * bytes. This is the minimum size the SPMC must report; the kernel reads
> + * exactly these fields and ignores any trailing ones per the forward-
> + * compatibility rules in FF-A v1.2 section 18.5.
> + */

I can't see any such details is the above mention version and section.
Can you confirm you are looking at [1] ?

-- 
Regards,
Sudeep

[1] https://developer.arm.com/documentation/den0077/j

