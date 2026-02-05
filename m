Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6289EEC1EB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 13:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Ee88cfCEyJfuagdKW68vt+5jA/u6C7sF1dfNwY+EAA=; b=0Xl0qOV1zjvY8yeiU7d2KjgDJ2
	0pmHg6cdUgPAN9Gnk1NJSltJdZ71JyhkuxF7Sgr4NrEWyHxMDriRhcAllJgtynimWgOQ5VIKghpzs
	aLoAMygTIyBCRHNmoiMNrmzGGbOoF3DoyBD+D3gevmV/lKbfONkJ+Tg8cnvGWJNqmAZkNwB1JUQQn
	sqtdujylgE9c0fmdG3HUUBSm6PBy4oLr/glFdwhfZZCU72ew9sxv/dRIRrNhJTTbnDM0J7atn+c7E
	il9xQ42vIdJUSnhe/Ml5wVPFIrh2ZVVRxZC0lUf0ztRmpHzVLDNdTpjghVuVxs+HBDLwd9D7mU2oc
	rmyxkCqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzKh-00000009wWX-1GCM;
	Thu, 05 Feb 2026 13:23:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzKg-00000009wWD-0q7b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 13:23:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 30E6360138;
	Thu,  5 Feb 2026 13:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D8EC19423;
	Thu,  5 Feb 2026 13:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770297820;
	bh=TH2SzadiN4HBN+40P0xnfax3PZRUqXvZ1UIA3ramg84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cGoGIKHsnk/D0CGgFAjZ/QcgfCNSPhv89UWcQmkPt8BJw+uM4cBLluhtuAQ+P35+L
	 CSNDtwyJoS4ddMBv0vmjO1Q5XZ4gZcmHd7z4TH0Oq48IKPN8lUxSXD+Gu2ZelAYuvl
	 pVAAiCssvsSIhkPGc6R8OPLjNgETk0rvJl4RWOQo8YSyRwSki/+ee9uGh/mzb8hvlX
	 I0r0XZ7sbgyZLqs5mlF8Frb2zL31sme0ZtN4WAW7IAxRVoRfUlhRoGMX+/f8A3IVv9
	 0tIojIr+uWACLmETEagWqvUhfghUaZqvmSHWr5lwBHozLSBXhVuKjTSDWuQSpqJTpe
	 ILzM0kBznjoKw==
Date: Thu, 5 Feb 2026 14:23:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: nuvoton: ma35d1: add display
 controller support
Message-ID: <20260205-tactful-warm-chicken-50bdc8@quoll>
References: <20260129040532.382693-1-a0987203069@gmail.com>
 <20260129040532.382693-3-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260129040532.382693-3-a0987203069@gmail.com>
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

On Thu, Jan 29, 2026 at 12:05:31PM +0800, Joey Lu wrote:
>  &uart0 {
> @@ -129,3 +165,23 @@ &uart16 {
>  	pinctrl-0 = <&pinctrl_uart16>;
>  	status = "okay";
>  };
> +
> +&panel {
> +	port {
> +		panel_in: endpoint@0 {
> +			remote-endpoint = <&dpi_out>;
> +		};
> +	};
> +};
> +
> +&display {

What sort of ordering rule is followed in Nuvoton? Why is it different
than DTS coding style? Why do you choose other style?

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_display>;
> +	status = "okay";
> +
> +	port {
> +		dpi_out: endpoint@0 {
> +			remote-endpoint = <&panel_in>;
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> index e51b98f5bdce..7d9d077f12b2 100644
> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> @@ -379,5 +379,19 @@ uart16: serial@40880000 {
>  			clocks = <&clk UART16_GATE>;
>  			status = "disabled";
>  		};
> +
> +		panel: panel {

No, there is no way your SoC has a panel.

Don't add fake stuff to your DTS.

Best regards,
Krzysztof


