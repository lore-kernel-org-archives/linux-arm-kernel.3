Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EB0C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 07:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVi419IZ6J1OlKP/sO/tJmwCKFBurgY4VPQVM65d4Ls=; b=uymMiSrebfUzq0LhUYnA1KsoVM
	j9t+XfvSj9d4h7oIZWVjGbv2ZV6rFi3PPoxkIhs4qxVpN8aOr05pNoqaJFSMSNEX7SdhZxk93lFsk
	N3SFoIKmzuhLZ4EWOS5tvWQgNHZAXlh3iM3EF0ItvLPHcZ2L3xFVloRxR/49GD2rfUcBNp/bGmAaZ
	Bo4aXrr8Jq70u/+v6RzcPofHn2WbgGUYMjASNNd39uk+upJHs2nVjaRWBZNNovIqHhSsiJ7NZ9bwJ
	0vbMuyWAMFvrFrmahhTF8xW808ZHe7B9mgHNDTK77NIxUIrDLFyxl3eCrthM3BG+4hoLIaI4CT3QX
	RiGu57pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAkTH-000000013fA-0Evu;
	Fri, 02 May 2025 07:06:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAkRL-000000013Km-0V1n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 07:04:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EAEBC60007;
	Fri,  2 May 2025 07:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91380C4CEE4;
	Fri,  2 May 2025 07:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746169446;
	bh=fhY5m60UFnO53XEqmXSlnWFnGO6KQea5r4wM2AKUazk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b5Kk0lw4IZiQ7mTdp0LhMvMPyRb+kLmnJYjEa8tg04JVahiWxnPKDqqo8uSyGj364
	 lrBNDL/ew8LhmEgJvZB9t58hBR5eSjObJL4TS9F7hxOjkUqezSrXJQA63zPfkFem8J
	 u9jzSxYnyCWoWENSNzE/+9susZ5YnFBT5IeWjRlZr1DjDiTpal9WI5oDbCn063GD+Z
	 GM1MqW/xl07SyL+LB86j1a8uZEd8IOXvSYSO7txZIhEnNNqSKlpP7gTJ7mhyjlDrBU
	 AdXIg6f06B6o3X0iIZGbnNKWkc6Sjd58MCKtJd5CgBWcFzRHqMPLd9izHMrQwXAsw2
	 zoKxcWU+jln5g==
Date: Fri, 2 May 2025 09:04:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH 5/6] arm64: dts: ls1028a-qds: make the QIXIS CPLD use the
 simple-mfd-i2c.c driver
Message-ID: <20250502-savvy-eccentric-hog-b4fed5@kuoka>
References: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
 <20250430153634.2971736-6-ioana.ciornei@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250430153634.2971736-6-ioana.ciornei@nxp.com>
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

On Wed, Apr 30, 2025 at 06:36:33PM GMT, Ioana Ciornei wrote:
> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> The MDIO mux on the LS1028A-QDS never worked in mainline. The device
> tree was submitted as-is, and there is a downstream driver for the QIXIS
> FPGA:
> 
> https://github.com/nxp-qoriq/linux/blob/lf-6.12.y/drivers/soc/fsl/qixis_ctrl.c
> 
> That driver is very similar to the already existing drivers/mfd/simple-mfd-i2c.c,
> and the hardware works with the simple-mfd-i2c driver, so there isn't
> any reason to upstream the other one.
> 
> Adapt the compatible string and child node format of the FPGA node, so
> that the simple-mfd-i2c driver accepts it.

Why do you break the users based on some driver differences? Fix the
drivers, not the DTS.

> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> index 0bb2f28a0441..58b54d521d75 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> @@ -338,17 +338,18 @@ sgtl5000: audio-codec@a {
>  	};
>  
>  	fpga@66 {
> -		compatible = "fsl,ls1028aqds-fpga", "fsl,fpga-qixis-i2c",
> -			     "simple-mfd";
> +		compatible = "fsl,ls1028a-qds-qixis-i2c";

This breaks all the existing users. NAK.

>  		reg = <0x66>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
>  
> -		mux: mux-controller {
> +		mux: mux-controller@54 {

This was never tested. Your binding says something else.

>  			compatible = "reg-mux";
> +			reg = <0x54>;
>  			#mux-control-cells = <1>;
>  			mux-reg-masks = <0x54 0xf0>; /* 0: reg 0x54, bits 7:4 */
>  		};
>  	};
> -
>  };
>  
>  &i2c1 {
> -- 
> 2.25.1
> 

