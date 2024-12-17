Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704C2E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 19:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=plXY3/Zcoe74Jr3EVPO0NcLX3LevAO5kvmSZ/p53PkM=; b=X8FD7lIrE2bkRhdtmez6xbR6w1
	C38RVhwGOG/rps0kM3a7HNSFGWRbI0O8czYMKHtrzuyxBFBF6USgdjyHw6Nhh9wnf2+He53kuELB+
	eK3JkSPkQfCdmPpIlu5mk/k93a0qmbPA24m4aW/OqeH6e7s8Lz/1Jq2l3fUh7OhURaBTzss4gaNYj
	gE/CQPBlSxcQOsTuumr7s2RK1zM79a9ndVlYLbzgM6JjuX/MyFtXnITlmmEPyc2xleW46gtGeQwrs
	FkQ7SE1NgWJNUve6WMlwz4QPI908K51zyejJBSNRu7jJWNPrGhr2aAqdTrJzL/ry8SSK5v2g59LXI
	dGfWdk7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdbH-0000000EgUv-0WYj;
	Tue, 17 Dec 2024 19:51:23 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdaB-0000000EgOA-0P4K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 19:50:16 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 475583E;
	Tue, 17 Dec 2024 20:49:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734464975;
	bh=ObpgcoRYeh8c9yIiYD3tbYsZnfL/7m9ZSvLsrGrdD9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d2KJ54c44K/8hPwKsfbhby6tk+Fd32DdkYirGIFG4Ir9zBS8xYUfnvU4jWQAcrXnV
	 dPQav2LaNtA6GKvWNc1JJqn4iUfjbeOWyMfWmZoSG2dGybu9cmX16fXomEb/HyjfMW
	 DMoT4v3qVesEB17bvZ0CUoEhjy97LeJNIeGbaEF0=
Date: Tue, 17 Dec 2024 21:50:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH] arm64: defconfig: Enable pinctrl-based I2C mux
Message-ID: <20241217195010.GE23470@pendragon.ideasonboard.com>
References: <20241217193356.111102-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217193356.111102-1-wahrenst@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_115015_272582_90209401 
X-CRM114-Status: GOOD (  14.26  )
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

On Tue, Dec 17, 2024 at 08:33:56PM +0100, Stefan Wahren wrote:
> The commit 84b1d6cc3e4c ("ARM: dts: bcm2711-rpi: Add pinctrl-based
> multiplexing for I2C0") introduced multiplexing for I2C on BCM2711-based
> Raspberry Pi boards. Unfortunately we missed to enable the necessary
> driver in the defconfig.
> 
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Link: https://lore.kernel.org/linux-devicetree/961b3d43-b4c9-4573-82d7-844aa129d994@notapiano/
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index c62831e61586..0fee3848d03a 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -516,6 +516,7 @@ CONFIG_TCG_TIS_I2C_INFINEON=y
>  CONFIG_I2C_CHARDEV=y
>  CONFIG_I2C_MUX=y
>  CONFIG_I2C_MUX_PCA954x=y
> +CONFIG_I2C_MUX_PINCTRL=m
>  CONFIG_I2C_BCM2835=m
>  CONFIG_I2C_CADENCE=m
>  CONFIG_I2C_DESIGNWARE_CORE=y
> --
> 2.34.1
> 

-- 
Regards,

Laurent Pinchart

