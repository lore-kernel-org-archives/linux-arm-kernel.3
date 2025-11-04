Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D92CCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 13:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWllGX1MMtxiRedjfqMRJ8FqbdXbLLxpGyjmvt9VVBs=; b=rS6lqmVoJZasHpos/xEWep1NiM
	kuRaEep8SOUoE4An9mNdIyxrY+k7qQmdfjv/MlW4BJyn1CBj6nTYK6EY3uGYeao80zwtkGKVTrE/8
	gRrCyY8/X+p5d3naPQ+sTUHXlprqDyUKbnYi282e77VUKwbWGvr0xgf7I69aw38qMghAMieysHozY
	3B3xn4nmMO6+t30nfkXo6VsBlu2TGlibBA/uQqIzDUbnAfoMOzl0ICGqztLovsRt+jgehpKBxa55E
	EsuOqIyOHcCmpOlcR2KPpBITcXSkC4AK5c95y/4tmt/OsL1Rr75zIe0d4dXaGeIqvR5Sw624/orkD
	vOb2KP9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHVm-0000000Bvbu-2Bsw;
	Tue, 04 Nov 2025 13:55:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHVj-0000000Bva6-2uvU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 13:55:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 190B4446DF;
	Tue,  4 Nov 2025 13:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28B8C116B1;
	Tue,  4 Nov 2025 13:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762264547;
	bh=G3VU4ztVKcvkUx9snPYfkRyw4Hbg8NsZbBTz7yXbbMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SIjTg2vr88Jluwg0BWr2AaAiabXujExUwccYZrvT7V8wl+0qnk/o8BJKcC4D1Ydpn
	 44pgtnQ+qZwCHvvz8TAjr9NIlUcmMJH4mrDbOJ9VYf4r1HUzPbwae7vjZVYYspTOnQ
	 OpaUj5xfSCuvtvprohitxKhtSaHgWmD2XB2mJzSIMBb6Kns59YMiWwg0Q/5C4vp5mE
	 GZfoWsIP/jALMr5IUlhtvFonNrc+URSogepMSpobYHM7sqEN7ERPybfoHrHnN4s0FD
	 irzqqWSvZ+brRf6Z32MZoqo8W1tQ2mKO93nIZhnOn706dRw+jViW4Lewnj+SdW8xV+
	 grJqw4S5Gh1pA==
Date: Tue, 4 Nov 2025 13:55:42 +0000
From: Will Deacon <will@kernel.org>
To: mrigendrachaubey <mrigendra.chaubey@gmail.com>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Fix typos and spelling errors in comments
Message-ID: <aQoF3pu8CjO3tAl6@willie-the-truck>
References: <20251011144004.14946-1-mrigendra.chaubey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011144004.14946-1-mrigendra.chaubey@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_055547_759468_3E8FAD24 
X-CRM114-Status: GOOD (  11.91  )
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

On Sat, Oct 11, 2025 at 08:10:04PM +0530, mrigendrachaubey wrote:
> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
> index ab83089c3d8f..3cfdb77fb47c 100644
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c
> @@ -3053,7 +3053,7 @@ bool bpf_jit_supports_exceptions(void)
>  	/* We unwind through both kernel frames starting from within bpf_throw
>  	 * call and BPF frames. Therefore we require FP unwinder to be enabled
>  	 * to walk kernel frames and reach BPF frames in the stack trace.
> -	 * ARM64 kernel is aways compiled with CONFIG_FRAME_POINTER=y
> +	 * ARM64 kernel is always, compiled with CONFIG_FRAME_POINTER=y

Seems weird to add a comma here?

Will

