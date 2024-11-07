Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57014D43374
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 16:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWa59i0YnfIsSkNMO4yMQvDB34SD7gZLLM6c999aC8g=; b=oerlz8GvDnBe4tbSRZOSS2Eu4g
	taETEYYvr4zPQlIzzA/f/z0VG7dC/iBNqJU0MKorYjWVHsthHTq4+jY8kpIzg5BSVg5fTBqqNgCHL
	EvxJkR216sqzMEwdS3w/d7Q1Zsa+I9j1RaeCMerzYj0MDNJpmSCKRTZp8HuIkUdGa+1As4ffakUSX
	9PXXDvQ5UGRkXjmlGIOkUtbH189sUTr+LcSAc5GeFUx7UGwrQf576aF75ps9jFVerVKoaXp9rbXWw
	rAh/uVhuvZkau5enwewJ6Ox8rGsQhcU+kdge5ap5LxfSZ6CSUpHDCbx/K06BJITBCRONdiGKTVOMu
	dlJbEYHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t951I-00000007Xt9-3LB5;
	Thu, 07 Nov 2024 16:06:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t94us-00000007WXT-1UfY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 15:59:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 31C3E5C5479;
	Thu,  7 Nov 2024 15:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60631C4CECC;
	Thu,  7 Nov 2024 15:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730995165;
	bh=EY9bRUE7pktK1ylVK13Q0axY1miNx65wET8k5SsvSYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rgBBwYSng15I1Sj9CukemsB8r92eeFNBu9UjOzjVelqyl+on+q7BOE9BfGXxrCg3C
	 cFuhr/Dg0Bc8ndaWjoD7aPFzlYKLHrY9aIseyUra+dYylkrfgUrfPFCuOU5BMa6A7F
	 Aqe3rIOTDqgXniwsdQXWPTdEv3aCMPFc5DUVJIhA2mCGEf3cnLkpM3sTg0iTnGEMEP
	 ZW6/cH0bEH0V/fxft/hZ3X9DnnN1TOLaoud22Od5ccjuUjr67GoCNA0ZtI3EPumnre
	 YMJtE52eqaqSvTur9DqroifGPDIsJuRuT9apQEdSA41ms/lzfu+OgDQfUpIL9EmeJM
	 JZ3MEVrEMofMA==
Date: Thu, 7 Nov 2024 09:59:23 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abhinav Saxena <xandfury@gmail.com>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 2/2] Documentation: dt-bindings: Remove trailing
 whitespace
Message-ID: <20241107155923.GA2770783-robh@kernel.org>
References: <20241107061124.105930-1-xandfury@gmail.com>
 <20241107061124.105930-3-xandfury@gmail.com>
 <gjxevyovxhymwm2ps37hfq3vmpmmr4pqmohq67llxrb2plb5zz@pvsmkqmhemx7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gjxevyovxhymwm2ps37hfq3vmpmmr4pqmohq67llxrb2plb5zz@pvsmkqmhemx7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_075926_457357_A552A7D2 
X-CRM114-Status: GOOD (  10.68  )
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

On Thu, Nov 07, 2024 at 12:07:46PM +0100, Krzysztof Kozlowski wrote:
> On Wed, Nov 06, 2024 at 11:11:24PM -0700, Abhinav Saxena wrote:
> > Remove trailing whitespace from devicetree binding documentation files:
> > - regulator/regulator-max77620.txt
> > - interrupt-controller/nvidia,tegra20-ictlr.txt
> > - interrupt-controller/msi.txt
> > 
> > No functional changes. Issues detected using checkpatch.pl script.
> 
> Instead I would prefer these files to be converted to DT schema which
> would result in their full removal.

Yes. I don't take fixes for .txt bindings.

Rob

