Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1C7FA3728
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 18:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wggzIh/uyggaVGyCJ7Xg7yzsieoJ97AxIjCXSYL+yg8=; b=U2RXIggpgXU/jYdLZBL8v7xCn/
	qJXCyo8VkYxpRVwGacVDxjzHkrFEgDf7zrg/6bZunIzbJzw2hgK2zLIoKqJMOOtOIURArb2z9A5v0
	BFYn+7ZoN5RWTjecldQ00z+hivgdpMXPJ2lGGzuMPojbjd3F2JBjJh8ECuV9W/LfMl8mThg7FPo83
	hKAe2XhsYWFnhNsGvsutT0oJ0AHIPSlmBl/Y6C07AjKvq/5JM7WfBpnZFE1qCd1sXVFQZwKDc5V9P
	EWJM3Y+UfzYSvFJ/F99FIWUBtDo4PXdtSGU8Jo+dY12wWFDRaf6s9OSlBvCkEiz7uxfMhBQvyQK11
	P7nCe3MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbjrm-00000008czW-0HOY;
	Fri, 02 Jan 2026 18:27:14 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbjrj-00000008cyo-3hPo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 18:27:13 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47a95a96d42so2005e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 10:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767378430; x=1767983230; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wggzIh/uyggaVGyCJ7Xg7yzsieoJ97AxIjCXSYL+yg8=;
        b=IVBnqcCAtrX/eDdB2pq+zDuzicd0fb9pIoIS7BZN7r2vC7kDXV31nFs1jjL1Ly6fUF
         druW8nUZRGfz022NzQsJoTr56AOJK8vE9GsN+aiN9ZDKATG7VAU5bK+LOaB4MACpIZ5J
         LiZRgkfZhT2IbnzZB/GP4DdaM1UKEOWfF+H0MMRa2BO+joFBkG3cR7eWprQb7i+gbxUJ
         lIU65e9IYn/XtQuyYfvbTtXUUQyFErI3CLSkgzeNEgqTs5hey1I4UzuPpRmTmjdT67SA
         FPRSXaZeRU2ice9JGesgHQrAOKuhoFkuqCyZGFyJuov01cZswF1F0qvqkyOOKygc8CNp
         /zAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767378430; x=1767983230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wggzIh/uyggaVGyCJ7Xg7yzsieoJ97AxIjCXSYL+yg8=;
        b=YgsdYAlK58MpJzYIs1JYrq/jO9G1f1AvZ73L8S5pxrxR/tp5PlMBf2mRa8bl7FG+uP
         zPAiwRnRrZvXy+xTTYfRwrTrHfmG6MR7oQlW377PfgDwPe3o0vcDxZPiz+lkNl8cTh/h
         8IiKKVZWNKQT5iDtW0ULjn4k4wOgRv4OMJJgIOjG6KsDt1LsNFtOKpPgLgUbZrq8AEL1
         RDXhRVN1fjm+y3s2nx/KOmwTKifGGvUDAuo0j7AqBsPm7nYYLpPpyMUceffrAXk26cq2
         V1YslkC2DA7qL8voG2/a1Gyy2qlauqWd7StNwrbIFQdH2NZPH+N9evyUSP5QrgmwhDWB
         sWWw==
X-Forwarded-Encrypted: i=1; AJvYcCUhWwwDjAFU3eGGAB/v2BlkTRyVXnyeApP6m8Bng8p2i6WeMpjujYK/OGj++H4KracI5qMxeWC38fpu1pWKJ/v0@lists.infradead.org
X-Gm-Message-State: AOJu0YyRHcS7AdtP3sK6WmNKfIo5haxGVCeb50GeA5MBaaXeNcWkdiCG
	VSX40snpAWOs/eOjJ8JTM/plYNj7OBXcHQvRy2gfhx9k6FJl7Jl7irsVHOppvqmAkA==
X-Gm-Gg: AY/fxX4r5B29UchrUBXeiWi7qxA97LYZBO43GDu6IT5sjVOHQ6cpPuMACEY+q4Y6FYF
	50+V6GSr3jNapVRixwg7XBPV6u/rVdt7Qz6ZIXxPa4g2L0sEEEYXaerNzHyrmeLKXJJwn+OQC32
	3UdSyTmCSK7oqRGrZEDLSRVlX5+C6nVNjCs5Xa5FBegGr+/EzCNozjB/uwnltekBB6iQnxDy7v3
	Sp1kDYaUIKszqVoh83krm3DLWRawfHL2I7jM9d/AGO92aXNHIZe7wYvfjoBcYSBSOn5puJQmcVe
	gX0Us97nxI4wtOp85g8lrlU959w38bnSRax0ZDti+LZU0qOHYRtFyYiYb0qGVOKgh1jVTjMUEUr
	Vu5UMn2LzsqzX2lD35qrUPnXjZa/4ou8LgXZG6+A+Tjr3g0iVuURW7wCYaTbnBm6w3Ibn33Jb3h
	mOSXgK6GgbTxUuJItcr8l2MErfITuD1XfI+kLIC6WrdtQQqXBAo3ynSlCnjG6JbSU=
X-Google-Smtp-Source: AGHT+IFR2BUb1i2YwkzJ6Oviq2NnQ/74j9hvEehkMoSH/0nN8LiscExmmh5dawi9pBS5mAmdCJrXoQ==
X-Received: by 2002:a05:600c:37ca:b0:475:da0c:38a8 with SMTP id 5b1f17b1804b1-47d6c328d1dmr13525e9.4.1767378429991;
        Fri, 02 Jan 2026 10:27:09 -0800 (PST)
Received: from google.com (171.85.155.104.bc.googleusercontent.com. [104.155.85.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324e9ba877sm86824635f8f.0.2026.01.02.10.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 10:27:09 -0800 (PST)
Date: Fri, 2 Jan 2026 18:27:06 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, skolothumtho@nvidia.com,
	praan@google.com, xueshuai@linux.alibaba.com
Subject: Re: [PATCH rc v5 2/4] iommu/arm-smmu-v3: Mark STE MEV safe when
 computing the update sequence
Message-ID: <aVgN-mkyoOcifTjE@google.com>
References: <cover.1766093909.git.nicolinc@nvidia.com>
 <83f991cbbb1331213aabe7c1fc5f725e79f60ecd.1766093909.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83f991cbbb1331213aabe7c1fc5f725e79f60ecd.1766093909.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_102711_934517_DFB108B8 
X-CRM114-Status: GOOD (  23.05  )
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

On Thu, Dec 18, 2025 at 01:41:57PM -0800, Nicolin Chen wrote:
> From: Jason Gunthorpe <jgg@nvidia.com>
> 
> Nested CD tables set the MEV bit to try to reduce multi-fault spamming on
> the hypervisor. Since MEV is in STE word 1 this causes a breaking update
> sequence that is not required and impacts real workloads.
> 
> For the purposes of STE updates the value of MEV doesn't matter, if it is
> set/cleared early or late it just results in a change to the fault reports
> that must be supported by the kernel anyhow. The spec says:
> 
>  Note: Software must expect, and be able to deal with, coalesced fault
>  records even when MEV == 0.
> 
> So mark STE MEV safe when computing the update sequence, to avoid creating
> a breaking update.
> 
> Fixes: da0c56520e88 ("iommu/arm-smmu-v3: Set MEV bit in nested STE for DoS mitigations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 8dbf4ad5b51e..12a9669bcc83 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -1085,6 +1085,16 @@ EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_used);
>  VISIBLE_IF_KUNIT
>  void arm_smmu_get_ste_update_safe(__le64 *safe_bits)
>  {
> +	/*
> +	 * MEV does not meaningfully impact the operation of the HW, it only
> +	 * changes how many fault events are generated, thus we can relax it
> +	 * when computing the ordering. The spec notes the device can act like
> +	 * MEV=1 anyhow:
> +	 *
> +	 *  Note: Software must expect, and be able to deal with, coalesced
> +	 *  fault records even when MEV == 0.
> +	 */
> +	safe_bits[1] |= cpu_to_le64(STRTAB_STE_1_MEV);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_update_safe);
>  
> -- 
> 2.43.0
> 

