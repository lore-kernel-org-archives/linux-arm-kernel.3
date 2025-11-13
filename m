Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944AECDB463
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 23:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vv0aL7AXAIMlEgt8wO7sedaEW4yov1nnh2TmH71AqG0=; b=dOeKi/vPp0WtDQYMkdqmsiE5/c
	14A4dg7stWv03gT70s4hcY6MlicdnowVTY4tN1656Xhb0IQteCuOCwjadO5vF26P62qkhd2YyehjH
	TR6O8EIebiODLnPaoq7eYXuHrAx7419UxG+1qzqkdQy+2TAdRAr1EK9prUCPpQunMmdZB2lsYz4eU
	+J4Lt16qvdH3xxPUNhPD9sq7XXbPMS6MPRdOmvF6jc3ZlC+27XkB4qFH3+dsj0m8l89rTon1yQgUE
	seaX95DUKvPTTzMwWFdOPi01BKX8z38NbocT/Ke2imLgA6Mp7f62oreC8eR4/PjNxp/uCWQFxu+k5
	5BANwPfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJhAS-0000000BJY3-2FJv;
	Thu, 13 Nov 2025 23:55:56 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJhAP-0000000BJXj-2SSf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 23:55:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763078152; bh=ZRVq35L6TkrpSlFnqbXH25zsbqFI5rryoyNnRXqRoZQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jpX9Nghwryf8uxSu4AB5hnX+xmz2yENYr9YicLYFq25z0toePQTIZ11EMoj/6NBzI
	 3kb4dCVaVQrJUfaL5IP2BPZ5/rnxOJf0j2aBppjWzTHzzJYuQorjpu/kao+bIPxUtl
	 epJCoPKLrmFqi0W5EiVO3dp916n2EaeLJSGgfmYFjFYYru3yWgnMzBcL9nBxCEZTDo
	 bxob+zX/arIl+YKlJmYy5fP0JkvzZWrhkkE4Tkl0+8G+eH8JSdssIkHQmkB45/nmos
	 EXPrYR0qZfuLDblqIyg2VapQuQvt4yNmivSo+2ri5lZNK7a0cF1EFdAFC299HYWthg
	 nNxYVGeXwV1Bw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id EB8793E101C;
	Thu, 13 Nov 2025 23:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763078151; bh=ZRVq35L6TkrpSlFnqbXH25zsbqFI5rryoyNnRXqRoZQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vvu7kgOmglxU/7GZV4bsMZsuyEbf5c1ubIWr7hGRZyOsvk32piaTwQUXHVy8zASBC
	 AFB+Q6Jkb5dYi8RgHbL4x4va2KkxMcU+/AmO3zK8H93wQphIgMNKA983m7J6OSRN7H
	 Au3CNfatXMfGRoviloOdx5biqQRLh/wISVansZ6kVL9UZakxWuBZeMnYvn5PPdinpi
	 Tcj6wrVHdCPskHdzNE2zM9H1+Yr2hV2p7k678DOF01IVHRWlrhf8I+SXGmXvC32bmx
	 9DRhnUgUTmwhj6cyEwyUJ1FkTlqbuLqioOlGDdHUaC3inVMtvwPvv/ZBl4khSEujGU
	 KdgyiNX/dCvMQ==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 688DA3E0FFD;
	Thu, 13 Nov 2025 23:55:51 +0000 (UTC)
Message-ID: <af66cc8a-051a-4512-9a02-468b17550775@mleia.com>
Date: Fri, 14 Nov 2025 01:55:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ARM: dts: lpc32xx: add bus surfix for simple-bus
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20251029202801.3963952-1-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20251029202801.3963952-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251113_235551_981863_740BD6B8 
X-CRM114-Status: GOOD (  15.55  )
/bin/ln: failed to access 'reaver_cache/texts/20251113_235551_981863_740BD6B8': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_235551_981863_740BD6B8 
X-CRM114-Status: GOOD (  15.32  )
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

Hi Frank.

On 10/29/25 22:27, Frank Li wrote:
> add bus surfix for simple-bus to fix below CHECK_DTBS warnings:

typo in the subject and in the commit message above, s/surfix/suffix/

> arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: usb (simple-bus): $nodename:0: 'usb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
>          from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> index 2236901a00313..9790b0a1d6537 100644
> --- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> +++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> @@ -86,7 +86,7 @@ dma: dma-controller@31000000 {
>   			#dma-cells = <2>;
>   		};
>   
> -		usb {
> +		usb-bus {

Device nodes under "usb" should be just elevated, the "simple-bus" here
was used only to group some controllers together.

>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   			compatible = "simple-bus";
> @@ -307,14 +307,14 @@ mpwm: pwm@400e8000 {
>   			};
>   		};
>   
> -		fab {
> +		fab-bus {

FAB shall find its place in the AXI/AHB/APB/... list, isn't it?

>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   			compatible = "simple-bus";
>   			ranges = <0x20000000 0x20000000 0x30000000>;
>   
>   			/* System Control Block */
> -			scb {
> +			scb-bus {
>   				compatible = "simple-bus";
>   				ranges = <0x0 0x40004000 0x00001000>;
>   				#address-cells = <1>;

Here "simple-bus" is also unjustified...

-- 
Best wishes,
Vladimir

