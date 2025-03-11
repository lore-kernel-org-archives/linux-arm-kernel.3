Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C848C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=onbqZ1oySKoxpyE/GjiNMDDbJqNwsQHqEyeVz6HRqTI=; b=dv/3994Nnb+AonLzKky6lDLW41
	gVFEt8LopxYYkIfFI+8lflGGXAQQ3IcGm7ajRfMxDs9qgdP3ZQw8jw1R79qtSVoQ3sS8youEv2FpN
	kyLK6gytCs99Yq7SaNo4xnyPdXBaL6cCFZ0yDPGbZIPnS2yxluovZewcWh3Zy7VXcG9kHNY0Hbvu8
	NAf5J8QAPHn5k0F1LaHtbr9BVWYtRO/KeH+VardQoYasSPn271YnKH2oghEF8yXIBHARnBLLp03DQ
	WuLoi2cZdcvp36KiCQbEpmc3noSfjDpVyObCZbOMlLwkB9LhNBTJDKYuYlVxE8ioEHFNFzWULiIKJ
	vD0sn2rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4gP-00000006gEL-01KC;
	Tue, 11 Mar 2025 18:50:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4SR-00000006e7Q-3cSp
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Mar 2025 18:36:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=onbqZ1oySKoxpyE/GjiNMDDbJqNwsQHqEyeVz6HRqTI=; b=k5Axs3/WjPiJJ7YS3V4n0A/XSp
	OCb3bDPIQnu2HqEz9wZkK5uDS5MRr7lRni4zDjnZbhDiaugdGcA69JuqveDKZX9N4wNUoIT2QHtHb
	AxFIB/ucBWOhKkChfTxtLqZ3noK3zZlTXYP0oRMdYUtLHepNC9x/kwbnMvzMQ6zGWqNxrSF5e2ARC
	ZgeKz/VI/nXLg+m18OPzuwPflYeok4ijfl42L6WNn5Z2Y5/b9sVjxBAxZHTsYWUn2dUH8AtzfA0g1
	0UK1OoDF3AwylNbtyVxuM5IGsGOe9AdCyhctUzhy4fm2ujVHSfO9I+qJt7MV9peV/D52bgyMdavBE
	THreS0Ew==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4SO-00000002DJ6-3ZQb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 18:36:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B2D21A4614D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 18:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B85C4CEEB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 18:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741718156;
	bh=C3Fu9VZ//tLVqjh/lpC24EbbrWvhMWEhn1OeRH5ZIQo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FzVvI9Q1Mgr/kZwqBT2sbv5S6JnVBKCWZ9oNGGqnjnmKX1U2uHtj3yRvflQYw4Trc
	 FvxMFKvfDxjoZ3i7n+YloK+pfBXaZA49wKFSHC77su+vL+b0i5kEtDdkfB3fmGw0hf
	 epnoiy/U4dlm+jBK0oiMnZKD6Agme/nSXNjEtE6N3XhoJBvq/NpaYheDMi6vWK0XCU
	 Zf6nMeQYbvhVyYCiHin6cpI4b5zOgbqY26Qf9fL8WnGBEFdD4wK9c2/W2URGhwwt17
	 Nam8ampBkCrrgawpxJB54KWYwxtAIBxclfgwXv8ii4vM9xuONjf8W0pSSToieNq026
	 jyWSOQVg3aYsg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-549967c72bcso4422090e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 11:35:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1Qwzt+7NsgARl62x9cN/yawMd+1S/1hxjQTJygZjt1/U5LU5uK7XK5TM7+47hDyzKOVPt3NfHpfnTV0pTGmdi@lists.infradead.org
X-Gm-Message-State: AOJu0YzyJtkpo6HnyToofAWSZHs33zyYsYhtcKKKkemBXNMqmNhmUx6f
	nxkaYNOCczyQ4mE3pYvKbpN69Ks/a4Wl6aGiiUMXQ3KdUMdrfS1xBHlFY6BiHi2j+mDQCdy+EZ6
	lrIxLK0pw7cU3PRuCApHZnwDgi3k=
X-Google-Smtp-Source: AGHT+IGKO3LEt2dY9lnYM/6J5lWrrZqj20/ln1u5D/q/+YR9i2v6huzoaHEx6Y0RMc4wCok8fnUA/Z/QlrVkEBAMMGo=
X-Received: by 2002:a05:6512:3ba5:b0:549:4e78:9ed7 with SMTP id
 2adb3069b0e04-549910d0e7bmr6900175e87.49.1741718154697; Tue, 11 Mar 2025
 11:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250311073043.96795-2-ardb+git@google.com> <f6d48d04-fd3c-493e-b7a0-020b912f6f10@arm.com>
In-Reply-To: <f6d48d04-fd3c-493e-b7a0-020b912f6f10@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 11 Mar 2025 19:35:42 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG1jqi9vfTS4wz_a3QPERCUYbHcV6Fq+jf4ZkPtgM5oAg@mail.gmail.com>
X-Gm-Features: AQ5f1Jo13aqKNs0iOZu9UW4iJMWSx5DpHNo8bX1-78BGMmsmqGacCrC-JnW94S8
Message-ID: <CAMj1kXG1jqi9vfTS4wz_a3QPERCUYbHcV6Fq+jf4ZkPtgM5oAg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64/kernel: Always use level 2 or higher for early mappings
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	mark.rutland@arm.com, will@kernel.org, catalin.marinas@arm.com, 
	Anshuman Khandual <anshuman.khandual@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_183601_214678_97D2093A 
X-CRM114-Status: GOOD (  28.10  )
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

On Tue, 11 Mar 2025 at 12:31, Ryan Roberts <ryan.roberts@arm.com> wrote:
>
> On 11/03/2025 07:30, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > The page table population code in map_range() uses a recursive algorithm
> > to create the early mappings of the kernel, the DTB and the ID mapped
> > text and data pages, and this fails to take into account that the way
> > these page tables may be constructed is not precisely the same at each
> > level. In particular, block mappings are not permitted at each level,
> > and the code as it exists today might inadvertently create such a
> > forbidden block mapping if it were used to map a region of the
> > appropriate size and alignment.
> >
> > This never happens in practice, given the limited size of the assets
> > being mapped by the early boot code. Nonetheless, it would be better if
> > this code would behave correctly in all circumstances.
> >
> > So only permit block mappings at level 2, and page mappings at level 3,
> > for any page size, and use table mappings exclusively at all other
> > levels. This change should have no impact in practice, but it makes the
> > code more robust.
> >
> > Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> > Reported-by: Ryan Roberts <ryan.roberts@arm.com>
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> > v2: take the assignment of protval out of the loop again, so that
> >     clearing a mapping works as expected wrt the PTE_CONT bit
>
> Ouch, totally missed that. Now that I've looked at the code properly, I wonder
> if it is worth supporting CONT_PMD mappings at level 2? That would be 32M for 4K
> pages, so is likely to actaually get used. I think it would just be something like:
>
> u64 cmask = (level == 3) ? CONT_PTE_SIZE - 1 :
>            ((level == 2) ? CONT_PMD_SIZE - 1 : U64_MAX) : U64_MAX;
>

With this patch applied, it is guaranteed that cmask is only
referenced if level >= 2, so we can simplify this as

  u64 cmask = (level < 3) ? CONT_PMD_SIZE - 1 : CONT_PTE_SIZE - 1;

(using the level < 3 for consistency with the protval assignment)

> Anyway, probably not worth the complexity for these boot-time tables, so regardless:
>

They are created at boot time but these are not 'boot-time tables' -
they are the ones that are used by the kernel at runtime. So I think
it makes sense to add this.

> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>

Thanks.

