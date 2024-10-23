Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC55CFA453
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 17:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U10MyS9Lw8JFmiB9HpAbdEI4lyOe06UE+66YRceLvUU=; b=hsvdmBYCGrXTtxlQPZhSpWtf3m
	5ePURhDxRtjQcf5pg2CIsxU48xpHNd/X22CZDcYbnz0FwAbXt7+HZaJbzmcVlXmeaRwWitGib8hW1
	jKHbtGNq6uoV5a87PgmK+9TFHiPhF7qCO0dZR4BJ2xtnT2RCW3Gp4E2UmTqICyFQWkVSWOHKkaPGg
	UyDNPCKEwztV7Qm3phZVNfhwbuv3om6NLpCwKptKnpJDm9ZCPIcQW0gKpf2/8vXe5y0bwM689khKg
	KyppPBoIY06osRA0P/9XQ7BHcezMu9CE4Q+b9MihPQhWU+0456Y4N+RmogK9eKTiC1iXp1H8SCukB
	bpbDRGsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3f0J-0000000FLbK-0a2E;
	Wed, 23 Oct 2024 17:18:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eKL-0000000FBZV-49fs
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 16:35:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=U10MyS9Lw8JFmiB9HpAbdEI4lyOe06UE+66YRceLvUU=; b=rAt9X5YWdBQO9yzXBTrTmyRsx7
	ci7Dyl5Nx+zu/fpA3lBJL9NfEJsnyzNZpqkwjtOR3vNIPbehmySR0x7NqMNN251lIdKzgUFwF8hYA
	QtZrFjW5B6ni+zyDnG11fRlwAcysGPRTmCjpdqKMreKdy967uyCLeuPP9pNPsKlcCfecm9hv0WVo8
	KIumzW1oadJSKPW7lxhJL6mN37u0Vt5fT2C4p01cNgWG6srfGvU+ixcXssviUJlfPWxJfFZ2JbWx+
	wtgw5YeEdsLB7dAOhmAxwnTg5WcM6jDaOhWshNMlDX9F6rQRWghrivSZnXkNRQY7ZF9qmGVgwWaau
	02JOmGZA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eKI-00000008ScF-3GxR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:35:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4812EA4259E;
	Wed, 23 Oct 2024 16:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0174C4CEC6;
	Wed, 23 Oct 2024 16:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729701313;
	bh=+M/rAGDzkw0biZcT2fJ8w/xWO2sn3tGipKuINKaFsRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eHX0rQLREZcmtw0dTxYhLwGuWXFVOoHu5bIknTnXaqSQQAPq1hvZkmtBlhvFLdRwY
	 ltq3BR7E3IDrXMz7yY2mJ2GImFUt8nbJLJorY/VKaKzjw2+h/p0cEQC7s0ocLyNOOy
	 7uDPK/dOXV0Jo8Gfl7j166UvWT/GEX5iMagBrvlJGzDLaKOjgrBDln04BkRSeigj/n
	 ZNnnb7s1sP34o8ofDpmvWwxtmKU1tW32YwfC/5t7IK+mTB0snDihlLCkDAINhVo6vw
	 nfwk7tloeWpY7g95JaBd5vFtxLzyGjyK3ANGDGBAz71E+Y6n8rS94UEYfbY7fldhuk
	 9NtGP8zixMk3w==
Date: Wed, 23 Oct 2024 17:35:08 +0100
From: Will Deacon <will@kernel.org>
To: Huang Shijie <shijie@os.amperecomputing.com>
Cc: catalin.marinas@arm.com, patches@amperecomputing.com,
	cl@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, adamli@os.amperecomputing.com
Subject: Re: [PATCH] arm64: set "rodata=on" as default
Message-ID: <20241023163507.GC29251@willie-the-truck>
References: <20241021053948.5848-1-shijie@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021053948.5848-1-shijie@os.amperecomputing.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_173514_980061_F5684189 
X-CRM114-Status: GOOD (  25.84  )
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

On Mon, Oct 21, 2024 at 01:39:48PM +0800, Huang Shijie wrote:
> From Documentation/admin-guide/kernel-parameters.txt, we know that:
>  rodata=	[KNL,EARLY]
> 	on	Mark read-only kernel memory as read-only (default).
> 	off	Leave read-only kernel memory writable for debugging.
> 	full	Mark read-only kernel memory and aliases as read-only
> 		[arm64]
> 
> So the "rodata=on" is the default.
> 
> But the current code does not follow the document, it makes "rodata=full"
> as the default.
> 
> After patch
>   commit acfa60dbe038 ("arm64: mm: Fix "rodata=on" when CONFIG_RODATA_FULL_DEFAULT_ENABLED=y")
> the "rodata=on" can works fine now.
> 
> The "rodata=on" can provide us more block mappings and contiguous hits
> to map the linear region which minimize the TLB footprint. And the
> linear aliases of pages belonging to read-only mappings in vmalloc
> region are also marked as read-only now.
> 
> This patch disables RODATA_FULL_DEFAULT_ENABLED by default,
> so the default value:
>      rodata_full=false, rodata_enabled=true
> then the default behavior follows the "rodata=on".
> And we can get better performance with the "rodata=on" as the default
> too.
> 
> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
> ---
>  arch/arm64/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index fd9df6dcc593..6f30f749156e 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1649,7 +1649,6 @@ config MITIGATE_SPECTRE_BRANCH_HISTORY
>  
>  config RODATA_FULL_DEFAULT_ENABLED
>  	bool "Apply r/o permissions of VM areas also to their linear aliases"
> -	default y
>  	help
>  	  Apply read-only attributes of VM areas to the linear alias of
>  	  the backing pages as well. This prevents code or read-only data

I think this is the wrong approach.

The "full" behaviour on arm64 is equivalent to the "on" behaviour on x86
so the more consistent change to make would be:

  - Make our "on" behaviour be what is currently done by "full"
  - Remove RODATA_FULL_DEFAULT_ENABLED
  - Introduce a new option (e.g. "rodata=noalias") which would match the
    current "on" behaviour
  - Update (simplify) the documentation

That way, the default behaviour and the "on"/"off" options follow the
x86 behaviour and expert users can fine-tune the security/performance
trade-off using the "noalias" option.

Will

