Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D00D35157
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLw3AnqNDOCAVgPwSkMqeu6fJrlI04ZRz6Elqr0ZG9Q=; b=jVuylYpzEqRx6atnRid+5ST2p3
	blSvjtQIbg7GoR3IJaTV/XycAmyISmonmP6YLcUxXvNVmNYK5X41euZjvgZ3qUA6wjDmJGSRXPKFe
	j86M48zDLddbqV6bgzBjvuDX4VROeTwoWM3INZGPdcVSg/aUBkUSd8cOSPwfTDRYzrB/R+V/3yTjH
	ORSa0lzcAUCZHCw8Udsi8SCeThIM8Z5mDVd9r3XFfVa5mhqHyBHwB0CNGlb55lhFd1nd2UloI2BG8
	87aE7VY9D4WEMcoLjkV6JDawKckVYrJs4HRy6SX8P0aP6PhxnRamg1ZAQfV/Ll/n6CsXBMPKy4b3q
	5BhO/N8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qK4-0000000EFia-22ha;
	Wed, 01 Apr 2026 07:49:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qK1-0000000EFh8-3bn0;
	Wed, 01 Apr 2026 07:49:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 274EE405AE;
	Wed,  1 Apr 2026 07:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B48EC4CEF7;
	Wed,  1 Apr 2026 07:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775029745;
	bh=IFfbJFEeD3AotwA8EHCQkhq/zOGdI61UowKl+UIaIIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O7UfUj32DCJfSaWHJRsBDqWK1VEw+a+7E1K1ywqU+MeH+eI8n/Jhc4f4cjYWpLjPC
	 Lv2aH7eA/OE2IqsJLFjwOTIXSdHTPYEztTqVdjMdPbUtpiEnrlkhgijLcNUDK2/FiW
	 mr2DawQAFwVomLK7EAyVr51kLsnD9AlwFCQL/82DJF7ANWODmL4nJi2UzcWQR+9KGE
	 NdKW9MygfDb+BekyXv3wQ5nJSN10pHIo1V+sSsnRPG+tUaq0XWrY0mFKRTL5zPpU6i
	 rgt3Pv1OJjMwxIjKTO5keiZSu5n9Y6vL7RzO3Kseh0sk7aApcCBUeZbgY71GH7QUN5
	 algPMSgWJNtXA==
Date: Wed, 1 Apr 2026 09:49:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, brgl@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, afaerber@suse.com, tychang@realtek.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, cy.huang@realtek.com, 
	stanley_chang@realtek.com, james.tai@realtek.com
Subject: Re: [PATCH 2/3] arm64: dts: realtek: Add GPIO support for RTD1625
Message-ID: <20260401-liberal-nondescript-muskrat-0ebe93@quoll>
References: <20260331113835.3510341-1-eleanor.lin@realtek.com>
 <20260331113835.3510341-3-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260331113835.3510341-3-eleanor.lin@realtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_004905_956397_6B01303E 
X-CRM114-Status: GOOD (  15.21  )
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

On Tue, Mar 31, 2026 at 07:38:34PM +0800, Yu-Chun Lin wrote:
> Add the GPIO node for the Realtek RTD1625 SoC.
> 
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
>  arch/arm64/boot/dts/realtek/kent.dtsi    | 43 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/realtek/rtd1501.dtsi |  8 +++++
>  arch/arm64/boot/dts/realtek/rtd1861.dtsi |  8 +++++
>  arch/arm64/boot/dts/realtek/rtd1920.dtsi |  8 +++++
>  4 files changed, 67 insertions(+)
> 

Why the DTS is in the middle? Drivers cannot depend on it. Please read
submitting patches (both documents).

> diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/realtek/kent.dtsi
> index 8d4293cd4c03..746932c26724 100644
> --- a/arch/arm64/boot/dts/realtek/kent.dtsi
> +++ b/arch/arm64/boot/dts/realtek/kent.dtsi
> @@ -151,6 +151,39 @@ uart0: serial@7800 {
>  				status = "disabled";
>  			};
>  
> +			gpio: gpio@31100 {
> +				compatible = "realtek,rtd1625-iso-gpio";
> +				reg = <0x31100 0x398>,
> +				      <0x31000 0x100>;
> +				gpio-controller;
> +				gpio-ranges = <&isom_pinctrl 0 0 2>,
> +					      <&ve4_pinctrl 2 0 6>,
> +					      <&iso_pinctrl 8 0 4>,
> +					      <&ve4_pinctrl 12 6 2>,
> +					      <&main2_pinctrl 14 0 2>,
> +					      <&ve4_pinctrl 16 8 4>,
> +					      <&main2_pinctrl 20 2 3>,
> +					      <&ve4_pinctrl 23 12 3>,
> +					      <&iso_pinctrl 26 4 2>,
> +					      <&isom_pinctrl 28 2 2>,
> +					      <&ve4_pinctrl 30 15 6>,
> +					      <&main2_pinctrl 36 5 6>,
> +					      <&ve4_pinctrl 42 21 3>,
> +					      <&iso_pinctrl 45 6 6>,
> +					      <&ve4_pinctrl 51 24 1>,
> +					      <&iso_pinctrl 52 12 1>,
> +					      <&ve4_pinctrl 53 25 11>,
> +					      <&main2_pinctrl 64 11 28>,
> +					      <&ve4_pinctrl 92 36 2>,
> +					      <&iso_pinctrl 94 13 19>,
> +					      <&iso_pinctrl 128 32 4>,
> +					      <&ve4_pinctrl 132 38 13>,
> +					      <&iso_pinctrl 145 36 19>,
> +					      <&ve4_pinctrl 164 51 2>;
> +				#gpio-cells = <2>;
> +				status = "disabled";

Why is it disabled? What is missing in the SoC? Which resources are
missing?

> +			};
> +
>  			iso_pinctrl: pinctrl@4e000 {
>  				compatible = "realtek,rtd1625-iso-pinctrl";
>  				reg = <0x4e000 0x1a4>;
> @@ -161,6 +194,16 @@ main2_pinctrl: pinctrl@4f200 {
>  				reg = <0x4f200 0x50>;
>  			};
>  
> +			iso_m_gpio: gpio@89120 {
> +				compatible = "realtek,rtd1625-isom-gpio";
> +				reg = <0x89120 0x10>,
> +				      <0x89100 0x20>;
> +				gpio-controller;
> +				gpio-ranges = <&isom_pinctrl 0 0 4>;
> +				#gpio-cells = <2>;
> +				status = "disabled";
> +			};
> +
>  			isom_pinctrl: pinctrl@146200 {
>  				compatible = "realtek,rtd1625-isom-pinctrl";
>  				reg = <0x146200 0x34>;
> diff --git a/arch/arm64/boot/dts/realtek/rtd1501.dtsi b/arch/arm64/boot/dts/realtek/rtd1501.dtsi
> index 65f7ede3df73..ae246a01f126 100644
> --- a/arch/arm64/boot/dts/realtek/rtd1501.dtsi
> +++ b/arch/arm64/boot/dts/realtek/rtd1501.dtsi
> @@ -10,3 +10,11 @@
>  &uart0 {
>  	status = "okay";
>  };
> +
> +&gpio {

Why aren't you following DTS coding style? What style is applicable for
Realtek?

Best regards,
Krzysztof


