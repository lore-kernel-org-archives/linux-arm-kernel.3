Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F014FCB638
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 15:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKC5zfjM/IoMOY95+u6tBOEtiXEaledxbgKFHxxepOU=; b=t2hgpw/uGtr4avdX1AfbATA9wH
	3y6yRgcqbh4IUYmplsgcmJt6og0vbb07W9EYsmzRHizCsgt4skxmgmUQL2sIViAbc+fbDTSxLAc3i
	Ay/zZh2LO0dDtxJR7jW6NL09tQeCEQhtYHSozeeB4vD2J+aIlxX8QAccu0m5zroIULSiLZFY0onVg
	P9YQLSpCQ8wWSOKYWHusDDZ05kAQklNR/pFq4zbh3KXTQiyzTahLZ8QmUxu6gj9tNU58vdbbVBaxe
	TUxCqvNAe4UpTAnp2hVq+zh0wbwXwfrIODwWtmYlGDpzIUW1HPcA1N3y1Itbrzeh1b6E3k97lBdGO
	SHaMp1pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytgw-00000005JGd-17a5;
	Sat, 07 Mar 2026 15:35:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytgt-00000005JFt-3HRv;
	Sat, 07 Mar 2026 15:35:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 753C043E2F;
	Sat,  7 Mar 2026 15:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC06AC19422;
	Sat,  7 Mar 2026 15:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772897743;
	bh=RhsV1o0tx6qDW0oNLBHCTGUNLy9Nze20CKSCrkhYlSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O9RJ8MLJbnpuO7ZK/6PWRfHB1qsnnaavMYfpbJTU95QdDTTrXGNK2waRGplZ/SNCV
	 1jwaE5YWYpJb58W/RJAyHnMw1264Agd78+A7GsCqbNAQjG+OjWUwnR0z7IwmlpkV6n
	 y67g+L+emeLezYdrdXqpQYcc4YcHYlekIvCAvYDxzWnipFxQ1O+H6g2rHRkbo/LtmJ
	 XmieY7PiDV0buFrf7kjA0dZo4nyzEwdlCsp/QD+tgF3uxdskhbdxoMqVojEi8ObCeq
	 TmQrKX2BuoXNYgb2hXcIQHcISNqT68RRzTYa5HN1geElgqrcJrqv8t+LvpIHrOuLr6
	 e0RVIKWPoSfIg==
Date: Sat, 7 Mar 2026 16:35:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Collabora Kernel Team <kernel@collabora.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: synopsys: csi2rx: add support for rk3588
 variant
Message-ID: <20260307-gleaming-loose-boobook-d75820@quoll>
References: <20260305-rk3588-csi2rx-v1-0-0cd8d2bf28c0@collabora.com>
 <20260305-rk3588-csi2rx-v1-2-0cd8d2bf28c0@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305-rk3588-csi2rx-v1-2-0cd8d2bf28c0@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_073544_243283_7838877A 
X-CRM114-Status: GOOD (  14.97  )
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

On Fri, Mar 06, 2026 at 03:09:49PM +0100, Michael Riesch wrote:
> Add support for the RK3588 variant of the Synopsys MIPI CSI-2
> Receiver.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index 170346ae1a59..45ec815b0fba 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -609,6 +609,9 @@ static const struct of_device_id dw_mipi_csi2rx_of_match[] = {
>  	{
>  		.compatible = "rockchip,rk3568-mipi-csi2",
>  	},
> +	{
> +		.compatible = "rockchip,rk3588-mipi-csi2",

So device is fully compatible? Drop the entry then... or your bindings
patch is really not explained correctly.

Best regards,
Krzysztof


