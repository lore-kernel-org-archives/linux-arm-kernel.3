Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C485BC531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 13:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmRh/ACBysE186L/e3+qC66mAm/FBcpbHY2HLNoqumI=; b=cq/vfNXnnHxrPb0GHLz3nAtojl
	BaIYVHYGzYqU7D2C2Ue9mfJD5AFKzV23uQPBRX6MG5aT5bEhhId13j6PFqbcmlrFMeGkDBEsnzlh/
	yxixN7eDsEQf8oT3xd4225GllD0cKaRZ+8VqrN9NBaHllmlnRBCOEh5f1rkWI7nc4di43L+DPV3ai
	WatKKHv3vZkxs1PprqCB1UYmZ9dptgbO6ADEWL1WmqYZ5Bhz9anPKb4mGnTJw0wzrM24KsVv9tjx3
	7Xp+d4aj0V/DR7bEfxMjWCwH7CfhrYZc701TucwmpXIZpLx9NQ1j2OAmKxG1JJdd5RCiNTRmhQa0v
	tuzEHiCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmt79-0000000EK2s-1KSc;
	Thu, 23 Jul 2026 13:05:27 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmt76-0000000EK2H-3Iso
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 13:05:26 +0000
X-Gm-Message-State: AOJu0YxaVbFqC8zRe8R9pbt+9D33rS3xjuJtF7UwvaA20lUcaNEBTzqE
	6wX7QkMGqTDZn5HLZTqrjLGcVPWoNziDnD/AR0eD7Y4pIIvGbHgJaDwCEf/IUwDyxeeoMo0/vxt
	eRfRIrcLoEuoy3Snhaf+q7epsyzwviVj0pGyIsqJT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784811918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qmRh/ACBysE186L/e3+qC66mAm/FBcpbHY2HLNoqumI=;
	b=MIwPkCkYwpVLwOI6fdKSxXodYeHRMOUQ1wdcWurWhLZZamf2agNreeHeUg/5G2oIdr0y4G
	+hOGRM8kLAErXbV4HD0PvJEvOjhwOcSf5Lyd+XU//7gt6VVpVhAcOdNr+q6pkPXZiswtGc
	JD/gVeMFr8oLZMTuPbemghf4DKSq4nk=
X-Received: by 2002:a05:622a:2506:b0:51c:ca9:3d15 with SMTP id
 d75a77b69052e-5283bb03cfdmr9429261cf.12.1784811914851; Thu, 23 Jul 2026
 06:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260723130233.3123-1-will@kernel.org>
In-Reply-To: <20260723130233.3123-1-will@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 23 Jul 2026 14:04:38 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwA7rzDHFUEbLRrAH=GPT4NqH7SpSOidmu+nO7Xh=ayRA@mail.gmail.com>
X-Gm-Features: AUfX_mzZkLXNyj46qQDjbfUviYWHowwloq72Kuj7N7E4RNvmG0-6Ws3i37D6TyU
Message-ID: <CA+EHjTwA7rzDHFUEbLRrAH=GPT4NqH7SpSOidmu+nO7Xh=ayRA@mail.gmail.com>
Subject: Re: [PATCH] arm64: cpucaps: Remove stale comment about keeping
 capabilities sorted
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <willdeacon@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_060525_029528_58AF1A72 
X-CRM114-Status: GOOD (  17.87  )
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

On Thu, 23 Jul 2026 at 14:02, Will Deacon <will@kernel.org> wrote:
>
> From: Will Deacon <willdeacon@google.com>
>
> There is no functional requirement to keep the entries in arm64's
> tools/cpucaps file sorted alphabetically and, in fact, they have fallen
> out of order over time. Given that only the arm64 tree touches this file,
> just remove the stale comment and accept that we're collectively not
> very good at the alphabet.
>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Reported-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>
> Follow-up from the discussion at:
>
> https://lore.kernel.org/r/20260519092243.7278-1-will@kernel.org
>
>  arch/arm64/tools/cpucaps | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> index 9b85a84f6fd4..3fcac789b0a4 100644
> --- a/arch/arm64/tools/cpucaps
> +++ b/arch/arm64/tools/cpucaps
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  #
> -# Internal CPU capabilities constants, keep this list sorted
> +# Internal CPU capabilities constants
>
>  ALWAYS_BOOT
>  ALWAYS_SYSTEM
> --
> 2.55.0.229.g6434b31f56-goog
>
>

