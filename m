Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2A5C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 09:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjGPVOew5ysCF3WUc2TZ8QW0kJr9lTS0DgEOW24GPw4=; b=vv7qStvirsbCO3CbqKheM9I+eZ
	kJqIh2J97oXxMkSEGkPpRiha6XMkl05GVvRzSPEAtp/j/bgvzPFUL+/q4NUBS7XoMw5jkPN08XpkD
	3M2G1VvusVvJJKKaNfcvFxsTRF75JDryG78tCNgky+mxUsYqIeDrPugU3skP+ZoPADupCYk8DNbyz
	HIcQopgHbqcFxgOHVmN02urNDCWi7aw8nK1rIcWOurdrMBJ88ZJnaKaTMzSwLpftiOU3BJDCmrBK1
	C7474jjksjdTRhoEkeJUfq1G6DBQjSZzMw7crRr45SPTnSQmtrEJFKw3ttoQ2IoX8KV+rTmuoURFY
	+xcJBK4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wNY-00000004ohL-3ULm;
	Tue, 22 Sep 2026 09:01:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wNW-00000004ogj-3ENR;
	Tue, 22 Sep 2026 09:01:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E75260DDA;
	Tue, 22 Sep 2026 09:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DD21F000FF;
	Tue, 22 Sep 2026 09:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790067689;
	bh=mjGPVOew5ysCF3WUc2TZ8QW0kJr9lTS0DgEOW24GPw4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RKTk+bn3+WrRh+uEPi4QsKpCQMBXdiVXaebzTyFMU52JIHYsRCsBMfXvtU7rub77Q
	 c2fEr37xSa/FgKfpQbOmr0c9p9pK/zq6q4W/drmX1lPcv3vRb3icWMD4gg0qNqTTVp
	 uy4jqLPrcnvvlNYaJ71axxVw70rxXcvMAz1o7bQwK2I4DFT70VIVpDD/fsuuwVCvnA
	 gq5CeO6ZT33+PfALex/ZbfH0KlRpf3mb8fEQaBSo3yx6fPOHe5xxnwc1aQjElG4KjB
	 rL3CjuBhz5Xe/jnj1pnhwqK3B7MWS+9TGPt1ZlARHlpTuVgUjv3joyNdav1qEFlRuN
	 0jXrGWn1YgZuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 7/9] of: reserved_mem: mark /reserved-memory entries
 with MEMBLOCK_NODUMP
To: robh@kernel.org, "Wandun Chen" <chenwandun1@gmail.com>, m.szyprowski@samsung.com, baoquan.he@linux.dev, rppt@kernel.org
Cc: aou@eecs.berkeley.edu, akpm@linux-foundation.org, pjw@kernel.org, chenhuacai@kernel.org, mingo@redhat.com, kexec@lists.infradead.org, palmer@dabbelt.com, pasha.tatashin@soleen.com, hpa@zytor.com, ruirui.yang@linux.dev, iommu@lists.linux.dev, pratyush@kernel.org, kernel@xen0n.name, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, robin.murphy@arm.com, devicetree@vger.kernel.org, catalin.marinas@arm.com, alex@ghiti.fr, linux-kernel@vger.kernel.org, x86@kernel.org, will@kernel.org, loongarch@lists.linux.dev, saravanak@kernel.org, linux-riscv@lists.infradead.org, conor+dt@kernel.org, tglx@kernel.org, mark.rutland@arm.com, bp@alien8.de, dave.hansen@linux.intel.com
In-Reply-To: <20260922084256.1515554-8-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
 <20260922084256.1515554-8-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 09:01:25 +0000
Message-Id: <20260922090126.03DD21F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] of: reserved_mem: unconditional MEMBLOCK_NODUMP breaks firmware de=
bugging
--

commit 70f4cbca539766519d8967f7e857d2db27db4c13
Author: Wandun Chen <chenwandun@lixiang.com>

of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP

This commit marks non-dumpable reserved-memory regions with MEMBLOCK_NODUMP
so kdump can omit them from the vmcore. The marking is guarded by
CONFIG_CRASH_DUMP to avoid splitting memblock.memory entries unnecessarily
on non-kdump kernels.

> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c

[ ... ]

> @@ -677,6 +677,21 @@ static void __init fdt_init_reserved_mem_node(...)
>  	reserved_mem_count++;
>  }
> =20
> +void __init fdt_mark_reserve_mem_nodump(void)
> +{
> +	struct reserved_mem *rmem;
> +	int i;
> +
> +	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
> +		return;
> +
> +	for (i =3D 0; i < reserved_mem_count; i++) {
> +		rmem =3D &reserved_mem[i];
> +		if (rmem->size && !rmem->dumpable)
> +			memblock_mark_nodump(rmem->base, rmem->size);

[Severity: High]
Does this unconditional masking prevent debugging of coprocessor memory and
firmware state in vmcores?

Since only the CMA driver sets dumpable to true, it appears all other
generic /reserved-memory regions (such as DSP logs or ramoops) default
to false.

Because fdt_mark_reserve_mem_nodump() unconditionally applies
MEMBLOCK_NODUMP to these regions, and there is no Device Tree property
provided to opt them back in, is there a risk that system administrators
will lose the ability to inspect these regions after a crash?

> +	}
> +}
> +
>  struct rmem_assigned_device {
>  	struct device *dev;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922084256.1515=
554-1-chenwandun1@gmail.com?part=3D7

