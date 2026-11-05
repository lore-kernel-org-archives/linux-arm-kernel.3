Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6012F606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=46hx1UEG;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=E0Txl2jW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hI6E0pWdIjYridUcVEtGitpYPVkZ0Czh5YzRDUq6aT8=; b=46hx1UEGDTS+uXv7URz4Y9toP/
	1kZTzPr7ut63t50g49Rf/DSf3/+GMUrRSiL+EI/G+rrowcjmxDXw/6zv1WSwVxmKL4nZHTTITmmNR
	T+lwdJpB1prDSnadqKQDmXifNzlALz3z5G3rU6CruJM9jlgGhZpw2zmY2lwKxsGkB5GMaiz402ONr
	gKki+UJ0VGpCIGzbDKiaRA/om4DAf/MlZ3FdlEAm/RXcU89w+obSbsH1h8Uor/KHySxT+pwS25Jg7
	tAjoQ0ZA1omh9l7LLnM/VEzYLfNSZKN33ageVocbp1riee05aPGp57kA37I76q2fASNBlEnG/IOt8
	WWTSZpZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOu2E-00000008LuT-0rJt;
	Thu, 05 Nov 2026 09:45:30 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOu2C-00000008Lu7-0j2I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 09:45:29 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48fd2e38825so1111105f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 01:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793871925; x=1794476725; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hI6E0pWdIjYridUcVEtGitpYPVkZ0Czh5YzRDUq6aT8=;
        b=E0Txl2jWCg7PexzfETMIucxzsXrdVcvcWRx7WoC/cjr0AoG9LD4khbMqsZBbNMZiKx
         fy1UT2KNC/nH8hdh/AD9nNewHN8cxpDjI6i8s/66/Zfi2EJlilA81Tp1Edvnuv49TsKy
         neXUWpLuGXx4IaAhB8o2UXebmmBOteuj++Mzxgf8Io1bwROIbtwiRrrb1j0zTK0GqExJ
         1jC7SGzjaOXo2/ZHc3LcPQ+f8JdYHMtckJb++KIcDggkpQ5QT4AZ2RQ6zSCZMRFvSTQs
         wpHwC2kHBrMIB4Tpn3yHJQiyt2DhIqdx1/9NksCMz886i1bv+D5rVNQS6DjIOmwty7SQ
         1Fmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871925; x=1794476725;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hI6E0pWdIjYridUcVEtGitpYPVkZ0Czh5YzRDUq6aT8=;
        b=2Yz1dH5vN3u3eAkJvQXLEdMFp8kEs2G93Vz6mffo6CUPxWKNaSoBiBr7MD2uoXjgfF
         bZoZkZmbL4zpGbKyP3Kj+5ysi4J6TsaG7ubOiTKT/ZMtvAgtFOk/S2hYO3hQvoy54DwH
         A0N1zEBdeehekdcc6qzQtv3KWi4W84oDtW9S4ANNCEHtH7HMXIsV32BfAuvAcw/uoW04
         G4C3b84uZ/DWdEN7tqj/9wpAx2FkxGkyZiFrsNN3qvkzWowKA/7R1n939Ccc1U1j1o2j
         +q/zH0odZAldioSDhUJwoB7Q/YBbTLfZqU/SNpxBD7B126AMK/BQWz7/EqBjbsIo4zYd
         cgrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeV5vDXsfn/LjNRlkzCmjxOkkvKUIXY7w+wRFmzzWTZksBQ6UngE2KaOXd1EFqCWMJlZ7XP86Yd7MZifKPca3y@lists.infradead.org
X-Gm-Message-State: APuU4Z9o+bVEUCafHv5W6js+e1qHFp7KNx676aF4zzLBE1jO5zMcNDVZ
	pwy+cmMLERqTrH+ZEaJWMrq0OdOx4TEkjHt+q+NwjiyOErSC9oh9eGi053TdhlUUjQ==
X-Gm-Gg: AYBFou2kOrEYrGaTnx2miTQpR6OOLOyuCGPFAjBSCHZ8ZklBVJEVeLTu6Q2N6Kw4x56
	JbDyBprPeosVo/2RTj3RGW3bPCpa957E/sm4z7WtXTIuYNgbtj5imvX3XpRfUqOtfi3t1hbBCDg
	YCTJM0HALzP6d094vENZd9nC/dRr+/Y/NB/mn/9ymipZFkvyL0S4kmH+59d+tFwrQRT+erok6Yp
	5DCn6WRssdM7xswAfOXH3YbWiYOLHl900DG7pFSJ1J/gZjgyg+yDHUB9X0BPPmqQpzlc7bDvtXq
	Wx1+Dbc2LpXc67VM6U77m8yLUvNSrGwBjDFwVc+msib8YXilI9vAoRI2mExdI3M7TZ6h9Gy4o6i
	Cs4FEnvDy5qCerpQB3fxl6raNGa6y11mkcLkWbBtczkjRwRDH9IzK1uL05EG7uKmc7Jyo29WQGc
	1pSe8YYqYMTdDKP2DK0HcHhOITmxGg4HsTKOAoKfwNCnAXnMRfsXCXymiW68DYHFlxo5gEu84vN
	msarDI6GT65T+18Rbz9Z4JI0aLKSyD8xFb83TOABlClc37StDtmFaHI8AuzF83Q6+qz28HzoMbV
	fmTNI5lzJV7Gaabise9E5m4O47KxouN9LcKggrw+aTxxMW5WguEMMUn2sYYk74Uj
X-Received: by 2002:a05:6000:1842:b0:48e:3cec:b852 with SMTP id ffacd0b85a97d-48e6e500962mr42464044f8f.40.1793871924816;
        Thu, 05 Nov 2026 01:45:24 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece998absm9721233f8f.22.2026.11.05.01.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:45:24 -0800 (PST)
Date: Thu, 5 Nov 2026 09:45:20 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v2 2/2] KVM: arm64: Resume a pKVM stage-2 teardown at the
 next mapping
Message-ID: <auxQMCboC9bhfW7h@google.com>
References: <20261104124451.2148724-1-fuad.tabba@linux.dev>
 <20261104124451.2148724-3-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104124451.2148724-3-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_014528_235778_88AD7BE6 
X-CRM114-Status: GOOD (  24.70  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 12:44:51PM +0000, Fuad Tabba wrote:
> pKVM keeps a VM's stage-2 mappings in an interval tree, and
> pkvm_pgtable_stage2_destroy_range() releases the ones in its range.
> stage2_destroy_range() still calls it for every block-sized chunk of the
> IPA space. As pKVM gives every VM the host's IPA limit, a teardown with
> LPA2 makes 2^27 calls with 16K pages (2^22 with 4K), however little the
> VM maps.
> 
> Return the address of the next mapping instead, or U64_MAX when none is
> left, so that the teardown skips the space between mappings. No mapping
> crosses a chunk boundary, as pKVM maps at most PMD_SIZE, so the next one
> starts at or above the end of the range. A VM without a handle doesn't
> have anything mapped, so return U64_MAX for it straight away.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/pkvm.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index f21c3326dda68..77315c83c61b3 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -504,9 +504,10 @@ u64 pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
>  {
>  	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
>  	pkvm_handle_t handle = kvm->arch.pkvm.handle;
> +	struct pkvm_mapping *mapping;
>  
>  	if (!handle)
> -		return addr + size;
> +		return U64_MAX;
>  
>  	if (pkvm_hyp_vm_is_created(kvm) && !kvm->arch.pkvm.is_dying) {
>  		WARN_ON(kvm_call_hyp_nvhe(__pkvm_start_teardown_vm, handle));
> @@ -518,7 +519,10 @@ u64 pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
>  	else
>  		__pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
>  
> -	return addr + size;
> +	/* Mappings left by a failed release are still in the tree, so look past the range. */

Hum, not sure I understand that comment. Which release are we talking about? The
_reclaim or _unshare? If yes, we don't propagate the error and WARN if any of
them fails. So we don't expect any failure here and I'd say there's nothing
special to do?

Additionally, in any case, iter_first(addr + size) seems like the right thing to
do and is self-explanatory.

> +	mapping = pkvm_mapping_iter_first(&pgt->pkvm_mappings, addr + size, U64_MAX);
> +
> +	return mapping ? gfn_to_gpa(mapping->gfn) : U64_MAX;
>  }
>  
>  void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
> -- 
> 2.47.3
> 

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

-- 
Vincent

