Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D4BC282E5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 16:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lFAL66VW3M8h5bO9V5zjZ4qVLBZr5V2GOw5tJ2FdVFk=; b=BVZb9/l+VZyjCpl1KsnQ8lyDh3
	3vP9QJI1wp0HKrFZ773W7n9HSeibNgeJvmkEZ/yvBdYHliaAZ0hT88PZN9pb/NIArr+dRmvj69wR8
	YhpEwbfXByDHFCNPSmhp1A6Z8KwEDPgYb8lRwAj0baQx58BHhNfrlf1NeuuufWuXpyW1RH40qkcsh
	+WkMFgBdEODYMdHiC84aHfoBDbU7Owh5Q2mUXtyx8AEcNvnXLV6ND+1gNr0R/dGbZkpEITYAicqIh
	XvaJeKTtZ8LTUIlz6jcNesz6MBO1grkoD3UxoA4uqRfaY2QO/V9A9yOZOpRZshsfp2cjCH1V1OpKE
	xNDxXtPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tprSE-00000008dU3-3bC0;
	Wed, 05 Mar 2025 16:18:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpqNh-00000008UDj-0sSZ;
	Wed, 05 Mar 2025 15:09:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 55E6CA458C6;
	Wed,  5 Mar 2025 15:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918C9C4CED1;
	Wed,  5 Mar 2025 15:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741187395;
	bh=KJ2n6qqivS8cfT5p3ck5BACWcFxyQHKwuyUCKJ1adwc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Foc64VcCsjkJX2XPNYKFjY/rY2tvFkBx0fPMjxxPmRCBlO0CPbiBAO2sQTT9/PPsp
	 3q0uYHmklJDSBvLK+//XKlnRBks0W0Q2t9WQ7gwiTXdZxHNluVSRsaGCnf2FgXgsI7
	 KmMy5XTgk+Xqqn1tplWiJW7P2JQ5Dvrv92EXS4XbP6Mh8JUXLP811GLMafGBWP2Kqw
	 fbunbDryDW70o3KzLjVJFgQzmWIAv70+qjGluGgBh+eubjHQTttDA5P0PtVlF8ZCHq
	 2KnArDxFlTKOjQhlUnjQBJ3R832yX+LEKuBZF1GYvifbdnnxLsNAY1GRLlCWg83uUP
	 pzWEOXoz5oNjQ==
Date: Wed, 05 Mar 2025 09:09:53 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
In-Reply-To: <20250305100134.1171124-1-manikandan.m@microchip.com>
References: <20250305100134.1171124-1-manikandan.m@microchip.com>
Message-Id: <174118733199.1974433.9410395684855092118.robh@kernel.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: sst: register SFDP region into NVMEM
 framework to read MAC Address
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_070957_313052_41034BBE 
X-CRM114-Status: GOOD (  13.56  )
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
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, alexandre.belloni@bootlin.com, mwalle@kernel.org, vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org, tudor.ambarus@linaro.org, claudiu.beznea@tuxon.dev, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, miquel.raynal@bootlin.com, Varshini Rajendran <varshini.rajendran@microchip.com>, krzk+dt@kernel.org, pratyush@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Wed, 05 Mar 2025 15:31:33 +0530, Manikandan Muralidharan wrote:
> From: Varshini Rajendran <varshini.rajendran@microchip.com>
> 
> EUI identifier and the MAC Address of the Ethernet Interface is stored
> after the SFDP table of contents starting at address 0x260 in the
> QSPI memory.
> Register the entire SFDP region read by the spi-nor (nor->sfdp) into the
> NVMEM framework and read the MAC Address when requested using the nvmem
> properties in the DT by the net drivers.
> 
> In kernel the Ethernet MAC address relied on U-Boot env variables or
> generated a random address, which posed challenges for boards without
> on-board EEPROMs or with multiple Ethernet ports.
> This change ensures consistent and reliable MAC address retrieval from QSPI,
> benefiting boards like the sama5d29 curiosity and sam9x75 curiosity.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> [manikandan.m@microchip.com: Integrate the nvmem->read callback framework]
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  drivers/mtd/spi-nor/sst.c | 62 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/microchip/' for 20250305100134.1171124-1-manikandan.m@microchip.com:

arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: flash@0: Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#






