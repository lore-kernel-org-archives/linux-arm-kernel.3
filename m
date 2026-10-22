Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB22F606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 07:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hPwBJZgX;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VauGxlNS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CvSBBaIzDOkoLy23YZbhr14hQwtX6X3MtGrLOOizPiQ=; b=hPwBJZgXBcT4MkxjuaTXAjK1xh
	aO8lgWw03RFNg0lmN0PN8QCKXUpp33Ymmv4mBT+3O8vLZaeia0gdZkg4HrM2bryRwGWl40zAkqcLg
	Q3NialODNTXOkD33M7epGuJhJrdEbXqMflhe+pFBhtjKpX4uo3EpSC7Jk0icidkj0ZiG6BNwTye4Q
	jEFlZ9A5M3uphV0JdsZPeE8nrtttWoTbYa8OvicCj5aGbZx5pJ20YEhqTACjcQopVVFI5sPICtUvJ
	0vqCPX66a01pk8AWn6n9QPPYNQaNmW+yZkSimpeVlemysptOmndki/FD4N06N3TWXsREHRQUcYymr
	k7Bowk/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnQj-0000000DaJJ-2w9L;
	Thu, 22 Oct 2026 07:41:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnQi-0000000DaJB-2YFR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 07:41:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E31F41261;
	Thu, 22 Oct 2026 07:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA0BE1F000C2;
	Thu, 22 Oct 2026 07:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792654899;
	bh=CvSBBaIzDOkoLy23YZbhr14hQwtX6X3MtGrLOOizPiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VauGxlNSCDVxn2W+8ZVHE+mDaGBaIGWxp4pz619csit3PAWFLuVGr3pOQ49B+Ukn/
	 NmF7dn0VLUuyL9DJFyXW2TSHiuS9YRfxlTyXEdTXz89xsTLYHgsaKCO4HcEpe0ho6e
	 /lLvoUUI0pucMrapI63Cl0XMbqnck2nXXKuTCbIaMFSoUq3iV+P0AqBrxdVTsNtgfu
	 4/hzLx5AcpehlHXJLt3G2lvocwuO3KRtzVFzCRlyinilWraHlyaemBrAv5ENUExpJD
	 fwcp/hgEDcMr3zxroLdDD8QUXcogTyh7Sib3aTu2o3oLjmI+5lyKAThv+no+5YHXpq
	 U71XbrUN9eE8A==
Date: Thu, 22 Oct 2026 00:41:38 -0700
From: Wei Liu <wei.liu@kernel.org>
To: Kameron Carr <kameroncarr@linux.microsoft.com>
Cc: haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
	mhklinux@outlook.com, catalin.marinas@arm.com, will@kernel.org,
	mark.rutland@arm.com, lpieralisi@kernel.org,
	sudeep.holla@kernel.org, arnd@arndb.de, thuth@redhat.com,
	linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v5 1/6] arm64: rsi: Add RSI host call structure and
 helper function
Message-ID: <20261022074138.GA1512710@liuwe-devbox-debian-v2.local>
References: <20261002215725.2015959-1-kameroncarr@linux.microsoft.com>
 <20261002215725.2015959-2-kameroncarr@linux.microsoft.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002215725.2015959-2-kameroncarr@linux.microsoft.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 02, 2026 at 02:57:20PM -0700, Kameron Carr wrote:
> Add struct rsi_host_call to arm-smccc-rsi.h, which represents the host
> call data structure used by the Realm Management Monitor (RMM) for the
> RSI_HOST_CALL interface. The structure contains a 16-bit immediate field
> and 31 general-purpose register values, aligned to 256 bytes as required
> by the CCA RMM specification.
> 
> Add rsi_host_call() static inline wrapper in arm-rsi-cmds.h that invokes
> SMC_RSI_HOST_CALL with the physical address of the host call structure.
> This will be used by Hyper-V guest code to route hypercalls through the
> RSI interface when running inside an Arm CCA Realm.
> 
> Reviewed-by: Michael Kelley <mhklinux@outlook.com>
> Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
> ---
>  include/linux/arm-rsi-cmds.h  | 22 ++++++++++++++++++++++
>  include/linux/arm-smccc-rsi.h |  7 +++++++

ARM maintainers, I think this needs an ack from you?

Wei

>  2 files changed, 29 insertions(+)
> 
> diff --git a/include/linux/arm-rsi-cmds.h b/include/linux/arm-rsi-cmds.h
> index 3f7a6a8..01d292e 100644
> --- a/include/linux/arm-rsi-cmds.h
> +++ b/include/linux/arm-rsi-cmds.h
> @@ -236,4 +236,26 @@ static inline unsigned long rsi_attestation_token_continue(phys_addr_t granule,
>  	return res.a0;
>  }
>  
> +/**
> + * rsi_host_call - Make a Host call.
> + * @host_call_struct: IPA of host call structure
> + *
> + * This call will fail if the IPA of the host call structure:
> + * * is not aligned to 256 bytes,
> + * * is not protected / encrypted,
> + * * is RIPAS_EMPTY
> + *
> + * Returns:
> + *  On success, returns RSI_SUCCESS.
> + *  Otherwise, returns an error code.
> + */
> +static inline unsigned long rsi_host_call(phys_addr_t host_call_struct)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_smc(SMC_RSI_HOST_CALL, host_call_struct, 0, 0, 0, 0, 0, 0,
> +		      &res);
> +	return res.a0;
> +}
> +
>  #endif /* __LINUX_ARM_RSI_CMDS_H_ */
> diff --git a/include/linux/arm-smccc-rsi.h b/include/linux/arm-smccc-rsi.h
> index fddb779..4c8530b 100644
> --- a/include/linux/arm-smccc-rsi.h
> +++ b/include/linux/arm-smccc-rsi.h
> @@ -142,6 +142,13 @@ struct realm_config {
>  	 */
>  } __aligned(0x1000);
>  
> +struct rsi_host_call {
> +	u16 immediate;
> +	u8 _padding[6];
> +	u64 gprs[31];
> +} __aligned(256);
> +static_assert(sizeof(struct rsi_host_call) == 256);
> +
>  #endif /* __ASSEMBLER__ */
>  
>  /*
> -- 
> 2.45.4
> 

