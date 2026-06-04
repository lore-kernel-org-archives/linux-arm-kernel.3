Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25364CD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 21:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bvq7vOl1c1mpIND7SGq8IUzzkQicWNmeIHBCULeRYCk=; b=P4SCW+GESxJQsU905cnI3wcTnx
	CzXRW249UtV9mi86Y5FObstX2Lk9DyyLT2ihdnaSjFxDrfrB+UTklVghp0ikuILcTqatE0SX0NprD
	EdGIGd0udqW6P8ewG3WrlnJqD3BZTRoh+5Lijf6nqI/Nj0CF/17PTxiyekwG9oiQTF/JnX7CASsnC
	jhdN8oQQI5JE61yAIHJ85pbGC7iEmAZjUBWzZwZIPsTlFvXpBen1mclqDmgDXDdm6Fv4zi+U2QIsy
	VOj3giCiFSt//W1ABbNSLbfiu13gh/kArMA5DjywypXw/1WFAysdo+5lsylXg5oMSHTeSTp6+bwaD
	siGHkvUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVFNS-0000000HJU3-0uTZ;
	Thu, 04 Jun 2026 21:13:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVFNP-0000000HJTV-34gk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 21:13:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 288D74042C;
	Thu,  4 Jun 2026 21:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685231F00898;
	Thu,  4 Jun 2026 21:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780607599;
	bh=Bvq7vOl1c1mpIND7SGq8IUzzkQicWNmeIHBCULeRYCk=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=MDcxOFIlJpDBkWx4G4Fyg+NRKBS8U/9nrpTIxW6hEAlPJieSOpscifAXinZHL8Pra
	 ZLcvQyU2kS2+93H6siaH+q5lJv7j+LGzr0G5gATRIramDZR8hJmQB2jAL2NvItMOwa
	 yuaA6IX9likH4SSia+VKj/6U5wccC4VyPhb5GYtrdsgtf5yx6sZ2TSBmSTmvz0A5a3
	 lDVeTJAPGhBGQSMQxXc0h41xsI9JXJ1l0XS3K8yxFPAVq7Gr95j40husFaFtoPFhFk
	 P3oAWBSjMGDNurtTa4DUHudhMuteXxxRhDtCCMKbPzSlhMjw2A2DlG56pJARAd9sxo
	 eLmhA5dVCl8aQ==
Content-Type: multipart/mixed; boundary="===============5364940318977030226=="
MIME-Version: 1.0
Message-Id: <1e7ab52954b9ff584d6871c2ec234a7155b577f29128564d0d597809cafad826@mail.kernel.org>
In-Reply-To: <20260604-kasan-v2-2-c066e627fda8@bootlin.com>
References: <20260604-kasan-v2-2-c066e627fda8@bootlin.com>
Subject: Re: [PATCH bpf-next v2 2/8] bpf: add BPF_JIT_KASAN for KASAN instrumentation of JITed programs
From: bot+bpf-ci@kernel.org
To: alexis.lothore@bootlin.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,martin.lau@linux.dev,eddyz87@gmail.com,memxor@gmail.com,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,john.fastabend@gmail.com,tglx@kernel.org,mingo@redhat.com,bp@alien8.de,dave.hansen@linux.intel.com,x86@kernel.org,hpa@zytor.com,shuah@kernel.org,mcoquelin.stm32@gmail.com,alexandre.torgue@foss.st.com,ihor.solodrai@linux.dev
Cc: ebpf@linuxfoundation.org,bastien.curutchet@bootlin.com,thomas.petazzoni@bootlin.com,bpf@vger.kernel.org,linux-kernel@vger.kernel.org,linux-kselftest@vger.kernel.org,linux-stm32@st-md-mailman.stormreply.com,linux-arm-kernel@lists.infradead.org,alexis.lothore@bootlin.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Thu,  4 Jun 2026 21:13:18 +0000 (UTC)
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

--===============5364940318977030226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/kernel/bpf/Kconfig b/kernel/bpf/Kconfig
> index eb3de35734f0..a8e004f88b92 100644
> --- a/kernel/bpf/Kconfig
> +++ b/kernel/bpf/Kconfig

[ ... ]

> @@ -101,4 +105,9 @@ config BPF_LSM
>
>  	  If you are unsure how to answer this question, answer N.
>
> +config BPF_JIT_KASAN
> +	bool
> +	depends on HAVE_EBPF_JIT_KASAN
> +	default y if BPF_JIT && KASAN_GENERIC && KASAN_VMALLOC && VMAP_STACK
> +
>  endmenu # "BPF subsystem"

This isn't a bug, but a design concern raised on an earlier posting of
this work doesn't look fully resolved.

In the v1 (RFC) discussion, the suggestion was to not add a config knob
at all and instead do the instrumentation inside the JIT whenever
KASAN_GENERIC is set:

  "Let's not add more config knobs. Even this patch looks redundant.
   Inside JIT do instrumentation when KASAN_GENERIC is set."

  https://lore.kernel.org/bpf/CAADnVQLj=UosnsC-4V2+mN92Fe0-kW++U+m-O9c93kk6BwiXgw@mail.gmail.com/

The reasoning given for keeping the internal Kconfig was that it lets
selftests adapt their behavior without sprinkling arch and KASAN
conditionals, and another reviewer agreed that approach was reasonable.

That "this patch looks redundant" objection was never explicitly
retracted or re-acked, yet the BPF_JIT_KASAN config is retained here.

Has this design point been settled?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/26978380520
--===============5364940318977030226==--

