Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72066C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 09:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MV3SBaP/NkJLElhKVQb3ChLAstdzKu69i8UbJJug81s=; b=uJm2PdS1EO8BrcahtGiBA3EgF0
	bMk5an+v2QjVk9Y0J/g0B5wOa3LcQBPv5hXePaCETwSyEgFfGOOM4um4F9UDyr29yBZaAym7Ae4cZ
	OFRW1WbpsneAVavb/CjPHlsXWpxAzjevUcJRwbun6FwgG9zlOs5UWxklVlsS7fhWzz+TgynxyQLQs
	rLkLJyJZvDAPFlafL3OSwqKx5B438fv8F1W2K6qRoypKfC7S6YgF46jrNIWx82Hkr1AGmQfYDUFkD
	VVfUe5B1qhUfEgWFdQ+8UMnGPeMS0ESFN63+JFDdpT2x/EIV4zMFYF9GbiwuRS6Zm2E6oWNgG2/f6
	/M+uy82A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJcs-000000031wR-0lFX;
	Fri, 09 May 2025 09:02:38 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIvR-00000002tnJ-3xXa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 08:17:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=MV3SBaP/NkJLElhKVQb3ChLAstdzKu69i8UbJJug81s=;
	b=gkwARIDO8HqvFi5wDJfHa30q7ILPqvIcbpTEwH9BgxhvqMDwTfUGnY49gXSEXy
	sfTavXq2+2Uw5iccg5Br1Twy8thHfjuLIcS8JnNOIonNqInAosvs4iGBrk01ze6N
	ndNxfTguVrKHupZAvZ0zmTUdBAUWof589jGxgqZXLkRAM=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3n_wVuh1o3uioAA--.11456S3;
	Fri, 09 May 2025 16:17:27 +0800 (CST)
Date: Fri, 9 May 2025 16:17:25 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 3/8] MAINTAINERS: add maintainer for the Ka-Ro
 tx8p-ml81 COM module
Message-ID: <aB26FRq/Ets5fiRK@dragon>
References: <20250417-initial_display-v6-0-3c6f6d24c7af@gocontroll.com>
 <20250417-initial_display-v6-3-3c6f6d24c7af@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417-initial_display-v6-3-3c6f6d24c7af@gocontroll.com>
X-CM-TRANSID: Ms8vCgD3n_wVuh1o3uioAA--.11456S3
X-Coremail-Antispam: 1Uf129KBjvJXoWrZryDuF1xGw48Xw4fJw1DJrb_yoW8Jr4kpw
	18Krs3CFn3JFsFkF1rKa1Yvw15ZFykGFW8uFZIv34vvFnxtFs0qw4DtwsI9rWDXF43Wr4r
	JrnI9r17Ww47XaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UVCJPUUUUU=
X-Originating-IP: [117.81.80.76]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQFIZWgdteEUjgAAsG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_011746_287173_5B38F4C8 
X-CRM114-Status: GOOD (  15.64  )
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

On Thu, Apr 17, 2025 at 12:14:04PM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> Add GOcontroll as unofficial maintainers of the Ka-Ro tx8p-ml81 COM
> module bindings.
> 
> This support is not officially done by Ka-Ro electronics, if they at
> some point will supporting mainline, this should be changed to them.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b5acf50fc6af4322dec0dad2169b46c6a1903e3c..1ca022081bcf564c8ec91fb6431570045495ec23 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12779,6 +12779,12 @@ S:	Maintained
>  F:	Documentation/hwmon/k8temp.rst
>  F:	drivers/hwmon/k8temp.c
>  
> +KA-RO TX8P COM MODULE
> +M:	Maud Spierings <maudspierings@gocontroll.com>
> +L:	imx@lists.linux.dev
> +S:	Maintained
> +F:	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
> +

I'm not fond of such changes, as MAINTAINERS file could be bloated
quickly by individual DTS.

Shawn

>  KASAN
>  M:	Andrey Ryabinin <ryabinin.a.a@gmail.com>
>  R:	Alexander Potapenko <glider@google.com>
> 
> -- 
> 2.49.0
> 
> 


