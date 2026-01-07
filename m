Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA0AD0D16F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 20:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3exSa+w/ruCuNom7Q+pCI3QLZZsVFpkCvUgONvIs0Q=; b=kxarbdoky5A/9rfkxauUiJWQ2b
	IrtheX38LSW7/iqRDIeo1+jzf58AdP3u3/+5dnDvkYVH4nG1z+R7WORpdDBcpciAB+n6BarSYBODb
	uz6ukWKM9cizaiufxY7MdFFMwq8YvByALfy66I570/RwmqrJFoI/bIX0L5RgkO7KdjgIMD53kbyZd
	6U1H6EIPpjiQxGpbGQMVXbRqp2sJ20U+NNf40K2B2H0ILs7co3sio2doOgt+KWeXZEcfY1lY0HT2O
	CNrOh9MncpzqSKiS5trkY6YL7+MgcLwnuL7HZcMiYMbo/JyLemSb893JuaLnTyfIIdN/gdIcrvfTP
	mVd4Ft6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZul-0000000Fb3y-1rVD;
	Wed, 07 Jan 2026 20:13:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZuh-0000000Fb2s-22ym
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 20:13:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 26AC940571;
	Wed,  7 Jan 2026 20:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D7C0C4CEF1;
	Wed,  7 Jan 2026 20:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767816829;
	bh=uxvX44J65a3nDY+0umcnprVifPJuXrT1Tg8RR+gfdRo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uvMYhz6oZ4NCbtyu8Id9MwSVb19F0sRVD2zj1B7feJgUiHjW5IGjh2e47/6cFpfbs
	 qtjFxxIBVhjIAyHhmVqFB/Qj8+Ak+NiLIqDCvEH3sj6q2Ep1aXFwy4E9Q1BqDV8NX8
	 B9/98pwjqnK73NUXOJUvdq7qkKj/G+MkPHc9whWjM2bC1QuLBorzKtS8oc2BU+cyAm
	 m8hIZ7aAsoDiEGA35ZQG+Jo/M901YFHMFKYGWQWOakxwqItlAmo8wKOtZX99HdMf/q
	 FRcnV13MYM6P+0brrDxpYF7FYsz0hVHuamx29b7Cj+qIfEVfChnQrMWWDFeBiqZX7S
	 vdNAoDay6bUHg==
Message-ID: <08351d85-606f-4409-a02a-369584786c0c@kernel.org>
Date: Wed, 7 Jan 2026 21:13:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: defconfig: Enable Apple Silicon drivers
To: Janne Grunau <j@jannau.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
Cc: Nick Chan <towinchenmi@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 =?UTF-8?Q?Piotr_Mas=C5=82owski?= <piotr@maslowski.xyz>,
 linux-arm-kernel@lists.infradead.org
References: <20251231-arch-arm64-apple-defconfig-v1-0-4ff19805ba39@jannau.net>
 <20251231-arch-arm64-apple-defconfig-v1-2-4ff19805ba39@jannau.net>
 <DFCLU67GQO86.1NY037FRPJ4E2@maslowski.xyz>
 <20260107112059.GB4068972@robin.jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260107112059.GB4068972@robin.jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_121352_639672_AE4D3CFD 
X-CRM114-Status: UNSURE (   9.33  )
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

Hi,


On 07.01.26 12:20, Janne Grunau wrote:
[...]
> 
> What is the merge policy for defconfig changes? If this can be merged
> for v6.19 I won't bother with a v2 and add them later in a subsequent
> change.


I'll pick up the defconfig change this cycle and sent it upstream. We 
can then follow up next cycle with the missings ones and PHY_APPLE_ATC 
which should be in Torvald's tree by then.

Not sure about the Kconfig.platforms change though, does that go through 
the SoC tree or the arm64 tree?


Sven



