Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443ECC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 18:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hKfS10Ix09HXSAe6fouGr/qZEU1ful/OQ7NhKqZZ3GU=; b=YIdANvqgTihl3lSyx4Iuu1JkRM
	22oSiTBiF1D3Iyj/OyJNr/RmfYpLQXcS2ysO6g7gUgCOoPMKvk15HqYI0vAOhBTB4NgMBVjaCvrX0
	6xLVrdESKi/I9x4JFPE3x/Qg1UmKGxUX5VK/hqd8gaYgO1vDpLMX1oAiRLPqMwuxx62JwI6zSEC86
	sIpxbNi85p2a9qEC1IoLNLhkPtjdB5onkl8CIuMoggUINBlw/0JHNmFvy6Bqi+Yd6NRj/XunD48gN
	2fp4K0B1L97klOI0swkHCoQE2zGvbRnhZuExuzNs3N0AuYkwcslFMQRMqkI2HmwS93CeLZnng2M3F
	wPpcBFJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJyca-0000000BJGo-0YzR;
	Tue, 27 May 2025 18:01:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJyXK-0000000BIQA-0dXe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 17:56:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E3DC4AA0F;
	Tue, 27 May 2025 17:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCD1C4CEED;
	Tue, 27 May 2025 17:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748368584;
	bh=sV+VhsTFkVG+PDShstWZZdPvkV2+Hq/qwiK6U/6fXX4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=pMlTMlYA7liTZY9OykGRA3FaijfG6V9VIWY5Ld8zatBhpjG4hSogpxyr9bSf5UqJh
	 8iWA5Y3nICnvHva2hPy7O96VjfGDSNFWmL5vshJtgbPvkmOtjOro6W0NRN7bNmqkgP
	 TUnr1VfvE0b524sw5rYpAz3q7jrhDu5MdQhZMqHnjr6lUkMa8GzkHSUJ6CNtJiO9sL
	 tkhSiGusHHXmAaOOJPsduatEs16UfTxqF08vbAeGVBlKRMoQIXMxyMYf8X2sD268Hx
	 dyYrjIx7QcHfw0WKB6BPHDgjMkOTpGFXOBikATkXZv6+yEDCYanjnGnutVk/HGntOR
	 mqo12813VnD0w==
Date: Tue, 27 May 2025 12:56:22 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Ed Tanous <etanous@nvidia.com>, 
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
 devicetree@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, Leo Huang <leohu@nvidia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Deepak Kodihalli <dkodihalli@nvidia.com>
To: Willie Thai <wthai@nvidia.com>
In-Reply-To: <20250525-dts-v1-0-9ac63ad3bf15@nvidia.com>
References: <20250525-dts-v1-0-9ac63ad3bf15@nvidia.com>
Message-Id: <174836830738.840800.7951224308265522325.robh@kernel.org>
Subject: Re: [PATCH 0/3] ARM: dts: aspeed: nvidia: Update DTS to support
 GB200NVL hardware
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_105626_252849_7124692C 
X-CRM114-Status: GOOD (  13.64  )
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


On Sun, 25 May 2025 18:20:16 +0000, Willie Thai wrote:
> Update the DTS file for the GB200NVL hardware change.
> 
> Signed-off-by: Deepak Kodihalli <dkodihalli@nvidia.com>
> Signed-off-by: Ed Tanous <etanous@nvidia.com>
> Signed-off-by: Leo Huang <leohu@nvidia.com>
> Signed-off-by: Willie Thai <wthai@nvidia.com>
> 
> Signed-off-by: Willie Thai <wthai@nvidia.com>
> ---
> Willie Thai (3):
>       ARM: dts: aspeed: nvidia: gb200nvl: Add VCC Supply
>       ARM: dts: aspeed: nvidia: gb200nvl: Enable i2c3 bus
>       ARM: dts: aspeed: nvidia: gb200nvl: Repurpose the HMC gpio pin
> 
>  .../dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts  | 39 ++++++++++++++++++++--
>  1 file changed, 37 insertions(+), 2 deletions(-)
> ---
> base-commit: 13c9c6eabf033ed4f369ad4d29bdc58ed4a411e3
> change-id: 20250525-dts-8eca0cb6dfae
> 
> Best regards,
> --
> Willie Thai <wthai@nvidia.com>
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
 Base: using specified base-commit 13c9c6eabf033ed4f369ad4d29bdc58ed4a411e3

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/aspeed/' for 20250525-dts-v1-0-9ac63ad3bf15@nvidia.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@200 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@280 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@300 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-mux@74 (nxp,pca9546): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-mux@74 (nxp,pca9546): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@380 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@480 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@500 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@780 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@800 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#






