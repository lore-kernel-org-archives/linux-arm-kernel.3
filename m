Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B504EC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 22:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pwvjf9rVpGodQ8kKWJmlUbe6+H3F+3biqlhFGSgAxCw=; b=yu2XWfRcpSQW1yqwiVlghgI+cp
	KEX4Gfz6X5K69Y317vrWI9vh6Vu0V9+uWkZLxJkScg0Ro/BEhX0DisvA9GVpEgJRk5yQCjZ4xSN++
	Ykm01+oMXtm/EFI9C2jLyivm8IzMProoVYfy5zoMDDe/hWuOC7tQGhKSwjfDpWcjqxLZHQgA4YVY+
	vdCtNvxD5X6z18Obz9oFfgqxYdTyEc1gFvf+48fZDufIX4IlsHsxm/L7qtxX04+JJXesla98Y4Iff
	ugfJ7MQvrSe3/ZEMIJS3byLe2l2XrGHWIVeR6aACna2qm0mQ3mPtedoGX9Ydx8wO/vywzhqmf336N
	cJgVIqpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thz8L-00000005WQx-194i;
	Tue, 11 Feb 2025 22:53:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thz6u-00000005WF9-24QP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 22:52:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5B835A40DF4;
	Tue, 11 Feb 2025 22:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CCBFC4CEDD;
	Tue, 11 Feb 2025 22:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739314327;
	bh=DQYkM4ufN/n8fXrucc3V3ZOmG/KXTPHm940bJ+L/nRo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Ci3ny5AVly53CuRUMaV1XGNdXJJTMrWd41HwtrQv7r8BWqQIzQNx5fJQYMWsWzWeb
	 iRhKPe5TPRGRWyDNLxPyLJkCGxO94ZgseKlQrmani83xOIQbeXHClPXhrwhR5qSum/
	 JH85r7/gvE3WFBrGkI22up/qLHU17iW7UVuDfIGUQo2O9XXpOW2fKAJEwRaSFG6RlD
	 pDtvhILqEGHRJvB/f5mKK1EnUFsjE9nBXxmkj9O+4hm4tdOZfBgPwTdJOOR5j5AEJK
	 ssVkNQ9NYCRpWZ3xH1G2nCEqGAJ0XfGcoa2HRgpiV8/anapxxCI1hGhR0VGMhjSQTe
	 08PQt7vr+mZ4A==
Date: Tue, 11 Feb 2025 16:52:06 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mihai Sain <mihai.sain@microchip.com>
In-Reply-To: <20250211143302.4102-1-mihai.sain@microchip.com>
References: <20250211143302.4102-1-mihai.sain@microchip.com>
Message-Id: <173931425548.1387873.8595837512080490773.robh@kernel.org>
Subject: Re: [PATCH 0/2] Add power monitor support on sama7d65-curiosity
 board
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_145208_591667_BB5E0199 
X-CRM114-Status: GOOD (  12.06  )
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
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, claudiu.beznea@tuxon.dev, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Tue, 11 Feb 2025 16:33:00 +0200, Mihai Sain wrote:
> This patch series adds power monitor support on Microchip SAMA7D65 Curiosity board.
> 
> [root@SAMA7D65 ~]$ lsiio
> Device 001: pac1934
> Device 000: e1000000.adc
> 
> [root@SAMA7D65 ~]$ awk -f pac1934.awk
> VDD3V3   current: 146.173 mA, voltage: 3302.73 mV
> VDDIODDR current: 62.1356 mA, voltage: 1353.96 mV
> VDDCORE  current: 242.248 mA, voltage: 1204.36 mV
> VDDCPU   current: 213.565 mA, voltage: 1303.05 mV
> 
> Mihai Sain (2):
>   ARM: dts: microchip: sama7d65: Add flexcom 10 node
>   ARM: dts: microchip: sama7d65_curiosity: Add power monitor support
> 
>  .../dts/microchip/at91-sama7d65_curiosity.dts | 52 +++++++++++++++++++
>  arch/arm/boot/dts/microchip/sama7d65.dtsi     | 21 ++++++++
>  2 files changed, 73 insertions(+)
> 
> 
> base-commit: febbc555cf0fff895546ddb8ba2c9a523692fb55
> --
> 2.48.1
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/microchip/' for 20250211143302.4102-1-mihai.sain@microchip.com:

arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: flexcom@e2824000: compatible: 'oneOf' conditional failed, one must be fixed:
	['microchip,sama7d65-flexcom', 'atmel,sama5d2-flexcom'] is too long
	'atmel,sama5d2-flexcom' was expected
	'microchip,sam9x7-flexcom' was expected
	'microchip,sama7g5-flexcom' was expected
	from schema $id: http://devicetree.org/schemas/mfd/atmel,sama5d2-flexcom.yaml#
arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: /soc/flexcom@e2824000: failed to match any schema with compatible: ['microchip,sama7d65-flexcom', 'atmel,sama5d2-flexcom']






