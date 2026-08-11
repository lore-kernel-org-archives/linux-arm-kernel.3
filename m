Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B73C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 18:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLMZG3a0XkvDabygdqWI0Ok/u2IdHHNuIIa8OSa4q6U=; b=hGP703eWbwQyGoP3qXD62Pu9js
	4yz3M9uaQmbr0g8ylim+yqv/8BaybrolwdB5kph0bKMVDa6YdSwxCvZRxdaO3NKKlpUeSrp3ys2Oy
	eG2+3n0q3vhs4CiJD9mbrTcxV68Mio05uatOxwpBcYJCI0ymV9XU4cMD3wN8rPWWnqL6zQK+a8k8A
	TiDcpl1gFOMdJmqvmp4trvAoiqbf/xSxyrfbbjwb1fkZLMXBEsMXmNRxCo9hp30/Pcp0l0kNzc2zB
	2KBb8IgxVNer5/TxTQE+0vKSvnst0X7wuDijNBaYmMyv9qMyRLeJxgZrC05IO0YnRWCVRHWowIndH
	FYeJ9kiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtrHP-0000000ElZ3-1e4G;
	Tue, 11 Aug 2026 18:32:51 +0000
Received: from lahtoruutu.iki.fi ([185.185.170.37])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtrHL-0000000ElXo-3hJI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 18:32:50 +0000
Received: from darkstar.musicnaut.iki.fi (85-76-106-235-nat.elisa-mobile.fi [85.76.106.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hKKx05RS2z49Px5;
	Tue, 11 Aug 2026 21:32:36 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1786473157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MLMZG3a0XkvDabygdqWI0Ok/u2IdHHNuIIa8OSa4q6U=;
	b=oZLUx+2Z5E8ar3zagCuGrS7esWiLCq1IVCkwn+abDRIuWTNcVtBDNtLs8jtoidaDyGStUY
	Udgi/WtXNC6fpn2lrz41TB7lhc0MXqMRR6FPWaCJI/F2gU7gFoMkZm6lexKpUbNZsBiZdU
	BG3wN7gv2Ytn6V/76wn5COlNRVbQ14R3WzjnEUl+qX54ZXqvy5knqiu6YHyu7gE8b/CuUg
	yNQj7XcJNb6XksKDn32EWA/n4q0oCXbl9OIrEoxmbTrXXdixsJd2BepUdE1kSkihDfefYt
	Bh/7zp72Xkns7jbOYtq6rIJ6RqOP56dOW8Nk0GmGdNQhptSk89zVHNxBlGZjDg==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1786473157;
	b=M55dj2UEFMEPOsz/hCG66MsDHuTWD0ardBnQ/+JYw+1BaMykUik0BS/RFXRJrr7Of0QU/8
	+toeyTl4MELrDtT32KeXJBImz3gx5YvCD4k+THbeu7vyMCzBqsjCvluhuxV5LScIlKP1Qq
	2625T3+tcFSTiC9UhW+0nmfyhhko6v82MLm/olcPFgg6Y+Qpt8/+IxilIyVL1LAlNcpnss
	hKQy7tmBbrEmuEGeNXolC5IdrgsmxnrT0kKpMovvo1Q8O42leQj2FoFZhSwTuWw44NbPfh
	EzvBmnDFDrRGnnb2B0MWwPDqKarsKXo8YX4k4nbJ1y0geu+a5IBNqm+wH9zNPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1786473157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MLMZG3a0XkvDabygdqWI0Ok/u2IdHHNuIIa8OSa4q6U=;
	b=hvLE60Tpg2ceXVVEblS+fvjWXRFZCfUSWbzRqqvdOGkm5eYMYsJL/vuG3iEST5ao88H/Ns
	IH4i3aILuj8ejWhhT/KmQnoLUwaqZA6/xUtjmB4IDtlpckafQV93XV+pK9yAsd01Ueo9wc
	3L8/33XcgN9rv0LoIkVFN+Rt8bpwzN+pgxBR7W8sbf26p34sq5vP5FHKtseQkAkraDMKdR
	wHUddPbCKY60zfpnXkg2LobfalkXXgfTUXWkp+VqUyXWfoyLn8UrV4F6TEpzcq1mu8PYdW
	/3YrTFOLoD4XOZzV5RW2erUMQg1E4NPewpWCHKgmx3VjWQdeZM1yfXbgxjSFww==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
Date: Tue, 11 Aug 2026 21:32:35 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v3 5/7] ARM: dts: ti: omap3-n900: Replace clock-frequency
 in camera sensor node
Message-ID: <antqw21HgXTAnZmI@darkstar.musicnaut.iki.fi>
References: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
 <20260810180604.3034255-6-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810180604.3034255-6-laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_113248_108801_A77EE471 
X-CRM114-Status: GOOD (  15.48  )
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

Hi,

On Mon, Aug 10, 2026 at 09:06:02PM +0300, Laurent Pinchart wrote:
> The clock-frequency for camera sensors has been deprecated in favour of
> the assigned-clocks and assigned-clock-rates properties. Replace it in
> the device tree.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>

A.

> ---
>  arch/arm/boot/dts/ti/omap/omap3-n900.dts | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/omap3-n900.dts b/arch/arm/boot/dts/ti/omap/omap3-n900.dts
> index 7db73d9bed9e..97e9eae2b60e 100644
> --- a/arch/arm/boot/dts/ti/omap/omap3-n900.dts
> +++ b/arch/arm/boot/dts/ti/omap/omap3-n900.dts
> @@ -792,7 +792,8 @@ cam1: camera@3e {
>  
>  		clocks = <&isp 0>;
>  		clock-names = "extclk";
> -		clock-frequency = <9600000>;
> +		assigned-clocks = <&isp 0>;
> +		assigned-clock-rates = <9600000>;
>  
>  		reset-gpio = <&gpio4 6 GPIO_ACTIVE_HIGH>; /* 102 */
>  
> -- 
> Regards,
> 
> Laurent Pinchart
> 

