Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5D8D2502E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 10:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxNZNklVrEMXLNQqOVDX0u6frYhqRRN/CqreVHI4oEw=; b=Qp+uePUruTN8TLL6q0Gq5Ol+hb
	oNVVzX5vYPfGnsj5/TMRuBxUAuJ/0DTnucDgSPTVaxi/2W9JpVRCVp3C1totjs4aw2+84KA55PwVH
	8a3OT/rBlOQ73KdYf7Dp8bx3/JQb8ppAPWlhorDDDXh5RiUHEEkzoHnoCT1b9FqdzWsXuPduxY2fi
	g99rgnj23x9i6tbs54vJQ2lInnJqbMqLjnndCcx1eNA74iwmGOmHcWV3gsun9WVvz5oOBc1n87Se7
	yYeL1f0Da1A+Z8oWqPW5LSJFBjYD4q0BAhNb9A+hsO8HIKQowEr4bngo4/X5xbaZgCCcPB52SUsZk
	n//oqnog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vess8-000000048X1-2cGc;
	Sun, 11 Jan 2026 10:40:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vess6-000000048WW-1S36;
	Sun, 11 Jan 2026 10:40:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5ABD560121;
	Sun, 11 Jan 2026 10:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 849A4C4CEF7;
	Sun, 11 Jan 2026 10:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768128033;
	bh=jNXP3T+QGdDwl9VpGDdEjw5Gc/3zONZuRVJyjdi8Pkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LEpqqfbTdpthCVE6J0syaQoiZT2GHX1BJ0Vi6SGyDNQPjuBqWFhDD7Fhln71NRRhL
	 vZAKijff4tkh2P/A7H0F0C2A9iCldzCSkBc+q0I3JGFhbqYDb8EMELwOxJE61Q+Nqh
	 153M5K85RLeQSY2/3iPPKDWSfZiNPzuW99J5ba/rGBwJhIWK2XpXvgjqkolYfEvRRo
	 uPML9sqLEL3uzznP9whlcMWiW5b5VMvr3SWc+ZJacbQvMjbObiTC5hDIGTpvdEk9I5
	 u/rUfkCDl1rys1yiHWfSZ+ZL6ehammbuff6iFUUxFRa0LK5R04Z1BnbEda1jnR1UmF
	 aQs09toTbrGjg==
Date: Sun, 11 Jan 2026 11:40:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tzu-Hao Wei <twei@axiado.com>
Cc: SriNavmani A <srinavmani@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 3/4] MAINTAINERS: Add Axiado AX3000 eMMC PHY driver
Message-ID: <20260111-watchful-pigeon-of-brotherhood-6ada05@quoll>
References: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-0-dd43459dbfea@axiado.com>
 <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-3-dd43459dbfea@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-3-dd43459dbfea@axiado.com>
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

On Fri, Jan 09, 2026 at 05:43:31PM +0800, Tzu-Hao Wei wrote:
> Add SriNavmani, Prasad and me as maintainers for Axiado AX3000 eMMC PHY
> driver
> 
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> ---
>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a0dd762f5648b7e4e6fc62560662e43720422e01..6d1af11eb289ffb7c0d8634ac7d8f903aed1799c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4250,6 +4250,16 @@ W:	https://ez.analog.com/linux-software-drivers
>  F:	Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.yaml
>  F:	drivers/hwmon/axi-fan-control.c
>  
> +AXIADO EMMC PHY DRIVER
> +M:	SriNavmani A <srinavmani@axiado.com>

No activity:
https://lore.kernel.org/all/?q=f%3Asrinavmani%40axiado.com

> +M:	Tzu-Hao Wei <twei@axiado.com>
> +M:	Prasad Bolisetty <pbolisetty@axiado.com>

No reviews:
https://lore.kernel.org/all/?q=f%3Apbolisetty%40axiado.com

Are these maintainers going to actually maintain code? At least Prasad
should provide proper review now.

> +L:	linux-phy@lists.infradead.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml

> +F:	drivers/phy/axiado/Kconfig
> +F:	drivers/phy/axiado/phy-axiado-emmc.c

If you are a maintainer of Kconfig you imply you maintain everything, so
simply entire directory...


Best regards,
Krzysztof


