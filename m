Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C36C44501
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 18:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+cz4TC7FYuAA1MNLgolPmcFRysJt6pzD3nfMB9W3q7M=; b=fr6dw05zERbzNexhHY4WjrTbqt
	4XFJkxzZAQqrQLCOklfrYN8CgvTZs/4AoSk8TwQCQG8gOW8ATla+LvILMqNRoKzeiH8/d4HMzc/01
	ddLGTA4WAT91ou4YHeEjbnKWPhNBo7VwEge4kyw5hpaR5nTLBmN45abTe1sccmz0VbB1JuC86ekYD
	d1r0IJWiFZB+M2sKxYLvC1SwlfDXDdIrnf3sI0Nxy5IOK26tIbVA2QhVygFCOt9H6WCkOKM5HE5c0
	/fBE50i2G03wklYXGP8iXsgbY4Obdqhc4WOCyV2c4O7J9HNT8fgRD6TJzgLaLsX8HziQPIMU8RoBb
	dQeBBkjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiyOX-00000007eS0-1gfY;
	Sun, 12 Jul 2026 17:55:13 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiyOS-00000007eQj-3Wjn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 17:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1783878908;
 bh=+cz4TC7FYuAA1MNLgolPmcFRysJt6pzD3nfMB9W3q7M=;
 b=SZh4rKwCZFEyIjv2X7MQyA8qX8udUnSZSeLXkpUVdVyDwhcrCr64/nQt7LXtU4p6Ky+YcwiRC
 GCuz3DVwTxKuaik7TiUKm5eORZdmzz48vUV21JsgWw4Uo4NuHP2pH/ZTaRA8h3knSn+1Yvr9hGp
 3zCv/mvqxJ3J1gM+l56KEH9qNGRBCIggggRM2NtkUcQqAVOL+7b8WIQgSjV1D0u5ton+Fk5ZgsE
 A/yH0xhp7bi360hGwhgemLTsCQLUDCjcnJkRADCwIJjPgPih5Ff5ljlPLv52XJTx28mIbCFfRb+
 EnHTRK4ItUPWdTfdQOG7O7tjAzt/BBfW2l4eKezkE7cQ==
X-Forward-Email-ID: 6a53d4f81f631853be4f2d47
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.10.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <e2ed95ee-8044-4a44-9775-9f36b10e727f@kwiboo.se>
Date: Sun, 12 Jul 2026 19:55:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] pinctrl: rockchip: Add RV1106 pinctrl support
To: Simon Glass <sjg@chromium.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@nabladev.com>, linux-arm-kernel@lists.infradead.org,
 Jeffy Chen <jeffy.chen@rock-chips.com>, Linus Walleij <linusw@kernel.org>,
 huang lin <hl@rock-chips.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260706195818.3906949-1-sjg@chromium.org>
 <20260706195818.3906949-5-sjg@chromium.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260706195818.3906949-5-sjg@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_105509_198550_240F3535 
X-CRM114-Status: GOOD (  17.09  )
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

Hi Simon,

On 7/6/2026 9:58 PM, Simon Glass wrote:
> Add pinctrl support for the Rockchip RV1106, taken from the vendor
> kernel in the Luckfox Pico SDK [1] at commit 824b817f8 (a Linux
> 5.10.160 kernel tree). The IOC registers are spread across several
> blocks, addressed through per-bank offsets, with the GPIO0 block in the
> PMU. The drive strength uses the RK3568-style exponential encoding.
> 
> The RV1103 is a package variant of the RV1106 with fewer pins and uses
> the same pin controller.
> 
> [1] https://github.com/LuckfoxTECH/luckfox-pico
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
>  drivers/pinctrl/pinctrl-rockchip.c | 208 +++++++++++++++++++++++++++++
>  drivers/pinctrl/pinctrl-rockchip.h |   1 +
>  2 files changed, 209 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index 7e0fcd45fd26..f9cbcb955853 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -1725,6 +1725,166 @@ static int rv1103b_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
>  	return 0;
>  }
>  
> +#define RV1106_DRV_BITS_PER_PIN		8
> +#define RV1106_DRV_PINS_PER_REG		2
> +#define RV1106_DRV_GPIO0_OFFSET		0x10
> +#define RV1106_DRV_GPIO1_OFFSET		0x80
> +#define RV1106_DRV_GPIO2_OFFSET		0x100C0

This, and remaining offsets, should likely be from the related GPIOx IOC
base and not from GPIO1 IOC base.

The regmap_base should likely only cover GPIO1 IOC, else it would cross
boundary into the GPIOx+1 controller regmap space.

See my review comment on pinctrl dt-bindings, we likely need to define
the IOC reg space for each GPIO controller for this SoC and adjust this
driver accordingly.

Possible something like following:

  gpio2: gpio@ff540000 {
	reg = <0xff540000 0x10c>, <0xff548000 0x8000>;
	reg-names = "base", "ioc";
  };

or

  gpio2: gpio@ff540000 {
	reg = <0xff540000 0x10c>;
	rockchip,grf = <&gpio2_ioc>;
  };

  gpio2_ioc: syscon@ff548000 {
	reg = <0xff548000 0x8000>;
  };

Regards,
Jonas

> +#define RV1106_DRV_GPIO3_OFFSET		0x20100
> +#define RV1106_DRV_GPIO4_OFFSET		0x30020

[snip]

