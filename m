Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD566C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIlyxI3oIQPrv8rT/JFahstddPM/FgX6y8BO7M0LV8A=; b=XYqaqt0GQK7QLNajj8hHc1HZgc
	rVf+t5Byr3r/AqGXajioiFdo1ntYl+NnFrOKrcboGNGc4WU4fwtWd17WLJcAmsOgOXl5lFq/1F09s
	lrWDvFGfFUpGtbcBFTuPWgyzweQRE61parubiZIH4xq7QNi93xkVozR3QKo0cdWJMPWCEH6K0GqTq
	zeiN1t/ROcpqZtUVoKRoxYZRNaqJ0Arh/sE6MvrxK8OKddxrjGJaRFwmgX98f+JsZuSrVbJ0cLV6r
	jP8swB0XivRC7KubD7li6zpWxZKfJrKpEEbUrkKAFUpiU8Szixx1cjELYR5tqHc9yL85TA0xrvumV
	JL9yjUZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFJy-000000096LL-30hT;
	Mon, 13 Jul 2026 11:59:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFJx-000000096L7-1bsG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:59:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7BE72600FC;
	Mon, 13 Jul 2026 11:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74CFF1F000E9;
	Mon, 13 Jul 2026 11:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783943976;
	bh=kIlyxI3oIQPrv8rT/JFahstddPM/FgX6y8BO7M0LV8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TGQgb1W8XunndD3pnSOJR8FhNZBFtiRa4R/mewCUu9V1ru0vEo4vpe02N6oYcq0Bh
	 jJXL8g5ES+zT3PaITgTAQcwqkLB/47cPEdXQd6YUxIRraiRIq+D8Ezh3+TitA9bANp
	 JWbk9cF12dst+P8nLi5I9JP64pDs+iwnUVyqVpSelT9vAUIdwf/4ha5W8zxr8VjOGn
	 QA9bEATH9mIncHJNS3GOJuiKBJhy+L1yk2htFxJFWYZR7GPb/pVTqaBYuj/PaV/ByK
	 TyfcaDB1NckGCZmXbOaA8NWM5iwq4vLYdZeSRA9SGQLsbUocmA4awG37tVVC2b2bQ1
	 kYhZpfA38YT+g==
Date: Mon, 13 Jul 2026 12:59:31 +0100
From: Will Deacon <will@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Yureka Lilian <yureka@cyberchaos.dev>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arch: arm64: add early_param idle=<wfi|yield|nop>
Message-ID: <alTTIx_aw3L0ibqN@willie-the-truck>
References: <20260711-arm64-idle-param-v2-1-0ab67652a435@cyberchaos.dev>
 <20260713-bulky-thistle-leopard-c66a18@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-bulky-thistle-leopard-c66a18@sudeepholla>
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

On Mon, Jul 13, 2026 at 10:57:38AM +0100, Sudeep Holla wrote:
> On Sat, Jul 11, 2026 at 09:35:25AM +0200, Yureka Lilian wrote:
> > Overriding the idle mechanism might be useful for debugging and performance
> > testing. Add a cmdline parameter for it, similar to the existing idle=
> > parameter already present for the x86 and ppc architectures.
> > 
> > It is also useful on platforms where the WFI instruction misbehaves,
> > such as Apple Silicon SoCs. Generally, a misbehaving instruction should
> > be treated as an erratum and patched using the alternatives framework.
> > However, in the Apple Silicon case we need more flexibility because it is
> > difficult to detect whether the erratum applies. For example, Linux VMs
> > inside macOS have the same MIDR and may even seem like they're running
> > in EL2 in the case of NV, but should continue using WFI (it's trapped and
> > handled correctly by the hypervisor there). Thus, we prefer to
> > let the m1n1 bootloader add the idle=nop parameter[1].
> > 
> > Link[1]: https://lore.kernel.org/all/99b69262-e54b-424e-baa2-96ef7013b87a@kernel.org/
> > Suggested-by: Will Deacon <will@kernel.org>
> > Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> > ---
> > Changes in v2:
> > - Applied suggestions by Anshuman Khandual (Thanks!)
> > - Link to v1: https://patch.msgid.link/20260705-arm64-idle-param-v1-1-7454249f473f@cyberchaos.dev
> > ---
> >  Documentation/admin-guide/kernel-parameters.txt | 23 +++++++++++++++++++
> >  arch/arm64/kernel/idle.c                        | 30 +++++++++++++++++++++++--
> >  arch/arm64/kernel/idle.h                        | 13 +++++++++++
> >  arch/arm64/lib/delay.c                          |  5 ++++-
> >  4 files changed, 68 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index b2d7d3540ded..d7f5471edf8f 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -2239,6 +2239,29 @@ Kernel parameters
> >  
> >  			idle=nomwait: Disable mwait for CPU C-states
> >  
> > +			[ARM64,EARLY]
> > +			Format: idle=wfi, idle=yield, idle=nop
> > +
> > +			idle=wfi: Use the WFI (Wait For Interrupt) hint
> > +			instruction in the idle loop. This is the default and
> > +			allows the CPU to enter a low-power state until an
> > +			interrupt arrives.
> 
> Just curious as when and why one would need to use idle=wfi if that is the
> default behaviour. I am missing the need to have it.

It's probably useful to have so that you can override an idle= option
present earlier in the cmdline. e.g.

	idle=nop idle=wfi

will give you the wfi behaviour, which is handy if the cmdline is
stitched topgether from different sources.

Will

