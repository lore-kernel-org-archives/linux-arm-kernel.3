Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F265AE909AE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 14:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgrYGzki/8CDchUbygE9S9HTRcJ+spBEW5xPJhmGL2M=; b=2FoSdtFGIare8MsVZQ3ChLDgKi
	TmZQ+4wBzHGxqPjJAKKN4V/98Ep0FpJqJsUkbK531JGn4Y3nKv3vu0MBH6Q/nREG3oW/oJzcfflHd
	dhxCxdMIXhjPHIRc0bBHk7pRGXSX1e6Y+HvOdstE5DgLLXbKMa8kJo5l8Z72Vac40hBjMyum3oUzE
	v0JephodCeNfqfQHp8CJT3FbfKocR9rqWZCKmig83OqlP15SL0knh9rWzA95yH7gIrinLik/vAHgc
	YsasWWw/l6QoBmoelcHTPalb3t74HKNclToAdKnpM9WssQC6AdwzcT/sIAs/T6CSJR5Kx1BYTRlW5
	un3pI0Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMXM-00000008TYe-2Wj4;
	Tue, 17 Feb 2026 14:58:52 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMXK-00000008TYI-071m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 14:58:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TgrYGzki/8CDchUbygE9S9HTRcJ+spBEW5xPJhmGL2M=; b=OEN1E4TOBXzDVAmqkxj1FpwVUx
	FszW/y92aT5KnFHR4qT6qgA0GxHMbPOmr5yQsBDGK01GPzWgRn4zWfBArExyhrV7KQcF9B2qN+MaY
	xkOFffE0LxZvBujfuI6hw5ZFnGL4hjR4Io9ViKOuh14RiFYV6957jiAB0PjQr7Hmc/Pw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vsMXC-007eik-1q; Tue, 17 Feb 2026 15:58:42 +0100
Date: Tue, 17 Feb 2026 15:58:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ARM: dts: imx: bx50v3: Configure phy-mode
Message-ID: <fa3805bd-d242-4399-8175-4b8dcd0f84b6@lunn.ch>
References: <20260217125952.53997-1-ian.ray@gehealthcare.com>
 <20260217125952.53997-3-ian.ray@gehealthcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217125952.53997-3-ian.ray@gehealthcare.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_065850_066581_7D11AA1F 
X-CRM114-Status: GOOD (  14.13  )
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

On Tue, Feb 17, 2026 at 02:59:49PM +0200, Ian Ray wrote:
> Set `phy-mode' on network switch CPU ports to eliminate a warning.
> 
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> ---
>  arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts | 1 +
>  arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts | 1 +
>  arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
> index d994b32ad825..7326b8ad08cb 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
> @@ -140,6 +140,7 @@ port@3 {
>  	port@4 {
>  		reg = <4>;
>  		label = "cpu";
> +		phy-mode = "gmii";

Are the PHYs external to the switch?

>  	port@4 {
>  		reg = <4>;
>  		label = "cpu";
> +		phy-mode = "gmii";
>  		ethernet = <&switch_nic>;
>  		phy-handle = <&switchphy4>;

You have back to back PHYs on the CPU port? This is not wrong, but
unusual.

	Andrew

