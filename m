Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E36C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 19:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=YIiLm6AX6U1kcZE4Hu3Syei+AqDHiDcs68FCGLYyTrg=; b=Wm38Lr+6IgZ6I/
	LZ/27DejEynMdGc3wT6pipg1n60i0EchSvSbrHxgX3NtxXMRQV6o8ILw2pB2uMdHFsDV/llVqddOI
	tg1f0K/LhzokPG9wU6yw6BN/zH2ny3sdJzcKnMin3EfplAZSVyPdQUc+Z1VG35EzvmUH9+CxrhkDh
	kasuhGxaJC4qNvkbCXpqdURyoiAAkf+oGgV0eGVJW/z5i04TUyMHL+ut4l/t92wsmBoEvATfiu0H2
	oy/7Zanvg7X0D0utInoxOYQzK47SuXy9x8VuW68cJ5I9V0o5JxsyA07WyiKrOxYQ9LNrx69RWzlW0
	DS7teb4r5+xt6Xqj4lJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWgKL-00000006R4q-0BLi;
	Tue, 01 Jul 2025 19:07:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWeb9-00000006CR5-0bTE;
	Tue, 01 Jul 2025 17:16:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 428A343AA2;
	Tue,  1 Jul 2025 17:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B0BC4CEEB;
	Tue,  1 Jul 2025 17:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751390206;
	bh=IHpoblBzuvpr+bD38aHPPj2yibJOlQN5z3Zq9NJFVjw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=R+7aGu9gGq1zndHEsz0rJcIVhpQTD5rgNkasa2YilgAe4wwaMjiKujUoB0kF5k6uH
	 SNweTnElvr0PTCLs3uObcEfiPJsP7l9DKaNUF0+/m9pkCZ8hTKeEFST3A9GL0cLK/h
	 Gq7XfGmJGwj+MMzr0Z8oPYDhwyn0zFAqChFKUIsz0FxR+vd4YB5G0WceGNuYs+lmRb
	 tBr9M+RziKoYiayXRcNIyx97ZbuzBgz6ULScHWmhVSEJh9zVlnJInmO3Cy5QHAQjxr
	 G1C68U3c/AvPcV3W0D2QsKOYHB5UuVGOBqnH3fLx+XM/jBzu3HHBUzcXun0wo8OAq1
	 5dlyOmRNwjuwg==
Date: Tue, 1 Jul 2025 12:16:44 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-fsd@tesla.com, mani@kernel.org,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, jingoohan1@gmail.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com, vkoul@kernel.org,
	kishon@kernel.org, arnd@arndb.de, m.szyprowski@samsung.com,
	jh80.chung@samsung.com, pankaj.dubey@samsung.com
Subject: Re: [PATCH v2 06/10] dt-bindings: PCI: Add bindings support for
 Tesla FSD SoC
Message-ID: <20250701171644.GA1839997@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02b201dbea7b$fbaf5390$f30dfab0$@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_101647_202728_CF403A51 
X-CRM114-Status: GOOD (  20.11  )
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

On Tue, Jul 01, 2025 at 05:03:31PM +0530, Shradha Todi wrote:
> > -----Original Message-----
> > From: Bjorn Helgaas <helgaas@kernel.org>
> > Sent: 27 June 2025 22:00

> > On Wed, Jun 25, 2025 at 10:22:25PM +0530, Shradha Todi wrote:
> > > Document the PCIe controller device tree bindings for Tesla FSD
> > > SoC for both RC and EP.

> > > +++ b/Documentation/devicetree/bindings/pci/tesla,fsd-pcie-ep.yaml
> > 
> > I'm not sure about the "tesla,fsd-pcie-ep.yaml" filename.  I see that
> > it currently only describes a tesla endpoint, but it seems like maybe
> > this should be parallel to the "samsung,exynos-pcie.yaml" host
> > controller binding.
> 
> Actually there is no support for Exynos5433 in EP mode. Initially I
> named the binding file "samsung,exynos-pcie-ep.yaml" to make it
> parallel to the host controller bindings. But I received a comment
> that file names should match the compatible strings which makes
> sense so I changed it to this.

Certainly makes sense to match the compatible strings, although
samsung,exynos-pcie.yaml now includes both:

  samsung,exynos5433-pcie
  tesla,fsd-pcie

Exynos5433 may not support EP mode, but I assume the underlying IP for
the Tesla FSD in EP mode is still Samsung, and I assume some Exynos
device may someday support EP mode.

But I see Krzysztof's suggestion that the filename match compatible
and also Rob's observation that there's not much shared between
samsung,exynos5433-pcie and tesla,fsd-pcie.

Maybe that means both the RC and EP bindings should be named
"tesla,fsd..."  It seems a little weird that the same hardware would
be named described by either "samsung-exynos" or "tesla,fsd" just
depending on a mode switch.

Bjorn

