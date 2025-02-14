Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5153DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 08:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0Q5CLE3xmQsx/TecE/GgWDTfFXm7q3j5ODUNh70GUc=; b=WwRzsI8qpR3bMYwSCcFvD2XB69
	UtTEVTFbJk++y+rcKS64TXYGUwD7hvbSs3z1zknVzXideAJnKciL6qq555g9gQfT7KXsJnv0xthtI
	T0E8wDt04kkczU01yVOM3POuUbdzUZk+2Zg8WrTGnZaUzH7PUJIm4wTUoOhJSd9e7tqMD1UJTvjbF
	Y98SA24zck60fCFrdYWlJToQ4GY+ekgAinWKs7mDbdXpoxd+k6BuYg4rSEc+PVQvdzn3g4n5zH2Kv
	w/gfumdqNOj8P5fxRRxtUe/gBBxNNqhTMLb0TFBFFqegyTDyIuBaxPQ03BufqV4x99k2bO4d2HhVe
	htx1TiPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tirPd-0000000EBgm-2Vwt;
	Fri, 14 Feb 2025 08:51:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tirN6-0000000EB7b-18u3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 08:48:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 484A55C4ACD;
	Fri, 14 Feb 2025 08:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D1EC4CED1;
	Fri, 14 Feb 2025 08:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739522907;
	bh=0CcrT2Wlm4tuiPUS1c1qxjhwtvUKk5Qd28xIn++aGYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mWqTQYPhLMpHVUAWn9+lI+WwXv0GpK5coz0IWSRGmVoS/yyOEqF8pXWKyTNwRgqq/
	 1yYbAjmPEQNjRC7EHElD6mCfhYSfQfeKjo5X1Y4g5xFupDNPXZXTNypGKrMipamTb1
	 WeqIo2Bh/57hrJCgyFW1ZJQfDFILZFVXKan3Da+owazDy0wetKYk5TxzM/+boRTfXs
	 rsT1hUclKurPzWFEBl7TNdESBly5X/B5JnD/XAMsISomqmsJ/rSi3BOZVvlCGWgrIm
	 MkShT8hiNcHdWxxHpBM+TJ4z1McfHV9kOcynn9oXnZGjBFrmEycJQ/Kt2U7cVs14bF
	 SoLtIXvTiC4XA==
Date: Fri, 14 Feb 2025 09:48:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wilson Ding <dingwei@marvell.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andrew@lunn.ch, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, salee@marvell.com, gakula@marvell.com
Subject: Re: [PATCH 2/4] [PATCH 2/4] reset: simple: Add support for Armada8K
 reset controller
Message-ID: <20250214-nimble-loutish-pronghorn-d0e3de@krzk-bin>
References: <20250214065833.530276-1-dingwei@marvell.com>
 <20250214065833.530276-4-dingwei@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250214065833.530276-4-dingwei@marvell.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_004828_358391_9E928EEF 
X-CRM114-Status: GOOD (  14.06  )
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

On Thu, Feb 13, 2025 at 10:58:31PM -0800, Wilson Ding wrote:
> Armada8k has one register for unit soft-reset configuration within the
> system controller register area.
> 
> Signed-off-by: Wilson Ding <dingwei@marvell.com>
> ---
>  drivers/reset/reset-simple.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
> index e4e777d40a79..a792b913e1b1 100644
> --- a/drivers/reset/reset-simple.c
> +++ b/drivers/reset/reset-simple.c
> @@ -183,6 +183,13 @@ static const struct reset_simple_devdata reset_simple_active_low = {
>  	.status_active_low = true,
>  };
>  
> +static const struct reset_simple_devdata reset_simple_armada8k = {
> +	.nr_resets = 32,
> +	.active_low = true,
> +	.status_active_low = true,
> +	.syscon_dev = true,
> +};
> +
>  static const struct of_device_id reset_simple_dt_ids[] = {
>  	{ .compatible = "altr,stratix10-rst-mgr",
>  		.data = &reset_simple_socfpga },
> @@ -203,6 +210,8 @@ static const struct of_device_id reset_simple_dt_ids[] = {
>  		.data = &reset_simple_active_low },
>  	{ .compatible = "sophgo,sg2042-reset",
>  		.data = &reset_simple_active_low },
> +	{ .compatible = "marvell,armada8k-reset",

Undocumented compatible.

Best regards,
Krzysztof


