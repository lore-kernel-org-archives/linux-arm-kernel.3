Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C3DC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 07:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVZTyegMOGHIfgb5zVAoq2b3YHNpgXqcGdsYOw+nS44=; b=IKL1G7PLwXAbyg6PqcSykX8jTD
	3+fPnyqdKBSto1/5kpaBUlMr+N9YR5z8Np78ki74pxckbLnPlcYArzTLGlJfuyuVhBeK5LAhqc+W1
	1QerJCnTECQgIfA5dENChvUPUcGUPxiU6pROeO9fKcj8isJMdT3fEdqw8H4f6QXw1H++ZzApXSpqq
	TsbO3kxjtZn6sAu45JN4X2L/gZy9qXvzKPJQ8wLFdWlrg7NKPkzIfhAMWxkaOxtTbTov597u0lZX9
	pi5qs8j1KVCgwVZIzDPge+TSoeuLonpUvqDzigrU9pQEMp7Cq7kj1dVNzLwIqSR8Lj/JV0ELDsXh6
	qLLMnupA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8Z1-0000000E2Qo-29Cp;
	Fri, 11 Jul 2025 07:52:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8Eh-0000000DzBH-49Oq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 07:32:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0118B6115D;
	Fri, 11 Jul 2025 07:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D64EC4CEED;
	Fri, 11 Jul 2025 07:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752219118;
	bh=hVZTyegMOGHIfgb5zVAoq2b3YHNpgXqcGdsYOw+nS44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kSHD/9Q8xLGAYm9t0kngcck+7CL4v2e7cdoLWjILBqtSCcBC5RdsIN7I1WFAYm+GK
	 yl+AW+l0V/mLAZpZO06utBp+rUdqN3ufgSVqjxK0Xz+4nITgZzOWu6DU9ug9jLOcvI
	 bmx4dFNpeRv/VtW+C1OWY6eDKSFc9+DfkRdcx9qw5HoFh3BIvyg3XTARYpEzDgkPzn
	 uATVjVMJtGWoHCnilfze+nQPr1izPUphbLuT5c/kN+h1+quoL3jZMXjDkb2JUz3LB9
	 DjQipdLVktQUNyisCzjlNqAhXevWDuJIN3/7Md1QSLn1mlXGMZM5itLqUCjaCNYffJ
	 IzAKHNb7JaIpQ==
Date: Fri, 11 Jul 2025 09:31:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, soc@lists.linux.dev, linux-mmc@vger.kernel.org
Subject: Re: [PATCH v16 1/5] dt-bindings: mmc: sdhci-pxa: restrict pinctrl to
 pxav1
Message-ID: <20250711-hypnotic-aloof-nuthatch-f3761c@krzk-bin>
References: <20250708-pxa1908-lkml-v16-0-b4392c484180@dujemihanovic.xyz>
 <20250708-pxa1908-lkml-v16-1-b4392c484180@dujemihanovic.xyz>
 <20250709-spectacular-goat-of-tenacity-ced55a@krzk-bin>
 <3379810.44csPzL39Z@radijator>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3379810.44csPzL39Z@radijator>
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

On Wed, Jul 09, 2025 at 07:33:01PM +0200, Duje Mihanovi=C4=87 wrote:
> On Wednesday, 9 July 2025 09:32:06 Central European Summer Time Krzysztof=
=20
> Kozlowski wrote:
> > On Tue, Jul 08, 2025 at 07:09:46PM +0200, Duje Mihanovi=C4=87 wrote:
> > > The current pinctrl properties apply only to the pxav1 controller.
> >=20
> > Why they are not applicable for pxav3?
>=20
> state_cmd_gpio is used for working around a PXA168 SDIO erratum. That SoC=
 uses=20
> the pxav1 controller and no such erratum exists on any of the other PXA S=
oCs.

I really don't get whether you are describing problem with schema or
actual state of hardware, especially considering this patch. You use
here present tense, which usually means state before this patch, but
your patch is changing this. IOW, if current pinctrl properties apply
only to pxav1, this matches what you said about hardware, so job is
done. No need for this patch.

>=20
> > > Adding one default pinctrl node to a pxav3 controller therefore causes
> > > a schema warning.
> > >=20
> > > Check the existing properties only on pxav1. pxav2 and pxav3 may add
> > > their own set of pinctrl properties if and when needed.
> >=20
> > This should be rather made complete here, because properties should be
> > defined in top-level, not in allOf: block. Strictly speaking pinctrl-xxx
> > are defined in core schema, but still the binding should follow same
> > rule - define them in top.
>=20
> Would it then be acceptable to declare the pinctrl properties in the top =
level=20
> and define each controller's respective description: and items: in the al=
lOf:=20
> block?

just min/maxItems should be enough in each allOf:if:then: sections.

Best regards,
Krzysztof


