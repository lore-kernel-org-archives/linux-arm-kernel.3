Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22B4C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 07:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CzAwD5rCWyW5vWK73YiaWDaddiilA3OZaGkOjADBvzY=; b=mjNSp/FHXGee2dvqSGWQ1W2/kG
	2H+sD9tjTqUJjN6bfzeORvtIy8XGGoX/iUl+jjSHxcYSHyHLmIyGupu/PiHTrnuwCR8fQceEcXt1s
	Xe5qJJg8asQP6EdVaVcSt/3e8W0kFfQATwu8WdkRLDBK6zz49uYtzA9XMAm3CjYYZ7ipZDCBqqugN
	uwaKp/vkZU2jMT1dl5DjuXc9ET5Bxt3DN4jWVmpAGGfOckBvY9cQPyflMj92VHM99ZkLOIk/S55or
	BA2mVfUY9bvJrMhzGmUvG0Z7aPAC4nbRxBZQHceS8VUfYO9LsO6BHrxkMIEWQfG/sw5D5JZM2FNB+
	a7SOySiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBrx-0000000C00c-1kBZ;
	Tue, 05 Aug 2025 07:13:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBgZ-0000000Byld-0ctI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 07:02:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D19360007;
	Tue,  5 Aug 2025 07:02:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697F9C4CEF4;
	Tue,  5 Aug 2025 07:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754377330;
	bh=WHyNbaTrvEEeFJm2Eyr27RbpKKVKpcYMFIZPyY6uqME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nz1Wy/tNdmSLGGe3aRRxM4HIvUDlcBHqOIlhzbdt3gXdgVTbEcS08oU0FC2XvHMSy
	 rD8IVkUMVELmCu+CQOAeyFVHsx5Qt5/1SK4Bx3khPc9zOJYggBsm0oKE3jMZKmXHzp
	 G19JTT3LLPOxvbO4FigHNeQF2fRsilDtQ6fJVPFUbNEce/AYxGkYOiE0oOS5yxR5jQ
	 T0vWNXgyoyT1XCwpeXS858QyMs5S7jbAzMFjpJy8AGOwQ2uB+wxCyvHAX7ZR9d7GZ/
	 Cd56Ha0JtINKPN7kf01psqFwdHqs4Qkir6QNViO8xQtFwtq/fWFzfxZ6PB/tupx+tW
	 n9RDnWxQPUDlw==
Date: Tue, 5 Aug 2025 09:02:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 2/7] dt-bindings: clock: imx8ulp: add SIM LPAV clock gate
 ID definitions
Message-ID: <20250805-natural-vulture-of-glamour-5fac8d@kuoka>
References: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
 <20250804155407.285353-3-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250804155407.285353-3-laurentiumihalcea111@gmail.com>
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

On Mon, Aug 04, 2025 at 11:54:02AM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add ID definitions for the clock gates managed by the SIM LPAV module.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  include/dt-bindings/clock/imx8ulp-clock.h | 7 +++++++
>  1 file changed, 7 insertions(+)

This is part of bindings patch.


> 
> diff --git a/include/dt-bindings/clock/imx8ulp-clock.h b/include/dt-bindings/clock/imx8ulp-clock.h
> index 827404fadf5c..ebebb4831761 100644
> --- a/include/dt-bindings/clock/imx8ulp-clock.h
> +++ b/include/dt-bindings/clock/imx8ulp-clock.h
> @@ -255,4 +255,11 @@
>  
>  #define IMX8ULP_CLK_PCC5_END		56
>  
> +/* LPAV SIM */
> +#define IMX8ULP_CLK_SIM_LPAV_HIFI_CORE		0
> +#define IMX8ULP_CLK_SIM_LPAV_HIFI_PBCLK		1
> +#define IMX8ULP_CLK_SIM_LPAV_HIFI_PLAT		2
> +
> +#define IMX8ULP_CLK_SIM_LPAV_END		3

Drop. Not a binding (see other discussions for many SoCs why).

Best regards,
Krzysztof


