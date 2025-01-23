Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C754C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 16:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/X60GkmierE1KKdIX9gqMqnKTdNHT4wSybas/59O7E=; b=MPStjRCEuICSybLPZC9Wbl3q5t
	wQpwLKkEzyWxpPF+PsxMcgNrByQDQtoRRP38xozyv6E9PSyVqBPBfBrGF/38E2u3nIW6LJFFUdxIo
	VWORYipZ3GrN4kX0/oFxFvLGs+YPNf/rSd7pyMGU4ijQt1nfRjL99L/+pc2SBF2U7m/moDzVjhUFo
	IcwFWX/Gsm6emViY+o5RAMNpAjOHXo5HKbZ4p9T6hAmKyM8OHZ6ozitC1b0EMThMnWSWvO4ef2Wh/
	nyaDpfBhbiWdwCa2jTUHBwITDmmp40mwLcItHqzT7vPV5lpmWkU3hvMkI7V5Lw5SgZ5BfVYxB9tAo
	aoyp2gNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tazeL-0000000ClYw-2IrI;
	Thu, 23 Jan 2025 16:01:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tazaY-0000000CkUB-0eLw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 15:57:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3B3B25C58AC;
	Thu, 23 Jan 2025 15:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448B5C4CED3;
	Thu, 23 Jan 2025 15:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737647869;
	bh=ft8Jievp9zLCcxslQvNCpMJJr771yq6XaBBtLD9kMvU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=SmlWiEJkChX33WESinpqu8F9rIKOPOsZrPOKeRT8AI3FAIwHcs/Cq9WEwL+8OFWPP
	 QJJ8ME5QD7b3+2zJ8OgtZyxnEDMRW2tmBoBPTuLGAOJkj2P7IQ90YClw78IuOfVzYc
	 gWfgDx59pmvU4wTwDirmvNXVPy707RS/T+wj+w89+ej44ABbKEaWPC3YYqFaF2OhNB
	 36aLbERTs2BlZ9H+hBvKIEYPowS0w/eb7KQRMfKKvdtLB7O17ophpFsK63ra8icoy5
	 8fukKhT+59r0qYfsp6SiEF60Yt66KhSkV6R6TPyNdPRb0N+1pRRrWUoYz0jVlIvVFk
	 fVIPSVDfjKLZg==
Date: Thu, 23 Jan 2025 09:57:48 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, 
 devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, imx@lists.linux.dev
To: Antonin Godard <antonin.godard@bootlin.com>
In-Reply-To: <20250121-varsom6ul-concerto-dts-v1-0-eb349acf0ac6@bootlin.com>
References: <20250121-varsom6ul-concerto-dts-v1-0-eb349acf0ac6@bootlin.com>
Message-Id: <173764775251.3793618.182783828690702678.robh@kernel.org>
Subject: Re: [PATCH 0/3] Add Variscite i.MX6UL SoM and Concerto board
 support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_075750_234843_A49EBD84 
X-CRM114-Status: GOOD (  18.42  )
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


On Tue, 21 Jan 2025 10:33:26 +0100, Antonin Godard wrote:
> This patch series adds support for the i.MX6UL Variscite SoM
> (VAR-SOM-6UL) and the Variscite Concerto Carrier Board.
> 
> I tested this with a VAR-SOM-6UL_G2_700C_512R_8N_IT_REV1.3A (one variant
> of this SoM), meaning I couldn't test all of the possible options of the
> SoM - so this device tree includes partial support for it.
> 
> These are based on the 5.15 Variscite kernel fork but adapted for
> mainline.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Antonin Godard (3):
>       dt-bindings: arm: fsl: Add VAR-SOM-MX6UL SoM and Concerto board
>       ARM: dts: imx6ul: Add Variscite VAR-SOM-MX6UL SoM support
>       ARM: dts: imx6ul: Add Variscite Concerto board support
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml     |   6 +
>  arch/arm/boot/dts/nxp/imx/Makefile                 |   1 +
>  .../boot/dts/nxp/imx/imx6ul-var-som-concerto.dts   | 331 +++++++++++++++++++++
>  arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi      | 232 +++++++++++++++
>  4 files changed, 570 insertions(+)
> ---
> base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> change-id: 20250120-varsom6ul-concerto-dts-a08be2a6219b
> 
> Best regards,
> --
> Antonin Godard <antonin.godard@bootlin.com>
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nxp/' for 20250121-varsom6ul-concerto-dts-v1-0-eb349acf0ac6@bootlin.com:

arch/arm/boot/dts/nxp/imx/imx6dl-b125v2.dtb: clock-controller@20c4000: clocks: [[23]] is too short
	from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.yaml#






