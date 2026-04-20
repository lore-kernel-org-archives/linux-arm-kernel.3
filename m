Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FF5F588C4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 13:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBwguYIzdd07ajaYm/pQF2q5czxsQgmSLj3rTqILxMs=; b=K6UuBCL6fisuG9xdS9T78Y4obI
	8wYXqnP05xB3LQov0zBSVjAW4xDExo5GT/okJ1KrwMBxkOS8QSeIvTOdTXKAGnNhrKdgcF1uWDTz4
	lNClDtZk7P6zddWDVs6dEv+AniuiXnbd3uLj4MLbqhQYsanieA7BJ/i+ekVsJ/MxSawkCK/Hj6tbj
	0lqk1xrm2Y8OgymoI6IK4SBLw7Fl7RMdwkFpcXbALZx6SIN+Ks9HUnsARdVsynYT90O4FBiofKNrK
	XC7k9YKBvpXRKoLN3hn0e5pWJaQwsTmLwasHxbZsCFqDVnk/9tJw+ycgUTFmGG2s5UKPA7Ve5OXaG
	uT/QUVRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEopZ-000000074uB-1jFf;
	Mon, 20 Apr 2026 13:38:29 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEopW-000000074to-1XMF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 13:38:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6F1BC1A335E;
	Mon, 20 Apr 2026 13:38:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 38E8C5FFA5;
	Mon, 20 Apr 2026 13:38:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CBB6710460969;
	Mon, 20 Apr 2026 15:38:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776692301; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=CBwguYIzdd07ajaYm/pQF2q5czxsQgmSLj3rTqILxMs=;
	b=dbJCfC4U8GTOBI84x7yHyaS5mXUlyCLQnwUBC10ZfN09Jkh6CCA1ER3p6CjrLNoVul0j5l
	WbTHGj+fAj8vDlHPKsglERQm2XhTMBXrKKauW6wIsOTlENv9yn/IX5sXBbAdX8YTQ/7lN6
	qh4hcXMqiV+qLyuLsrvpDTvWJD/mlOhhxbRsQPArLjlbEm+ukqQo7lIHPkkllpK5d6hBwe
	fEISn4ZQhablSCU7hUej2laZDERtRSA+FIxbFWQ6Vh2KatrIRsZPytxrPwN90WkIFDS7No
	w1AIepZG7+v4b4Hl3Bl2Uv0wUoXJKhjTV6NsftGkZMcFG5aB2dOCGc1SaofCSA==
Message-ID: <c36821db-2fcb-438c-b54c-a4f2d5b33fa5@bootlin.com>
Date: Mon, 20 Apr 2026 15:38:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j722s: use ti,j7200-padconf compatible
To: "Richard Genoud (TI)" <richard.genoud@bootlin.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, Udit Kumar <u-kumar1@ti.com>,
 Abhash Kumar <a-kumar2@ti.com>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420131735.3833993-1-richard.genoud@bootlin.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20260420131735.3833993-1-richard.genoud@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_063826_580145_8FD24BFC 
X-CRM114-Status: GOOD (  13.34  )
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

Hello Richard,

On 4/20/26 3:17 PM, Richard Genoud (TI) wrote:
> From: Abhash Kumar Jha <a-kumar2@ti.com>
> 
> The pinctrl contexts for j722s should be saved and restored during
> suspend-to-ram, just like it is done for j7200 and j784s4 SoCs.
> 
> Use ti,j7200-padconf compatible to save and restore pinctrl contexts during
> suspend-to-ram.
> 
> Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
> Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
> ---
>  arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> index e66330c71593..757eb6abcd72 100644
> --- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> @@ -242,6 +242,7 @@ &phy_gmii_sel {
>  };
>  
>  &main_pmx0 {
> +	compatible = "ti,j7200-padconf", "pinctrl-single";
>  
>  	main_mcan0_pins_default: main-mcan0-default-pins {
>  		pinctrl-single,pins = <
> @@ -418,6 +419,7 @@ &main_uart5 {
>  };
>  
>  &mcu_pmx0 {
> +	compatible = "ti,j7200-padconf", "pinctrl-single";
>  
>  	mcu_i2c0_pins_default: mcu-i2c0-default-pins {
>  		pinctrl-single,pins = <

It should be done at SoC level, not just for the EVM board.
You should modify k3-j722s-main.dtsi and create k3-j722s-mcu.dtsi.

Best Regards,
Thomas

