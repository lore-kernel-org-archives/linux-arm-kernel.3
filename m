Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F48CD5E147
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 13:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TuUqlnLhfz7N+jBR4LfZWuOxVfsW+PT9rIbN0cdpF0g=; b=eEnaz6YK7pSCkYomxsW/z95BSm
	131OGmBI9l/el3YAgqUEEAppLkaYsUz704B5DxTiaqtLLvcxX2duPKsIXWAIUR1Db/9WDupntKTLa
	NrGa8vRolWYwCxDWMJ4iZVc5smlfa+NwM+B696YIfQZXbceTeK1QtnO2HhBLMsYuUdNrvaYdszQzA
	+e+x84mV4u8IF2oTBLApCUb3Le/SpDhbyirtmm5ccPmYl0RbiLc0G+bGllZLaqp1cg++fXN9QDNlg
	sBPI76krKFxjiCTvqfIh3FxPNYfC0WPcyG6g1NHI1nyRUGSO44HZ3wwDZ5DLZ203cZwbGXWVeUcQC
	UEQ5QOWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVUqJ-00000005EO4-47Yg;
	Tue, 16 Dec 2025 13:11:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVUqG-00000005EMs-3jmk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 13:11:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9855943F50;
	Tue, 16 Dec 2025 13:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548DCC4CEF1;
	Tue, 16 Dec 2025 13:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765890712;
	bh=42Q51V+DJ8mxB4c2XkCdjem/RxmNhxIK1HpVUzeDmMI=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=X8z9QTrVJZUmlEAkWh4GWVBCWEvZsvMHxe3nkMdV1ZElRVXL5LBWGe4+1hK7zLDmk
	 4Ck6h1FHwlQoHvxdNl3iV/6x+v86yZ6GQC4yKTAxL8WaYFROFWjSIF/kWkWk9ebvJM
	 htyimtyCz/C+MhyD1zH5Ga6jOIm57OanH5HZny9ThNlosjvXvg3BeBCJEO/6tgnh7a
	 YqFrWDwF2kUusXGpKk7pTW+Y5Vuc6qVKfjzBpf5/IKC/dMTulDs2JxCnhIlMQnhfPZ
	 Mu9HY+rLnpjU7gz/9GpLnz3Q7bG+XmpoIjBWs95x09OD9XTs99ZhfXCfYtdUND/c5b
	 VBXGvlpJcWh9Q==
From: Rob Herring <robh@kernel.org>
Date: Tue, 16 Dec 2025 07:11:51 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Marquet <tb@a-marquet.fr>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>
To: Lukas Timmermann <linux@timmermann.space>
In-Reply-To: <20251215-lat3st-staging-v3-0-2e4914b64dd8@timmermann.space>
References: <20251215-lat3st-staging-v3-0-2e4914b64dd8@timmermann.space>
Message-Id: <176589052399.1815190.7793235081822033570.robh@kernel.org>
Subject: Re: [PATCH v3 0/3] Add support for exynos5250-manta (Google Nexus
 10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_051152_971271_8EC752DC 
X-CRM114-Status: GOOD (  27.00  )
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


On Mon, 15 Dec 2025 16:05:21 +0100, Lukas Timmermann wrote:
> This patch series adds initial support for the google-manta board, known
> as Google Nexus 10 to users. The device is powered by
> the Exynos 5250 SoC. The bindings for the notification led are already
> in the kernel mailing list, got recently applied and can be found here:
> https://lore.kernel.org/linux-leds/20251125114015.355487-1-linux@timmermann.space/
> 
> The first two patches add the necessary device tree files and
> bindings, while the last patch makes a small modification to
> allow CPU1 to boot, as it requires a call to it's underlying firmware.
> 
> This first iteration only provides basic support to get the board
> up and running and usable via UART and with WiFi support. We will upstream additional
> features in future patches. All patches have been tested on real hardware.
> 
> Changes in v3:
>  - Added a better patch description for firmware patch. (@krzk)
>  - Reorganized nodes in DT. (@krzk)
>  - Fixed memory node to use separate entries. (@krzk)
>  - Renamed pwrseq node. (@krzk)
>  - Fixed firmware checking for old dt compatible string. (@pavel)
>  - Link to v2: https://lore.kernel.org/all/20251125-google-manta-v2-0-0f097cfff39c@timmermann.space/
> Changes in v2:
>  - Renamed to google-manta (@krzk)
>  - Link to v1: https://lore.kernel.org/all/20251120144018.961604-2-linux@timmermann.space/
> 
> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> ---
> Alexandre Marquet (3):
>       dt-bindings: ARM: samsung: Add Google Manta (Nexus 10)
>       ARM: dts: exynos: Add Google Manta (Nexus 10)
>       ARM: samsung: exynos5250: Allow CPU1 to boot
> 
>  .../bindings/arm/samsung/samsung-boards.yaml       |   1 +
>  arch/arm/boot/dts/samsung/Makefile                 |   1 +
>  arch/arm/boot/dts/samsung/exynos5250-manta.dts     | 511 +++++++++++++++++++++
>  arch/arm/mach-exynos/firmware.c                    |   4 +-
>  4 files changed, 515 insertions(+), 2 deletions(-)
> ---
> base-commit: d5f0e9098499869354aacb5b080f602f0399d396
> change-id: 20251215-lat3st-staging-d9c926d8a75f
> 
> Best regards,
> --
> Lukas Timmermann <linux@timmermann.space>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: base-commit d5f0e9098499869354aacb5b080f602f0399d396 not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/next-20251215 (exact match)
 Base: tags/next-20251215 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/samsung/' for 20251215-lat3st-staging-v3-0-2e4914b64dd8@timmermann.space:

arch/arm/boot/dts/samsung/exynos5250-manta.dtb: /soc/i2c@12c70000/led-controller@42: failed to match any schema with compatible: ['ams,as3668']
arch/arm/boot/dts/samsung/exynos5250-manta.dtb: rtc@101e0000 (samsung,s3c6410-rtc): clock-names: ['rtc'] is too short
	from schema $id: http://devicetree.org/schemas/rtc/s3c-rtc.yaml
arch/arm/boot/dts/samsung/exynos5250-manta.dtb: rtc@101e0000 (samsung,s3c6410-rtc): clocks: [[2, 337]] is too short
	from schema $id: http://devicetree.org/schemas/rtc/s3c-rtc.yaml






