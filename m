Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE28D13594
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 07:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8PjK7JrwvWuHjH+qvYyQR84YqEMaoAAfaI/fV+EMY8=; b=LmQC0xHjtIy3fRhVAMvcVU6t2e
	NFKFys6LgmwfgtBc+v967rtMSRy6QthIRaxbaFgh1gSGzPvsZxMP2efAy2uYEK5CZj/GR5V54Y+Xw
	lmK0vHthJuKMqqLZ/xd85dNuDvtCyqB3ML1+7m4uHsFOwoUjV8NczUfcKHgiH0S9bKOHTGsJLNYPK
	cs+oDdRS4Ug5pnnQQuODALlMsQRVjgJyffhXxobn940P9kGRHacWEUb6mE//gQ6WkHjd5X3XIGSto
	m/HkDqpt+nkAQCoglBM4f9i26Kq0ntuy/ig9YRZJy/3udxeeucgbXPrg9K34RhUAjQBoxCookBPiG
	YWkP4V0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gYI-0000000DUIr-3abT;
	Tue, 29 Oct 2024 07:22:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gQD-0000000DSea-2pVk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 07:13:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D3CEC5C402B;
	Tue, 29 Oct 2024 07:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFBFC4CECD;
	Tue, 29 Oct 2024 07:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730186024;
	bh=yZacnLzwlmMaPMgCQVc6Cs2tFUW+rgsYqgTbJRGZhDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TL+Et39/oJkVZmxXRlBodyw+QeDCk90Ru9GXqsC/xpE7MVBpuY+PMpG9PzSBo1Hd4
	 EOX0DUAVQLaPlWzjdih9SCrNDmIdPIEEzPdHTHgop5Y/Ph7fMv5YJnAbDiRTtcL8WC
	 7rUEO2X/zMYuDueryjDhWYjFclRxCx+QUUlyjHyGcIo+ViuHQZZORr8b7ZMKysZ65/
	 aEeBErGoi/NhPwpJPTD0a7ZVPezKt4R4eilcO+qbNAzblgQDi9tKHPI/Y2pM6UpiTl
	 0mcIG6XlpW/yyFMOGTJyMZV+r1mbN7tVEMn/P6wMjlyPnRxdeA8ZzICum+/SlfGDWz
	 XcKZfURViRwsQ==
Date: Tue, 29 Oct 2024 08:13:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Subject: Re: [PATCH v4 14/16] net: stmmac: dwmac-s32: add basic NXP S32G/S32R
 glue driver
Message-ID: <xanb4j56u2rjwpkyj5gwh6y6t36gpvawph62jw72ksh7jximhr@cjwlp7wsxgp6>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-14-03618f10e3e2@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241028-upstream_s32cc_gmac-v4-14-03618f10e3e2@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_001345_778551_B66479F4 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Keyur Chudgar <keyur@os.amperecomputing.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Oct 28, 2024 at 09:24:56PM +0100, Jan Petrous (OSS) wrote:
> +	plat->init = s32_gmac_init;
> +	plat->exit = s32_gmac_exit;
> +	plat->fix_mac_speed = s32_fix_mac_speed;
> +
> +	plat->bsp_priv = gmac;
> +
> +	return stmmac_pltfr_probe(pdev, plat, &res);
> +}
> +
> +static const struct of_device_id s32_dwmac_match[] = {
> +	{ .compatible = "nxp,s32g2-dwmac" },
> +	{ .compatible = "nxp,s32g3-dwmac" },
> +	{ .compatible = "nxp,s32r-dwmac" },

Why do you need three same entries?

Best regards,
Krzysztof


