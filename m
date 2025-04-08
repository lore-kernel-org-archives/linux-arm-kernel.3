Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F45C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 06:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3YbiSpapDotmfaOGLJqjVmnKHPrHlGTjtLofNPSkO0=; b=oD99YDHpYfgGQgLYUoJaxjIxUy
	of3l6YdSD24/C3GvxjHe2wdq36Ged3wAY+fJJsaNcCjXf7DWc0kqXKbz22dZ+2vNgpq/Tv6cARv/i
	qfMZ8E3t2Ct9MHc5IpclH8aWCeG5Xg0mmednEqY52unXbJ6HZoW6+qBi0Kia/U49f9OqgZcKSg17B
	Pr9r44m5QQRjgPkCAQKd9syo8wfeUmaMSTvw2JKgldVtEhi9TajLu0tFcEvLkaOMh0HkV9x576lWk
	AJdlYO/M1O6YRIIgbAsZhICuymoAgH2+CfWwiRwCqmWt9cTpXQExFF1ChG0ONPCpECUb1KEDmMAqB
	VyXS1f2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22eE-00000002wFH-3Om1;
	Tue, 08 Apr 2025 06:41:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22b6-00000002vre-14un
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 06:38:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F08F060007;
	Tue,  8 Apr 2025 06:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3D6C4CEE5;
	Tue,  8 Apr 2025 06:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744094291;
	bh=JJC94Lz0zUD4TEdlGfqwtlcTdbmhju2+3wATQkMNeAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PlG2w4d1ftsFi3+kIshkvaX7VWEwC6HwHzXnTSaF6evp0X1jTXGKIjCBd65eozkCg
	 M+CZo7XyGTpPZ+9tfEfAT3PTrz1dfUV07ukl6cDMa+8IGTpoFgy5IZRDZCOmMBDFyG
	 /NG7KxnFTI2dY354YY0FDkknGa8KFijMpBjsgfoHp79I73Qi2+D27EGapia0oymHL/
	 PNDok9S4lYahSgRKW/SROAc4L0BVe9zRhxu1o66cX7lxKF/USkmVQ5EIg8PRaqTlEA
	 /VO90PH1qAfyHzsOWwD5iedRHvvnYFYt9iuW4mLtrk17B8C/k0BjGYqpJOIkBYl3KY
	 Vdby+VLZWxnUA==
Date: Tue, 8 Apr 2025 08:38:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, christophe.kerello@foss.st.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/7] Add STM32MP25 SPI NOR support
Message-ID: <20250408-opal-pillbug-of-acumen-0fbb68@shite>
References: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
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

On Mon, Apr 07, 2025 at 03:27:31PM GMT, Patrice Chotard wrote:
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> Patrice Chotard (7):
>       MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver
>       dt-bindings: memory-controllers: Add STM32 Octo Memory Manager controller
>       memory: Add STM32 Octo Memory Manager driver
>       arm64: dts: st: Add OMM node on stm32mp251
>       arm64: dts: st: Add ospi port1 pinctrl entries in stm32mp25-pinctrl.dtsi
>       arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board
>       arm64: defconfig: Enable STM32 Octo Memory Manager and OcstoSPI driver
> 
>  .../memory-controllers/st,stm32mp25-omm.yaml       | 226 ++++++++++
>  MAINTAINERS                                        |   6 +
>  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi      |  51 +++
>  arch/arm64/boot/dts/st/stm32mp251.dtsi             |  54 +++
>  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |  32 ++
>  arch/arm64/configs/defconfig                       |   2 +
>  drivers/memory/Kconfig                             |  17 +
>  drivers/memory/Makefile                            |   1 +
>  drivers/memory/stm32_omm.c                         | 474 +++++++++++++++++++++
>  9 files changed, 863 insertions(+)
> ---
> base-commit: 88424abd55ab36c3565898a656589a0a25ecd92f

That's unknown commit.

b4 diff '20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com'
Using cached copy of the lookup
---
Analyzing 81 messages in the thread
Preparing fake-am for v7: MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver
ERROR: Could not write fake-am tree
---
Could not create fake-am range for lower series v7

I tried on latest next, on some March next, on latest mainline. It seems
you use some weird base here, so anyway I won't be able to apply it.

Please split the patchset per subsystem and send something based on
maintainer tree (so for me my for-next branch), mainline (which is the
same as for-next currently) or linux-next.... which would be the same as
my for-next branch currently.

Best regards,
Krzysztof


