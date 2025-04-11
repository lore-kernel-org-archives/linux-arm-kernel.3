Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BB6C369AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XRKNWIzvy96fYcVAhsLmjafMleyO8ygwXlM7kcdyAM=; b=HBFE/ESmCxoeIIZDi4ROvz1DaX
	lvJ4ycaCyWq8sz3TqJN576NwU6Cj0jPr5Lf7jxxgJfg6Ec55/kuvBFmybp3jTCuSu6l54Ls1c/btF
	mXEaWB1Uvz6y40edkn8XkQxsUWKKyprhMkgfgvyKZo0l0Bnr0JLrgtrc5xgJq6K0jJVew5z/85Dt8
	xO5WHui4evepBjSj8P5jn2G1N/NjG62x5lUlCDk40tTDiabfTye6bbEiCGFTTVJ5zsURDuBShE1fe
	vLl9umtQulJEKkSbIXxC4cunDTGVciczYzwt2uV0srZ3nceLubrCfVoq/9PlgeikkLKSeQmBj2dl8
	4qeaoHYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3GFx-0000000EEYe-1hzr;
	Fri, 11 Apr 2025 15:25:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3GDa-0000000EEH1-1Ufm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 15:22:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8EA456845B;
	Fri, 11 Apr 2025 15:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30DF2C4CEE9;
	Fri, 11 Apr 2025 15:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744384977;
	bh=5VH+Kw5uc61DtQBWYw5PyM1LgNGGDqiUvj3mP4vtzho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jFF9wtRULrrQbnny31jmOpzUAXpNXxVUrIbTKxxkZqGvmmTdqSj91KKl6NkPMNhHc
	 ofnKGdxbM4RHHURb4B9U204zCVx1plMNxKPefqEYWeCd5fQ4ZT2VaiUNyCfrMvhY6W
	 BNnCA7cgDNLjfMIk0zMTEKGpCe+k0h8yXGwyZ38B4clA9A7buKm34VNETzfBJOR2gH
	 VyYG1on5KELT6IABs0XHhehlnP5fl4fUF3iiOSnPmhxxbWH3wU4EAttnWDBXVwln1K
	 JyAXDEMgbP65kUhawrPNSRo4ksd0PAxzd+aE8QBgjkCVtzVxvnaVtTLbS8RbnaaMrb
	 bejGVLTBzQdoQ==
Date: Fri, 11 Apr 2025 10:22:56 -0500
From: Rob Herring <robh@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/6] arm64: dts: imx8mp: add aipstz-related definitions
Message-ID: <20250411152256.GA3270148-robh@kernel.org>
References: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
 <20250408154236.49421-6-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408154236.49421-6-laurentiumihalcea111@gmail.com>
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

On Tue, Apr 08, 2025 at 11:42:35AM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add header file with AIPSTZ-related definitions: consumer types,
> master/peripheral configuration bits, and master ID definitions.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-aipstz.h | 39 +++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
> new file mode 100644
> index 000000000000..b816cb6ee9d0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#ifndef __IMX8MP_AIPSTZ_H
> +#define __IMX8MP_AIPSTZ_H
> +
> +/* consumer type - master or peripheral */
> +#define IMX8MP_AIPSTZ_MASTER 0x0
> +#define IMX8MP_AIPSTZ_PERIPH 0x1
> +
> +/* master configuration options */
> +#define IMX8MP_AIPSTZ_MPL (1 << 0)
> +#define IMX8MP_AIPSTZ_MTW (1 << 1)
> +#define IMX8MP_AIPSTZ_MTR (1 << 2)
> +#define IMX8MP_AIPSTZ_MBW (1 << 3)
> +
> +/* peripheral configuration options */
> +#define IMX8MP_AIPSTZ_TP (1 << 0)
> +#define IMX8MP_AIPSTZ_WP (1 << 1)
> +#define IMX8MP_AIPSTZ_SP (1 << 2)
> +#define IMX8MP_AIPSTZ_BW (1 << 3)
> +
> +/* master ID definitions */
> +#define IMX8MP_AIPSTZ_EDMA 0 /* AUDIOMIX EDMA */
> +#define IMX8MP_AIPSTZ_CA53 1 /* Cortex-A53 cluster */
> +#define IMX8MP_AIPSTZ_SDMA2 3 /* AUDIOMIX SDMA2 */
> +#define IMX8MP_AIPSTZ_SDMA3 3 /* AUDIOMIX SDMA3 */
> +#define IMX8MP_AIPSTZ_HIFI4 5 /* HIFI4 DSP */
> +#define IMX8MP_AIPSTZ_CM7 6 /* Cortex-M7 */
> +
> +/* helper macros */
> +#define IMX8MP_AIPSTZ_HIFI4_T_RW_PL					\
> +	IMX8MP_AIPSTZ_MASTER						\
> +	IMX8MP_AIPSTZ_HIFI4						\
> +	(IMX8MP_AIPSTZ_MPL | IMX8MP_AIPSTZ_MTW | IMX8MP_AIPSTZ_MTR)

Drop this. 1 define per value. Combining these makes the .dts look 
wrong.

Rob

