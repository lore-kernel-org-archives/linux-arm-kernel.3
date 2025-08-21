Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3ECACA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 06:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrScFWxwUweYwsRmH5bskazblTnrXR09gx4xHuFB8Kg=; b=CLrfDWSfBvqVznBpdUipIzvihL
	H/QdiaCeVeQYYcI/em/tNIvZceS178ddN5eyJieORMfee3jEnNvRP07sQLC6lkLHTcJXCn1oWsbVC
	l4I39x5wbSx0Vieotjx6sJDM8RPp3tMWTHFAyYdKB1my5qiWR+NZbOA6vCsuoEzQnJAbzmUIL42q8
	168DCAUEdOQ1RvcAbjMtZC0UdHhaf4ShTEgZLQa5dv/j3pE1dd/sRvYFzpkUWjMYiRXHv53H4lJi1
	iTY6ZBvpTpAZi79jvKu0D9lf4J8qY6H2KdRZfy7COhlvSOOmEfd/oHXTIzenqhGzduTDvjqjVnOXQ
	Zf4A8Ndg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyRH-0000000Fuxz-15Ez;
	Thu, 21 Aug 2025 06:06:19 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyOe-0000000Fuqp-0wVp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 06:03:38 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id CA76C1F928;
	Thu, 21 Aug 2025 08:03:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1755756208;
	bh=FrScFWxwUweYwsRmH5bskazblTnrXR09gx4xHuFB8Kg=; h=From:To:Subject;
	b=zONGa+v4bwGNv4NkMlLXJBcl+T66Aubn6+uZeZqZRxlK6EgqdY9fErRukWmC0wcPt
	 pn+NE89+6dK+apL5q0hIvkumyummyYKvGo+21g+mKTaGmaVZcabaqZCg43Q/6fnbcd
	 QW/kncFmMvnikr+nvoWPZYcleJNZ36/AhUhEcGq8/2p+Y7wtNc9ujO35A0Uy3ZaTcm
	 pE3kSJCiUk+54u+aHTd813thKqqoG3Mud2to++HEWJM4axNNQkqSejgqDNRlXa3fY7
	 KR7xNojpleTwPv/DH5HtYZ8BIuAl1PSQ3o4AKlzatsaRjzSLfzyqjmmrwUPADRDzp6
	 xFoJWqyMOhsMw==
Date: Thu, 21 Aug 2025 08:03:24 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, afd@ti.com,
	u-kumar1@ti.com, hnagalla@ti.com, jm@ti.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 20/33] arm64: dts: ti: k3-am62: Enable Mailbox nodes at
 the board level
Message-ID: <20250821060324.GA7503@francesco-nb>
References: <20250814223839.3256046-1-b-padhi@ti.com>
 <20250814223839.3256046-21-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814223839.3256046-21-b-padhi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_230337_303525_EE167888 
X-CRM114-Status: GOOD (  16.73  )
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

On Fri, Aug 15, 2025 at 04:08:26AM +0530, Beleswar Padhi wrote:
> Mailbox nodes defined in the top-level AM62x SoC dtsi files are
> incomplete and may not be functional unless they are extended with a
> chosen interrupt and connection to a remote processor.
> 
> As the remote processors depend on memory nodes which are only known at
> the board integration level, these nodes should only be enabled when
> provided with the above information.
> 
> Disable the Mailbox nodes in the dtsi files and only enable the ones
> that are actually used on a given board.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62-main.dtsi         | 1 +
>  arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts | 1 +
>  arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi       | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> index 029380dc1a35..40fb3c9e674c 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> @@ -808,6 +808,7 @@ mailbox0_cluster0: mailbox@29000000 {
>  		#mbox-cells = <1>;
>  		ti,mbox-num-users = <4>;
>  		ti,mbox-num-fifos = <16>;
> +		status = "disabled";
>  	};
>  
>  	ecap0: pwm@23100000 {
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
> index df2e1b0e74a1..2140e0cdec85 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
> @@ -299,6 +299,7 @@ &epwm2 {
>  };
>  
>  &mailbox0_cluster0 {
> +	status = "okay";

add new line

>  	mbox_m4_0: mbox-m4-0 {
>  		ti,mbox-rx = <0 0 0>;
>  		ti,mbox-tx = <1 0 0>;
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
> index fba6f5c8d099..1c44d17281dd 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
> @@ -1335,6 +1335,7 @@ &main_i2c3 {
>  };
>  
>  &mailbox0_cluster0 {
> +	status = "okay";

add new line

>  	mbox_m4_0: mbox-m4-0 {
>  		ti,mbox-rx = <0 0 0>;
>  		ti,mbox-tx = <1 0 0>;
> -- 
> 2.34.1
> 

