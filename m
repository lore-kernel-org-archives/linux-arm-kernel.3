Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE0FCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 10:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGPMDXDyEdvzseLa55tTi1pUuwUdWYDhAEaapa/IbuE=; b=dCb0gygAJJTrzXo456MBhuFhu3
	RejDonxqOwB1A/Wb10fXgQ0ncZuIRYwbFn74NyJmrjORbUMiU/zYPt4/DMCevyYWhHpjrqSAfBXoh
	XSvsCmYo0RZtjH2gIXAFU/Ysi2GulkgPj7zhJnYmF7L3/wrfycM6kiLU+edfEfvqg8jlnYXleGpSu
	/Rm3ld3yl/zirzDnSImcm4DaD3GIuYUbH5oPgdL96dUF/lEiB3882I9ghFkta4WtMN28X2yduxhpy
	T7pqV/OArBlWaNVzaNPot6fY2QAaLpY9PzonGQF9+SoWTUTR1NgG71cO5rXZpuzjWL9VtTlvKsJqG
	abLNmO0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9so-0000000GftL-1q9y;
	Tue, 21 Oct 2025 10:46:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9sl-0000000Gfsn-0cNL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 10:46:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 849A64029F;
	Tue, 21 Oct 2025 10:46:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D135AC4CEF1;
	Tue, 21 Oct 2025 10:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761043582;
	bh=EL/deV2+NAe7Ey9GQFKqJtn+XrkhgmRGr22p3S0Ukmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n4SqDOKVh+gJNEHY6HdSDpJmWHOIESAZr124vQ1HNd9RrID/5qAeW5AFTR9YzyUZ8
	 6JnV49iP8P0Si37Q26PuJ9CHjoZnSIBfR/Ew4+8FQa2/awpAPlPUaYrwgPSxVMvbnz
	 e9IXfTOLz4mlD+PHdm1ORdulFBGR6yk2B6PwXSktNEQopM2H6/AI2ocSx0EPEp9yD4
	 ycvZoUpgIH+h0hPNue38tY+at0Mc3tI//M+QlKL6aiNUU112LGWYYBdvH3J7KBX0p7
	 liGreE+LhOiiL4lNhfRJWnSBPK9kxFCORd40b+1ZviJnaAJz2211jdLmKN20H4sQWu
	 4vyqrMeqtbdgQ==
Date: Tue, 21 Oct 2025 11:46:15 +0100
From: Lee Jones <lee@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.li@nxp.com>,
	Andreas Kemnade <akemnade@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v3 1/3] dt-bindings: mfd: sy7636a: Add missing
 gpio pins and supply
Message-ID: <20251021104615.GC475031@google.com>
References: <20250917-sy7636-rsrc-v3-1-331237d507a2@kernel.org>
 <175993751776.2584245.7441294249150226238.b4-ty@kernel.org>
 <20251020151511.1fd8611b@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020151511.1fd8611b@kemnade.info>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_034623_204277_07CD2DDC 
X-CRM114-Status: GOOD (  14.88  )
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

On Mon, 20 Oct 2025, Andreas Kemnade wrote:

> On Wed, 08 Oct 2025 16:31:57 +0100
> Lee Jones <lee@kernel.org> wrote:
> 
> > On Wed, 17 Sep 2025 09:14:29 +0200, Andreas Kemnade wrote:
> > > To be able to fully describe how the SY7636A is connected to the system,
> > > add properties for the EN and VCOM_EN pins. To squeeze out every bit
> > > of unused current, in many devices it is possible to power off the
> > > complete chip. Add an input regulator to allow that.
> > > 
> > >   
> > 
> > Applied, thanks!
> > 
> > [1/3] dt-bindings: mfd: sy7636a: Add missing gpio pins and supply
> >       commit: 7d983e997cb53d4c48b61b105163c31c92a35823
> > 
> hmm, what is the fate of this? I remember having seen this in your
> for-mfd-next-next branch. But now I cannot find it neither in
> your mfd-next nor your mfd-next-next nor general linux-next.

It's still applied, only with a different subject line:

https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/commit/?h=for-mfd-next&id=cb62b0ea2c88c8a3d38b7b4991adbc0aacdb1418

-- 
Lee Jones [李琼斯]

