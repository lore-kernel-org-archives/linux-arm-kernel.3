Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D3DCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 22:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCD4hCc4XJ9cLp0cEeWugpV7A+Kjg6CRiPP8rloQDrU=; b=RxPGYh4jyYA15506d3E6X+hZCw
	4Y7G1o9apYPHrBaa00x87xY/cLFI3P4MBCv9QpGaTM4lUInQHnNtp6DS2QOM40zq7Ivb0MejzYjgu
	ZRiz9m+pq/7t4Pjn7pQCqOoM5XxenpE1Xf08JMXiQAgZ6hPZ0aGvk7KHe4gBE6apPhT63K/FYmNlN
	/oDqL2MHpne8Ru6jGDB0sXuWUFkOWbhYL/GkMnOD5V6wvaINUOsIwOUdiN7U+BK5Usk1Hw2DMp7AI
	tYCP89bn0FxDg2+uLe650OXD2J29/1IKv/rN8/47hf20/AS9TYMn9qNDknVzgNg400E8zYhz7EgY8
	7rkPImxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUXby-0000000Dt7r-2g4l;
	Tue, 02 Jun 2026 22:29:26 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUXbw-0000000Dt7S-1C9w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 22:29:25 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so14506295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 15:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780439362; x=1781044162; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCD4hCc4XJ9cLp0cEeWugpV7A+Kjg6CRiPP8rloQDrU=;
        b=WCFym6764D4cXbtVnFGwF6murFj4hvVIng9dvZhGz7wwwYwDoVDKIkGqn3ivT2pCOy
         lkqqNv4XTyaKOVbsXLtPInuTnAT//04iju1n6lAAr5uWTAQQ7+KXtV0I/EjNez5HIGL+
         Tg9SJbThBITFtqx+xyCbxRNJPYVc5tBPLDJ0vvn3YJdO4YAF3AC0SYXWqIVXpwoYJ91j
         OnCetkUdlNcR0yR7sa/77Wd+cya3H9SN2HuGDv3A75wzDWIfrz8YmbOvA/K+EVlyXvwk
         Oe92ApUgKkP2Lxe1o6eZdMzsIJSYM0ne9p7CkuI0aFJOpTTF+41+e35VDdokr0hcexnj
         mIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780439362; x=1781044162;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uCD4hCc4XJ9cLp0cEeWugpV7A+Kjg6CRiPP8rloQDrU=;
        b=fYoT1lTq8WGxxhQZ2VdZT370DyHEAg86QQB1M8LQK/gIphORePauG2kuYM1RSKo8sG
         8ZZsHWkdDPe4Gslch6GViCZf6cyRz5qDAoZ1Fw1X8aM0hDPfsTgVakfWncoFl/DKbU90
         nyIwsDmOlTewmOddSI8Gbq885ooI4MNLF91twkKqP6J8vyBe1bbSyoQgNcfzVXTIv06w
         PeaEU01EfbrZ7qkIvHgdnriHCy4kxiBWizURWmI9VWJXCKndpF9p2eZSq8kKSZbgb/G5
         u/kpcfYVWdVoO41fmHyT0OqgbbNo3ZeTGzW+JRICTxzfZ4VpiIoxhr0xr7CMFBJbfml8
         rn7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/LYV1ipiPKT0JMdYXdIwDYcrKixoAKZBTqObr1ztl04BDfHpMMsD2ql6sTPzVw9GQglMnNvKn0N7+aa74+TnMS@lists.infradead.org
X-Gm-Message-State: AOJu0YzS06no3/kF/pFgfTGRp0XhNuibvTmqtRHABxTu5B5Gwb6uZIKq
	cJ5Gf8BBM1V2X/ZNSwwZTKXfO+gX5IkP7A+bb0hTUAYqM5Muo0lW9l87
X-Gm-Gg: Acq92OF6lmNNacGmXqcWyR4DsD9saBbL+ohiFKMj6c88T78ZbGvLciaqk6nfXi0hT3b
	xHp8Jl6d+pEQz5EHiFw5YZIF9AuyOcdt4v/WmP6d5BKSOjso+moyk6gdIxHm1TenAiBeGE8oFWd
	aYAQNrO1TigYIrSqKaLm1QiDX6uaCeehih4b7tZcSXabkfyowZE+f5ARUQ2jGeNyLj7w/Le1YqK
	EwaQ2EpPQx8n8m6lXUQCVNlakXENkCKlurIp0fwr/I6jbLunl2bgz+t6zeQU3VY/yeTqblb//GB
	MyTjIbmteNBiDoMXRfzF9gijFjT36a4ALvUtUl0WvejOu6bJ8/Za6pg7uYclwLQGq+ci1zPdArS
	NK14AQ5EPXKAC047esqR6SmiqKdyiav2XW3uka9SEdJyj+AOEZj32s14pGiFWCznoN4Nu29gWcV
	CTPf7mETK0dx2GBmeJrEfOurLinm+pZQfUztW58cmOs6+GSTHvldsnrL717h1Jxp2/YHO2ED2w/
	VvOAEPYXUkStdc3CljGp36K+uSrxAfM1h/ggiLMxBubYpS8EQUrRcQ+H5DrD3Tl9COgHiYWK80w
	UXUoBsMrsQc=
X-Received: by 2002:a05:600c:3495:b0:490:3c90:2cda with SMTP id 5b1f17b1804b1-490b5ed636amr10835505e9.20.1780439361703;
        Tue, 02 Jun 2026 15:29:21 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b612f92fsm3362605e9.15.2026.06.02.15.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 15:29:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 00:29:20 +0200
Message-Id: <DIYX2UV4C7W8.212LVKLCI8WG0@gmail.com>
Cc: <peterz@infradead.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
 <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
 <dave.hansen@linux.intel.com>, <akpm@linux-foundation.org>,
 <david@kernel.org>, <rppt@kernel.org>, <emil@etsalapatis.com>,
 <sched-ext@lists.linux.dev>, <bpf@vger.kernel.org>, <x86@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next] bpf: Replace scratch PTE atomically when
 allocating arena pages
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Tejun Heo" <tj@kernel.org>, <void@manifault.com>, <arighi@nvidia.com>,
 <changwoo@igalia.com>, <ast@kernel.org>, <andrii@kernel.org>,
 <daniel@iogearbox.net>, <martin.lau@linux.dev>, <memxor@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260601183728.1800490-1-tj@kernel.org>
In-Reply-To: <20260601183728.1800490-1-tj@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_152924_363667_0E792B18 
X-CRM114-Status: GOOD (  11.93  )
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

On Mon Jun 1, 2026 at 8:37 PM CEST, Tejun Heo wrote:
> apply_range_set_cb() maps the pages for a new arena allocation and return=
ed
> -EBUSY when the target PTE was already populated. Kernel-fault recovery
> leaves the per-arena scratch page in unallocated arena PTEs, so a later
> bpf_arena_alloc_pages() over such a page hits that -EBUSY, and every
> subsequent allocation of it fails the same way. Allocation must install t=
he
> real page over scratch instead.
>
> Overwriting the scratch PTE in place is a valid->valid change, which arm6=
4
> forbids without break-before-make. Route through an invalid entry instead=
:
> ptep_try_set() fills only a none slot, so the PTE goes scratch->none->pag=
e.
> On finding scratch, clear it and flush_tlb_before_set() before retrying. =
The
> new flush_tlb_before_set() is a no-op except on arches like arm64 that ne=
ed
> the break-before-make TLB invalidate. The loop also copes with a concurre=
nt
> fault re-scratching the slot.
>
> Arches without ptep_try_set() never install the scratch page, so keep the
> must-be-empty check and set_pte_at() for them.
>
> Fixes: dc11a4dba246 ("bpf: Recover arena kernel faults with scratch page"=
)
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Cc: Alexei Starovoitov <ast@kernel.org>
> Cc: David Hildenbrand <david@kernel.org>
> ---
>

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

