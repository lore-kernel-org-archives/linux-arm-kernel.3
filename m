Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C38C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 21:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8sUifbOipNYqUHyx3VWuhZIXR1VP4zw9Dz6cx7kEiY=; b=NjNk/ssmb0697Qg172+KZCfpeZ
	m0Hnl+p919LuaXebD6KCL8KdlIpUafWSHFfEZs0ppqwqo68ScE6sMGrUy5v7A34EIdxhwMSYbtG4K
	VbQ5hpo3IM4eteIKlX6P0groA26PWs1+jANFEk6Gg/6EahxUcvKPEBfFK/n4aaGId8MmbyJg3oHMK
	fhCPKxykBJS0UONuv6TaC/GGI64TcdZofrYhxFEB3+0A7l5kfWWBnQbwbpVYM6oh3As4KV22xxyy7
	hD79cqgE1CQE3f8oxbtLg2A4PkUWy2wcECxhCzByCGRk5OXFSS+hofKCW9lFNiqyBiAIv60jHHnrf
	vUJXnYVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1XQF-0000000Fq6H-0IUN;
	Sun, 06 Apr 2025 21:20:55 +0000
Received: from mail-24418.protonmail.ch ([109.224.244.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1XN7-0000000Fpm6-3189
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 21:17:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743974254; x=1744233454;
	bh=g8sUifbOipNYqUHyx3VWuhZIXR1VP4zw9Dz6cx7kEiY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=ku2/BLwZcHLur85wegvxo11QiqWwDn1mE9x28DKFPqfmNlkcq+4qkCztb667aouXI
	 +0U3XEKSuxXDvOhQmqxznLpR8pRyx9CI24i8LLmdFeoOd07NciKYKu/GeQYHTAW4rK
	 NZVklgm0JZBDnvFdny6YjWmD/FmQnZwH/lHFvUQO7NQzVTvocPBuDgKIikTs+t0Lkq
	 by3nzViSVreTy34syukAksp9X3usH7TeSGUGJApYsONnPatZDr23KT7c+haYkHnVbn
	 PK7PdlrMpLdqZlhug3f5YTR3kX7ZEKeTERPgFw3q8c/uqj1GL7opM1zjEAwQG09cLp
	 3eOVwxHc5IHoQ==
Date: Sun, 06 Apr 2025 21:17:26 +0000
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Manish Shakya <msh.shakya@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: chrisi.schrefl@gmail.com, Jamie.Cunliffe@arm.com, a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, andrew@lunn.ch, ardb@kernel.org, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, corbet@lwn.net, gary@garyguo.net, guptarud@gmail.com, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux@armlinux.org.uk, ojeda@kernel.org, rust-for-linux@vger.kernel.org, stappers@stappers.nl, thesven73@gmail.com, tmgross@umich.edu
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
Message-ID: <D8ZV9SWWK1OG.1HLXBSCAR76CO@proton.me>
In-Reply-To: <CANiq72=p4zjbvVKAR90wY2saFty6AS+-JCNWRvnFu7VeLzg43g@mail.gmail.com>
References: <399cceb4-dcf5-4af8-a8b7-6741e9b7e8ae@gmail.com> <0cc991ff-e0e5-453c-91dd-84710bf7e028@gmail.com> <CANiq72=p4zjbvVKAR90wY2saFty6AS+-JCNWRvnFu7VeLzg43g@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: f467d7a470867f87fb17661f610b7b814febe96e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_141741_900163_C7716417 
X-CRM114-Status: UNSURE (   8.54  )
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

On Sun Apr 6, 2025 at 4:57 PM CEST, Miguel Ojeda wrote:
> On Sun, Apr 6, 2025 at 4:08=E2=80=AFPM Manish Shakya <msh.shakya@gmail.co=
m> wrote:
>>
>> CONFIG_RUST_DEBUG_ASSERTIONS=3Dy
>
> This is great for testing...
>
>> CONFIG_RUST_BUILD_ASSERT_ALLOW=3Dy
>
> ...but this one should really be disabled (both for testing and for
> production use).
>
> `RUST_BUILD_ASSERT_ALLOW` is really only there as a worst case
> workaround (escape hatch) that nobody should ever hit, hopefully.

Maybe we should rename it to something more discouraging then. Eg
CONFIG_RUST_BUILD_ASSERT_DISABLE.

---
Cheers,
Benno


