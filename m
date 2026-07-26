Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5078FC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 13:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ckV1U19phOeaxmxGVNQ9Q7jutnvgK/D9/0OgZzl6bI=; b=VYNIcGdyYxLmw1V0NSFXmpq4pf
	utJq5lW4b10LklAyj1h1HsUIWI6Cxt1fMCbRA+ylTdFDNyiH+WtZjgVzMejcsg6HtmrJ9IWywpSIk
	X+ys8N1q7DrjWUekxM/pYfFr5Tc7KMXP9TlIIprsys49otLJyh6yNXePIABZZkdzWx7vgG/z3s50j
	5LDs/7tobcthhCOEzDiezBdoJ1DBM8zjVsPCy83HHQZCLXlXjkDYI0PvcyWvtd49uQB9L8PyeDL9p
	XMHiOzC5ZtahmJDb8mT0Zmx7MQTNkrifeBiUM/c6JTphVOZ8WS7lK6pWb1n+I0SuPevhMi3bE4LB3
	zRQYbx+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnz3e-00000001DEM-3zbo;
	Sun, 26 Jul 2026 13:38:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnz3e-00000001DEG-0oKe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 13:38:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 594DF435AE;
	Sun, 26 Jul 2026 13:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 790491F000E9;
	Sun, 26 Jul 2026 13:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785073101;
	bh=0ckV1U19phOeaxmxGVNQ9Q7jutnvgK/D9/0OgZzl6bI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h2yKAN8edCw7OcTToYKtDlo5VyMnTAvu+aHlR/TZgGelKuxDA/AJg1CYOH9c2hh3c
	 tknaSPmpjcomgShMTLXkEiNbWqZrJ0uAVC7HBCJQ+Z5aI4w9AY9NSiJGoUJ48ahG2c
	 TMV3bYjHfLtcbhoRX5lmLo2xB+7SXV+fYt1FRHo1DxkYxiYc/m6j5blwJQTWljk87h
	 uNoYJrZoJZtiUF124AxKYaU0/GZkwifu14QE2vAb8igvC6aVll07rvcxlyPtVhjsiv
	 IC2x2HeUbAF0XsoCs7mtHTE3WkIdsCSLpSOCpXNjlJIYxpGT3aUautKtfnzleadkWs
	 9OZO4gqRRPOTQ==
Date: Sun, 26 Jul 2026 14:38:16 +0100
From: Will Deacon <will@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>,
	Liu Song <liusong@linux.alibaba.com>,
	shechenglong <shechenglong@xfusion.com>,
	Jonathan Marek <jonathan@marek.ca>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: proton-pack: Restore the nospectre_bhb
 command-line option
Message-ID: <amYNyGksq324kzgN@willie-the-truck>
References: <20260725122959.98361-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725122959.98361-1-kmehltretter@gmail.com>
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

On Sat, Jul 25, 2026 at 02:29:59PM +0200, Karl Mehltretter wrote:
> Commit 7f1635737823 ("arm64: proton-pack: Fix hard lockup due to print in
> scheduler context") moved the "mitigation disabled" printks into
> spectre_print_disabled_mitigations(). For spectre-v2 and spectre-v4 only
> the pr_info_once() calls were removed, but for spectre-bhb the whole
> branch went with the print:
> 
>   -	} else if (cpu_mitigations_off() || __nospectre_bhb) {
>   -		pr_info_once("spectre-bhb mitigation disabled ...\n");
> 
> spectre_bhb_enable_mitigation() therefore no longer tests __nospectre_bhb
> or cpu_mitigations_off() and the mitigation is enabled regardless of the
> command line. The flag survives only in its __setup handler and in
> spectre_print_disabled_mitigations(), so the kernel prints "spectre-bhb
> mitigation disabled by command-line option" while
> /sys/devices/system/cpu/vulnerabilities/spectre_v2 reports "Mitigation:
> CSV2, BHB" and the vectors are switched to EL1_VECTOR_BHB_LOOP.
> 
> The only remaining escape is the SPECTRE_VULNERABLE arm at the top of the
> chain, which a CSV2 core never reaches, so from Cortex-A76 and Neoverse N1
> onwards both nospectre_bhb and mitigations=off are ignored. Both are
> documented in Documentation/admin-guide/kernel-parameters.txt.
> 
> The identical mistake was made on the neighbouring branch by the
> immediately preceding commit 62e72463ca71 ("arm64: proton-pack: Drop print when !CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY")
> and fixed by commit 165eb13e485c ("arm64: proton-pack: Fix hard lockup when !MITIGATE_SPECTRE_BRANCH_HISTORY");
> this one was missed. build_bhb_mitigation() in arch/arm64/net/bpf_jit_comp.c
> still tests both flags, so nospectre_bhb currently keeps the exception-vector
> loop while dropping the cBPF epilogue mitigation.
> 
> Restore the branch. The print already lives in
> spectre_print_disabled_mitigations(), so only the guard is needed.
> 
> Tested under QEMU with -cpu neoverse-n1 (CSV2, no ECBHB, no CLRBHB).
> Before, spectre_v2 read "Mitigation: CSV2, BHB" with and without the
> option; after, nospectre_bhb and mitigations=off both give "Mitigation:
> CSV2, but not BHB" and a boot without either is unchanged.
> 
> Fixes: 7f1635737823 ("arm64: proton-pack: Fix hard lockup due to print in scheduler context")
> Assisted-by: Claude:claude-opus-5
> Cc: stable@vger.kernel.org
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  arch/arm64/kernel/proton-pack.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
> index 7bb6553fec08..4eaa523cdeb9 100644
> --- a/arch/arm64/kernel/proton-pack.c
> +++ b/arch/arm64/kernel/proton-pack.c
> @@ -1036,6 +1036,8 @@ void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *entry)
>  		/* No point mitigating Spectre-BHB alone. */
>  	} else if (!IS_ENABLED(CONFIG_MITIGATE_SPECTRE_BRANCH_HISTORY)) {
>  		/* Do nothing */
> +	} else if (cpu_mitigations_off() || __nospectre_bhb) {

Can you stick this in a spectre_bhb_mitigations_off() helper that can be
used both here and in spectre_print_disabled_mitigations(), please?

Will

