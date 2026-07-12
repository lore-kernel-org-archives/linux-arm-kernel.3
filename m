Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084E2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 15:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jLcdFtl7R6Tfa/ki2sHb7vZqexvF1gWmIdn1yVC0L4=; b=yR5hI5Yh7wlpSC+OWcYuM23blw
	3eDfL8BcbItI50xz/0mCrVAMy2YFNcv7kbpdqDoXw1tUOU9n++fqNuXFGDNkuSmp5dmPP/yHcuCrG
	Jrqy89/La4IOWysOJKSyQYSrZM47DeX+EgQ7r9g+szU4fRh6Qvhppg3eQp0+7xtuZaxsfSrV3yn1g
	7yWbXCbMIO9q45qoGgmCZrV3JDqVQpcIc4QsDBIsHIsBbE71J9fMoZ8fi4GxMdbOuIfWHrO7cndI/
	Xn4hT6KldIe59aYtjodxGRtnDuVB+BnXEwEj5K9lzvQJCPvvYUY6QBerkEmMB9fogeuAT6VpSSLI4
	8NeztWnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiwYK-00000007avF-0Mje;
	Sun, 12 Jul 2026 15:57:12 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiwYH-00000007aum-0Lcr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 15:57:10 +0000
X-Forwarded-Encrypted: i=1; AHgh+Rpc8flnianMXBw/41zq2iVyGF93GHBctZEwHbTKnxe0H0I42YJs50NRwvbgxx9MNhWPWu4WTuutoEulIwSr9180@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783871823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0jLcdFtl7R6Tfa/ki2sHb7vZqexvF1gWmIdn1yVC0L4=;
	b=ZS7uXdfz4/n08RMJBnqJBVC3yX4SgOSnVgNYo24SDsTAxKxYe0XJf/LVoEZNVQpA3czmqd
	jthWQzxj5LTnbkQNoplQE7EOkf87tzD0U7IbqXMiGoFrxLP2HgI4JKSIYTYwpUQUX5hXIG
	DMDqyByJ7XAB8gj6O9HbhYwAS3BPKM8=
X-Gm-Message-State: AOJu0YwvhdodRtUn0caTptjYKfoaRzZpAayGFsaqFv2yyQUP+jPv85YG
	D4jJ6cc9QgPlJFGo8FuTKPT2xapL8/+Gph+jWZ6jyapK89NYJKQwnRmYhpXn0QqBsxVpT1AC87T
	Y9U2mDB1winK0TrsDsatFhjXez09hYUimZFW5sNUX
X-Received: by 2002:ac8:7fce:0:b0:51c:ad5:93be with SMTP id
 d75a77b69052e-51cbe223323mr11181191cf.8.1783871819977; Sun, 12 Jul 2026
 08:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260710114819.2689386-1-vdonnefort@google.com> <20260710114819.2689386-3-vdonnefort@google.com>
In-Reply-To: <20260710114819.2689386-3-vdonnefort@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 12 Jul 2026 16:56:23 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwAEhgDLPrpRdSyMYdV5zbt1T2LB=hKxb4PG4JB7XWHUg@mail.gmail.com>
X-Gm-Features: AUfX_mz6PtwEXTIM6AD8HjcL_CT8j8sTWbGf_r1fC3QNf5VdqNLl-GNqWThuFk8
Message-ID: <CA+EHjTwAEhgDLPrpRdSyMYdV5zbt1T2LB=hKxb4PG4JB7XWHUg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] KVM: arm64: Fix hyp_trace_desc allocation size in hyp_trace_load()
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_085709_519247_98588EDA 
X-CRM114-Status: GOOD (  16.88  )
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

On Fri, 10 Jul 2026 at 12:48, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> The footprint calculated for struct hyp_trace_desc sizes only
> trace_buffer_desc and do not take into account the other fields. It
> worked so far thanks to the follow-up PAGE_ALIGN().
>
> Fix the descriptor size and while at it, enforce an overflow check after
> PAGE_ALIGN().
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Fixes: 3aed038aac8d ("KVM: arm64: Add trace remote for the nVHE/pKVM hyp")
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Applied both patches on v7.2-rc2 and confirmed
arch/arm64/kvm/hyp_trace.c compiles (CONFIG_NVHE_EL2_TRACING=y).
Booted protected and non-protected VMs. To exercise hyp_trace_load()
directly I enabled the hypervisor trace remote via tracefs
(remotes/hypervisor/tracing_on) at the default 7KiB and reloaded at
512KiB, so the reworked desc_size/tb_desc_size split and the
alloc/map/share/__tracing_load path all ran fine.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Cheers,
/fuad

>
> diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
> index a7237aca6898..22437c5e1e7b 100644
> --- a/arch/arm64/kvm/hyp_trace.c
> +++ b/arch/arm64/kvm/hyp_trace.c
> @@ -235,18 +235,22 @@ static int hyp_trace_buffer_share_hyp(struct hyp_trace_buffer *trace_buffer)
>  static struct trace_buffer_desc *hyp_trace_load(unsigned long size, void *priv)
>  {
>         struct hyp_trace_buffer *trace_buffer = priv;
> +       size_t desc_size, tb_desc_size;
>         struct hyp_trace_desc *desc;
> -       size_t desc_size;
>         int ret;
>
>         if (WARN_ON(trace_buffer->desc))
>                 return ERR_PTR(-EINVAL);
>
> -       desc_size = trace_buffer_desc_size(size, num_possible_cpus());
> +       tb_desc_size = trace_buffer_desc_size(size, num_possible_cpus());
> +       desc_size = size_add(tb_desc_size, offsetof(struct hyp_trace_desc, trace_buffer_desc));
>         if (desc_size == SIZE_MAX)
>                 return ERR_PTR(-E2BIG);
>
>         desc_size = PAGE_ALIGN(desc_size);
> +       if (!desc_size)
> +               return ERR_PTR(-E2BIG);
> +
>         desc = (struct hyp_trace_desc *)alloc_pages_exact(desc_size, GFP_KERNEL);
>         if (!desc)
>                 return ERR_PTR(-ENOMEM);
> @@ -262,7 +266,7 @@ static struct trace_buffer_desc *hyp_trace_load(unsigned long size, void *priv)
>         if (ret)
>                 goto err_free_desc;
>
> -       ret = trace_remote_alloc_buffer(&desc->trace_buffer_desc, desc_size, size,
> +       ret = trace_remote_alloc_buffer(&desc->trace_buffer_desc, tb_desc_size, size,
>                                         cpu_possible_mask);
>         if (ret)
>                 goto err_free_backing;
> --
> 2.55.0.795.g602f6c329a-goog
>

