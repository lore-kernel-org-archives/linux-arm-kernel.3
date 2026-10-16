Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72718CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 07:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j6n/ZjZ2OIMP6lyuBqMBR5OqO2p3A3f429iS/YeL0TM=; b=EnMoGY83towdclXH0eqmX5S45q
	7TPGzX2y8RkkUwU+N538IdSZP+hLTwFPY+Fyz39LLt93zQoBQD4hbW7tcxp9/NpaSdZp/SLIk0bfn
	p+xDRqdoASutMebLthHhzLgZTX+gKBzmDXWeoVJRn3HKN1fG5KawnfIbhEGxfth3pj/eGroJ6N90i
	8AtitR93CDvq4AS6uMc4UvPjzs34M3lX+kJNq0ucMD6i+vWgp6mBKwBVKWYCg2z4btpCcm1y3mjuI
	YLD0jiKXiLqWILAMsvkLTrwL3dleeC+qOfg9ArJ1zk0bVX7ryc+7wMUAVsHrnAmwQkgis8u6XdZEH
	AAvVE/Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHcmw-00000002H48-2wzF;
	Fri, 16 Oct 2026 07:55:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHcmv-00000002H3D-24RY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 07:55:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B4B4B600D4;
	Fri, 16 Oct 2026 07:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4851F000C4;
	Fri, 16 Oct 2026 07:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792137336;
	bh=j6n/ZjZ2OIMP6lyuBqMBR5OqO2p3A3f429iS/YeL0TM=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=YF+dKR6yM5v6UDIIr8S+PXF1O+nlvbIgVGV7Y43J3ORBkjWrhKNjplk2d7AZmOSbB
	 Vsf7kRv5NVSuY0KkYzP2F2y7MagHAwM8yYDbHdlGLDtBTIcc7JNRlkUwsz7rLqZ92v
	 m3J0IjY3GGZO8Pb37VtVICMFG7sMkzIpoqKzuPKXOq2DrTCceZNnJnlezz9ahPqUXZ
	 2A78+1m1Wk9oLu0wpKvKnffi4uNz9bNsnT6+JnSlxO5KuplvDffRe568AmjLHS6GvK
	 qfwTNFBaNeELYts/xEUmof7v2O8/5uWYu/7vooKOLojn109xaXUIm2qk1eJhz6qNwk
	 yAJvdaC4Tu44w==
Content-Type: multipart/mixed; boundary="===============0314830124621368691=="
MIME-Version: 1.0
Message-Id: <39f6de0b5e2388ef5857634f3df37a650c778e190b346409e4712064556c6aef@mail.kernel.org>
In-Reply-To: <20261016070837.440748-4-ankur.a.arora@oracle.com>
References: <20261016070837.440748-4-ankur.a.arora@oracle.com>
Subject: Re: [PATCH v16 03/16] arm64/delay: move, fixup usecs_to_cycles()
From: bot+bpf-ci@kernel.org
To: ankur.a.arora@oracle.com,linux-kernel@vger.kernel.org,linux-arch@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-pm@vger.kernel.org,bpf@vger.kernel.org
Cc: arnd@arndb.de,catalin.marinas@arm.com,will@kernel.org,peterz@infradead.org,akpm@linux-foundation.org,mark.rutland@arm.com,harisokn@amazon.com,cl@gentwo.org,ast@kernel.org,rafael@kernel.org,daniel.lezcano@kernel.org,memxor@gmail.com,zhenglifeng1@huawei.com,xueshuai@linux.alibaba.com,rdunlap@infradead.org,david.laight.linux@gmail.com,broonie@kernel.org,boris.ostrovsky@oracle.com,ashok.bhat@arm.com,ankur.a.arora@oracle.com,andersson@kernel.org,konradybcio@kernel.org,cl@linux.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Fri, 16 Oct 2026 07:55:33 +0000 (UTC)
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

--===============0314830124621368691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> arm64/delay: move, fixup usecs_to_cycles()

TL;DR: The new generic usecs_to_cycles() in arm64 delay-const.h likely
conflicts with gpio-aspeed.c's function of the same name once a later patch
includes it, so arm64 builds with CONFIG_GPIO_ASPEED (allmodconfig, defconfig)
would fail.

> diff --git a/arch/arm64/include/asm/delay-const.h b/arch/arm64/include/asm/delay-const.h
> new file mode 100644
> index 000000000000..6ccdfe0a4130
> --- /dev/null
> +++ b/arch/arm64/include/asm/delay-const.h
> @@ -0,0 +1,35 @@

[ ... ]

> +static inline u64 usecs_to_cycles(u64 time_usecs)
> +{
> +	return xloops_to_cycles(time_usecs * __usecs_to_xloops_mult);
> +}

[ ... ]

Can these generic names conflict with other file-scope definitions once this
header is included widely?

The commit message says the rpmh-rsc.c helpers were renamed because they
"were occupying the same namespace", but drivers/gpio/gpio-aspeed.c also
defines a function with the same name and a different signature:

drivers/gpio/gpio-aspeed.c:
static int usecs_to_cycles(struct aspeed_gpio *gpio, unsigned long usecs,
		u32 *cycles)

Later in this series, commit 117729ec2d64 ("arm64: support WFET in
smp_cond_load_relaxed_timeout()") adds this to
arch/arm64/include/asm/cmpxchg.h:

+#include <asm/delay-const.h>

gpio-aspeed.c reaches it through:

linux/spinlock.h -> linux/atomic.h -> asm/atomic.h -> asm/cmpxchg.h ->
asm/delay-const.h

At that point 'static inline u64 usecs_to_cycles(u64)' and 'static int
usecs_to_cycles(struct aspeed_gpio *, unsigned long, u32 *)' are two
file-scope declarations of one identifier with incompatible types, which
should fail with "conflicting types for 'usecs_to_cycles'".

GPIO_ASPEED depends on ARCH_ASPEED || COMPILE_TEST, and ARCH_ASPEED is an
arm64 platform option that is enabled in arch/arm64/configs/defconfig.  So
it looks like any arm64 config enabling CONFIG_GPIO_ASPEED, including
allmodconfig and allyesconfig, would fail to build.

The build first breaks at 117729ec2d64, but the cause is the namespace
cleanup here only covering rpmh-rsc.c.  Nothing up to the end of the series
(c43dfae4ee10) changes the gpio-aspeed definition.

Would renaming the gpio-aspeed helper, or giving the arm64 helpers a
namespaced prefix (for example arch_ or __arm64_), avoid the collision?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/38867477666
--===============0314830124621368691==--

