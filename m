Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E41C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NQCGAdkzYKOAr7afTKItocmK3QBZ5Mm5lieH0vuNx0M=; b=jFTmZWS4nYyoZ3u/TQohAEwjLy
	Rg1470573PBIZ9newrhu40H8ZJn5BGje0b8FX2Fw0OZpSsh4XDi3Ns03NMl2WbMci6K2yE72KLNMp
	uQSk93RqlDvzQGfeUi0iWU/AD0BhGJL5GNhAytdqgNIrjKs83/+1qV+snHIF1BuF1A4TCp8m4XKBl
	kpplOioaCwl7CT3RmG4aCMSf4SaPdd4Ule/VFVUfxODQpmwS43T4xL2k5sUjg1tozkjhcdNeWAoiK
	5IvoN5V2mH+xHugT6la4uxwZd5cp5HNLcTu9ZetVOnTlqoxvd8e2BglxAJEke4DvbdbjefpvVFuKN
	ewU2EpYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk050-0000000F0u0-2tql;
	Wed, 15 Jul 2026 13:55:18 +0000
Received: from out-187.mta1.migadu.com ([95.215.58.187])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk04x-0000000F0sM-3FaN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 13:55:17 +0000
X-Forwarded-Encrypted: i=1; AHgh+RoX91WL6wH0Zd9h1OwEMV72/PW36GQ3FDYvsgPb/6xMR/b3kfqtcOEeY8sBJHUs5L940adZx1IetYEmuc6lAlnu@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784123710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NQCGAdkzYKOAr7afTKItocmK3QBZ5Mm5lieH0vuNx0M=;
	b=qZFQWzRF42+UQvdA/0TubE9iCqQQXkOb29JBoCtc03gO0n6OMKhp8AooBT2T0iPqwuJcsV
	Rm9jQevwQauEz9FekYr8s5R8XJSDJy/7b+AmudA+OKESsFZCy2CW7O1/Nm4iDaMpy878Si
	8wkWKEFGn2QGI1Zj4ETDHM4Y9wP6WeE=
X-Gm-Message-State: AOJu0Yw2T2KBfoLhUz0IrndDQ6Ws6gUGk+8dbr8Jgy6IFF2sUUfJ0P7M
	nNxYRcvqJrCkFcCQ35sqm5ca3D0JTNJCgd4lSLog3wSd80WD8AeHTgr05aSxyLhHc5TvuP4WdP0
	VVcID5wZRHjrRcO4qQAHV41uWqrU7LKi05FmHS9hi
X-Received: by 2002:a05:622a:c81:b0:510:f9b:fb5f with SMTP id
 d75a77b69052e-51d7bd1d949mr27444781cf.16.1784123693155; Wed, 15 Jul 2026
 06:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com> <20260706175415.2604046-18-vdonnefort@google.com>
In-Reply-To: <20260706175415.2604046-18-vdonnefort@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 15 Jul 2026 14:54:16 +0100
X-Gmail-Original-Message-ID: <CA+EHjTz2aM=XoefwAxpNrN5e1boBZ8d1uMGuB3dj6gUzML9mHA@mail.gmail.com>
X-Gm-Features: AUfX_mxQJDCiL_XwMIIjQrHo9vj4Q3arYavOYvKrlwTTbMnSrizaInG-eT77Ask
Message-ID: <CA+EHjTz2aM=XoefwAxpNrN5e1boBZ8d1uMGuB3dj6gUzML9mHA@mail.gmail.com>
Subject: Re: [PATCH v2 17/18] KVM: arm64: Reject hyp trace descriptors with
 fewer CPUs than hyp_nr_cpus
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_065515_960098_1B35063C 
X-CRM114-Status: GOOD (  13.15  )
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

On Mon, 6 Jul 2026 at 18:54, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> While a trace descriptor with fewer CPUs than hyp_nr_cpus currently
> causes no functional issue, such a configuration is invalid and would
> cause the hypervisor to skip ring buffer initialization when allocating
> backing pages in EL2.
>
> Enforce nr_cpus == hyp_nr_cpus during trace descriptor validation to
> guarantee that every possible CPU has a valid ring buffer descriptor.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

>
> diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
> index e7e150ab265f..6e716295247a 100644
> --- a/arch/arm64/kvm/hyp/nvhe/trace.c
> +++ b/arch/arm64/kvm/hyp/nvhe/trace.c
> @@ -181,6 +181,9 @@ static bool hyp_trace_desc_is_valid(struct hyp_trace_desc *desc, size_t desc_siz
>         desc_end = (void *)desc + desc_size;
>         nr_bpages = desc->bpages_backing_size / sizeof(struct simple_buffer_page);
>
> +       if (desc->trace_buffer_desc.nr_cpus != hyp_nr_cpus)
> +               return false;
> +
>         for_each_ring_buffer_desc(rb_desc, cpu, &desc->trace_buffer_desc) {
>                 /* Can we read nr_page_va? */
>                 if ((void *)rb_desc + struct_size(rb_desc, page_va, 0) > desc_end)
> --
> 2.55.0.rc2.803.g1fd1e6609c-goog
>

