Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB99CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 11:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lxrLqUMtvVZWfbuIxE7nkSXqALDPINezDAd0k8PW0U=; b=veOd8EjD/rWxceQ7GmF2RJYkbz
	RYqnP2OD9X3KSuRwygmQtwjAHSaF0pr2e60yEb1e95lqIh16qrpDyNh+PvPfoihfiXQO5Hw0RNfJo
	ileQHZlmJh3xpfNawzz9PVwbKLKz6cy6T7oYI7MozdAXu6zpGOKXX9IkSrxVU5HlMNg4PrF1lf+md
	8/mryvBa+K7xTI3lDRqYZkWoAKuTW5v9OzTHaduN+SpRgIk2lKEC7eMyNXuWHVza6v50nJcWMX0yw
	muqhP4S6tEDri7tygxE++AVtoUdmacpGGMU12z5xyk/3JSF0H303/n8fB+2qpvpSzve4WFvGIvh1u
	GKHvB85Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwf3T-00000002VtJ-3JjO;
	Thu, 11 Sep 2025 11:01:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwf3R-00000002Vsx-2NDv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 11:01:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E443940F59
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 11:01:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6C01C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 11:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757588488;
	bh=qcwkKCiYu69+MlAmuClu7yal5bt9UA5Xzjd+iYOanOQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G2gaCq/HPJpvimU0nAjGHqGGFrOWvEpjthSOPI8V7JQxB2xw/jhEtd+BkHFo+0Pj3
	 ZTpt82S/+e2k8p5ngrQ7BjVGsYYNWICjqMdOBBYAjLzxBL3VJUGOc5QY3Ytu5ehgQF
	 dWbv7p+G2Hva6LV23bMvuMDFSM2BcEeL13s9e4gYAKRRWU6bEWe/xDkjlfBoDDfTPo
	 AYLzNVAR/IugHdT8Xzkp9o+NI27Y5nfAEL+v8Oc9K+udOPAluL0PXH1FaID03/RgqW
	 No9/51PXwBIJob6B3OB3vj9MagqTQBjIXdoPcT8xvZaYvwON9QX4nynNguiVOkdEGs
	 yaTXrsTypyrbw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-336e16f4729so4946991fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 04:01:28 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw8L7ceRHsmkK8NwlghTaWZP19pR6YDIkqiYbV0dg8jtZ7rwrDS
	Saz/MA9k8CI3nlRCD88lJ3KQ4scyEeaQ85iuzvYJlxjpgazIZELe+6q4KRHL882ojIP4QkzzQIO
	k67d4lXnZMGNH1fCQsdeh+72DKpdta3k=
X-Google-Smtp-Source: AGHT+IGcEbBFp/2Fh0XeMpz+5/rU4x28vqOtFqExcdzTuNfvhLVgJUe6AzbpIhsu4BDjrjUhuLaPSCReMoUhxkhgDCk=
X-Received: by 2002:a05:651c:19ab:b0:336:e32f:79ed with SMTP id
 38308e7fff4ca-33b55f3292amr64487191fa.29.1757588487165; Thu, 11 Sep 2025
 04:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250910104454.317067-1-kevin.brodsky@arm.com>
 <CAMj1kXHR34kpL1qLgeEgEmRZN1o=umWzjZEzmSV+X2AX-4CvVg@mail.gmail.com> <b0b11c57-e45b-4a53-8dba-93e8ce5800c1@arm.com>
In-Reply-To: <b0b11c57-e45b-4a53-8dba-93e8ce5800c1@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 11 Sep 2025 13:01:15 +0200
X-Gmail-Original-Message-ID: <CAMj1kXG7bpDSnx8stk4eAYP4C4zgCN4qc+QEFFK2y5=RP4Xitg@mail.gmail.com>
X-Gm-Features: Ac12FXw3MQJ-186gJHsvUQGzb5AY80L338hr6NUNkPCASCKkcMmO8Q6YFPmQtMg
Message-ID: <CAMj1kXG7bpDSnx8stk4eAYP4C4zgCN4qc+QEFFK2y5=RP4Xitg@mail.gmail.com>
Subject: Re: [PATCH] arm64: mm: Move KPTI helpers to mmu.c
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Kees Cook <kees@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_040129_626240_878A29C9 
X-CRM114-Status: GOOD (  18.57  )
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

On Thu, 11 Sept 2025 at 12:52, Kevin Brodsky <kevin.brodsky@arm.com> wrote:
>
> On 11/09/2025 11:19, Ard Biesheuvel wrote:
> >> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
> >> index 49f1a810df16..624edd6c4964 100644
> >> --- a/arch/arm64/include/asm/mmu.h
> >> +++ b/arch/arm64/include/asm/mmu.h
> >> @@ -104,5 +104,11 @@ static inline bool kaslr_requires_kpti(void)
> >>         return true;
> >>  }
> >>
> >> +#ifdef CONFIG_UNMAP_KERNEL_AT_EL0
> >> +void kpti_install_ng_mappings(void);
> >> +#else
> >> +static inline void kpti_install_ng_mappings(void) {}
> >> +#endif
> >> +
> > Nit: you might just keep the former declaration, and check for
> > IS_ENABLED(CONFIG_UNMAP_KERNEL_AT_EL0) in the function, rather than
> > propagating this distinction to the header file.
> > But either is fine with me.
>
> That's an option, but that would mean removing the #ifdef around the
> functions defined in mmu.c. They would probably get eliminated by the
> linker if the CONFIG isn't defined, but I'm not so sure about the static
> variable (kpti_ng_temp_alloc). Probably not a big deal but I feel
> keeping the #ifdef is more self-documenting as well.
>

Fair enough.

