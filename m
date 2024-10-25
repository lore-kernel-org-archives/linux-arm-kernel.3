Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D02AD149F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 23:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+LonYrIZEHor693r4mdE7TdXh7oFFBiZD+b7YxVtbo=; b=BR9UzdOw4A0MWbY3uf8r9Ew+4k
	5C+uE/LESw+orvjF2yXApT1HkLnhqMfkaf+WUSPG/4jrEUPLIqSwLqdJixjdiuxlxQrkq2jrXjGXB
	j1YxaHyUDB1ykTfyagqozBC/6KUmHiwqj2n2Vfoy4EHLOOQIEJjrBF49ri6eX9GWBV0kkkqaX7fic
	rNUieQnAPHheGRFlP/N81Tubz/b/SguiBoTI0uG/fir2oujVbu1o4mx3cOuvTcXEpKlEskVBRIT3w
	TZiRRtn1/naCcon4WSG6nxB2R2dJ0OP+ArUgmZBiEXo4M3wrmwW9FeE1rve323Mx3zSVW+fcoWspM
	SDleyQEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Tkh-00000005WiP-1RjW;
	Fri, 25 Oct 2024 23:29:55 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Tj7-00000005WXq-063n;
	Fri, 25 Oct 2024 23:28:18 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20cbca51687so22318845ad.1;
        Fri, 25 Oct 2024 16:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729898896; x=1730503696; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d+LonYrIZEHor693r4mdE7TdXh7oFFBiZD+b7YxVtbo=;
        b=ekr7XxNg1TdPyJaV3qDGDsH6/M7TElGexRdCbmNQ4LyOaNQbeSG4G0EYtz25BoUFcD
         Zliz516IxrTxLRGomNFmbcOO0Ajw5l+RUdPkXRWTwwpTjsn0fO1gD3pzBM/v+uuw7Yib
         tLhnxcN0c9+GyLXqjE18zo0PT5/7sSei67nNqO6WSZRbPo9cUrQRhRRjaGnRAM1B/o4R
         u6FPmT9Kx1cQUN7a13oEk3504s5mqaxUtylTEtt8KtUDvLjH1WPSvGTJcn5ggJqZv1wi
         +qa6kCQ3YnCKrlLsSEFBuSf8bw8aVjzxgT10JmWZLtGwp9igzWs6RzPjKW3jfCq4FPgG
         EaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729898896; x=1730503696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+LonYrIZEHor693r4mdE7TdXh7oFFBiZD+b7YxVtbo=;
        b=n5VJ9gRa/CWpcwm6C+AGgr/1+t4eb41CcwpZHZkolY45zfUw5XM6CCqICp6ABHS3CV
         bCyLK27ty4vOD4dQzsgwVPoOIyyMUnLM2V1EkMAN7rP8lfUy6QhGq1mO/dbzPPv6Op9L
         UYSH4jsZ1t6h1Y4CWvdrWj5Fjkmukshsvj0ul0nq6BqUi/IIXfYQrg8C6KBUPo+jRkoN
         XRtgq07dxHz4cu3/lN7GBTNoYiIdR7e2Ds8rzbamduZYPtmkLj+yZiGB5K4bW8EquOll
         +V5rtUi87NfQWpuk4L5MLR4DHhd93unD3AZu6q8RSKMin6+isavZQ/Cxm+1pxAUytEEF
         pG6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJXC+ykdtvCmcilMYSF5nsEbMVFFUZlQyQ09398Q6i8TJ5CNDW+iZHUcrNP6VlDF4I9dSyAVUNp2P3M9jqX5jn@lists.infradead.org, AJvYcCXgA2nZfFu3R6Xni0iESH4w17coVRmbq29mvUAryCKQZkomPMeQFGKzSUlVNXCMawzf/JczhnAabL02ntU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTUPfKSPNhnKLtvmzo0b5LWjqlhOV7iSLd9Dm45+hR3OSn6CK1
	pXGzM/0bbFZXqzc+S/GmcFlFkZm149WUt6eHdPqjUdvEV7txS1p+
X-Google-Smtp-Source: AGHT+IHamz0WczDVCsPc6CPqKdEhjI+8PIhVIRTWBbvo/nv2cWi0cJElpgaxLC3cRQCvUjNkV4uDYQ==
X-Received: by 2002:a17:903:2450:b0:20c:a692:cf1e with SMTP id d9443c01a7336-210c6c6ce1bmr13188725ad.43.1729898895779;
        Fri, 25 Oct 2024 16:28:15 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf6d6e7sm14383325ad.71.2024.10.25.16.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 16:28:15 -0700 (PDT)
Date: Sat, 26 Oct 2024 07:27:54 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/4] net: stmmac: Add glue layer for Sophgo SG2044 SoC
Message-ID: <22g3v2h52xjhhwxdgnte6mhhadjfds2vlxlwz7b7t2fa7jlty2@lwyumoromg3c>
References: <20241025011000.244350-1-inochiama@gmail.com>
 <20241025011000.244350-5-inochiama@gmail.com>
 <e00a0277-c298-47ba-9fdd-8f740f7490cc@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e00a0277-c298-47ba-9fdd-8f740f7490cc@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_162817_087037_8CC13C24 
X-CRM114-Status: GOOD (  28.18  )
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

On Fri, Oct 25, 2024 at 04:53:07PM +0200, Alexander Lobakin wrote:
> From: Inochi Amaoto <inochiama@gmail.com>
> Date: Fri, 25 Oct 2024 09:10:00 +0800
> 
> > Adds Sophgo dwmac driver support on the Sophgo SG2044 SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
> >  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> >  .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 109 ++++++++++++++++++
> >  3 files changed, 121 insertions(+)
> >  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> 
> [...]
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> > new file mode 100644
> > index 000000000000..8f37bcf86a73
> > --- /dev/null
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> > @@ -0,0 +1,109 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Sophgo DWMAC platform driver
> > + *
> > + * Copyright (C) 2024 Inochi Amaoto <inochiama@gmail.com>
> > + *
> 
> This empty line is redundant I guess?
> 
> > + */
> > +
> > +#include <linux/bits.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/phy.h>
> > +#include <linux/regmap.h>
> 
> Here should be alphabetical order.
> 

Thanks, I forgot to reorder it when adding new include.

> > +
> > +#include "stmmac_platform.h"
> > +
> > +struct sophgo_dwmac {
> > +	struct device *dev;
> > +	struct clk *clk_tx;
> > +};
> > +
> > +static void sophgo_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
> > +{
> > +	struct sophgo_dwmac *dwmac = priv;
> > +	long rate;
> > +	int ret;
> > +
> > +	rate = rgmii_clock(speed);
> > +	if (ret < 0) {
> 
> Did you mean `if (rate < 0)`?
> 

Yeah, it seems I forgot to modify it.

> > +		dev_err(dwmac->dev, "invalid speed %u\n", speed);
> > +		return;
> > +	}
> > +
> > +	ret = clk_set_rate(dwmac->clk_tx, rate);
> > +	if (ret)
> > +		dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
> 
> Don't you want to print the error code here?
> 
> 		"failed to set tx rate %lu: %pe\n", rate, ERR_PTR(ret));
> 

Thanks, it is more clear now.

> > +}
> > +
> > +static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
> > +				    struct plat_stmmacenet_data *plat_dat,
> > +				    struct stmmac_resources *stmmac_res)
> > +{
> > +	struct sophgo_dwmac *dwmac;
> > +	int ret;
> 
> Unused var.
> 
> > +
> > +	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
> > +	if (!dwmac)
> > +		return -ENOMEM;
> > +
> > +	dwmac->clk_tx = devm_clk_get_enabled(&pdev->dev, "tx");
> > +	if (IS_ERR(dwmac->clk_tx))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_tx),
> > +				     "failed to get tx clock\n");
> > +
> > +	dwmac->dev = &pdev->dev;
> > +	plat_dat->bsp_priv = dwmac;
> > +	plat_dat->flags |= STMMAC_FLAG_SPH_DISABLE;
> > +	plat_dat->fix_mac_speed = sophgo_dwmac_fix_mac_speed;
> > +	plat_dat->multicast_filter_bins = 0;
> > +	plat_dat->unicast_filter_entries = 1;
> > +
> > +	return 0;
> > +}
> 
> [...]
> 
> + see the build bot report.
> 
> Thanks,
> Olek


Thanks, I will fix it.

Regards,
Inochi

