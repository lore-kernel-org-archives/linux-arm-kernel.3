Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB67FD3ABF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 19:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VoOvd60Z5sJEGwTfTCFOEcWAXUKH/B7ofE6eDnjYJDw=; b=Zrg6Fy0QVpGskUZ1b4q+Pp3lhi
	ZE8dGyH/4o/fFp27yJCufOEIHHr+eHpf/uPeLCP8QIUQ+LYquFdKzX4iQEElJwYR9amhztEJlgrGm
	HQCWr4RHeXpBn1GtrVu3n/TCBazIG8k5SrZVoSP8JTyhNiR1/s8uhUfKuWCvPu9+jsPF7XBG15IrI
	EZlgIF6bnUa1JHBrJ285zdqTFT0Xc3i1Arm24qNB0bBaHZ9OTTeLOLN2i4noiq4JVWerotApe/KVX
	+MUgQvW16rSMSSV7ziJEtIVzoKHQYBYRp0vH+SD9zAfPZYD/HdduZaKyPV/3u22HzNgS8JqlDuh6K
	fMaAxiZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZs8-000000011Pm-3wjP;
	Mon, 11 Nov 2024 19:14:48 +0000
Received: from smtp.forwardemail.net ([207.246.76.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZqL-000000011BQ-0oNB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 19:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: Cc:
 References: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1731352364;
 bh=VoOvd60Z5sJEGwTfTCFOEcWAXUKH/B7ofE6eDnjYJDw=;
 b=ES5D7iaJBf3vI/JUt0lYxAsqV+V9Ppes5SXnaMMg76LS3frlUD+nJG5OQNLbT768lEwZoYDNl
 SFwkFnNX4TnGCBDIl5i7QVEJBrdbBTtsjGRAvpVhPDq5MnYD2RbsJTl7ZAlPrIMEIq7uiYYSqed
 CAYHUkDtRlTTj55mbTa0CWPjdCjKta+jVTjFZ8Omlef04wvPu8Mcg4PTcGUEwmk2VqFyXo7fkCH
 6OHfNsirVg1jYHgmbpnwuLFDagyYGgs5vDodOJZhGYhOyoKaTi5cRWnx7B+9IcWvOnpsMvvNJil
 PrMcTb8NVNMswWj5XRHuGZroubsRys+ILm9g9ATaorsQ==
Message-ID: <4ba81dfa-f276-4e05-b46b-92f50dbcfcc4@kwiboo.se>
Date: Mon, 11 Nov 2024 20:12:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Enable UART8 on rock-3b
To: =?UTF-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@linux.com>
References: <20241111181807.13211-1-tszucs@linux.com>
 <20241111181807.13211-4-tszucs@linux.com>
Content-Language: en-US
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 FUKAUMI Naoki <naoki@radxa.com>, Dragan Simic <dsimic@manjaro.org>,
 Chukun Pan <amadeus@jmu.edu.cn>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20241111181807.13211-4-tszucs@linux.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 207.246.76.47
X-ForwardEmail-ID: 673257291b4710f318d5f54d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_111257_391891_6E6D39A9 
X-CRM114-Status: GOOD (  13.93  )
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
> Enable UART lines on Radxa ROCK 3 Model B M.2 Key E.
> 
> Signed-off-by: Tamás Szűcs <tszucs@linux.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> index b7527ba418f7..61d4ba2d312a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> @@ -732,7 +732,7 @@ &uart8 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart8m0_xfer &uart8m0_ctsn &uart8m0_rtsn>;
>  	uart-has-rtscts;
> -	status = "disabled";
> +	status = "okay";

This should probably be enabled using an dt-overlay, there is no UART
device embedded on the board and the reason I left it disabled in
original board DT submission.

On second thought maybe they should be enabled, think PCIe and USB lines
on the M.2 Key E is already enabled by default. I probably only tested
with a pcie/usb wifi/bt card and not a sido/uart wifi/bt card.

Regards,
Jonas

>  };
>  
>  &usb_host0_ehci {


