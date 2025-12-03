Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304CFD15DB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 16:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GLNw0G6b149MCzPLLEzRuLxoLDWEj7jHYuM/qIPSZAs=; b=EDS7UrgpJIj9ACZKQPIkqNAyPy
	8vkWYxyTiEz70RuY2XTISmuPrCkiwYBQ9/ZUiaZEGCGj4vZJl/nrrwzFVPdjhAs+8B86tosPX0s1C
	o72An5MIsIW7iebvjNK9n8Bzrve4L36HSMh3YxLkRz4ju44VCr9M32XN9MU/zdXSudXz2gI4fTCtK
	aXxaYZvtLuRDFWyd6fFGclmIiLSlQQNU9LhHt2cjO+s5PPIg8VNCzFpefXkPozoPrqzAkKDpCgvOH
	G8RlcPFLqr/x/msQNvem4m/8qntSOpNdrx89b+y9cdxzE9nUysiMspy2LjS3qVIdKuI2PrZgoJZWs
	figvlqsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQqCX-00000006peZ-3CCp;
	Wed, 03 Dec 2025 16:59:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQqCV-00000006pe9-3P5j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 16:59:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BBC1244397
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Dec 2025 16:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE85C19421
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Dec 2025 16:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764781174;
	bh=GLNw0G6b149MCzPLLEzRuLxoLDWEj7jHYuM/qIPSZAs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JvwgrgcfGebBMg0+kif06uP4+Vu1gxC5loY2xSXlJZtgAzlldFv8S4vy2RyKW8TJf
	 wN2B9KwnwO8jdAxqox8WRFRELSKTOJcpDSnY/Ie2MCFmVBRE1wiWIWYfSTxe3bBQJ1
	 rhFRiWN3jpbitk07IXTF/9atAtyiqJUI6Iqk4RY1sUg0u15qWiirDgKJ0xcp9jhazb
	 eLsEuxM8bIxpnLNnDUImwJTE78o0h4A8RBdofvlLtcuwKfNhhgAVFtVPNE5z/50OwK
	 9wU5vsbUGkEXfMItdT/sF9Obxsbn6iaroqOtWfdz72NKOVyUgo1L/gYEsGuLmrcR+M
	 AEvyvB3KedC5A==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5958931c9c7so9065828e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 08:59:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXhlzRajcRooaj947JdrxsDfhTYhWt8ZxPnqDzgAMH0qUyeJryvoJsoNgIu7RL4/we9try3rGrh0ULv8TptdLKG@lists.infradead.org
X-Gm-Message-State: AOJu0YwVy7KRUZx18CSeEd5l1qkMs76t8G3VnVJ1uSKGSPjEjTLxCXV+
	rE0vBIN2KoYrBmvtu/b/b+2N8uy2DriCoRDlnPifgPORocj5XGuOUSVmK1YEPVHIFJb+A7pUwLh
	ws9LzQM6VfZd8CBLY5gSTplIcz5daz8M=
X-Google-Smtp-Source: AGHT+IFxEQ2Jijkxcdh/scou3ByOpWOH6CyVQrhGC1j+BRsw+a4wNEkslTkW0FzZgwwrgB0TC7sHeOVJskTQid6Ey9M=
X-Received: by 2002:a05:6512:3a95:b0:594:51ac:13e with SMTP id
 2adb3069b0e04-597d3f5be96mr1435500e87.17.1764781172972; Wed, 03 Dec 2025
 08:59:32 -0800 (PST)
MIME-Version: 1.0
References: <20251127092226.1439196-8-ardb+git@google.com> <20251127092226.1439196-10-ardb+git@google.com>
 <20251127150614.GA3271003@e124191.cambridge.arm.com>
In-Reply-To: <20251127150614.GA3271003@e124191.cambridge.arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 3 Dec 2025 17:59:21 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHhSFj-ScYXCZu=9SyWp8j3ZrO4qwOcmKLZ9FBLwN6-Qg@mail.gmail.com>
X-Gm-Features: AWmQ_bmIzYenu2M9X7IlJutEKtuuegnOzOylc9adBpVGEOeCZ6TUe0IIN3luTYU
Message-ID: <CAMj1kXHhSFj-ScYXCZu=9SyWp8j3ZrO4qwOcmKLZ9FBLwN6-Qg@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH 2/6] arc: Wire up cmpxchg64_local() to generic implementation
To: Joey Gouly <joey.gouly@arm.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jeremy Linton <jeremy.linton@arm.com>, 
	Catalin Marinas <Catalin.Marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_085935_870422_933789AC 
X-CRM114-Status: GOOD (  11.23  )
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

On Thu, 27 Nov 2025 at 16:06, Joey Gouly <joey.gouly@arm.com> wrote:
>
> On Thu, Nov 27, 2025 at 10:22:29AM +0100, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Provide cmpxchg64_local() for hexagon so we can start using it in
> > generic code.
>
> nit: this is for arc, not hexagon.
>

Indeed, thanks!

