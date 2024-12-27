Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D1BE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 15:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RI7ipb/+4Szmw4qFmtEiLT3qk/InoToMz8FY4RLwi60=; b=GzjMXdEhuBRdCxYkcIotbNZ5cm
	UXzmlmBSRZxt2MPy4FYTkTGD4JqxCTYdUerD9uCO9d9sMG8n4OoWhcdHvm5A16l6n2FItEPQkPpAf
	iTq1F1ixH8UuqJpn9iSWVqxkURPka5w5YRX/RgGsoqvnxRcJycJnVptfValgkyhlzX4fVPV2jXPkE
	D30SswEurLg2QGiMzXAvrDjnCSC8TVKAc7BBPR4ZF8JtIMtKcmg5wW5gI0gvF9D3TPwscQOVy62/2
	YCAjEV3IQ4KT1HJylefkUU48p//jUpgkIKjkS8tELF+pqNTOvjfdK+cZx2xLIeLJ72Gc8+5QNNHYm
	bTgmwNrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRCBA-00000000WTT-2ldm;
	Fri, 27 Dec 2024 15:23:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRC77-00000000VmI-3kfP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 15:18:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C73DA5C61D8;
	Fri, 27 Dec 2024 15:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDF7C4CED0;
	Fri, 27 Dec 2024 15:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735312737;
	bh=TecfYovZ6nU0ZbJdXO5WWSnJJ+xeXIYM70+2gZINR5A=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FJ9ai8QFN8/H30uRZEWlmqWuSonhow5tSiRAPqUIVsiuxGbQ+jhlqp20bMlDN3o0w
	 raAyGmCKGqKOPp2YmIrlWMQI/qIzLhRSkxfZbhHjnczg3lkRYsomNAfE4AWsM9209b
	 NroJl1LQUfURNu+72iXZ35TjMv358pEegNloKHT21oEI9Y1JHczcH99TxH5vgvBvSM
	 qf44SbhkstcpSnOCNqN/rpu/t5GKmWV1f4a4k2/EKYq6YHv5Z5cjpdJHKGQdz4LwRY
	 tbt4T/5Rq4qlTwmnf3Rmb1KAnKV1rJ8G2/utKXo2MKMtl2zG3fWlgyPJzXAHyZQpwG
	 UJpMr2NnLUOug==
Date: Fri, 27 Dec 2024 09:18:55 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
To: Marek Vasut <marex@denx.de>
In-Reply-To: <20241226171404.84095-1-marex@denx.de>
References: <20241226171404.84095-1-marex@denx.de>
Message-Id: <173531253398.3886481.9345779510218290682.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp: Update Data Modul i.MX8M Plus eDM
 SBC DT to rev.903
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_071858_019277_3B6BEC5C 
X-CRM114-Status: GOOD (  15.10  )
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


On Thu, 26 Dec 2024 18:13:27 +0100, Marek Vasut wrote:
> Update the DT to match newest Data Modul i.MX8M Plus eDM SBC rev.903
> board which implements significant changes. Keep some of the rev.900
> and rev.902 nodes in the DT so that a DTO can be used to support old
> rev.900 and rev.902 boards easily.
> 
> The changes from rev.900 to rev.902 are:
> - Both ethernet PHYs replaced from AR8031 to BCM54213PE
> - Both ethernet PHYs MDIO address changed
> - PCIe WiFi now comes with dedicated regulator
> - I2C TPM chip address
> - Additional GPIO expander for LVDS panel control added
> - Current EEPROM I2C address changed
> - Another optional EEPROM added onto another I2C bus
> 
> The changes from rev.902 to rev.903 are:
> - Additional GPIO expander for WiFi and LVDS panel control added
> - Multiple GPIOs are reassigned
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  .../freescale/imx8mp-data-modul-edm-sbc.dts   | 147 +++++++++++++++---
>  1 file changed, 128 insertions(+), 19 deletions(-)
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


New warnings running 'make CHECK_DTBS=y freescale/imx8mp-data-modul-edm-sbc.dtb' for 20241226171404.84095-1-marex@denx.de:

arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: tpm@2e: compatible: 'oneOf' conditional failed, one must be fixed:
	['st,st33tphf2ei2c', 'tcg,tpm-tis-i2c'] is too long
	'st,st33tphf2ei2c' is not one of ['infineon,slb9673', 'nuvoton,npct75x', 'st,st33ktpm2xi2c']
	'st,st33tphf2ei2c' is not one of ['atmel,at97sc3204t', 'infineon,slb9635tt', 'infineon,slb9645tt', 'infineon,tpm_i2c_infineon', 'nuvoton,npct501', 'nuvoton,npct601', 'st,st33zp24-i2c', 'winbond,wpct301']
	from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm-tis-i2c.yaml#
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: tpm@2e: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm-tis-i2c.yaml#
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: /soc@0/bus@30800000/i2c@30a20000/tpm@2e: failed to match any schema with compatible: ['st,st33tphf2ei2c', 'tcg,tpm-tis-i2c']
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: rtc@68: #clock-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/rtc/st,m41t80.yaml#
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: rtc@68: Unevaluated properties are not allowed ('#clock-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/rtc/st,m41t80.yaml#






