Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46880C98315
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 22:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdrXAkkkjnrEKFPnannjoCRD2DpHi2Wl6YjZ5rUEVx4=; b=EK5cHUzEwM3BmYB1RZf5ywEczv
	hmFYazLfil5ECQRfNawbKcEvQmu2TPXpls9+kkamfN74204+O1hoLfOdxbmaTqv28cAOSXW0KPs1D
	00LfuT3tXpFzzlHNovIhVzyembkmNWkdelm3FxbaohkaQ50jmZFTX14aVsX3r5tzQLEqbBsCzHIVP
	dIE+xSn1CdLbn68CLtpCXKQBtrwG8/vX+3csFMLXcYu5eI5WfYN31EcuZsYWSOWvh88IyTWoBqOBs
	/jP/ApJZutQ/q/AX78qS7+MCod7A6nWz/85J0J3YBcatoQcCqOsgojie4jx2zJGdrhAlr0/gP/Hv1
	FXh3by9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhb7P-000000015kl-0x1w;
	Sun, 18 Jan 2026 22:19:35 +0000
Received: from vps.xff.cz ([195.181.215.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhb7L-000000015jR-40hK;
	Sun, 18 Jan 2026 22:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1768774766; bh=cblX9jkR3kK0JXIO//SSgI0CBfwe8fL4kkNcudepMJ0=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=vWfPP1/SdkG+4FnYFWL3VHCXHf0WbRvFr0gkr4FmMYgTMMeYrV5DqPKla2B8NoyhX
	 co7F8vLiA0d5+MnmNKNsMjxB+WCQfwrfg5LQ2F6TWKMb6qvq2iH2JZlEcOBDxXXSdQ
	 OMfMiulyVYt/DMdAXF2GYVsphNhOlAN+IBakeXrw=
Date: Sun, 18 Jan 2026 23:19:26 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Luis Garcia <git@luigi311.com>
Cc: Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Benjamin <olivier.benjamin@bootlin.com>
Subject: Re: [PATCH 0/1] Fix imx258 variant on pinephone pro
Message-ID: <hu2f4zd3qx75h3lj5sjinnj7lwcacpy4ywzbrp53tuch2xe4fd@fzkbs2q3lpbq>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	Luis Garcia <git@luigi311.com>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Benjamin <olivier.benjamin@bootlin.com>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20260118214620.3319040-1-git@luigi311.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260118214620.3319040-1-git@luigi311.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_141932_440787_64E9B206 
X-CRM114-Status: GOOD (  13.95  )
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

Hi Luis,

On Sun, Jan 18, 2026 at 02:46:19PM -0700, Luis Garcia wrote:
> imx258 had the driver updated a while back and it introduced
> two variants, the imx258 and imx258-pdaf. The pinephone pro
> is using the pdaf variant so this switches it to the correct
> variant and eliminates the pdaf pixels from the sensor output
> resulting in a much cleaner image.

You don't need a cover letter for a single patch. Also this
description should be in the patch itself.

Thank you,
	o.

> Luis Garcia (1):
>   arm64: dts: rockchip: Fix imx258 variant on pinephone pro
> 
>  arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> -- 
> 2.50.1
> 

