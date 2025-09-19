Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E37CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 19:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZc6O1gS0LKhpcOU4jDHkuQ/F2g2CYp+dX9ckaPyyeQ=; b=tU8/FE17ZYzRJTQnAiUWcI9cEs
	H3SonGmo25a5FEBf6ayVlIGoQWQME0qv9Ww25ih0rYziD8RtY6W4Z+dI1ywTLfyei/NWwoQ9P43SS
	a9EF4oxXx6IXZ4ThsgM2zI4gjePAvTtW47EsRv0vch2J5ZJGA88oua37Cr8zd3FLqth974FniOzKF
	/IjliCSD8tUpQ0020ZkxA2CfaIgF7OpVZpvpPWEJMwGL+1u3h2SFUcVEqOtxjB6P3ChieKLB/yseP
	RQ6CuWjBSukeqEuUel3p3CWPzCca1o+Dj+7Eu5lkXIgJ1MRT89qtFtziojHFSDiKEJ4DDsHkzKCZY
	FSdzO8OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzgLR-00000003qAv-1hA8;
	Fri, 19 Sep 2025 19:00:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzgLP-00000003qAP-42XO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 19:00:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0934060194
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 19:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF70EC4CEFB
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 19:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758308430;
	bh=HcwxKv6M4QHuuO2svOhfrhy59mV+y1o/K3jCMijv930=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Mczu+OK9XDThJUVzXu7BRCqV+gkiDiWWCJBLfZERfgtSwaXb85jpQfE/drHGG/Qr4
	 Bmkk5TuSOEcGp4DOYx2lZNDe1/0UELlw6FIp7nwStv4k0BO9R/trqdkCLX3tvjuTOU
	 wbIR6KeyYvrn1EBQXM5gTtw/L+s2PjjTs9RwvDjqNafWP2qWKXcYqtBw8/fqFBHGqF
	 aMW2/X/PMU2aorIIW/EXJTFZYYEFgHxwKBTsUkHm/V9OIu1jAUgIwugSApEzsQKfEJ
	 7W82WtQgA01sGmdfmlghJutyWZxmH7xLKR9EqPjP4QPHrejaEOO+rHitjjCmIucDZ3
	 7GOCZhHoPSSNA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-361d175c97fso19773841fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 12:00:30 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw6dG9EeRZSlstZsqaIga8Nesgy4Ay5glMGLGN+XE9wBhrpLgV+
	vdBxV1A4XINFWbvl6vvHnzz1m8LjIVB0o+rJapdHuLhPzyqq3UjP63Fn8BxUuhVLCUWn947/Zly
	pbM7rzAc6/GIZKaKb9MO+t90wsE6PkEw=
X-Google-Smtp-Source: AGHT+IHO7aSHw670m68ErAhqLH2Bld973VeBVOMCXNxNFPfbHObnL1TOlifyio/GFnkbGA99Ea+PfoARhKlYSiI7318=
X-Received: by 2002:a05:651c:211c:b0:336:6b46:f30d with SMTP id
 38308e7fff4ca-36416fa7840mr16627851fa.11.1758308429068; Fri, 19 Sep 2025
 12:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250919184025.15416-1-will@kernel.org>
In-Reply-To: <20250919184025.15416-1-will@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 19 Sep 2025 21:00:17 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFXKNpoOEpp7AVz-tv0r8JoMrKphF2JgddbqLV6VQebVg@mail.gmail.com>
X-Gm-Features: AS18NWBC0cCk4TPO4PNd13MGdYlbVk2HSEIiAOgoY1lqiu63yh-sqaKWPXRg0l8
Message-ID: <CAMj1kXFXKNpoOEpp7AVz-tv0r8JoMrKphF2JgddbqLV6VQebVg@mail.gmail.com>
Subject: Re: [PATCH] arm64: Kconfig: Make CPU_BIG_ENDIAN depend on BROKEN
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Hanjun Guo <guohanjun@huawei.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 19 Sept 2025 at 20:40, Will Deacon <will@kernel.org> wrote:
>
> Big-endian arm64 configurations are vanishingly rare, yet we still claim
> to support them in Linux despite very limited testing or visible
> interest. Supporting big-endian adds unnecessary burden to reviewers and
> contributors which, without any known active users, is hard to justify.
> For example, recent work to improve our futex routines and to implement
> nested virtualisation support is non-trivially complicated by having to
> support both big- and little-endianness.
>
> Back in 2019 [1], it was claimed that Huawei were using arm64 big-endian
> machines in their telecommunication products but I don't know whether
> that's still the case and certainly haven't seen any patch contributions
> to help support or maintain it.
>
> Make CPU_BIG_ENDIAN depend on BROKEN as an initial deprecation step
> towards its removal.
>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Hanjun Guo <guohanjun@huawei.com>
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Link: https://lore.kernel.org/linux-arm-kernel/73701e9f-bee1-7ae8-2277-7a3576171cd4@huawei.com/ [1]
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> Cc'ing Guenter as a heads-up in case he needs to turn down his testing
> to avoid this causing a false regression report.
>
> Cc'ing Hanjun and Jonathan for clarity on the telecommunication
> situation.
>
>  arch/arm64/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index e9bbfacc35a6..5ac670d41604 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1493,7 +1493,7 @@ choice
>  config CPU_BIG_ENDIAN
>         bool "Build big-endian kernel"
>         # https://github.com/llvm/llvm-project/commit/1379b150991f70a5782e9a143c2ba5308da1161c
> -       depends on AS_IS_GNU || AS_VERSION >= 150000
> +       depends on (AS_IS_GNU || AS_VERSION >= 150000) && BROKEN
>         help
>           Say Y if you plan on running a kernel with a big-endian userspace.
>
> --
> 2.51.0.470.ga7dc726c21-goog
>

