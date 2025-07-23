Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE85C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 00:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDWwMCWNmNg13/uNfIiBkoY/WSAIAnYmTPwjUuO5SDo=; b=JDYR71nuDeZ2YNcAmfzSWr6zF2
	kexdLKzoqxXjXZ/SrhAErAu6fl7jiFnHOAzkMS/sE26lzo017RYvHFHhoJLmB/uebHCwZ9mT0O4f4
	OHRFdAs+9a1k1+Clb21sh6NWLZROpNEHF/hgadGUlbFff9LhT32drAYZnra+S+o2PmtQlp+qw3UAN
	k7isLPNiMzqbnvITOnXJ3TzLhSZ1fwacxspuXujWDXM+viMUp98YNzgDr/qFEwJ6VXwh6y9l/UoHE
	s87LvuprJHf50LlYv4N6D3RxifF56v0LdXVG2WGsvanDNFc07AW7oEcSNGoUKPsg6mHUnk97jrTr9
	e0OzOWIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueNhN-00000003kKF-1HBz;
	Wed, 23 Jul 2025 00:51:09 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueNes-00000003k9b-03Pd;
	Wed, 23 Jul 2025 00:48:35 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-313bcf6e565so235104a91.0;
        Tue, 22 Jul 2025 17:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753231713; x=1753836513; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDWwMCWNmNg13/uNfIiBkoY/WSAIAnYmTPwjUuO5SDo=;
        b=nCgAi/1e0h6Mn0USw/CK9rvN+3OfCcDwSxZUg6WWkxsBPzdzA5Y0rfY26BWvN4wTld
         lRizI9/kGCytLhX0ybCn6fRyIHi1MEiiIB335iu1wzJghB7ikaCUH/kvQo/g2oJZ1G53
         zr+Ky3w6FwTLCVuCJUFXWZYOo34K9WitZuFsZs92Ogdmx+QFHR4Y1OlbZcBA9wENZ6Tm
         YebmXpJAv3UaSmu5lE4bj/kA94rzS0BSXQXCclaeYRXQMZ4e7J6ucZlPRDvLeGYTwvE/
         Lra0W6jlWhSsyt2BqhNpkAnbKwRGeSrz6s2IpNKD/Tq/1QjvZ7Oh2OCu4xgkmD94tdfm
         HsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753231713; x=1753836513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDWwMCWNmNg13/uNfIiBkoY/WSAIAnYmTPwjUuO5SDo=;
        b=w1vTiN6Jts80Y1SC3mLWgxFZjv6EzDqirE367pnxW7P98EMD93YV8X4iYZ9wyZSouR
         pu2WZVriu81PQddQC+w2xBVHO1qqb/PxBnGkBd5EQaHCqRT/2dyau2z0ouaZBJdHcRjO
         VrJQEp2dKK2ZL8no6veZjLiZvTrJGRuDV0WyySyoopC8A2G52xFuqWiOFxea5xrjhKY3
         6KMFlmpm3mlaYHZqzwjfXdj1DW9UJnJiQiVnjhcAyXPU34mi8U+5oaAdbvFyTZsikQzf
         d7YQ1uBV1OaTFMEgXh/dBMgj8gcJpGOdF/1Hz8DSw88SfreLteY730pkAm/abgEFxQIU
         4Y6g==
X-Forwarded-Encrypted: i=1; AJvYcCW7c1RwjJ3bYWZYFFIXxui0uwOaUzhRvZpUfupYFv80rqnDSteSf7dh/3J6A0g2+xoqqYPat31D4r3OXho=@lists.infradead.org, AJvYcCWLKM/gvhgwb7aGNXanofQU/BA5Ly+2EFJNYyAV77oPIVb+SrO6+fwzXstpL9muQ4EzTPA0oByWhOAgOdTEcuWP@lists.infradead.org
X-Gm-Message-State: AOJu0YyIIGQ5jL05D4mQ3IRfxW8yvjwHd5nbkSeF2rghhpDi3L9NTvFb
	kW7oS17kZlNzj2S7Q9mNBnlcCLuuzgLSTW7B0bU5iNgHlRQbtAn/DsltCyzQJgziGm61jG+FzH/
	k1xzz3Gtt6LBEOcMrIR/zDisQVdgQZOg=
X-Gm-Gg: ASbGncuI24RwjptTkM5RwaJZFizLVyyYYmGu6+7Oti8lNwnjbUIugU5HZJYM3Gawzjb
	NRqH0C5lCRFyp5G6siFbtHkItNAHJ2wWWyRdMhvSVrFr62lCmuBEg1+mbXnt92IylzAYjlE5gf+
	SdolEHMx+wYCXrvjYHslGTt/Z9B1YazIsfOp0aw1vx59jRyEjm0j9DYQm/nDjvRk7qX5iL7q5jU
	+R0KdWv
X-Google-Smtp-Source: AGHT+IEROY3xKK1boGx8uMtw+7HtkmcD7Il1aBqwfuxTsZ79ub1lx8jvxICoebRQamqfzBv+TelUdZ/qR6LkFSGFHEw=
X-Received: by 2002:a17:90b:4d08:b0:310:cf92:7899 with SMTP id
 98e67ed59e1d1-31e50812d7cmr712415a91.3.1753231712760; Tue, 22 Jul 2025
 17:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250502094537.231725-1-fujita.tomonori@gmail.com>
In-Reply-To: <20250502094537.231725-1-fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 23 Jul 2025 02:48:20 +0200
X-Gm-Features: Ac12FXwgRZoR7Zgn1XC8m0WPG0N61nJSGet7-c0jdjdrsFebOoekk-VJ_EoxJF4
Message-ID: <CANiq72=Hr5rg7tYta8aUoxt8hOPjR2ik5_-xMWZwacr63=-7KA@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] rust: Add bug/warn abstractions
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, peterz@infradead.org, hpa@zytor.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, tangyouling@loongson.cn, hejinyang@loongson.cn, 
	yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_174834_052946_FC6DE59D 
X-CRM114-Status: GOOD (  16.67  )
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

On Fri, May 2, 2025 at 11:46=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> This patchset adds warn_on macro with the bug/warn abstraction that
> utilizes the kernel's BUG/WARN feature via assembly.

Ok, let's move forward with this.

I took a look at the first three patches and compared the expanded
output for the existing macros, to make sure we (hopefully) don't
break anything else.

It seems OK, I only noticed a removed newline. Was that intentional?
There was also a bad parameter name, but that was not hurting anything
since it was unused.

(For the x86 one could be closer removing a couple spaces, but it
should not matter and other x86 files format it that way, so I didn't
change it. I also noticed unexpected spaces used for aligning the
macro, but it turned out it was in the original already, so I left it
also unchanged.)

Then I found a few more bits on the last patch.

Tomo, could you please double-check you are OK with all the changes,
and please run the tests you did back then on `rust-next` again for
all arches, given it has been a while since you posted it (plus I did
a few changes on top, after all)? I would appreciate it, thanks in
advance!

To be clear, I didn't re-check every single thing/combination, but
hopefully what I caught helps. Since there are no users anyway (of the
last patch) right now, it should be fairly safe.

Applied to `rust-next` -- thanks everyone!

    [ Fixed typo in macro parameter name. - Miguel ]

    [ Remove ending newline in `ARCH_WARN_ASM` content to be closer to the
      original. - Miguel ]

    [ Avoid evaluating the condition twice (a good idea in general,
      but it also matches the C side). Simplify with `as_char_ptr()`
      to avoid a cast. Cast to `ffi` integer types for
      `warn_slowpath_fmt`. Avoid cast for `null()`. - Miguel ]

Cheers,
Miguel

