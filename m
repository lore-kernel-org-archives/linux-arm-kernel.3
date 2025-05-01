Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88230C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 04:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNe3miHcpLcnSMR5z6VKMwa3fx7HOMBvo3VIxFdilv8=; b=udzTftJMXDBOwFvbmrLnorkzC/
	ssAjREWIbnzDojw0iIAp1ihoZWhqn+KptLW6uh4KlKSXCquzRrITZg8N7XT82DOt0QSLkgsnZ9SOj
	YuchlJPm8C1y+SCkUCZwIzN2hQldmlVFC75kz+q3Qe472PC49QgFrBd4D/EWwJl+g2v1l1FXJJ5Bb
	YNRJud9PcE/oIkp6B1gmGsbDQ4AWBveOQURAmeuJ7jLMPJ9W+de4taeJq6LWIHlYmugPadm9832oy
	g97/Zb86hELur2SQPmMo8qA0+4ai02HtKcIw55JLQNDBUEE0+melpGGMWOSrA1krS3W7hHO5Ths4P
	MNQ4Hc4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uALMY-0000000EfcP-3Dqm;
	Thu, 01 May 2025 04:17:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uALKe-0000000EfJQ-44zE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 04:15:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C4E568499;
	Thu,  1 May 2025 04:15:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B70EC4CEE3;
	Thu,  1 May 2025 04:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746072930;
	bh=buPxZBousmKo9OStYdQccta50qsdElaO21GDRbmAvRM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=JBZCO0Epyf9CUJvXNT6QWXd3n4pi9p3rcEMdewXPrnqGzzklEUGcnDXzZRV7L1HeL
	 8FIDuSgNsvI6QpztWAGvRmuBXo2TWuHKRSlbkmQ3ku4rvvH+Sl8Ufx2kK7enAyt5CR
	 7RzyuMg0UnjjggKqkFVr6oXALWcz6OKu199mtGEf5GimXR6WWvpkkG7sOaL1TwHHWx
	 J8K4RIWfE7siz/n3gZv8zlV4qPLjFKKKvl8X3p5WzaauD73TOaULb6vMGJNMqjBt2Q
	 qGms6AITyQmABxeHM4tH/KEEm+praYVNqavldOYi0EOSdqDwwZMiPrQPiOpzVFskvc
	 LnPVTKF0Df0iQ==
Date: Wed, 30 Apr 2025 23:15:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
In-Reply-To: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
References: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
Message-Id: <174607289976.949416.5265834490992116431.robh@kernel.org>
Subject: Re: [PATCH 0/6] mfd: simple-mfd-i2c: add QIXIS CPLD support
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


On Wed, 30 Apr 2025 18:36:28 +0300, Ioana Ciornei wrote:
> The MDIO mux on the LX2160AQDS, LX2162AQDS and LS1028AQDS boards never
> worked in mainline. The DT files were submitted initially as-is, and
> there is a downstream driver for the QIXIS CPLD device:
> https://github.com/nxp-qoriq/linux/blob/lf-6.12.y/drivers/soc/fsl/qixis_ctrl.c
> 
> Since the HW works with the already existing
> driver/mfd/similar-mfd-i2c.c driver, extend the list of compatible
> strings to also cover these 3 new boards, instead of trying to upstream
> a duplicate driver.
> 
> This patch set also adapts the DT nodes for each of the affected boards
> so that we match on the new compatible strings.
> 
> The last patch describes the two on-board RGMII PHYs found on the
> LX2160AQDS boards which make use of the MDIO bus found behind the CPLD
> driven MDIO mux.
> 
> Ioana Ciornei (5):
>   dt-bindings: mfd: add bindings for QIXIS CPLD
>   mfd: simple-mfd-i2c: add compatible string for Layerscape QIXIS CPLD
>   arm64: dts: lx2160a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c
>     driver
>   arm64: dts: lx2162a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c
>     driver
>   arm64: dts: lx2160a-qds: add the two on-board RGMII PHYs
> 
> Vladimir Oltean (1):
>   arm64: dts: ls1028a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c
>     driver
> 
>  .../bindings/mfd/fsl,qixis-i2c.yaml           | 65 +++++++++++++++++++
>  .../boot/dts/freescale/fsl-ls1028a-qds.dts    |  9 +--
>  .../boot/dts/freescale/fsl-lx2160a-qds.dts    | 28 +++++++-
>  .../boot/dts/freescale/fsl-lx2162a-qds.dts    |  8 ++-
>  drivers/mfd/simple-mfd-i2c.c                  |  3 +
>  5 files changed, 103 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml
> 
> --
> 2.25.1
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
 Base: attempting to guess base-commit...
 Base: tags/next-20250429 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250430153634.2971736-1-ioana.ciornei@nxp.com:

arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: fpga@66 (fsl,lx2160a-qds-qixis-i2c): 'mux-controller@54' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/fsl,qixis-i2c.yaml#
arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: fpga@66 (fsl,ls1028a-qds-qixis-i2c): 'mux-controller@54' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/fsl,qixis-i2c.yaml#
arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: fpga@66 (fsl,lx2162a-qds-qixis-i2c): 'mux-controller@54' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/fsl,qixis-i2c.yaml#






