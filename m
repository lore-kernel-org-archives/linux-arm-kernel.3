Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26AE8D43349
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 11:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crOUcDlEzUR3DZ0n6a2QmAqKobcrOvKf5Agt2Wh69jA=; b=Jl2SoI/qZ0B54Y6A29Q8iQfRim
	jmBGkPq82YwMNttoNAKzTEO6gEwG+hB3uQU8HtoXI+DJGOCXzJEiAeoc1c4qr3K39OOx/gDnErYBw
	fOKXN/udEbGtR2yzbvQpgKNpdCjrNod+k8ve5v+hlR07xqXIQdj4o1ixJ4C4pPV2BhEnESFUEeoWQ
	xx03ljd55UT/VZCSHvk3jLvOFxVgoAKZpLP+KaF0KeUVPRWgF9JOh49VjsLwROBOJ6sBg/FpLY95Z
	7ULUOptFaZygUm2ils5d+pKL8SmDOkKYXQqIIGXHeelpbS35CesPeUTsgc2tmhNu2TbMorkW75EJY
	NgdUi5vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t90QU-00000006dJl-31nb;
	Thu, 07 Nov 2024 11:11:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t90Mi-00000006cH1-3iLS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 11:07:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 951715C0496;
	Thu,  7 Nov 2024 11:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504A7C4CECC;
	Thu,  7 Nov 2024 11:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730977672;
	bh=3RDsctzj+jKcHyPmCDmgDEvkYRZVjj3F2h2JnfN6XYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CEkUUHT2AyhLlnl5b5Kr1aHQP+HLUSQogHUG19q1+lqDySaWJ0NwDuaoCr01ID9vp
	 ErMXgC7nML7+V9kF1Mp0H2Dz1RPL/xYpcwwUr1eyHZWAw+R8FB8t7L2730xLblaMnp
	 W4H5RJYM2bn2TSm1bIAOHaonkfGI/TxTIj6+fxZZ69fnVmt5EFUWD0jBE1DVkzottY
	 LW91NKPMxk3T3e2WcVXGU0x7L64WnT80R2SpOoNMeAgUln7KQEKgcDTpKOOBRkHtxa
	 xaOyhJt+VrQA7oR8749NarQRcwH42e7ilCnd6UWg8cdc2/eWVMHqtvQvuMsaqadkam
	 dECzA0PDtrbSg==
Date: Thu, 7 Nov 2024 12:07:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abhinav Saxena <xandfury@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 2/2] Documentation: dt-bindings: Remove trailing
 whitespace
Message-ID: <gjxevyovxhymwm2ps37hfq3vmpmmr4pqmohq67llxrb2plb5zz@pvsmkqmhemx7>
References: <20241107061124.105930-1-xandfury@gmail.com>
 <20241107061124.105930-3-xandfury@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241107061124.105930-3-xandfury@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_030752_992660_591C3515 
X-CRM114-Status: UNSURE (   9.01  )
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

On Wed, Nov 06, 2024 at 11:11:24PM -0700, Abhinav Saxena wrote:
> Remove trailing whitespace from devicetree binding documentation files:
> - regulator/regulator-max77620.txt
> - interrupt-controller/nvidia,tegra20-ictlr.txt
> - interrupt-controller/msi.txt
> 
> No functional changes. Issues detected using checkpatch.pl script.

Instead I would prefer these files to be converted to DT schema which
would result in their full removal.

Best regards,
Krzysztof


