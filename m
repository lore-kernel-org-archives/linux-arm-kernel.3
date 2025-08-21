Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2B7CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 06:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5LeyRtpyuW55yhWUN6UCJJFNU3yjTx94Q5pC/9mD8Go=; b=Ku+tiNHOVt+H3Woii/AGvamjxA
	1msnpM9MCr4syNNA4ozhgTEHMgXuf/0r7uenCoyDo2LfnMwZfPQqLBHCxBDfbopol6AIz/jq9DCEg
	3N5d+hnGMlygFZiA6HV9N0krPraazWnTPH426pMOY/pGIfqdSGNEBNsG3G2H9iIzOUO12Zg7gWgiC
	atlVG+M4/OZWW45RMxGtMxDpWGnJc+MJHOUnZc1N6s9heYOE9qOBifQMe0kZO+fzdWSPfW6JL62om
	o4Jz6rqfBGIJq6trzeca6zg439rkn1sAmGFKNA4cHdPwt+gE/6fwwSP+R3gXGMxc6Q8Yauiloilqc
	dwZSa3+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyU7-0000000Fv8n-00ss;
	Thu, 21 Aug 2025 06:09:15 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyRU-0000000Fuz8-2aqn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 06:06:33 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 693211F99A;
	Thu, 21 Aug 2025 08:06:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1755756391;
	bh=5LeyRtpyuW55yhWUN6UCJJFNU3yjTx94Q5pC/9mD8Go=; h=From:To:Subject;
	b=vXAGdynY/VP5F5OmYQXNvMje6hhApmzcNLSY6ngtZvjmSghuVWQuTQuLEA05pZrnf
	 Aj5zKNypjtmuDmKMhRpX6nPW3UuE2yqAQIAidK+6HtPXXU0yr0wEqsWWswnDv3Cqu9
	 +tqwYExKHQIGm1B84+tmJB5d47VAi/yEismZ+DsItrvmQtW9FcHGGOJAU3fESkxk5o
	 syxsvbU8TBiyckoHiBC5EO0oute5VSzeD2sX4mDi8URj0rAdL+WHUyUu/K6MSUlUkP
	 8tRQeK/40xZso/EwYmU6RbNWo8M6sUIe+ZMVLDU5467qXp8JzlB5yVCkI1PFNrJdeK
	 9uBdICyocm6Sg==
Date: Thu, 21 Aug 2025 08:06:29 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, afd@ti.com,
	u-kumar1@ti.com, hnagalla@ti.com, jm@ti.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Parth Pancholi <parth.pancholi@toradex.com>,
	Jo_o Paulo Gon_alves <joao.goncalves@toradex.com>
Subject: Re: [PATCH 16/33] arm64: dts: ti: k3-am62p-verdin: Add missing cfg
 for TI IPC Firmware
Message-ID: <20250821060629.GB7503@francesco-nb>
References: <20250814223839.3256046-1-b-padhi@ti.com>
 <20250814223839.3256046-17-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814223839.3256046-17-b-padhi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_230632_815559_87D8C7E8 
X-CRM114-Status: GOOD (  20.00  )
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

On Fri, Aug 15, 2025 at 04:08:22AM +0530, Beleswar Padhi wrote:
> The wkup_r5fss0_core0_memory_region is used to store the text/data
> sections of the Device Manager (DM) firmware itself and is necessary for
> platform boot. Whereas the wkup_r5fss0_core0_dma_memory_region is used
> for allocating the Virtio buffers needed for IPC with the DM core which
> could be optional. The labels were incorrectly used in the
> k3-am62p-verdin.dtsi file. Correct the firmware memory region label.
> 
> Currently, only mailbox node is enabled with FIFO assignment. However,
> there are no users of the enabled mailboxes. Add the missing carveouts
> for WKUP and MCU R5F remote processors, and enable those by associating
> to the above carveout and mailboxes. This config aligns with other AM62P
> boards and can be refactored out later.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
> Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Cc: Parth Pancholi <parth.pancholi@toradex.com>
> Cc: Jo_o Paulo Gon_alves <joao.goncalves@toradex.com>
> Requesting for a review/test.
> 
>  arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 42 ++++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> index 6a04b370d149..0687debf3bbb 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> @@ -162,7 +162,25 @@ secure_ddr: optee@9e800000 {
>  			no-map;
>  		};
>  
> -		wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
> +		mcu_r5fss0_core0_dma_memory_region: mcu-r5fss-dma-memory-region@9b800000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9b800000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		mcu_r5fss0_core0_memory_region: mcu-r5fss-memory-region@9b900000 {

Node name should be generic, `memory@9b900000` ?

this applies in multiple patches in this series


> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9b900000 0x00 0xf00000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9c800000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
>  			compatible = "shared-dma-pool";
>  			reg = <0x00 0x9c900000 0x00 0x01e00000>;
>  			no-map;
> @@ -848,6 +866,28 @@ mbox_mcu_r5_0: mbox-mcu-r5-0 {
>  	};
>  };
>  
> +&wkup_r5fss0 {
> +	status = "okay";
> +};
> +
> +&wkup_r5fss0_core0 {
> +	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
> +	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
> +			<&wkup_r5fss0_core0_memory_region>;
> +	status = "okay";
> +};
> +
> +&mcu_r5fss0 {
> +	status = "okay";
> +};
> +
> +&mcu_r5fss0_core0 {
> +	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5_0>;
> +	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
> +			<&mcu_r5fss0_core0_memory_region>;
> +	status = "okay";
> +};
> +
>  &main0_alert {
>  	temperature = <95000>;
>  };
> -- 
> 2.34.1
> 

