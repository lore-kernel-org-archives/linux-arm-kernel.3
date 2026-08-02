Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FEAC55177
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 11:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=563oNXUIkeVMeBvn7KJOWvs/zhYBpCRLhQXu0aHBhw8=; b=CTBDxVY90FoaoiZh1iA3ddneBP
	7HbZ1ul6EYuo/bhYfbo1fC8dYpaEbNMoHRuNQL6r6nAkXpUnsjHKIJDJOrHsegngMZDDXLzdfOrgP
	XGBt1avnpmLxFCzgV4Uabj5RgU/haj6IYr9XNt534ybbDBQ7KYyPkEPB/0Ww4VoQdJ7/vKeb1A6+H
	FkT2UoCZtV1Rb9ScnFU/588cUZt1KXqPopwiW+of3EwIx9F0uwmZf9GACZNr0x/k0EDTQE1SRj720
	T19Zqjlrjnr4iK9jq/WRjCHSqmM8sj83dlTEmlEDVoBgV1IbZl4O+WuPEXRdw7ifZX6g+JtEC4PKz
	fFOW+B9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqUR9-0000000FZwe-0H6A;
	Sun, 02 Aug 2026 11:32:59 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqUR5-0000000FZuj-2Jtj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 11:32:57 +0000
X-Forwarded-Encrypted: i=1; AHgh+Rra39bNlhDJGxFbY43QRV3c031gNj6B9n5k84ixVXR+vzZ0C19fW5p+SuZTKHRAZ1foBc1sb88F4qEOtPOD63L8@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785670370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=563oNXUIkeVMeBvn7KJOWvs/zhYBpCRLhQXu0aHBhw8=;
	b=kQPlOZ1JQ4qbF+i4cvbTozoQx1/EveGT8FEOf8iw72OKr+Ln4oKTZ9I0lUX0Llj+pYQGzf
	qn7EQiAUCuDuO/eQXvLHt/nN+wvco2FlXcabDbNRIMOWDrm4ySZ/a0vR5P7wTfDkyXGeIB
	nbrqtJrOc03FV8pfXIAly3FZgVZtQkA=
X-Gm-Message-State: AOJu0Yw3MzPFe6yMVpHHAbkPdly40GXZl88mAu/RZ61TbCUXDWa6DhGd
	wqW5pAFDArj8aZptMaGwyGdMp1iOaajLNIzqC3tWHmH5Aa5gVsZZZ5f5gYXrYVdN5ftkWzsWBNa
	dMH5M0MTI5lb+0kbK6hFQ7CQA93tAm+TzyJpyIOx/
X-Received: by 2002:ac8:580e:0:b0:517:5d71:84e5 with SMTP id
 d75a77b69052e-52b5b0b0160mr17986791cf.5.1785670353005; Sun, 02 Aug 2026
 04:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260731182231.1277064-1-vdonnefort@google.com>
In-Reply-To: <20260731182231.1277064-1-vdonnefort@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 2 Aug 2026 12:31:55 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxwJ+e4nOuVE3nuMJxRk62fDhY-GVDjO6HLGzGmUVj5Qg@mail.gmail.com>
X-Gm-Features: AUfX_mzYz28lGkU5fFeVKuoX3O7CJ-5QBWq0Fe673Jb9b-5t2OiaUr7qhE-dcTs
Message-ID: <CA+EHjTxwJ+e4nOuVE3nuMJxRk62fDhY-GVDjO6HLGzGmUVj5Qg@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Drop %pB on nVHE panic when stage-2 is active
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_043256_365766_6BF6AC55 
X-CRM114-Status: GOOD (  13.96  )
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

On Fri, 31 Jul 2026 at 19:22, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> Currently, the host stage-2 is lazily mapped. kallsyms, accessed with
> the modifier %pB is therefore potentially unmapped. If the hyp panic
> occured with the host stage-2 lock taken, a dead lock will occur.
>
> Fixes: 6ccf9cb557bd ("KVM: arm64: Symbolize the nVHE HYP addresses")
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
>
> diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
> index 54aedf93c78b..2e1951c215ae 100644
> --- a/arch/arm64/kvm/handle_exit.c
> +++ b/arch/arm64/kvm/handle_exit.c
> @@ -509,8 +509,12 @@ void handle_exit_early(struct kvm_vcpu *vcpu, int exception_index)
>
>  static void print_nvhe_hyp_panic(const char *name, u64 panic_addr)
>  {
> -       kvm_err("nVHE hyp %s at: [<%016llx>] %pB!\n", name, panic_addr,
> -               (void *)(panic_addr + kaslr_offset()));
> +       /* Kallsyms might not be mapped in the host stage-2 */
> +       if (is_protected_kvm_enabled() && !IS_ENABLED(CONFIG_PKVM_DISABLE_STAGE2_ON_PANIC))

nit: this is the negation of the find_bug() guard a few lines up (not
visible here), so could the two could share a helper?

> +               kvm_err("nVHE hyp %s at: %016llx!\n", name, panic_addr);
> +       else
> +               kvm_err("nVHE hyp %s at: [<%016llx>] %pB!\n", name, panic_addr,
> +                       (void *)(panic_addr + kaslr_offset()));
>  }

Tested on a pKVM host with CONFIG_PKVM_DISABLE_STAGE2_ON_PANIC=n:
triggered an nVHE hyp panic and confirmed the new branch is taken and
the panic reports cleanly. The later dump_kernel_instr() is fine too,
it reads hyp text, which stays RO-mapped in the host stage-2 for
inspection, so no fault.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Cheers,
/fuad
>
>  static void kvm_nvhe_report_cfi_failure(u64 panic_addr)
>
> base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
> --
> 2.55.0.508.g3f0d502094-goog
>

