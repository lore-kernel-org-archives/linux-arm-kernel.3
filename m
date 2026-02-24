Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CF6EFB7F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 07:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVAK1R6Am9KjH8L4qf/zKEa0xXfP3iPdCy6oho9HqBY=; b=qytXkGkg0peWP1qKoQUkoGeeOp
	zvkaaEx7pf/zjJcVo/bqSSxIC0P6o0HhWUs1iVwC6jSk6awpdAgJGmH75d1CXOxgsunjAiCj/ibp3
	ckW4mF9cPu2ls0FCDCpSl4IViQ33cNheEWnkKpBxuFVF3Ue+KDJgqA0hoSn5nYIkwh5HVG2HJ+lJS
	SjbDWotxwcBxLdqX0PqAgX6EbXBUNWINncKf+VJ/CSsR/XwSzX0Jz0eR2tj+MwAgMMMtf1QSHia2o
	1dRG0PJONCPkCmIpStb/BsPwhgicp+q22PsPagRSDfTxcFAZbJgge53ebVB3PuLJaAdmiAzWdiGoL
	+usyozMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vumQE-00000001YN1-46hS;
	Tue, 24 Feb 2026 07:01:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vumQD-00000001YMv-3SiP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 07:01:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7991260137;
	Tue, 24 Feb 2026 07:01:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE30C116D0;
	Tue, 24 Feb 2026 07:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771916488;
	bh=DJZHSQJziow3QmZca4yny9ttSPljgtLdDVcSSxbf7kk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hTQ4b/PcNGPiLgHTZUQRbzcAFBVz/d7owHXu5kOlG2PBII9LZCNo8ttrp5rLgCa0+
	 0IzskXAAVjljfMEIHGUHoZONpyfKopd+K+ff5GIhgPyVsHWSU6NZFZnrugDBUPuZZZ
	 KjYm/JPiVvRjtXG3Gj9ML0U96JOuIylqj534SX5wrWtd4yCzHGBg+Gx2tz9D85hHzp
	 Hc91V9Sin5WVjgn+9wSIxIxi6QqetujaOc0dPROHX4+M+Yh4nlT4ymPp7zVaVjVaOB
	 t1rvmrdiQ+yu1aZO2dPmgDUQXjgWbyO9nIC0cqBohVOh8cNSNh57PARXTUGDglzV4F
	 69koUAenfZ0DA==
Message-ID: <48d5eb8e-834f-4e87-a59c-d05add0dfda7@kernel.org>
Date: Tue, 24 Feb 2026 08:01:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: exynos: gs101-pixel-common: add supply and
 regulator properties
To: amitsd@google.com, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Badhri Jagan Sridharan <badhri@google.com>
References: <20260224-max77759-charger-dts-v1-1-b443545c04aa@google.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260224-max77759-charger-dts-v1-1-b443545c04aa@google.com>
Content-Type: text/plain; charset=UTF-8
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

On 24/02/2026 06:03, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
> 
> Add power supply and regulator properties to the MAX77759 pmic. The
> usb-typec device will reference the regulator provided by the pmic as
> it supplies vbus to the typec device when operating in power source mode.
> 
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
> This patch depends on the patchset [1].
> [1] https://lore.kernel.org/all/20260224-max77759-charger-v8-0-eb86bd570e9c@google.com/
> ---
>  arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> index 93892adaa679..2cc00d34dda8 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> @@ -142,12 +142,13 @@ &hsi2c_12 {
>  	status = "okay";
>  	/* TODO: add the devices once drivers exist */
>  
> -	usb-typec@25 {
> +	maxtcpci: usb-typec@25 {
>  		compatible = "maxim,max77759-tcpci", "maxim,max33359";
>  		reg = <0x25>;
>  		interrupts-extended = <&gpa8 2 IRQ_TYPE_LEVEL_LOW>;
>  		pinctrl-0 = <&typec_int>;
>  		pinctrl-names = "default";
> +		vbus-supply = <&chgin_otg_reg>;
>  
>  		connector {
>  			compatible = "usb-c-connector";
> @@ -236,6 +237,11 @@ pmic@66 {
>  		interrupt-controller;
>  		#interrupt-cells = <2>;
>  
> +		power-supplies = <&maxtcpci>;

Missing blank line. Please follow DTS coding style.

> +		chgin_otg_reg: chgin-otg-regulator {
> +			regulator-name = "chgin-otg";
> +		};
> +
>  		gpio {
>  			compatible = "maxim,max77759-gpio";
>  
> 
> ---
> base-commit: 8bf22c33e7a172fbc72464f4cc484d23a6b412ba
> change-id: 20260224-max77759-charger-dts-23493398e77c
> 
> Best regards,


Best regards,
Krzysztof

