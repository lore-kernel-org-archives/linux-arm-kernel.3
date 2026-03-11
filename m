Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D174FD88D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 02:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azrMf9c8pk9ByPsVHSfU8FEgslKnZ86hS76XYLjLPdI=; b=KxQKWzI0dy+9y7YWjf1XSm+4H1
	TWxjyrvVEL/D0P30aINq7L1TFErNAIDc4bUDYgENpZB3dq1aKWFaJA2uclHRrMJDfVy19M5CbiVUt
	N62jBJ4OVIbHOQvtdK2ZAiPtAgr7sgLBEaWAKMB0jHH55bbh4sONn4J4uF4DNW3F937Yc0VjqfKF2
	0UwjXydnw1hrmmUhAy98yy2qpOwAMCJ8ub15gnXz1YfbKzsHlw3UsCviTKUBijurOxXjz3nPVAVkC
	3rkcfYRXfzHaDWTVzI2qJ1+mEu2hTMlx8dQdWov+NHuqwP7GptxS8N+cf/HLAMYv/pl9EFsltYmPh
	6Zno1aDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w093r-0000000AXRB-4AE1;
	Wed, 11 Mar 2026 02:12:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w093q-0000000AXQv-43AK;
	Wed, 11 Mar 2026 02:12:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DC627600B0;
	Wed, 11 Mar 2026 02:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDEA5C19423;
	Wed, 11 Mar 2026 02:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773195153;
	bh=4CnovYDhNoNio5xEWsPkE1GeUH6w6lWSrJIetu2UlqQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ACL9ssfNiEmsJs0gEXwX5Fi1mKxQ7XWjCAL/GkRFhXCmTbFz4m+w2YgGvzsfVtYaU
	 FhscloNlnTwRc+pIRWGHtYayFZIoTatIQ0EEsMskA22NcugVW9eQAelo7a5xlp4N1X
	 VJifoQbj0w70CCGZDGF+35t81QoFS7dFAH/sEIv9gBiykpDIccxiSbdh9aM4tu2mjJ
	 gxt8W7XHt9ILn/IOWiqFA2SN94RjwnYtaxsM/YQBk1n09PqbGnDBq9GPS8RBli9dnb
	 MzLGYJaet7Z1NwDoAlIaMZIgcNMMZGFKA3U9yLoVjJ0YstnuGUpmEVEb5EpJMCgCTX
	 HzcPXz9ogRMAw==
Message-ID: <fee9a7fa-8195-43d3-b534-efeade00f275@kernel.org>
Date: Tue, 10 Mar 2026 21:12:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: intel: agilex5: Drop CPU masks from GICv3
 PPI interrupts
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Marc Zyngier <marc.zyngier@arm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <treding@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1772643434.git.geert+renesas@glider.be>
 <bdc7563fba133b600ad3e6c1ce8cb1e5856b1042.1772643434.git.geert+renesas@glider.be>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <bdc7563fba133b600ad3e6c1ce8cb1e5856b1042.1772643434.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 3/4/26 11:11, Geert Uytterhoeven wrote:
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Drop the masks.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> index 352c96d144a84102..02e62d954e94905d 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> @@ -152,10 +152,10 @@ qspi_clk: qspi-clk {
>   	timer {
>   		compatible = "arm,armv8-timer";
>   		interrupt-parent = <&intc>;
> -		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> -			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>   	};
>   
>   	usbphy0: usbphy {

Applied!

Thanks,
Dinh


