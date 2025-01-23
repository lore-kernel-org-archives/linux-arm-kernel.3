Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650A1C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 16:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fp0JHkmmpmVExrBWNJ/AEecKLMgr9X7JiSOUWEMwm5M=; b=nYjQx4HIb4z7FVUG+3X8VmuWwM
	ZVm9VMfth/Vbjf69FpE3QdcDCdpCpimcsce0jZOQBDm1c0sJXA0n4hNvCAgYi7Cbn2iATbc5sVr8v
	M/oeot6W78DuH+PlxZVY93kGuNcHdPt2o41TBDfxFXuHP9Du9Tc+HT3R0jZRpzCthjgALEOWjK848
	FvZmvx9xDjQVm9Ji/7PUOgqqMKzMIlzCYEIdCTOpplXdoYbGHnAIpf7v83Lbsd7bkMwXYHk0V6r26
	EZ3/+xR5JAri2W2i8V83fcIZ77B2lZEH5kLPvYWcSnHXJS0kgTJIo6nx4MUpz7hDvWSlJc8Iu4eEa
	kJe6pv+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tazd4-0000000ClLk-3ayI;
	Thu, 23 Jan 2025 16:00:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tazaX-0000000CkU8-3Kdb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 15:57:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F0A9D5C587B;
	Thu, 23 Jan 2025 15:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0404DC4CEDD;
	Thu, 23 Jan 2025 15:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737647868;
	bh=HDXxO9qAlUO62itZdH9ffW5f6oieeEZ+qyLExIJ0csA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=S3kuVMywcjybsUaZb5GdvcQCDNGNFTj8NgmSOjNj2PrcKbU+ru6FEP3VtzSwBvQsS
	 8PhobbLGxx03onDIusJ3bSI5ujoimWBPLAvjvHo4DH0D6H37YDFRKA1JC+sEhHRUXg
	 71n06VS2YLC94oqcZmI/teGKjpRHZck9qT1X4ildlb8aDhgReeuQ+666Umvj8vKP3w
	 smRtG9fxfRxTrqKypY6zFGAFBcXRoKA/3a8TdOTQULF2pYpuIY7fJu8p5jJWB3FCW2
	 pU3GN4MQCA5Vo5MtoFi4ZT5ajUbfMA5nXHWoO37jwD5FU39ZltMM20BbFiggocTPp1
	 Ke7CW+B4gAb9w==
Date: Thu, 23 Jan 2025 09:57:47 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
To: Marc Kleine-Budde <mkl@pengutronix.de>
In-Reply-To: <20250121-lxa-fairytux-v3-0-8d42d7d232fb@pengutronix.de>
References: <20250121-lxa-fairytux-v3-0-8d42d7d232fb@pengutronix.de>
Message-Id: <173764775141.3793586.6690578690442295161.robh@kernel.org>
Subject: Re: [PATCH stm32-next v3 0/2] ARM: dts: stm32: lxa-fairytux2: add
 gen{1,2} boards
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_075749_919373_3D50BCA1 
X-CRM114-Status: GOOD (  17.78  )
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


On Tue, 21 Jan 2025 12:14:04 +0100, Marc Kleine-Budde wrote:
> Hello,
> 
> this series adds support for the Linux Automation GmbH FairyTux2
> boards generation 1 and 2.
> 
> The FairyTux2 is a small Linux device based on an Octavo Systems
> OSD32MP153c SiP, that occupies just two slots on a DIN rail.
> 
> regards,
> Marc
> 
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> ---
> Changes in v3:
> - 2/2: fix use generic node names for external GPIO and USB Type-C controller (thanks Krzysztof)
> - 2/2: LEDs: replace label by color and function property (thanks Krzysztof)
> - 2/2: gen2: sort nodes of i2c1 by address (thanks Krzysztof)
> - Link to v2: https://patch.msgid.link/20250120-lxa-fairytux-v2-0-95f4a0eaa44d@pengutronix.de
> 
> Changes in v2:
> - 1/2: Added Krzysztof's Acked-by
> - 2/2: fix alignment for gpio-line-names (thanks Krzysztof)
> - 2/2: only use color:function for LED labels (thanks Krzysztof)
> - 2/2: use generic node names for external GPIO and USB Type-C controller
> - Link to v1: https://patch.msgid.link/20241210-lxa-fairytux-v1-0-9aea01cdb83e@pengutronix.de
> 
> ---
> Leonard Göhrs (2):
>       dt-bindings: arm: stm32: add compatible strings for Linux Automation GmbH LXA FairyTux 2
>       ARM: dts: stm32: lxa-fairytux2: add Linux Automation GmbH FairyTux 2
> 
>  .../devicetree/bindings/arm/stm32/stm32.yaml       |   2 +
>  arch/arm/boot/dts/st/Makefile                      |   2 +
>  .../boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dts | 103 ++++++
>  .../boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dts | 147 ++++++++
>  .../arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 397 +++++++++++++++++++++
>  5 files changed, 651 insertions(+)
> ---
> base-commit: b7ebfb84a09de6b44492974339654d8ffc5ad9e1
> change-id: 20241210-lxa-fairytux-e730979d3d3f
> 
> Best regards,
> --
> Marc Kleine-Budde <mkl@pengutronix.de>
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/st/' for 20250121-lxa-fairytux-v3-0-8d42d7d232fb@pengutronix.de:

arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: gpio@a03fe000: compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml#






