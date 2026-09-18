Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D96BC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 17:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0zQusZ4sgAGUg7jmWtu1kJEPMiDaIZXs+FDWoLbZkc=; b=yJpYgQxM53dVrCjGAzgpbYUUZG
	o7zBV+5fTTgvaPgHe2HLdkyKrGe/vYlDBP1MXGCCVSHlYmArcOMP/9WYA6+CkgckCGkkhK3dbK9SE
	Dk8NjzkolfH77Q3QKUOEvq/8EjAuyTxjVmO3JH1u/LsjTkdqPXb/U7Gv/R0MrGU5a5WQ7RnNHdizX
	NKTWAjrib5nuw536/Yu/q5AOE2mXWX8Z5bepj1BmaTponcrAc936bRfHSp+cn7lAYL2LcIomtTOUY
	GWthyVhjRYZa30ytpWNr5xfTD7JAGUHDN1f6bZ2TPumk5Uww/Lw+n7AASS4K8ZTXyM2EQGvrPgmZq
	1lMmCxew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cVf-0000000FCOs-3PKO;
	Fri, 18 Sep 2026 17:36:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cVc-0000000FCNm-000W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 17:36:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0C0D1596;
	Fri, 18 Sep 2026 10:36:18 -0700 (PDT)
Received: from [172.18.224.124] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EFD13F7B4;
	Fri, 18 Sep 2026 10:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789752982; bh=2srv1XLkscOatAp2l4+oooP8vZZpRy+cubNoI7IaP24=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eBdR4zQ5mqr+kLhrkLlnUHMi5INt3IUoHVvjNTADZu6tTNm1EGNfBvRHUYVi0VNxG
	 ZDXwTlZaAMYofuUgHh2IvIykf7ebHqEnZE73bYnTBlxl7L/nxtQNK1WIAN7S7uB+V8
	 fyOjTikMpTBePwQm7nA9JLRE7o6HqtO9I9jHrT9s=
Message-ID: <f31009e2-f7e0-426f-a546-1ed3ba63a1b4@arm.com>
Date: Fri, 18 Sep 2026 19:36:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: allwinner: sun55i-a523: add I2C0 and I2C1
 pin groups
To: Mikhail Kalashnikov <iuncuim@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918165414.1129076-1-iuncuim@gmail.com>
 <20260918165414.1129076-4-iuncuim@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260918165414.1129076-4-iuncuim@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_103625_011729_DEEFA195 
X-CRM114-Status: GOOD (  14.48  )
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

Hi,

On 9/18/26 18:54, Mikhail Kalashnikov wrote:
> Add the pin groups for the I2C0 (PH0/PH1) and I2C1 (PH2/PH3) controllers
> that used on some A523 boards.

I was about to say we should add port specifiers to the node names and 
labels (i2c0-ph-pins), for functions which are also available on other 
pins, but I see we don't do this for I2C on any other SoC, so that's 
fine. It's internal, so we can fix this later.

Compared against the manual:
> Assisted-by: OpenCode:DeepSeek-V4.1-Flash
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks,
Andre

> ---
>   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> index 85ef492ff..0ec5d19f7 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -147,6 +147,24 @@ pio: pinctrl@2000000 {
>   			interrupt-controller;
>   			#interrupt-cells = <3>;
>   
> +			/omit-if-no-ref/
> +			i2c0_pins: i2c0-pins {
> +				pins = "PH0", "PH1";
> +				function = "i2c0";
> +				allwinner,pinmux = <2>;
> +				drive-strength = <10>;
> +				bias-pull-up;
> +			};
> +
> +			/omit-if-no-ref/
> +			i2c1_pins: i2c1-pins {
> +				pins = "PH2", "PH3";
> +				function = "i2c1";
> +				allwinner,pinmux = <2>;
> +				drive-strength = <10>;
> +				bias-pull-up;
> +			};
> +
>   			/omit-if-no-ref/
>   			i2s2_pi_pins: i2s2-pi-pins {
>   				pins = "PI2", "PI3", "PI4", "PI5";


