Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BFEE674BA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 08:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IeaVJHhC0vZY63A4QtQYExEgCz/IQApw8RhqgXRhQ5A=; b=0/0ejUxzyYLQX5au8AEhRS/7DJ
	6p8QR3xqZngpmEtedK+liA92QSloFLG1INAKLt5n7paRSPyjIusxtUAikZ6GALCuhxtYgSn/+xt2T
	ClWBRQg0R3rEsIIR3Ki7wqvIuJHCCzchxUFvM2ByCZKrL5uiVl16rzE8sex0zC4EWuojquxzWlslb
	D1KmwBzNQqQ+m0n/wprFoX0uqBhGkFFZlec8ZiKRSTkSi2qkKjWIwGQVkPPZEMSZCPadIiMyZk8He
	aUlm98ffyY/VbrZ8aPr7Xcu61eldAULqWiuIoEJoe6yShb7VlboOgejt24cNJKnoLCYuO0XNSEKXf
	+nJEbxMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6nLx-00000006K1p-2v0V;
	Fri, 01 Nov 2024 08:49:57 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6nJd-00000006Jj8-0GRy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 08:47:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=IeaVJHhC0vZY63A4QtQYExEgCz/IQApw8RhqgXRhQ5A=;
	b=aPmnC14zcu7eUaNpshEHexKf8C8or9kGiWOh6N82pnkymJELLGh+LVNYWq+P0x
	lOcTL39BG6IH9r2tVtoOZ3kXhnxe19/KuaKkg9ITumylG7q0vcyhGiqAiQy1PNTF
	sulrv32U3bIpJ79x58DqJ9jtHBMRwXzIpWpHSMTYQl8/g=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgC3P0uVlSRn0vRiAQ--.13641S3;
	Fri, 01 Nov 2024 16:47:19 +0800 (CST)
Date: Fri, 1 Nov 2024 16:47:17 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mq-zii-ultra: remove #address-cells
 of eeprom@a4
Message-ID: <ZySVlU2gPSN3KKSl@dragon>
References: <20241018183117.740439-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018183117.740439-1-Frank.Li@nxp.com>
X-CM-TRANSID: Mc8vCgC3P0uVlSRn0vRiAQ--.13641S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JrWfXFy3tw13Ar47JrWrKrg_yoWftrXEyw
	1fuw4UG395ArW7C3s8Zw40qwnFk34UA34fJw1fXr4DKayav3y3K397J3yrJr9xGF43Krs5
	AFn8tF1kJ345KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8qYLPUUUUU==
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxyKZWckPo77kgABsj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_014733_488121_CE274779 
X-CRM114-Status: GOOD (  12.03  )
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

On Fri, Oct 18, 2024 at 02:31:16PM -0400, Frank Li wrote:
> Remove #address-cells and #size-cells of eeprom@a4 because no children
> nodes under eeprom@a4.

Hmm, bindings/nvmem/zii,rave-sp-eeprom.txt suggests there could be child
nodes?

Shawn

> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
> index 0c960efd9b3d5..c7bbba45f3685 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi
> @@ -517,8 +517,6 @@ eeprom@a3 {
>  		eeprom@a4 {
>  			compatible = "zii,rave-sp-eeprom";
>  			reg = <0xa4 0x4000>;
> -			#address-cells = <1>;
> -			#size-cells = <1>;
>  			zii,eeprom-name = "main-eeprom";
>  		};
>  	};
> -- 
> 2.34.1
> 


