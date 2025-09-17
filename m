Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6034CCA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 08:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=moXfVqdOfr1UFlBnG/8qehg+Zc3VJ2KYDGf7E7aQfD8=; b=BKXFoBxYG74CpJR64VzxPjE8q5
	pJ2jAJjt/BzhTXgEG3wG95/cHVeykO9zHhVnix8/fFFol+y5NrSK/o+Ooq1P21Dgafm4OZuxw7Tmj
	iIid/+eIt7vFfcLeK5RSNcyghsX94rWEt73OvthV1S/w6ipWdUzG3M1lui3PEd3iL3kn+7pWAA5ZJ
	R88SIcKJMnQlQho8UdQV5c7tUZwOJ5ERcRWkx48VNMGgB/J2Vm2iuAkKNmff1vbTTYME8GU+s78Lx
	AkJsj8qkxMlp3S0uQVK0zfZ8lgBKUUKSsWuCA4ODlxNDrN0zbUK2VYYlUmjTJnaQDXnxr4X14K1ff
	fOj5AVCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynkb-0000000Afhb-2Bhh;
	Wed, 17 Sep 2025 08:42:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynka-0000000Afg4-04Yq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 08:42:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 190536021E;
	Wed, 17 Sep 2025 08:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9EB6C4CEF5;
	Wed, 17 Sep 2025 08:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758098570;
	bh=CMm0HgNBKMoHaAJh86JjHiEwTFlQgqebNAVg0nJ9CEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XoBk9H9/fk3hEvvn+gAJu80NKRXPfW8GtIar0Vpe65NqcQI0fOFTf6+Ni4y4mQA6v
	 uvy1/nwUiDDy754G6J1W3BifeTN6slbPxx++cVkO2M1G2ZAhmhRmaEy5aBMlnviDj0
	 H5vOuebJLQVHpm6NBS9qLds5Lb+/OsKf0TcaOIGRvmxkeb55LAnq/PfCuz4tRCrNrw
	 02Wc1kIXqFgn7Domq1qtNXu/90UOdKtL8VeTojPXYQ15DopqoMceKwQqh8d9J2lRQN
	 b+Wy2Wj3gbqEiogu6BbIWJ0IRNug8dyHcCBfxchaxyrjagH9A0hCWX3A1SaP+9maaE
	 KjAQcfOIBWRBg==
Date: Wed, 17 Sep 2025 10:42:44 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: chester62515@gmail.com, mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com,
	ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: pcie: Add the NXP PCIe controller
Message-ID: <aMp0hNnBUwTV5cbp@ryzen>
References: <20250912141436.2347852-1-vincent.guittot@linaro.org>
 <20250912141436.2347852-2-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912141436.2347852-2-vincent.guittot@linaro.org>
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

Hello Vincent,

Nice to see you sending some PCIe patches :)

Quite different from the scheduler and power management patches that you
usually work on :)

(snip)

> +  nxp,phy-mode:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: Select PHY mode for PCIe controller
> +    enum:
> +      - crns  # Common Reference Clock, No Spread Spectrum
> +      - crss  # Common Reference Clock, Spread Spectrum
> +      - srns  # Separate reference Clock, No Spread Spectrum
> +      - sris  # Separate Reference Clock, Independent Spread Spectrum

This does not seem to be anything NXP specific, so I really think that this
should be some kind of generic property.


Note that I tried to add a similar property, but for the PCIe endpoint side
rather that the PCIe root complex side:
https://lore.kernel.org/linux-pci/20250425092012.95418-2-cassel@kernel.org/

However, due to shifting priorities, I haven't been able to follow up with
a new version/proposal.

My problem is not exactly the same, but even for a root complex, the PCI
specification allows the endpoint side to provide the common clock, which
means that the root complex would source the refclk from the PCIe slot,
so I would say that our problems are quite similar.

Rob Herring suggested to use the clock binding rather than an enum.
I can see his point of view, but personally I'm not convinced that his
suggestion of not having a clock specified means "source the refclock from
the slot" is better than a simple enum.

To me, it seems way clearer to explicitly specify the mode in device tree,
rather than the mode implictly being set if a "clk" phandle is there or not.
That approach seems way easier to misunderstand, as the user would need to
know that the clocking mode is inferred from a "clk" phandle being there or
not.


I also note that Rob Herring was not really a fan of having separate spread
spectrum options. Instead, it seems like he wanted a separate way to define
if SSC was used or not.

I have seen the following patch merged:
https://github.com/devicetree-org/dt-schema/pull/154
https://github.com/devicetree-org/dt-schema/commit/d7c9156d46bd287f21a5ed3303bea8a4d66d452a

So I'm not sure if that is the intended way they want SSC to be defined or
not.


I apologize for bringing up my own problem in this discussion, but at least
it is clear to me that we cannot continue with each PCIe driver adding their
own vendor specific properties (with completely different names) for this.
Some kind of generic solution is needed, at least for new drivers.


Kind regards,
Niklas

