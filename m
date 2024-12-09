Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C305E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 12:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c0w54vZT7PKG1XWtN+/uhpQiw/mRzqEusnhno0TxGLE=; b=zu1NbW1rDRwyi2RuMABdS8hpa9
	/kBPxUGFziTy1cxr2Rn2aeJ/j3lxJXF5YBZEDFduHx5AR6nOw5hsfHqh2jc0IXguladRirPT60eK/
	woTz8NbR31SLIgzfkbzFy7kYgrK07UB9np2ZgW3bSjpIaWND92obyNEjNR21OYaQavaYBUlJrmAlp
	ElwZhEsVIvhEagk8brawo1wsP7k/l/WFf+N8nOiXhB4Dv8KFTWL/J70EUuGZi9QlbUO3PPpAUXf4E
	KLPOGQkCYPaM7LRurXnnwSJxOEPCynG0CzcK8BXcFIus7Xs7n8SXixg/HpZvfTue2OvcKHxkFlwEp
	wX+YXmMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcuf-00000007gwY-18Ws;
	Mon, 09 Dec 2024 12:30:57 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKctb-00000007gY8-1q0v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 12:29:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=c0w54vZT7PKG1XWtN+/uhpQiw/mRzqEusnhno0TxGLE=;
	b=bI/DGTJRzhytnyCFnnV41Vgg5thANKUze3OAJoHEzQveY2ntPLmOtvUm0FYmYM
	nI2pXExwzoqttNzaW7gMJxZd6Ntlt07qxUypqMX4pT+1yaBs4MWctSheD3e6Tgrm
	Q9rjqNgsNE5l32YTxaJVdvBO7f6vibbzAtBQHXEVp6Frg=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgC3vzGp4lZnf959BA--.46916S3;
	Mon, 09 Dec 2024 20:29:31 +0800 (CST)
Date: Mon, 9 Dec 2024 20:29:29 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: freescale: Remove unused and undocumented
 "cooling-(min|max)-state" properties
Message-ID: <Z1biqf24yH6HCl8Y@dragon>
References: <20241115193504.3619533-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115193504.3619533-1-robh@kernel.org>
X-CM-TRANSID: Mc8vCgC3vzGp4lZnf959BA--.46916S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZryxGF4kurWfCrWkKrykZrb_yoW8AF4kp3
	WkZa95Wrs7WF1aya4qgr18Kryq9ws8JFn5ur1DWry3tr43Z3WjqryYk3Z3WF47ZF4fCw4F
	gF1Fqr10vF1YqaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jaVbkUUUUU=
X-Originating-IP: [114.218.218.187]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAh2wZWdWz70tEgABs3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_042952_075928_BA9F9481 
X-CRM114-Status: GOOD (  13.20  )
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

On Fri, Nov 15, 2024 at 01:35:03PM -0600, Rob Herring (Arm) wrote:
> Remove "cooling-(min|max)-state" properties which are both unused in the
> kernel and undocumented. Most likely they are leftovers from downstream.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

A similar change from Frank [1] was applied, thanks!

Shawn

[1] https://lore.kernel.org/lkml/20241007220542.897605-1-Frank.Li@nxp.com/

> ---
>  .../boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts   | 2 --
>  arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi             | 2 --
>  2 files changed, 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts
> index d9fac647f432..1d53b529af88 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts
> @@ -19,8 +19,6 @@ / {
>  
>  	pwm-fan {
>  		compatible = "pwm-fan";
> -		cooling-min-state = <0>;
> -		cooling-max-state = <3>;
>  		#cooling-cells = <2>;
>  		pwms = <&sl28cpld_pwm0 0 4000000>;
>  		cooling-levels = <1 128 192 255>;
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
> index d32a52ab00a4..aef63a4f698c 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
> @@ -94,8 +94,6 @@ i2c@1 {
>  			fan-temperature-ctrlr@18 {
>  				compatible = "ti,amc6821";
>  				reg = <0x18>;
> -				cooling-min-state = <0>;
> -				cooling-max-state = <9>;
>  				#cooling-cells = <2>;
>  			};
>  		};
> -- 
> 2.45.2
> 


