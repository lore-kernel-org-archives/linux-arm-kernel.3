Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B36C44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 19:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G97p3I72zO6HSzwQX3GsrN/RHi2gmwpFncs/h5lZiNA=; b=EBffkrFqmaBmIJZ/JmJq7YV5nx
	9EYxqaMb9r3wM3aRSwvBfKG8Q7L49J5jmj1rihSBE0wTN+hgkUUyxloenUjiPmBN/jb8o4owqNig6
	R/8buxRAbKBcQNuuIzlNh/JKY5Vfl07WvbRlwPEOwQB9xRVmjmShW/5oh1iMYyrh54dzleUye1dhN
	q9vqRN+QhyMEy05UU1bY/Tz/3p+Pln6ZSrZt8yV6xpm2C2YQVUfWR/Sfr3YTiqdNKwLg6i9JqmrCO
	uplRYVwGYG3mbBBvdG99UrLYS7emxIpxN6vdYk5bBRCD8ehjLiiT/tJySH7p+DHbJOQ9hdnCn9R+4
	YYbxZakQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiHDc-00000005dA5-3QA4;
	Fri, 10 Jul 2026 19:49:04 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiHDZ-00000005d8v-3B5v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 19:49:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1783712940;
 bh=G97p3I72zO6HSzwQX3GsrN/RHi2gmwpFncs/h5lZiNA=;
 b=x8rrJNC3XxtyqvLDRoY+Lbt1yO+qWyF2yAQ/4WSQSbORse1SrrPJ7wuf8jEKzvvqoUIA0FubW
 NEONjT0oUCq+B//yhm1PTZyqMiAEXsQ+NfKMf2m116PLbOJdNSNnzb2tcGMpM62qLz0D/xi9J2C
 bLUGXJhI0ptwF7/RQTCqx2mUcqQBL5VA5UNuoGoaCltkiDpddfhbXqeRdimYczmcmdL8/7MjKIF
 ySGiWVkelyoYwjM5MbIwz6pUZJoc+VVzi6gwDjUqiIL6kbNRlO2Z1lRNYRp4HcvCeqFUbejgahp
 ljw/zi9+FG2K7i1+o83cF7aLHe66OqWp4rdiG0oFUU3Q==
X-Forward-Email-ID: 6a514ca876cf32b2f5f788d4
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.10.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <2127e98d-d411-4be9-aac0-bc3684339faa@kwiboo.se>
Date: Fri, 10 Jul 2026 21:48:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] dt-bindings: pinctrl: rockchip: Add RV1106
 compatible
To: Simon Glass <sjg@chromium.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@nabladev.com>, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, huang lin <hl@rock-chips.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706195818.3906949-1-sjg@chromium.org>
 <20260706195818.3906949-4-sjg@chromium.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260706195818.3906949-4-sjg@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_124901_897685_A708C440 
X-CRM114-Status: GOOD (  13.75  )
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

On 7/6/2026 9:57 PM, Simon Glass wrote:
> Add the compatible for the pin controller of the Rockchip RV1106 and
> its RV1103 package variant.

The RV1106/RV1103 has a dedicated GPIO IOC regs block for each GPIO
controller. Something that seem to be different compared to other
Rockchip pinctrl/gpio controllers.

I think we possible need to have a rockchip,ioc or similar added to each
gpio bank for this variant.

Address mapping for gpio controllers and ioc regs.

  GPIO0		FF380000	32KB
  GPIO1_IOC	FF388000	32KB
  [...]
  GPIO1		FF530000	32KB
  GPIO1_IOC	FF538000	32KB
  GPIO2		FF540000	32KB
  GPIO2_IOC	FF548000	32KB
  GPIO3		FF550000	32KB
  GPIO3_IOC	FF558000	32KB
  GPIO4		FF560000	32KB
  GPIO4_IOC	FF568000	32KB

I even made a note of this in my mainline U-Boot tree at [1]:

  FIXME: range overlap gpio2+, u-boot pinctrl driver
  fail pinconf of gpio2+ unless regmap cover all banks.

Something I simply ignored at the time when I played around booting my
RV1106/RV1103 boards using mainline U-Boot. However, this is something
that should be fixed in a proper way for mainline Linux.

[1] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/blob/rk3562/arch/arm/dts/rv1106.dtsi#L130-137

Regards,
Jonas

> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
>  Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> index 9b3cbeb54fed..81747bb53056 100644
> --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> @@ -51,6 +51,7 @@ properties:
>        - rockchip,rk3576-pinctrl
>        - rockchip,rk3588-pinctrl
>        - rockchip,rv1103b-pinctrl
> +      - rockchip,rv1106-pinctrl
>        - rockchip,rv1108-pinctrl
>        - rockchip,rv1126-pinctrl
>  


