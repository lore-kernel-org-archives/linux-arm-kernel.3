Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9DCCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 05:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=giM7NWZnc5LVRCPwmgWqmMTjxvPwwx0UfdWCSCRrRpE=; b=cH8aqQaN9isgNfmNrdC+B9Zq+e
	pk0Dcl8/xCBhX9NXc6dIggFqZtFeQIIpk8Bzhf2xsgy6124cj7+Bq7BxZ2KB1tSQe1lgotKMA82zW
	/oH9D7mPXLeO9t+prMPd1KqB9GwIQdz7EKIw51hMQdngSRJM1BmQsdj3+QH0tAiw/+58erUHI4i8s
	9UPMbNgsmPbVWPQ6/zbY7JlbPUF7al+Sl8A/q56T7YMUcUhrhHbbVItzaq5ffDHz0/mDCS4XsIaEl
	GVxGp6QR0rLJRsa8K/g+qN/q3uZy+aC0aVD5BI3ruUFfXqxUMX3qvBgWgwp3rCRSBGNDTj740mGl1
	NTQ+MROQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAMFS-0000000AhZf-1YhV;
	Sun, 19 Oct 2025 05:46:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAMFR-0000000AhZY-1mnk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 05:46:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A67760261;
	Sun, 19 Oct 2025 05:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE2CCC4CEE7;
	Sun, 19 Oct 2025 05:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760852779;
	bh=k6dLJospkNnZM88ur31GaVa3vtvm36+YwoHgWyO9KWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BH1cnBZHVvkXAIDXVa76qucH+MM6U4BI32MRjM3/OwIyrVezK8qBavKRymWlsrVH3
	 v5mU6zylvUJDFfGUaMPbfWpF36R/sj/23PSim4gZuda0JR+umCOo6ESx2mXBhxX4bd
	 J3R8XgTjwKbXpVWtUKhgFr/9ElAjLUc5efSGe+8Hs1CKL6rbnX5g/69stiEnf3+XOc
	 faAnizHGhLd8bKt5Ene03RVXHJJG4TV1h60zxRmwZTkKnK6MISB4WvRBf9Va7EpNZ/
	 dZm2r3WJPiXWARwneR9IDY+tXnWTD9lQke+GScWX+O4EfnIWNLMt2NPKQK5XuWjPnc
	 f/Fh2VIf5Gr3g==
Date: Sun, 19 Oct 2025 11:15:57 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
Cc: Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	bhelgaas@google.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, yuji2.ishikawa@toshiba.co.jp
Subject: Re: [PATCH v3 1/2] arm64: dts: toshiba: Update SoC and PCIe ranges
 to reflect hardware behavior
Message-ID: <qspujjam6am5wzdrb3ygbprdxf5u3aonn5m5qhywxvok5vapgy@idqfjpzs5hna>
References: <1757298848-15154-1-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
 <1757298848-15154-2-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1757298848-15154-2-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
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

On Mon, Sep 08, 2025 at 11:34:07AM +0900, Nobuhiro Iwamatsu wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> tmpv7708 trim address bit[31:30] in tmpv7708 before passing to the PCIe
> controller. Since only PCIe controller needs to convert the address range
> 0x40000000 - 0x80000000, add a bus definition, describe the ranges in it,
> and move the PCIe definition.
> 
> Prepare for the removal of the driver’s cpu_addr_fixup().
> 

This statement is the linux driver behavior which has nothing to do with
devicetree. Please drop it.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> Suggested-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> 
> ---
> v3:
>  Move update in drivers/pci/controller/dwc/pcie-visconti.c to patch 2.
>  Update Signed-off-by address, because my company email address has changed.
> 
> v2:
>   Update commit message.
>   Fix range.
>   Set true to use_parent_dt_ranges.
>   move pcie under the dedicated sub-bus.
> ---
>  arch/arm64/boot/dts/toshiba/tmpv7708.dtsi | 75 ++++++++++++++---------
>  1 file changed, 45 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi b/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
> index 39806f0ae5133..b754965a76ca6 100644
> --- a/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
> +++ b/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
> @@ -478,37 +478,52 @@ pwm: pwm@241c0000 {
>  			status = "disabled";
>  		};
>  
> -		pcie: pcie@28400000 {
> -			compatible = "toshiba,visconti-pcie";
> -			reg = <0x0 0x28400000 0x0 0x00400000>,
> -			      <0x0 0x70000000 0x0 0x10000000>,
> -			      <0x0 0x28050000 0x0 0x00010000>,
> -			      <0x0 0x24200000 0x0 0x00002000>,
> -			      <0x0 0x24162000 0x0 0x00001000>;
> -			reg-names = "dbi", "config", "ulreg", "smu", "mpu";
> -			device_type = "pci";
> -			bus-range = <0x00 0xff>;
> -			num-lanes = <2>;
> -			num-viewport = <8>;
> -
> -			#address-cells = <3>;
> +		pcie_bus: bus@24000000 {
> +			compatible = "simple-bus";
> +			#address-cells = <2>;
>  			#size-cells = <2>;
> -			#interrupt-cells = <1>;
> -			ranges = <0x81000000 0 0x40000000 0 0x40000000 0 0x00010000
> -				  0x82000000 0 0x50000000 0 0x50000000 0 0x20000000>;
> -			interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "msi", "intr";
> -			interrupt-map-mask = <0 0 0 7>;
> -			interrupt-map =
> -				<0 0 0 1 &gic GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH
> -				 0 0 0 2 &gic GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH
> -				 0 0 0 3 &gic GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH
> -				 0 0 0 4 &gic GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
> -			max-link-speed = <2>;
> -			clocks = <&extclk100mhz>, <&pismu TMPV770X_CLK_PCIE_MSTR>, <&pismu TMPV770X_CLK_PCIE_AUX>;
> -			clock-names = "ref", "core", "aux";
> -			status = "disabled";
> +			ranges = /* register 1:1 map */
> +				 <0x0 0x24000000 0x0 0x24000000 0x0 0x0C000000>,
> +				 /*
> +				  * bus fabric mask address bit 30 and 31 to 0
> +				  * before send to PCIe controller.
> +				  *
> +				  * PCIe map address 0 to cpu's 0x40000000
> +				  */
> +				 <0x0 0x00000000 0x0 0x40000000 0x0 0x40000000>;
> +
> +			pcie: pcie@28400000 {
> +				compatible = "toshiba,visconti-pcie";
> +				reg = <0x0 0x28400000 0x0 0x00400000>,
> +				      <0x0 0x30000000 0x0 0x10000000>,
> +				      <0x0 0x28050000 0x0 0x00010000>,
> +				      <0x0 0x24200000 0x0 0x00002000>,
> +				      <0x0 0x24162000 0x0 0x00001000>;
> +				reg-names = "dbi", "config", "ulreg", "smu", "mpu";
> +				device_type = "pci";
> +				bus-range = <0x00 0xff>;
> +				num-lanes = <2>;
> +				num-viewport = <8>;
> +
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				#interrupt-cells = <1>;
> +				ranges = <0x81000000 0 0x00000000 0 0x00000000 0 0x00010000
> +					  0x82000000 0 0x10000000 0 0x10000000 0 0x20000000>;
> +				interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-names = "msi", "intr";
> +				interrupt-map-mask = <0 0 0 7>;
> +				interrupt-map =
> +					<0 0 0 1 &gic GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH
> +					 0 0 0 2 &gic GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH
> +					 0 0 0 3 &gic GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH
> +					 0 0 0 4 &gic GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
> +				max-link-speed = <2>;
> +				clocks = <&extclk100mhz>, <&pismu TMPV770X_CLK_PCIE_MSTR>, <&pismu TMPV770X_CLK_PCIE_AUX>;
> +				clock-names = "ref", "core", "aux";
> +				status = "disabled";
> +			};
>  		};
>  	};
>  };
> -- 
> 2.51.0
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

