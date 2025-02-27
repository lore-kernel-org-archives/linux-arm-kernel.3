Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB416C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 11:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjtMjIFCbBqdyLhStmlaYyvs0n8jkqiHMgxcKjIxdk0=; b=WAD/cVtJktXEaJj7SdMvI2Uwk5
	uZVnZ0IBQ246H1UJMI2t9M5hdt/YOE7G+ihJP0kAV4HCJ/eMkSDfORD+bhJ52B0UITiCimejj7uOp
	FO1U2I7nmhLPdpb4ZAXfqn/LoIqAbsJcGWxRavj+2CYaReROdeni7q2TUyaeD5WqHHbYRq6oSIMEh
	qHpJPYmR+61Qzm/c2wHgbgyZmWnAY3ZwjbV4gh3YDtSerAZFTPXZkRDKntVexStPhv77GW2UFoIeg
	YtKyZFT4hDmAhJd91IxmJD1wgN4B3k+OqEE2Gv5CLP3zwS7wsp9hwN3kFQGk7vhxAc1+P+8fDRXKs
	EnA+1p/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnc0a-00000007AWN-3Plz;
	Thu, 27 Feb 2025 11:24:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbks-000000076VD-2fLl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 11:08:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D84A2BCC;
	Thu, 27 Feb 2025 03:08:51 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C90A3F6A8;
	Thu, 27 Feb 2025 03:08:33 -0800 (PST)
Date: Thu, 27 Feb 2025 11:08:30 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: [PATCH v7 07/10] arm64: dts: morello: Add support for common
 functionalities
Message-ID: <Z8BHrrL0kXeBmRpx@bogus>
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
 <20250221180349.1413089-8-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221180349.1413089-8-vincenzo.frascino@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_030838_756914_0DB47B60 
X-CRM114-Status: GOOD (  19.51  )
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

On Fri, Feb 21, 2025 at 06:03:46PM +0000, Vincenzo Frascino wrote:
> The Morello architecture is an experimental extension to Armv8.2-A,
> which extends the AArch64 state with the principles proposed in
> version 7 of the Capability Hardware Enhanced RISC Instructions
> (CHERI) ISA.
> 
> The Morello Platform (soc) and the Fixed Virtual Platfom (fvp) share
> some functionalities that have conveniently been included in
> morello.dtsi to avoid duplication.
> 
> Introduce morello.dtsi.
> 
> Note: Morello fvp will be introduced with a future patch series.
> 
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> ---
>  arch/arm64/boot/dts/arm/morello.dtsi | 323 +++++++++++++++++++++++++++
>  1 file changed, 323 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/arm/morello.dtsi
> 
> diff --git a/arch/arm64/boot/dts/arm/morello.dtsi b/arch/arm64/boot/dts/arm/morello.dtsi
> new file mode 100644
> +
> +		gic: interrupt-controller@2c010000 {
> +			compatible = "arm,gic-v3";
> +			reg = <0x0 0x30000000 0x0 0x10000>,	/* GICD */
> +			      <0x0 0x300c0000 0x0 0x80000>;	/* GICR */

[...]

> +
> +
> +		sram: sram@45200000 {
> +			compatible = "mmio-sram";
> +			reg = <0x0 0x06000000 0x0 0x8000>;
> +			ranges = <0 0x0 0x06000000 0x8000>;
> +

[...]

Not sure if you are not seeing these warnings from DTC. Looks pretty clear
to me. May be you missed or using some old DTC. I don't know why though.
If you agree, I can patch it up with below patch and no need to repost:

morello.dtsi:227.38-272.5: Warning (simple_bus_reg): /soc/interrupt-controller@2c010000: simple-bus unit address format error, expected "30000000"
morello.dtsi:296.23-313.5: Warning (simple_bus_reg): /soc/sram@45200000: simple-bus unit address format error, expected "6000000"
morello.dtsi:227.38-272.5: Warning (simple_bus_reg): /soc/interrupt-controller@2c010000: simple-bus unit address format error, expected "30000000"
morello.dtsi:296.23-313.5: Warning (simple_bus_reg): /soc/sram@45200000: simple-bus unit address format error, expected "6000000"

Regards,
Sudeep

-->8

diff --git i/arch/arm64/boot/dts/arm/morello.dtsi w/arch/arm64/boot/dts/arm/morello.dtsi
index e35e5e482720..0bab0b3ea969 100644
--- i/arch/arm64/boot/dts/arm/morello.dtsi
+++ w/arch/arm64/boot/dts/arm/morello.dtsi
@@ -224,7 +224,7 @@ uart0: serial@2a400000 {
                        status = "disabled";
                };

-               gic: interrupt-controller@2c010000 {
+               gic: interrupt-controller@30000000 {
                        compatible = "arm,gic-v3";
                        reg = <0x0 0x30000000 0x0 0x10000>,     /* GICD */
                              <0x0 0x300c0000 0x0 0x80000>;     /* GICR */
@@ -293,7 +293,7 @@ mailbox: mhu@45000000 {
                        clock-names = "apb_pclk";
                };

-               sram: sram@45200000 {
+               sram: sram@6000000 {
                        compatible = "mmio-sram";
                        reg = <0x0 0x06000000 0x0 0x8000>;
                        ranges = <0 0x0 0x06000000 0x8000>;


