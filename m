Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1EAE6B246
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 11:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBhhEiomKrzvqxGLGcDjM350Ad9Z2r+Ry5z4X3rrDy8=; b=pas1mC+IaBWzibMO7bOAZNKV/K
	xlQP8gIzLggxDo5d2ObZrS9L5v3XZnzkrqsOGedGjkIVXUwQFhlxlIPs92xrdUM1NpH4BqD5zaxVT
	GQ9mFl9OnZQ1DDNBy2BDv5ydkEcO9nE3nEJcaM99JScxPygwf0z6upHrosly+L8TKZpUakVVbIK0v
	0Np7AjKZBbEd0WkuieJjoFmQOcmHD3CpNXsQ+Vrn+Pxetzd/jbNP0ScvovM9jymMBPOE9hy5EePwx
	r/65TOmLDgK4uFGWHB43C7VPP13+Ur3+3T84cv8PLvbZnV04d2s+8EUwlU+1sK5rZsEWuFknED1/p
	Botq2hUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qDO-00000006oXv-0UoD;
	Fri, 01 Nov 2024 11:53:18 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6q6t-00000006nTM-2mrj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 11:46:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=vBhhEiomKrzvqxGLGcDjM350Ad9Z2r+Ry5z4X3rrDy8=;
	b=KJKFw353fhDs710pbkq9vTdnMRsejfZ5iqwWlIWRjb1RcZwxk4IfCUPm3QLqFA
	752EO89ExgeAZ0rHV2XEe2vHdu5s414AXZpsn7MoRT+oXfuVomORhj5HijuR7GXq
	pj/6wl0Zs9EUHvikIXj9YKlsYf1DHuQUcihnccmjbyz3Q=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBX8YiMvyRnpAFrAQ--.14187S3;
	Fri, 01 Nov 2024 19:46:22 +0800 (CST)
Date: Fri, 1 Nov 2024 19:46:20 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mq-librem5: remove undocument
 property 'extcon' for usb-pd@3f
Message-ID: <ZyS/jGUf2C2VlJ4J@dragon>
References: <20241023220252.1392585-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023220252.1392585-1-Frank.Li@nxp.com>
X-CM-TRANSID: Ms8vCgBX8YiMvyRnpAFrAQ--.14187S3
X-Coremail-Antispam: 1Uf129KBjvdXoWruryDuw43uFyfJrWkZr4rAFb_yoWkJFb_AF
	4xuw4rJrWrAFWIgas5tw4kZ3W2grWUC34ftr1rXr4kGryav398Ca97Wr4rGrn8GFWFkrZ8
	ArZxXF15AryYkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8voGJUUUUU==
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhWKZWckdPvVbQAAsc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_044636_078792_4BA7E338 
X-CRM114-Status: GOOD (  13.08  )
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

Copy Sebastian for comment if any.

Shawn

On Wed, Oct 23, 2024 at 06:02:52PM -0400, Frank Li wrote:
> Remove undocment property 'extcon' for usb-pd@3f to fix below CHECK_DTBS
> warnings:
> arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: usb-pd@3f: 'extcon' does not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/usb/ti,tps6598x.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> index 1b39514d5c12a..61bdb43dec31d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> @@ -794,7 +794,6 @@ typec_pd: usb-pd@3f {
>  		interrupt-parent = <&gpio1>;
>  		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
>  		interrupt-names = "irq";
> -		extcon = <&usb3_phy0>;
>  		wakeup-source;
>  
>  		connector {
> -- 
> 2.34.1
> 


