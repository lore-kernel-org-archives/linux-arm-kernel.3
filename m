Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70AB0C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 08:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+tjp8piTbhkLhPhSuqVhrcux4eBsa6H5w4NcKOW4Gs=; b=AwbS77qXbsQ4iLNq/jswkMX0vi
	eKGyzQmrjrVUiLS4pxvpZ6GdiP+GffA+c58rdWlW83q+BsQ2yzp0W6kOjD2Z1E/fGBMujnmnBfI2l
	Z1QxpU5IqYhegIX6gyn20l6N+JM1PaIssaVFZBdZ+Q8SPaWIwz8Bkmt15CwEAzMiIFgsga8uaiJuY
	iEja2JRDiTMSGp65a84e5TFBrrK3FuSxNqh9KR3033XIOwzZR+OJD/5yv2Oa9rexOKkPyQSL+SAzC
	OUTqcgBO/fOOPJCs5LDwG5EFEEhTuXyMjgzSc9AC8tpijRW6ZCMguMbPrHm350m++naSgWCW+E+yE
	KMBOe8Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbExe-0000000EEAg-0RRx;
	Fri, 24 Jan 2025 08:22:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbEvj-0000000EDoE-13kd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 08:20:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CCC18A401AC;
	Fri, 24 Jan 2025 08:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 350E2C4CED2;
	Fri, 24 Jan 2025 08:20:41 +0000 (UTC)
Date: Fri, 24 Jan 2025 09:20:38 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/5] arm64: dts: ti: k3-am62a-wakeup: Add ddr-pmctrl,
 canuart-wake
Message-ID: <20250124-spicy-mighty-worm-ece42c@krzk-bin>
References: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
 <20250122-topic-am62-dt-syscon-v6-13-v1-4-515d56edc35e@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250122-topic-am62-dt-syscon-v6-13-v1-4-515d56edc35e@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_002043_367746_2AF107A1 
X-CRM114-Status: GOOD (  13.96  )
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

On Wed, Jan 22, 2025 at 11:24:35AM +0100, Markus Schneider-Pargmann wrote:
> Within the wkup-conf register range there are ddr-pmctrl and
> canuart-wake control registers. Add dedicated subnodes for these.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
> index 0b1dd5390cd3f42b0ec56bab042388722b4c22a1..a9bcda212c99d2f7669100ca29459eb13172da3e 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
> @@ -36,6 +36,16 @@ usb1_phy_ctrl: syscon@4018 {
>  			compatible = "ti,am62-usb-phy-ctrl", "syscon";
>  			reg = <0x4018 0x4>;
>  		};
> +
> +		ddr_pmctrl: syscon@80d0 {
> +			compatible = "ti,am62-ddr-pmctrl", "syscon";
> +			reg = <0x80d0 0x4>;

No, why do you export single registers? Entire device is syscon, not
single register.

Best regards,
Krzysztof


