Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC57C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 08:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vkwMqEbKDECyOrbFUQuixGz194KxSACX1c7ic6lEmE=; b=TcdQiOWICyexM+aQsBttWiYHzk
	OQkff3Vr+JahGtpHdVsxkMGPqsJT6HW3BSw1Q817vr2X/Oh17fc99etJhfOH317WYk8giyFg3dww6
	V7sLFCadhKVD2+sD5mEs2G9bGqrnl+D9twq/o1Fd5OB/BoSRn/jcucj5b5VEJxLBeC9rt96pY+zfy
	dTiEo0tQ5vZwusl3JQbqalAhFxaPKFBYI2XxBd8kz9+G3ZFODPrPeypsCdZW3ZjZKczpHqem+OjB4
	E6dg+D6zxyym6IsgM5VVVXlHHpIikbOrMC7RRCUNd3Gf8VZt2sLXOD+QyulXgg/FHPPOuC3SKlP7r
	jaiKBmFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6Qt-000000001xV-0ggU;
	Mon, 28 Sep 2026 08:09:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6Qq-000000001xF-3u3i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 08:09:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DC2B2601FF;
	Mon, 28 Sep 2026 08:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1971F000FF;
	Mon, 28 Sep 2026 08:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790582991;
	bh=4vkwMqEbKDECyOrbFUQuixGz194KxSACX1c7ic6lEmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oPlMjnHyQR+LugBeOdYlkD6y8qn5VJ0Vuivkz0BE5ACb9s6eKxrkeT32UJYPcI92A
	 K9wTSFwKF5aqV0VH8/hRwD9ktLquVSnhABVzP6or4DQH5dSKSUTSOJENYUFqxmcedd
	 UE2Rix+nUgaNzEZr9bzj07DQGpZtaSEbOGMu2nssY7MNAmdxz2pafj/gnZw5HQkwOP
	 QJK5/3/diLtPy6Yfm8J5OUwJWLcvxE9OEpS2EOKjclFXj1QRt4Bi6fvrMhNbLY09cN
	 klQRxzAWZBLnva11xWZkzki1Dk9ExUQy4ggQpInt+GMY/pnnKhYFBsYkQ+qVfGlYrk
	 0vf5/jyxhQ5Yw==
Date: Mon, 28 Sep 2026 11:09:45 +0300
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, adrian.hunter@intel.com, aubin.constans@microchip.com, 
	ehristev@kernel.org, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, luka.perkov@sartura.hr
Subject: Re: [PATCH v2 5/6] arm64: dts: microchip: ev23x71a: enable QSPI
Message-ID: <tl5ep4ze2e5ctv7c47jsjedvcpnibdspo5az7a73i5p7iwbivk@vbtd4rhtvroa>
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
 <20260907132617.1198548-6-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907132617.1198548-6-robert.marko@sartura.hr>
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

On Mon, Sep 07, 2026 at 03:25:33PM +0200, Robert Marko wrote:
> Enable the QSPI controller and describe the onboard SPI NOR flash.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Missing '---'

> 
>  .../arm64/boot/dts/microchip/lan9696-ev23x71a.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
> index 4012ea7d07bb..985ca31e74e7 100644
> --- a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
> +++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
> @@ -463,6 +463,21 @@ phy27: phy@27 {
>  	};
>  };
>  
> +&qspi0 {
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <100000000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;

As sashiko pointed out, #address-cells, #size-cells, should not be
necessary here. I dropped them and applied to microchip-dt64.

Thank you,
Claudiu

