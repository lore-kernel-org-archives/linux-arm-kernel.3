Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1490C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 07:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tr11PuQ6p0BAaSa12Hk90VELZZ4JJpN1h5vlKVPXrXc=; b=zKGbDu0mWdYZFZpqSKw1pocYQu
	o82GafCVWP58mf6zkqFXgsMLy19Bp8kaYdvlCqOBBsAzDF7uN85OeBCOKaui/+4pCklHN4+W4zcND
	rMe9nquWYK6leKeIm86TNgJMi5o1Dq7t+MU6+CRwiGzj0fM7vym4bHTE2noSJ9xivOWjSfATT7Ci3
	AUJW+qcStGfGmiDCymbyZZvsIaumFjg2h9JXzdUNBOMTXG/XPOC1uOYJ1rv21Yw7kMAL7JYNJVBjq
	xVr4eWqXJZ+SHnS0xOa5mXdVF7hqgjmbae1IUItxxLpjD5KNDpv7/dhiYv7gYDAuBcr/RtaoSzgRk
	ZbQMgmbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u232e-000000030C0-2AAs;
	Tue, 08 Apr 2025 07:06:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22yF-00000002zEE-2lPM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 07:02:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7CBCE4A030;
	Tue,  8 Apr 2025 07:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B82C4CEE5;
	Tue,  8 Apr 2025 07:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744095727;
	bh=n5s/LEoEQT9NSU6XeyqlvUReVnAp5oh6ZpPr1vmJWlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qWK6hpiKl5YRKO1XST0DS4G1798u4QPzV/BYigAc7enKX9RvtfbHVZiIyWLipOFNq
	 R/TI9O0yCS5wZAOjM3gUxOGG8kzT8ZfEscsNFE+cdoEabPjcPBX+eqizMRGHd2XQhE
	 wMoFS5FBU9Q5I5jPyg01niVBXZsCkXhf5ZUGW7XIHNYkuu0yRx6BMVUkkkCFN9XtC4
	 JArmSuarCNVcbj+kNHG8QIz5FV9j+QXgqgAFJrE4C5/3HCklP4QdgsDJBip5WC0TUx
	 t/ZQJD52d9OnT3Kgmj9mtlKP7XfL0pXlXKEJp0kwo32dByen14GJSaQHzP24ksgM7H
	 //0NShTXgPthQ==
Date: Tue, 8 Apr 2025 09:02:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, christophe.kerello@foss.st.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/7] Add STM32MP25 SPI NOR support
Message-ID: <20250408-offbeat-esoteric-millipede-ed8a2a@shite>
References: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
 <20250408-opal-pillbug-of-acumen-0fbb68@shite>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250408-opal-pillbug-of-acumen-0fbb68@shite>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_000207_712975_70BBF3B1 
X-CRM114-Status: GOOD (  15.90  )
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

On Tue, Apr 08, 2025 at 08:38:08AM GMT, Krzysztof Kozlowski wrote:
> On Mon, Apr 07, 2025 at 03:27:31PM GMT, Patrice Chotard wrote:
> > Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> > ---
> > Patrice Chotard (7):
> >       MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver
> >       dt-bindings: memory-controllers: Add STM32 Octo Memory Manager controller
> >       memory: Add STM32 Octo Memory Manager driver
> >       arm64: dts: st: Add OMM node on stm32mp251
> >       arm64: dts: st: Add ospi port1 pinctrl entries in stm32mp25-pinctrl.dtsi
> >       arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board
> >       arm64: defconfig: Enable STM32 Octo Memory Manager and OcstoSPI driver
> > 
> >  .../memory-controllers/st,stm32mp25-omm.yaml       | 226 ++++++++++
> >  MAINTAINERS                                        |   6 +
> >  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi      |  51 +++
> >  arch/arm64/boot/dts/st/stm32mp251.dtsi             |  54 +++
> >  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |  32 ++
> >  arch/arm64/configs/defconfig                       |   2 +
> >  drivers/memory/Kconfig                             |  17 +
> >  drivers/memory/Makefile                            |   1 +
> >  drivers/memory/stm32_omm.c                         | 474 +++++++++++++++++++++
> >  9 files changed, 863 insertions(+)
> > ---
> > base-commit: 88424abd55ab36c3565898a656589a0a25ecd92f
> 
> That's unknown commit.
> 
> b4 diff '20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com'
> Using cached copy of the lookup
> ---
> Analyzing 81 messages in the thread
> Preparing fake-am for v7: MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver
> ERROR: Could not write fake-am tree
> ---
> Could not create fake-am range for lower series v7

Hm, both v7 and v8 apply cleanly on next, so not sure why fake-am
failed.

Best regards,
Krzysztof


