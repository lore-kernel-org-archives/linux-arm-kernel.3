Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8684ACD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 08:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7TivDAliLqNja1df1hxZ5aF3MEDj9hFJr+hYTLChCQM=; b=LZi00NpEEVOBSVUOAjSyHLOPkB
	1e8yNwpjLPt/jVbiMtgzpgZeqvq/u6XM87BJku4DrxdX+IRkfWPPXv3OesyCaLzKVjSqse7tZAjru
	/W+ajdOt+L+QKXudOD7TsUFWEicQ35VmsTebFkmLMt3+2dA5Rll8CVuRDXVPteFcXgNQIhdV6qQux
	a/iVRgEvLsZcZOXojfc9isbw6Bz4IyUPOWNCDXSjkdAfZrKy8PqXMJvPsXyw+5g+h6QWMT8RjVbok
	J36ww+pYFb8jZplnCbBmOkfY+bVRSqGJ/wjyu90X2vQ+2lNWOAV/PesvBqgibF4FTBDxfXgQsoP0b
	bCzeRiZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTxgz-0000000AKeQ-1GlD;
	Mon, 01 Jun 2026 08:08:13 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTxgv-0000000AKdm-2i5E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 08:08:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 04B48C6247E;
	Mon,  1 Jun 2026 08:08:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 153D2602AB;
	Mon,  1 Jun 2026 08:08:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C7ED1088805A;
	Mon,  1 Jun 2026 10:08:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780301285; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7TivDAliLqNja1df1hxZ5aF3MEDj9hFJr+hYTLChCQM=;
	b=VP4ResRhgkhmp7jlvX1TMKeoc+wG63phGoZfOIqZdqtI2Yn9HiUetRA1gu0OBzMtaPC5iE
	5z7pCWJ3dy0WIDQ31MZ9Ympy55M28K0LRZx9z1OGdmw/XPa1ucvcH4uYwk5u/u67Xpw87R
	KfwIivyR6A1Gs3Q5vXbSS4Oy7nC3ed2N639JPmFnRP+lNE+8Sun6Otcm2+7aeT+D0l0/Oz
	Y1PGRzHY4yfXP2KwniHe3CP2ClgbRoN6wTQTmd5YMpRt0RIXKwLincQldg7D7ScxruOBvN
	nLQ2lAEXzOrA6WHBy76+dqfWHAs2XHyjVyHQVOybYjL6Qq2k4YC/Q1DlsrQ0AQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Aleksander Jan Bajkowski <olek2@wp.pl>, andrew@lunn.ch,
 sebastian.hesselbarth@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: Re: [PATCH] arm64: dts: marvell: armada-37xx: mark EIP97 as
 dma-coherent
In-Reply-To: <20260524124456.350659-1-olek2@wp.pl>
References: <20260524124456.350659-1-olek2@wp.pl>
Date: Mon, 01 Jun 2026 10:08:00 +0200
Message-ID: <87zf1eznrz.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_010809_844207_4CF913AF 
X-CRM114-Status: GOOD (  12.51  )
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

Hello Aleksander,

> Armada 37xx has coherent bus, similar to Armada 7k/8k. Cache
> synchronization consumes a lot of CPU cycles. Enabling coherent DMA
> increases IOPS performance up to 4 times. Some numbers:
> 					Data length
> Algo		MB	   16	  64	 128	 256	1024	1424	4096
> DES-ECB		1	+21 %	+5 %	+5 %	+7 %	+7 %	+3 %	+20 %
> AES-ECB-128	1	+21 %	+6 %	+6 %	+6 %	+9 %	+8 %	+22 %
> AES-CBC-128	1	+21 %	+5 %	+5 %	+5 %	+6 %	+7 %	+23 %
> AES-CBC-256	1	+23 %	+7 %	+8 %	+6 %	+11 %	+13 %	+20 %
>
> 					Data length
> Algo		MB	    16	    64	   256	  512	  1024	 1420	 4096	 8192
> AES-GCM-128	1	 +44 %	 +42 %	 +31 %	 +32 %	 +27 %	+30 %	+32 %	+30 %
> AES-GCM-128	8	+319 %	+326 %	+163 %	+148 %	 +75 %	+72 %	+74 %	+41 %
> AES-GCM-128	4096	+123 %	+128 %	 +90 %	 +83 %	+116 %	+59 %	+38 %	+28 %
>
> 					Data length
> Algo		MB	   16	   64	  256	 1024	 2048	 4096	 8192
> MD5		1	+21 %	+15 %	+29 %	+25 %	+50 %	+16 %	+20 %
> SHA1		1	+24 %	+22 %	+27 %	+22 %	+18 %	+20 %	+20 %
> SHA256		1	+30 %	+24 %	+25 %	+26 %	+21 %	+41 %	+19 %
> SHA512		1	 +4 %	 +3 %	 +8 %	+10 %	+24 %	+10 %	+11 %
>
> Tested on Armada 3720. Platform passes testmgr selftests.
>
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>

I'm surprised that we didn't enable it when submitting the support for
Armada 3700, but indeed the datasheet mentions I/O coherency support. I
didn't see any specific register to configure it. Moreover, if none of
the tests failed, we can assume that the bus is indeed coherent.

Applied on mvebu/dt64

Thanks,

Gregory


> ---
>  arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/bo=
ot/dts/marvell/armada-37xx.dtsi
> index 360fc24fdde2..8418777042b8 100644
> --- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> @@ -437,6 +437,7 @@ crypto: crypto@90000 {
>  				interrupt-names =3D "ring0", "ring1", "ring2",
>  						  "ring3", "eip", "mem";
>  				clocks =3D <&nb_periph_clk 15>;
> +				dma-coherent;
>  			};
>=20=20
>  			rwtm: mailbox@b0000 {
> --=20
> 2.53.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

