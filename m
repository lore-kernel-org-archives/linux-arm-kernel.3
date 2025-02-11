Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CB7C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 03:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTIEVTb8WG6g/xYwFCZRA14WxKqhOtoX7+ICXbI2OMk=; b=y+k3C5yW7ZHIVAHqsV352VTf9R
	9sk9E0SH4Tc6SevuhlnpK6JuzmPKpES79BniKgFXvk1ShOezjvmfS+DZITvBibBmU4znGli+zeYhZ
	XWKsYxuN5R6vW5e5yvP3XTlXtC0frBdxgQa35DDHXTyPeEI0gbj+EjAktbV/a/bRLEhZ9dnaYfqKP
	ttJzXTgJL2LtBfQYt5m1SDStjvJfYuamYwONyyhCpNCrvdIzXBql44D4fI0qSHgb8kQaSO52QVahT
	ITOKKYFad0R4DmM1WlMZhyGNBEIPvbMAheDC2lm+Dd5uid8gbNnhreDd83QtQ96xpI3VaobNBnth5
	CkEFKFfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thgfj-00000002NF3-361u;
	Tue, 11 Feb 2025 03:10:51 +0000
Received: from mail-qt1-f171.google.com ([209.85.160.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1theQh-0000000226k-005x;
	Tue, 11 Feb 2025 00:47:12 +0000
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4679eacf2c5so51651041cf.0;
        Mon, 10 Feb 2025 16:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739234829; x=1739839629; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jTIEVTb8WG6g/xYwFCZRA14WxKqhOtoX7+ICXbI2OMk=;
        b=njmx7K13XudtyUI38Ns3JQf660DXAQtrLva4LiHFgTZR327waVH2jKC6iXD+jaY86x
         224OBakHWRdvXkZPm6UtVMaxny3wHPFY9eK/aPuqV4A1zWPNihCj/rLwrx8APPsgPSVB
         fjFlDlB/+CvieP+BNSGdX9JQ35Ge5IwadUZzTvRC9wq7f/Im9Lk6vk17+qgkpw8GUfPp
         KGLbqYXoYZIvYArQyQ6nsrkQm3iuemMfkUIWZlgH4xtU8PGOBWfTiWT06UMPUtqCob54
         55ERwbzA4GlkcteIh9i6XN4O+bF7CnE3AFSqiVOnttjBcfrfyCqdzDCewao8nQpUI4zA
         1GFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739234829; x=1739839629;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jTIEVTb8WG6g/xYwFCZRA14WxKqhOtoX7+ICXbI2OMk=;
        b=JOl5LaCL6+BNQBXYQXHEdC0dhPcdu0ppQ43Zuugq7flC6g43j3omU6up0VNjIb67ue
         hkqUfsPtAm0dU/HuwaJVMOMCjgnvbr64n2yr60XGICG7UrPayhM0mwn2FAx56ks8YYhN
         hnkelxtJ2Hepaie3Zqg/mYzkOH3UkSqN7rN6Zt1H748TDWwyCi2h3CnbqCgIsxjbRAYm
         j8zcaGqRLYZ1zlC960xL2wIdEAElqQrawK9Fep/v3Idz7tJERySD6CA+oI6GORLvJc8z
         XRYICIjn5yUp2kXLwujGSDfAYOvXQtHzjUT1M6mnqOKAgT7YGq307J3vDUA1biA7YfDV
         E02A==
X-Forwarded-Encrypted: i=1; AJvYcCXcMlscOwOMVjSXxFU2rz4BmCTg7dmR7bbrCb15Q3DFO3qluwMfnEIH1s6PYClQF/fnOJeLOCByokowWX1ht9xG@lists.infradead.org, AJvYcCXtUOgn++1iu2MHhE3i8FE8x0/pvHRt/ffw25ea8GF0PeQshSfTO46pY0BnefnM9U50LqHaKWe0kFZCh3k=@lists.infradead.org
X-Gm-Message-State: AOJu0YzhqT1ZZaJShYtmKuQL3IbqH8O5uFvsZ5azZuNN2b6IhjBCfVgI
	KvsSOAw6BQ7EXkZ+6PcY8SDjFDsrrFf9MAng9HRBHcc5RFYivwNS
X-Gm-Gg: ASbGncu/b2MFWuvNItkwaNHvoMXRN1YBNUfuJKXTnqGDYCP28TC6pvv0q/tu6GAXft0
	pzRExIgGd57EBMS5OXKiXEboAapSL+8VOLuZhdkdwZSdpZawd03VjYIR9c2m087yaAzx/WtoYWY
	t8L9eeI0u9OMDD7WEZ9OyF3b2VpBwSKBZ0k4l5/e+ZMkwh0mB1J9DEZeKk1FyP6dg3jG1oVkE+c
	ZRcqOxJjHFDN++tVkjI+vmNEuiYcXbTo6o3qILoJAEiv9qJopLhWlTH7F8/0Ne4uuY=
X-Google-Smtp-Source: AGHT+IHdTWiwpRzbdPuvlFEYzABE9ESxasKSuFHVRX5pGBvoEIPULEvUws7kobHnz0ZNoja0v14wbA==
X-Received: by 2002:a05:6214:dc7:b0:6d4:1e43:f3a5 with SMTP id 6a1803df08f44-6e4455f4e38mr268033066d6.13.1739234829280;
        Mon, 10 Feb 2025 16:47:09 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e459711533sm26289906d6.18.2025.02.10.16.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 16:47:08 -0800 (PST)
Date: Tue, 11 Feb 2025 08:47:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Jisheng Zhang <jszhang@kernel.org>, 
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Simon Horman <horms@kernel.org>, Furong Xu <0x1207@gmail.com>, 
	Serge Semin <fancer.lancer@gmail.com>, Lothar Rubusch <l.rubusch@gmail.com>, 
	Suraj Jaiswal <quic_jsuraj@quicinc.com>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v4 3/3] net: stmmac: Add glue layer for Sophgo
 SG2044 SoC
Message-ID: <uhup3bm6ez6kg7efvimy6rcthmqfcdkg2vmcwafqz33vouplfl@i25wn6q6c4h6>
References: <20250209013054.816580-1-inochiama@gmail.com>
 <20250209013054.816580-4-inochiama@gmail.com>
 <2379380.ElGaqSPkdT@fw-rgant>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2379380.ElGaqSPkdT@fw-rgant>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_164711_042522_280F3955 
X-CRM114-Status: GOOD (  29.46  )
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

On Mon, Feb 10, 2025 at 12:01:56PM +0100, Romain Gantois wrote:
> Hello Inochi,
> 
> On dimanche 9 février 2025 02:30:52 heure normale d’Europe centrale Inochi 
> Amaoto wrote:
> > Adds Sophgo dwmac driver support on the Sophgo SG2044 SoC.
> ...
> > --- /dev/null
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> > @@ -0,0 +1,105 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Sophgo DWMAC platform driver
> > + *
> > + * Copyright (C) 2024 Inochi Amaoto <inochiama@gmail.com>
> > + */
> > +
> > +#include <linux/bits.h>
> 
> It doesn't look like this include is used, could you please remove it?
> 

Thanks, I will. And I will add the miss header 
linux/clk.h and linux/module.h.

> > +#include <linux/mod_devicetable.h>
> > +#include <linux/phy.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include "stmmac_platform.h"
> > +
> > +struct sophgo_dwmac {
> > +	struct device *dev;
> > +	struct clk *clk_tx;
> > +};
> > +
> > +static void sophgo_dwmac_fix_mac_speed(void *priv, unsigned int speed,
> > unsigned int mode) +{
> > +	struct sophgo_dwmac *dwmac = priv;
> > +	long rate;
> > +	int ret;
> > +
> > +	rate = rgmii_clock(speed);
> > +	if (rate < 0) {
> > +		dev_err(dwmac->dev, "invalid speed %u\n", speed);
> > +		return;
> > +	}
> > +
> > +	ret = clk_set_rate(dwmac->clk_tx, rate);
> > +	if (ret)
> > +		dev_err(dwmac->dev, "failed to set tx rate %lu: %pe\n",
> 
> nit: shouldn't this be "%ld"?
> 

Yeah, it is my mistake, I will fix it.

> > +			rate, ERR_PTR(ret));
> > +}
> > +
> > +static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
> > +				    struct plat_stmmacenet_data *plat_dat,
> > +				    struct stmmac_resources *stmmac_res)
> > +{
> > +	struct sophgo_dwmac *dwmac;
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
> > +
> > +static int sophgo_dwmac_probe(struct platform_device *pdev)
> > +{
> > +	struct plat_stmmacenet_data *plat_dat;
> > +	struct stmmac_resources stmmac_res;
> 
> nit: I think adding "struct device *dev = &pdev->dev;" here would
> be better than repeating "&pdev->dev" later on.
> 

Thanks, I will change that.

> > +	int ret;
> > +
> > +	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "failed to get resources\n");
> 
> This error message is a bit too vague, maybe replace it with "failed to get 
> platform resources"?
> 

OK.

> > +
> > +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
> > +	if (IS_ERR(plat_dat))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat),
> > +				     "dt configuration failed\n");
> 
> This error message is a bit misleading IMO, I would replace it with
> something like "failed to parse device-tree parameters".
> 

OK.

> > +
> > +	ret = sophgo_sg2044_dwmac_init(pdev, plat_dat, &stmmac_res);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
> > +}
> > +
> > +static const struct of_device_id sophgo_dwmac_match[] = {
> > +	{ .compatible = "sophgo,sg2044-dwmac" },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, sophgo_dwmac_match);
> > +
> > +static struct platform_driver sophgo_dwmac_driver = {
> > +	.probe  = sophgo_dwmac_probe,
> > +	.remove = stmmac_pltfr_remove,
> > +	.driver = {
> > +		.name = "sophgo-dwmac",
> > +		.pm = &stmmac_pltfr_pm_ops,
> > +		.of_match_table = sophgo_dwmac_match,
> > +	},
> > +};
> > +module_platform_driver(sophgo_dwmac_driver);
> > +
> > +MODULE_AUTHOR("Inochi Amaoto <inochiama@gmail.com>");
> > +MODULE_DESCRIPTION("Sophgo DWMAC platform driver");
> > +MODULE_LICENSE("GPL");
> 
> Thanks,
> 
> -- 
> Romain Gantois, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



