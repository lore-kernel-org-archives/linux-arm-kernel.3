Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC6EF459F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 15:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BpSOIXXZ3ZNpAOx8++v8mFOwpFQb2y00e+UwJxOC5kE=; b=b4mPKupgSXHtBrX7Gz4oD91d7X
	tsk5oav49OVaTRQJCHKlRTrZZCh5afQKmQZxV8tr/iq6tEYvPvGL//Id6zF/XUsn5v1OVCFFwOSE1
	lrawoLsnQnAO7ZPdaG8s+Vbt6OpJp3V2q09urUxSo6LKOAjaQ39TvnzhUksXMdxvwwG//7s0qOaA2
	dRIoCwl5MD6k1hdwNXDuycOw4WNKLQWuCDInfWqzfbeebUu6helLKQju5xWyqIf/fyCpqLogR8MlQ
	jFcFstJpV68VCMr5M8s58gFKM2p2kb9QH/nCZ4XvLp0e+UUL/GfQ0/wnNYn3M9P8QVxmzcAwhTjgH
	x14ioPCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBE9q-0000000CUQ3-37Pq;
	Fri, 10 Apr 2026 15:52:34 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBE9n-0000000CUPY-0OQl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 15:52:32 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so1544101a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 08:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775836349; x=1776441149; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BpSOIXXZ3ZNpAOx8++v8mFOwpFQb2y00e+UwJxOC5kE=;
        b=A4Y8fJdo1W6ZUYK/WA3tT+nO51Sk0+xSCABfN8+j3iAT76ubXMyrPIxZW/nXQ5LQIH
         d+Bmyt4p6U2nwU4ZbVUENchjuA1PZvLrPeqAVmp2eQY3OGX8BgVbtesokpVzv1K9bTH8
         DtQMhud18xiJnYKQQORZmbnanbFZpyOpUIXVpyrX+Ex46jJ2CfBt6Q0YnsK7WLyN1JUc
         ZLO12R0isFs9bnzpgVAT3D8sglmoP+t4qCecvIXdLc/9XZahm6SGJKrOvPdLERQXugOM
         21DNt+HAgQ+SZrqjLqhhTYPX/wPPJP4a4aTIImxCtCsE7sOx+U1BYqwG5qI9WQd6W1nA
         pIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836349; x=1776441149;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BpSOIXXZ3ZNpAOx8++v8mFOwpFQb2y00e+UwJxOC5kE=;
        b=RvM3a9RDdjjIDuK0kpSn7ivpYTKCAd8kVuKCG2HCwSyXR6F1FLWq8S+wrV0y02EvzS
         3885HN5RBYgzOEW+vIziG4SXogtANMIfEk+9h1r3k5ZG86StHih1LK8C54kF1rokqMW7
         0P8HZ3dPQNr/xzpifedoizjHMPUBC1saw9trty6UKxSAVOLA2Y1PV0+sv5KnwH6ljU0+
         xzASaUqHMaRtDXz9MIeH2NEmhfC8HM3SnqqHjzicZ3cLixpN5c8EiJOBP4eW839yyN1A
         OxKq4Bd3b2ZvDklMOnCcS9yw/zd8EIPv9G6dtgXvFfFB2fqVmhW/8fxmgCgm7iHtb+6o
         hZbw==
X-Forwarded-Encrypted: i=1; AJvYcCVMc1o2go54h/k3IZoSwT3HEcYt1shz4faIf5VekBWtBUOgCwfSw7ivZKhxJmCPEoCvqciCWRdPRbAZ/PGVj2Nj@lists.infradead.org
X-Gm-Message-State: AOJu0YweRL/pVvKlnlOS9A3l7OqENkRkLw5ozyzuUE+yVzAS1eWJCpyl
	DdeKvGOQnegwHvRPW5iIp0wQwOCS280GHuTK++NpybuKqEIok3AAz64ZeU1tqIsOWrk=
X-Gm-Gg: AeBDietZtJh3m5/WukZ/fRqZI3KCjw1LU9QuCGQH0ZJHKQ0r5xddKsnga7dREbmatn/
	c0An7t06VEc8sy2nqe2P8+bJnJ+kmYZwVakowH4X4WV8kfUeNkmb/aPlnkWpuDTSXFRefBcnqtA
	YvzpgbxSscZBH7+1L+YSYFfwgblEAGZhamRgrUh6Gmif3ev/ycI3is6GhYCM3gABW3Nnk3nUlBR
	IeJqmaaD6xZV8KjX1QFvV3zZQc8GB+kbVWEs5nhMVy3xRMqK0zDVn1lRwoF+ZV+yh0FvwSLncYx
	u13ODb44hCm50bTytZlNrBTaVkoQ1PXpXFPp/J0D9nI38nLeJZXxtSumPIeFDAsRLn01EnlhrTF
	q6hyWeDmZLm27NClWI400W9yZr+2xIkwnGFGVZ5s2zwHnHqgGj52dA8j+bKh0KBpyD9NxoYqLVl
	/E+OJUe32ykaR0KZBQ2kPIxdsIyRg=
X-Received: by 2002:a17:90b:2fd0:b0:359:d54:846f with SMTP id 98e67ed59e1d1-35e4275f708mr4213158a91.7.1775836349298;
        Fri, 10 Apr 2026 08:52:29 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:372f:d8dc:5d88:3c78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f25aa2sm33630105ad.55.2026.04.10.08.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:52:28 -0700 (PDT)
Date: Fri, 10 Apr 2026 09:52:26 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to SM
 CPU/LMM reset vector
Message-ID: <adkcugNgyrkHtUML@p14s>
References: <20260327-imx943-rproc-v2-0-a547a3588730@nxp.com>
 <20260327-imx943-rproc-v2-2-a547a3588730@nxp.com>
 <acqjS440STRl2sK2@p14s>
 <acs2PAZq2k3zjmDW@shlinux89>
 <adUghiyZbe3fmcNX@p14s>
 <PAXPR04MB8459AA009C932EB9D6139A11885BA@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <adZ4WIaC6WN97JhR@p14s>
 <adbzPl7ydUvb+MIS@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adbzPl7ydUvb+MIS@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_085231_441165_E5E2CE55 
X-CRM114-Status: GOOD (  37.21  )
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

On Thu, Apr 09, 2026 at 08:30:54AM +0800, Peng Fan wrote:
> On Wed, Apr 08, 2026 at 09:46:32AM -0600, Mathieu Poirier wrote:
> >On Wed, Apr 08, 2026 at 01:30:16AM +0000, Peng Fan wrote:
> >> > Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to
> >> > SM CPU/LMM reset vector
> >> > 
> >> [...]
> >> > 
> >> > >
> >> > > Aligning the ELF entry point with the hardware reset base on
> >> > Cortex‑M
> >> > > systems is possible, but it comes with several risks.
> >> > 
> >> > I'm not asking to align the ELF entry point with the hardware reset base.
> >> > All I want is to have the correct start address embedded in the ELF file
> >> > to avoid having to use a mask.
> >> 
> >> I see, per my understanding:
> >> FreeRTOS typically exposes __isr_vector, which corresponds to the hardware
> >> reset / vector table base.
> >> Zephyr (Cortex‑M) exposes _vector_table, which serves the same purpose.
> >> I am not certain about other RTOSes, but the pattern seems consistent:
> >> the vector table base is already available as a named ELF symbol.
> >> 
> >> Given that, if the preferred approach is to parse the ELF and explicitly
> >> retrieve the hardware reset base, I can update the implementation accordingly.
> >> If you prefer to parse the elf file to get the hardware reset base,
> >> I could update to use them.
> >> 
> >> Options1: Something as below:
> >> 1. Include rproc_elf_find_symbol in remoteproc_elf_loader.c
> >> 2. Use below in imx_rproc.c
> >> ret = rproc_elf_find_symbol(rproc, fw, "__isr_vector", &vector_base);
> >> if (ret)
> >>     ret = rproc_elf_find_symbol(rproc, fw, "__vector_table", &vector_base);
> >> 
> >> if (!ret)
> >>     rproc->bootaddr = vector_base
> >> else
> >>    dev_info(dev, "no __isr_vector or __vector_table\n")
> >
> >No
> 
> If your concern is about rproc->bootaddr, I could introduce
> imx_rproc->vector_base for i.MX.  Please help detail a bit.
> 
> >
> >> 
> >> This makes the hardware reset base explicit, avoids masking e_entry.
> >> 
> >> Option 2: User‑provided reset symbol via sysfs 
> >> As an alternative, we could expose a sysfs attribute,
> >> e.g. reset_symbol, allowing users to specify the symbol name
> >> to be used as the reset base:
> >> 
> >> echo __isr_vector > /sys/class/remoteproc/remoteprocX/reset_symbol
> >> 
> >
> >Definitely not.
> >
> >The definition of e_entry in the specification is clear, i.e "the address of the
> >entry point from where the process starts executing".  If masking is required
> >because the tool that puts the image together gets the wrong address, then it
> >should be fixed.
> 
> The hardware reset base is the address from which the hardware fetches the
> initial stack pointer and program counter values and loads them into the SP
> and PC registers.  In contrast, bootaddr (i.e. e_entry) represents the address
> at which the CPU starts executing code (the PC value after reset). As you
> pointed out earlier, this distinction is clear.
> 
> In our case, we need to obtain the hardware reset base and pass that value to
> the system firmware. However, e_entry should not be set to the hardware reset
> base. Doing so would introduce the issues I described in [1]. This means we
> should not modify the Zephyr or FreeRTOS build outputs to make e_entry equal
> to the hardware reset base.


As I said earlier, I am _not_ suggesting to make e_entry equal to the hardware
reset base.

We are going in circles here.

> 
> Given these constraints, the feasible solutions I can see are either:
> - option 1 (explicitly retrieving the hardware reset base), or
> - continuing to use masking.
> 
> Please suggest.
> 
> [1] https://lore.kernel.org/all/acs2PAZq2k3zjmDW@shlinux89/
> 
> Thanks,
> Peng
> 
> >
> >> The remoteproc core would then resolve that symbol from
> >> the ELF and set rproc->bootaddr accordingly.
> >> This provides maximum flexibility but does introduce a new user‑visible ABI,
> >> so I see it more as an opt‑in or fallback mechanism.
> >> 
> >> Please let me know which approach you prefer, and I will update
> >> this series accordingly in v3..
> >> 
> >> Thanks,
> >> Peng.
> >> 
> >> 
> >> > 
> >> > > 1, Semantic mismatch (ELF vs. hardware behavior) 2, Debuggers may
> >> > > attempt to set breakpoints or start execution at the entry symbol
> >> > >

