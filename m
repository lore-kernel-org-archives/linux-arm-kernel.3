Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9DFC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 15:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1UksYG3BGMSWQLFo2u7eoMh9Nmo4SqJ9rgJuiisEQVo=; b=05sE/nchgpa0tx1nHov3wCmPbj
	aQVMa0sT+UU4qnbW4qehnxgFl207tNQvlkBJ+b/mEJKKLXX2dqnqnxryYuS9X27tywJVMjtPUWlzI
	q5UE68ZPUkRDN9UitYgHd4ilgfwHWPlcOxWcHZVoxl7Ayush7wlzvgX5TaK7KL5ZAFcdHxQenIY4U
	f4/IrOkR8hEWuRC+wPET6GFXKz/LZAQ4kVSSfLnvwQrF3y2DGFvlvZKlbBv3RgJUbENkZPW7xxmZR
	sLsfL109lVgTTp1R+iERYhucCVSu9AOg1ZytXzUhBgXGg7s6xrMnfTIjP4YHYpkdIAo7B4MYcRLEG
	uDS3mlwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk1DZ-0000000FG9A-00fJ;
	Wed, 15 Jul 2026 15:08:13 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk1DU-0000000FG7Y-0VxB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 15:08:11 +0000
X-Forwarded-Encrypted: i=1; AHgh+Rpe01beDeiLSW/aqkwHmimAMPMtCxaJckeUXiDNgZzzZmHCbmfAFzjqinBOf+sMi+3cYmLfQe9YTaBMlsFRxQE/@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784128084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1UksYG3BGMSWQLFo2u7eoMh9Nmo4SqJ9rgJuiisEQVo=;
	b=TZ2NZURNLDy3KiqaYkKl4xNWIlQZy6oAodqIys0NGlJjoLXCikmISeYrtsAIiN7/HKSXtR
	5bMyMaknFrr4psOOWpYM64jCv/4ZtGa8OExtkSOPfmkBuOBAevksHTtDabY7BwoLtU8DGf
	SZev+Tv6abIOMobtzWvD24dw8839CVM=
X-Gm-Message-State: AOJu0YwN0EqkhFQSltYpBDIOgc3n0gQ1s1GN82PxNnb2A+DG2Nq3oYht
	y/sZCplOZALjw7nnuwUTzY4tzUE0ld07VMeO5QTgjML13tYtCYN6ExA0kcxEMEEtrU5VPqOpuHX
	nPuZNK1H0n0Co8tOg3jG427aU8nmam+FaVgseFr5X
X-Received: by 2002:a05:622a:1314:b0:516:3f51:81cb with SMTP id
 d75a77b69052e-51d7bdcb522mr26277441cf.13.1784128062853; Wed, 15 Jul 2026
 08:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com> <20260706175415.2604046-19-vdonnefort@google.com>
In-Reply-To: <20260706175415.2604046-19-vdonnefort@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 15 Jul 2026 16:07:05 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxRFSW=9fAYvikL2t48ykaiGp7O3Mg6ddXdtFZrmWWaGQ@mail.gmail.com>
X-Gm-Features: AUfX_mwQkLtR_K54e2-Z1gB3kd7lVeTizQhfcU3nhShnO-K3WpnpK5Ukazz8LTw
Message-ID: <CA+EHjTxRFSW=9fAYvikL2t48ykaiGp7O3Mg6ddXdtFZrmWWaGQ@mail.gmail.com>
Subject: Re: [PATCH v2 18/18] KVM: arm64: Alloc simple_buffer_page using pKVM
 hyp allocator
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_080809_544623_C36B3727 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

...

> @@ -193,17 +211,8 @@ static bool hyp_trace_desc_is_valid(struct hyp_trace_desc *desc, size_t desc_siz
>                 if ((void *)rb_desc + struct_size(rb_desc, page_va, rb_desc->nr_page_va) > desc_end)
>                         return false;
>
> -               /* Overflow bpages backing memory? */
> -               if (nr_bpages < rb_desc->nr_page_va)
> -                       return false;
> -
> -               if (cpu >= hyp_nr_cpus)
> -                       return false;
> -
>                 if (cpu != rb_desc->cpu)
>                         return false;

Sashiko flagged this. Nothing here bounds nr_page_va from below, so
with nr_page_va == 0 on every CPU the bpage size sums to 0.
hyp_alloc() still hands back a chunk, but bpages_backing_size is
stored as 0, so when init_mm() fails on nr_page_va < 3 the free path
takes its if (!size) return and never frees it. The host can repeat
it. Would validating nr_page_va >= 3 here work?

I don't think the rest of Sashiko's note holds: the zero-size path
succeeds rather than hitting -ENOMEM. And it's only reachable from the
host kernel, not userspace.

Cheers,
/fuad

