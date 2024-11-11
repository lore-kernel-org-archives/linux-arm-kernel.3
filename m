Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77052D3ABF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 19:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYHKDYyg+2ly+dMUeJ/cLWI4XcdPgA25RQIFqXCblz0=; b=aRCn7LM4/ZdpVsJRDpXbWndVwI
	nsfm+MOVKcc0akVNkR2LCX/tHWG4k1opRyEnVDLgL6HchA2eEy8RPTYMDHWj8X19OOga4rIDmnr+b
	mVkYX3rscCQh+NLOZO/EZfyouhXn6M4ENkPmpCRNtvwrm9yNs2fKsRwJo5FJoZpkxLnRxeGs8N5tb
	Bs+B2UcRlpFjA/+TnEM6pGMMUkZQs5OpOeFR0E1SUNSINBHm48mJxxSGL4jykF6COZQauXmg+wnn+
	NdCzocmghmAqAgM/LSTQ0cfil/WCbgcbA/lg0YVM0x3uxs/sJxpwrdeeVCyHoSXuJerbOTe6QqBd6
	FUzl/Ppw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZlu-000000010Ro-2TId;
	Mon, 11 Nov 2024 19:08:22 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZk8-000000010F8-3DJd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 19:06:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: Cc:
 References: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1731351974;
 bh=kYHKDYyg+2ly+dMUeJ/cLWI4XcdPgA25RQIFqXCblz0=;
 b=CqUOv845dWIcsXI8fXS+1a9kBYL/23xyPaBVw0yqXKuaCw5smETxbxnPf14OyGqTAG4e1VQUA
 M8WJ/1kJuqfHH6LaINYZQntJz8qmDnkznw3GaN6k2BTdIzE93M1YX0sAdr4xzMUIkjGJEMHmImV
 XEzFSyJ6ydEGDCfFUzB9VTg8c9OfK9VfO/HQl2sZjvQuSyQFZ0dlmVupvNNs4KoRw04IcJolx4I
 TGersC4jVJSEAYtdXJ/7fk5BwZCwyNje+pmOk3yOLkhEodnZccgEAofMQNh5glhDK7HoTNM0czi
 4bcPsfhEIeIq2OcXwoO/48iDFayR+dI3fSe/tRjjdDbA==
Message-ID: <9fbdf05c-42e6-4ac5-9542-805200bc8c87@kwiboo.se>
Date: Mon, 11 Nov 2024 20:06:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: Enable sdmmc2 on rock-3b and
 set it up for SDIO devices
To: =?UTF-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@linux.com>
References: <20241111181807.13211-1-tszucs@linux.com>
 <20241111181807.13211-3-tszucs@linux.com>
Content-Language: en-US
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 FUKAUMI Naoki <naoki@radxa.com>, Dragan Simic <dsimic@manjaro.org>,
 Chukun Pan <amadeus@jmu.edu.cn>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20241111181807.13211-3-tszucs@linux.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 673255a41b4710f318d5f267
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_110632_865146_E2C1CD17 
X-CRM114-Status: GOOD (  13.42  )
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

Hi Tamás,

On 2024-11-11 19:17, Tamás Szűcs wrote:
> Enable SDIO on Radxa ROCK 3 Model B M.2 Key E. Add all supported UHS-I rates and
> enable 200 MHz maximum clock. Also, allow host wakeup via SDIO IRQ.
> 
> Signed-off-by: Tamás Szűcs <tszucs@linux.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> index 242af5337cdf..b7527ba418f7 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> @@ -688,14 +688,20 @@ &sdmmc2 {
>  	cap-sd-highspeed;
>  	cap-sdio-irq;
>  	keep-power-in-suspend;
> +	max-frequency = <200000000>;
>  	mmc-pwrseq = <&sdio_pwrseq>;
>  	non-removable;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&sdmmc2m0_bus4 &sdmmc2m0_clk &sdmmc2m0_cmd>;
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;

I thought that lower speeds was implied by uhs-sdr104?

>  	sd-uhs-sdr104;
> +	sd-uhs-ddr50;
>  	vmmc-supply = <&vcc3v3_sys2>;
>  	vqmmc-supply = <&vcc_1v8>;
> -	status = "disabled";
> +	wakeup-source;
> +	status = "okay";

This should probably be enabled using an dt-overlay, there is no SDIO
device embedded on the board and the reason I left it disabled in
original board DT submission.

Regards,
Jonas

>  };
>  
>  &sfc {


