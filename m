Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5318FC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 07:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIXg7np9usec25+u5f5CPg2C+dLhyz1Hb6Nl/ECOjP4=; b=K92xQHf3DHHgDgTjgW61Ha4Jo4
	Fn3X1tAoA8N4vWycEMYqPJMKDkSQIGQzyVkCZZPkxHTWveG72jwZwMzdV/vC11ZeRZI5kXPPcEkbs
	dNO58j/mUpqCWPTtHUxHCTJgqc0s/8P/QWKqKoIkLW3UB99k+o0V5cb0FG5j/MiCsJOL1UYvYwqyK
	zZtE28qKepoOu3UbmkguVUaCvszKgtiJKXu3skAWYY/PRTfYdGqPrtCXo3liRbXjeGzIfnBPfrBmS
	Wo8D/iBDbNaCyI0DHli4r/S6lZg+1LW+XB9VXeImP+xufdh8yJCMALNmV3HHiUJ/14GZSBUS3gapg
	76VwsYRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBpyA-00000006bmI-1r8v;
	Mon, 05 May 2025 07:10:30 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBpuK-00000006bFk-2QAX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 07:06:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1746428790;
 bh=gIXg7np9usec25+u5f5CPg2C+dLhyz1Hb6Nl/ECOjP4=;
 b=CQ7Wwaulma4QRhTixZ0UHxzavdchAaPfJHOE7fHk5QhMwgA0XOApJMfHPUkC4MGJ3IuY2txcX
 F5NUGMDNQUAk0J4gJ2Ql55tAXxTq4/ud/O9DZuoO6YbAvwUiuobC3dhdYc1l4uEqQk0hUHYnkJr
 UfYi3ZUBYN9zFVGzSjcB08qpO8CW5xgmtJ0Y0sQFBWJ8iWuZmR8JnknSp5FW7L4IoPl46eGKh1S
 1ICS8z31Xs5So17Y6yGs2K037r+e02HczAfNbLnqw9Yc6lBIros1HZspef45noSKvoDfsQwH23K
 CQvjkLPBNpFVimpYxhrfYT3V8eREBYYpqXCAF+Xo/a4w==
X-Forward-Email-ID: 68186375baed44ffca19f440
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.0.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <9b804428-1c36-437b-9d48-4bce2a79ce63@kwiboo.se>
Date: Mon, 5 May 2025 09:06:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Add onboard EEPROM for Radxa
 E20C
To: Yao Zi <ziyao@disroot.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250417120118.17610-3-ziyao@disroot.org>
 <20250417120118.17610-6-ziyao@disroot.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250417120118.17610-6-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_000632_715585_6F1C6EEC 
X-CRM114-Status: GOOD (  12.34  )
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

On 2025-04-17 14:01, Yao Zi wrote:
> Radxa E20C ships an onboard I2C EEPROM for storing production
> information. Enable it in devicetree.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>

Reading from the EEPROM on my E20C works:

  $ hexdump -C /sys/devices/platform/soc/ffa58000.i2c/i2c-1/1-0050/1-00500/nvmem
  00000000  52 41 44 58 01 00 03 00  00 01 00 00 01 00 01 00  |RADX............|
  00000010  58 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |X...............|
  00000020  00 00 00 00 00 00 00 00  20 20 52 61 64 78 61 20  |........  Radxa |
  00000030  54 65 63 68 6e 6f 6c 6f  67 79 20 43 6f 2e 2c 20  |Technology Co., |
  00000040  4c 74 64 2e 00 00 00 00  00 00 44 31 45 38 31 30  |Ltd.......D1E810|
  00000050  4f 32 52 32 39 58 34 59  36 00 00 00 00 00 00 00  |O2R29X4Y6.......|
  00000060  00 00 00 00 00 00 00 00  00 00 9e 69 04 00 02 00  |...........i....|
  00000070  0c 00 00 00 01 00 56 31  2e 31 30 32 00 00 ed 09  |......V1.102....|
  00000080  05 00 03 00 78 00 00 00  01 00 30 00 00 00 00 00  |....x.....0.....|
  00000090  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 e0  |................|
  000000a0  4c 0d 0a 5c 00 e0 4c 0d  0a 5b 00 00 00 00 00 00  |L..\..L..[......|
  000000b0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
  *
  000000f0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 cf 50  |...............P|

So this is:

Reviewed-by: Jonas Karlman <jonas@kwiboo.se>

Regards,
Jonas

> ---
>  arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> index 57a446b5cbd6..6e77f7753ff7 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> @@ -110,6 +110,20 @@ vcc5v0_sys: regulator-5v0-vcc-sys {
>  	};
>  };
>  
> +&i2c1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1m0_xfer>;
> +	status = "okay";
> +
> +	eeprom@50 {
> +		compatible = "belling,bl24c16a", "atmel,24c16";
> +		reg = <0x50>;
> +		pagesize = <16>;
> +		read-only;
> +		vcc-supply = <&vcc_3v3>;
> +	};
> +};
> +
>  &pinctrl {
>  	gpio-keys {
>  		user_key: user-key {


