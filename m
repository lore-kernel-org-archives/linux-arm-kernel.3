Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB93EC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 14:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZwJl3+1eTKhGCa+3cLBLUKEPw6+05Ra6Blbt2eH/4I=; b=c/HApUsf48QIUD2v0PMwB4w6fX
	IohV7F1t3gGHEX/TwWD9gzPS1rQkkmNIC/Gj0/O/C48cgu3DEgkTNW5A8iCorgiZVnb/I7UxdP09k
	lBi7lKc+E6WshLcqxhsI5PKaggYJ/1049zW32iLNAG+xaqF1+bTAZ0CNoYx04i4UVr8FDL4WJGM+S
	mgacho+p9QYOsubPvCcCn21kwhVYo0rN2S4F+7Ae5GZoT6i0LwyRJoDVU+qs2dNSceHK3aFm9Jjl6
	ow+MozK8T6EbLOVY8qg12lZBTtuRuwhmDbZ3Oi2v8/suAdOo/9KhMh10d0zwl5awET3mfWmzzhhwH
	PSJKgWQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ani-0000000767q-1GcV;
	Mon, 07 Sep 2026 14:58:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ang-0000000767T-3SKB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 14:58:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 192C31476;
	Mon,  7 Sep 2026 07:58:20 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 900113F528;
	Mon,  7 Sep 2026 07:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788793103; bh=S52BFuMLtdk3fEiTm/WlGd0vl/me+yACyOJVPNoNoS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J8SHXGfaeHVa9VYnf6yA/0sXtUmyrbF3tikyCBJgpU0a0XMfen/jsosSbYcbeOS1c
	 vRFNy90bw1FQFrNmcYnO7XKsEN/ADVw76dG8l5BjKzRjFDUp42Ux+DZkiY9jMPcp5t
	 Ysy9Bg+Kc6HhsGf7DyyydYV0PsqX6xgBkJhXTKMI=
Date: Mon, 7 Sep 2026 15:58:13 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Vincent Donnefort <vdonnefort@google.com>, maz@kernel.org, 
	oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, keirf@google.com
Subject: Re: [PATCH 11/20] KVM: arm64: Add a range to pKVM ownership selftest
Message-ID: <ravrecwvcy2okwdi3h5buzneyfilfjgx76c374r7l7jtx62lqc@rom2sxozz5is>
References: <20260803100904.3563942-1-vdonnefort@google.com>
 <20260803100904.3563942-12-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803100904.3563942-12-vdonnefort@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_075824_910255_F8A49475 
X-CRM114-Status: GOOD (  11.29  )
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

On Mon, Aug 03, 2026 at 11:08:55AM +0100, Vincent Donnefort wrote:

[...]

>  void __init pkvm_ownership_selftest(void)
>  {
>  	unsigned long pgtable_order = 5;
>  	unsigned long pgtable = 0;
> -	unsigned long page = 0;
> -	long ret = -ENOMEM;
>  
>  	/* Memory for the VM page-table */
>  	pgtable = __get_free_pages(GFP_KERNEL, pgtable_order);
>  	if (!pgtable)
> -		goto out;
> +		return;

nit: previously this allocation failure will print a message, but not
after the change. Is this the intention?

Thanks,
Wei-Lin Chang

>  
> -	/* Page whose ownership will be tested */
> -	page = __get_free_page(GFP_KERNEL);
> -	if (!page)
> -		goto out;
> -
> -	ret = kvm_call_hyp_nvhe(__pkvm_ownership_selftest, virt_to_pfn((void *)page),
> -				virt_to_pfn((void *)pgtable), 1 << pgtable_order);
> -out:
> -	if (ret)
> -		kvm_err("Failed to run %s (%ld)\n", __func__, ret);
> +	__pkvm_ownership_selftest(0, pgtable, pgtable_order);
> +	__pkvm_ownership_selftest(PMD_ORDER, pgtable, pgtable_order);
>  
>  	free_pages(pgtable, pgtable_order);
> -	free_page(page);
>  }
>  #endif
>  
> -- 
> 2.55.0.508.g3f0d502094-goog
> 

