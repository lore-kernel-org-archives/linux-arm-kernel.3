Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF7BC36000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 07:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adcY5lpBYxhtgE0B4OVlvWzTIzNOH8BCNVpvQyPMMV4=; b=i9SlOrYBI/GAjrHC+h3pBZ22ns
	D6ppCfoOOj5OtaDP+x4HSvryZRpzGzTQajYR9x34pK+LmNcD7MmhCuMrg4oVSdt9IOcwJ+oqnMZy0
	+ExgdWJV+STGlDKKbP8cPxfV5EkvhRuqkHFXJivnr/j2hWHcDnEEvIwMiHXCug8B9+fHjWFAmGEeH
	UyVlUGamCwnGkvvNuHNIPD5BSlMAg50tSy7SlyCLwvx6KFZEuZmmVeTmlW8AGmSuHuVH2AojJhlUi
	I5t6VxdTeCRv/yruR3Y4Lnpb5QnyrkFBpnXwWfFcy4SsnF4SvkhOiDxk+AXhPe0MTowDY2prkeeSP
	ras10tzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvAod-0000000BTPR-0Qte;
	Thu, 20 Mar 2025 07:59:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvAmv-0000000BTJS-2vN0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 07:58:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 424FF43751
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 07:58:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AF7C4CEEA
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 07:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742457480;
	bh=Ess/GFiXQnY/TJf5j8pZaKg+a4s6VGT+FXoCIdtSljY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LTvARj4Ns2d9QyrT1ya7RPJ0WCyjrQ2F+ebTYcZzc3PQh4FZwUFJg+iYm8PXWvzVi
	 /wSZ3RywOLddXzanBd2Qij0dRnUWs7EAzB03L+8B5JlX+n6eiTJ+lg5T/H0uXDRaLF
	 obhdhDfNtSR+1BsAlkJnf8YKFTE7X6gint44dg5IRhwuRabbg6PN5PFnTXdqENJS6/
	 95wmNBccSi04IyWQEnrj+rwlkpSICO/dn8s4w213IXdEVxcn31MVXbU5c1NW57UHUa
	 aaLx39jeLV3/Z8gSVxcHqzJT5THrbuGcYYI5CxB6oy1ADb0KSrS83/jLygoSKu+cg8
	 2mfJUJUH5PUVQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-549946c5346so616132e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 00:58:00 -0700 (PDT)
X-Gm-Message-State: AOJu0YzzclhD0luKXkvV1ciscELc4QhQ4ZokXMp8l1zpM73CPIC0sgRD
	+AbNPgaEybmBH/vAtmbQeMlQ91u+Wk85GsTIu/WvmMHHEhQgento5AGLt1qeRLPuPIoD8OHtBZl
	d4Umjh/5qwWNx/6m7d5SsXZECWDo=
X-Google-Smtp-Source: AGHT+IHxMPNnW3ahoF6dyr61q+mJ5mQKb0REzmKIWVM/WDF7dR9vMAw2jTe0SRluNBmN6Nesu4NshFyCdDUXlanegeA=
X-Received: by 2002:a05:6512:3ca8:b0:549:8fd0:bad8 with SMTP id
 2adb3069b0e04-54acb1b83f6mr1925566e87.21.1742457478970; Thu, 20 Mar 2025
 00:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250318134949.3194334-2-ardb+git@google.com>
In-Reply-To: <20250318134949.3194334-2-ardb+git@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 20 Mar 2025 08:57:47 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHXAYt0xLnx4=+qiCbnuF5U+9dzwnds1yd+vhTtpP5v3Q@mail.gmail.com>
X-Gm-Features: AQ5f1JruVvX2NW9k2AtKWjmGfECveHlfhMO7faRJZ8Td6Fub8xUy3jUEpJHaXeo
Message-ID: <CAMj1kXHXAYt0xLnx4=+qiCbnuF5U+9dzwnds1yd+vhTtpP5v3Q@mail.gmail.com>
Subject: Re: [RFC PATCH] arm64/mm: Remove randomization of the linear map
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_005801_777374_2434CEE3 
X-CRM114-Status: GOOD (  19.92  )
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

On Tue, 18 Mar 2025 at 14:50, Ard Biesheuvel <ardb+git@google.com> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Since commit
>
>   97d6786e0669 ("arm64: mm: account for hotplug memory when randomizing the linear region")
>
> the decision whether or not to randomize the placement of the system's
> DRAM inside the linear map is based on the capabilities of the CPU
> rather than how much memory is present at boot time. This change was
> necessary because memory hotplug may result in DRAM appearing in places
> that are not covered by the linear region at all (and therefore
> unusable) if the decision is solely based on the memory map at boot.
>
> In the Android GKI kernel, which requires support for memory hotplug,
> and is built with a reduced virtual address space of only 39 bits wide,
> randomization of the linear map never happens in practice as a result.
> And even on arm64 kernels built with support for 48 bit virtual
> addressing, the wider PArange of recent CPUs means that linear map
> randomization is slowly becoming a feature that only works on systems
> that will soon be obsolete.
>
> So let's just remove this feature. We can always bring it back in an
> improved form if there is a real need for it.
>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Kees Cook <kees@kernel.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Additional note based on an off-list discussion with Kees and the KSPP team:

Initially, the randomization of the linear map was considered to be a
layer of defense against the abuse of writable linear aliases of
read-only mappings in the vmalloc range, such as module text and
rodata. This has been addressed in the meantime, by mapping the linear
region down to pages by default, and mapping linear aliases read-only
if the vmalloc mapping is read-only.

So considering that, and the fact that randomization of the linear map
occurs rarely if at all on recent CPUs, I think we should go ahead and
remove this feature.

