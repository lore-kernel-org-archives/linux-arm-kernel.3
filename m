Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4B3E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 12:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObzuBtRvdTYYc5ZI72EO8xxEXcCsf9XtGeinrNeixuA=; b=1YLRDSVrNYduBwB2TAB2FEVutK
	J1m3LAunpLK0AQUD/RsOytHNR8bJBUww9YiwVmAz44XmJGTuXkQvOiFqRjmI11ostFDmpk8b8/9Na
	92NFdfSZdlQ8jGhB2wYPwDQw6W98DhKXtuorcCBl2toaq4vz3Y27NN5qAqqEIocDGpS6unGLd6C0v
	H0AvitddYSlO9GVYNKr+8ztb3228jOtm0vgnLbFLTDmad/DET6v3Syh+KsGtgIut7Zwg9LMKCYPQi
	lh4P/FfJjff2SitP22ukY/ucXwVSwxZkTVMcf7jswWwjrovejgRXYk3hA07waP8fD544Xl2STn+W8
	ok90MvKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKGfV-00000005Gfo-11E0;
	Sun, 08 Dec 2024 12:45:49 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKGeR-00000005GUL-1IXh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 12:44:45 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21628b3fe7dso11734985ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 04:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733661882; x=1734266682; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ObzuBtRvdTYYc5ZI72EO8xxEXcCsf9XtGeinrNeixuA=;
        b=DzsH2FligkCcErC58dCxYSv0QK7F2ynYNGzsSkt3OgTq9YgDIyZKf0uOJU7FmAhWRp
         N/fgahFlLsYAfdiC2CU/5f3TgOnDF/wzssD2k/eXnTpoZP49MMO1gYKOFIOulQbcXdg0
         tIxdE82FykheXYCDsOzglLUK+wv5/H7Fo+X6svOrQXrqXiwJHxzX3DC7vATIw7c7ked1
         6Xxr6No4R1uP56PRdHeuUpxbxM0NzV/3U1pot5HCwrwBw+rmy94ab759yjTYoa29iSQd
         /9k0AIMeePJ4k0JMvorN/ZVVRKAes83DOjtPjJP2hBlNRhnsONoDkiUnS0hpvR17L18R
         965Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733661882; x=1734266682;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ObzuBtRvdTYYc5ZI72EO8xxEXcCsf9XtGeinrNeixuA=;
        b=NZeuaKwL2Vtbeq1zZ4yeS2n5npZvkFNp7RFFJCzRLsOMQ7ZOb4sSlkF8rBXfuthvQX
         N4KtgCwyc5fByGDl61SJBPA73UJb5m3B+mGltQUybX8TJC9numtFyTGo27P/rPIZnZSb
         zDWu7PDodnkU7WQHMsGaBoaRWWCUMG52+qxJMMFKybCkz2KM8+lGCeR1hykjzHi/Staa
         621Q5lcRVkqrb8Aa5IBK78AcTwkROs8fmUb8F6TiqIKhazjDWPRkAiaFKyZUSCG/xUfM
         01XjHnBxYUlPRIYqIqRF2D3i6ol39XZvKUz7DWolxjSs1bT3T8HIiFhlZsT5IJs3BeGP
         2EIA==
X-Forwarded-Encrypted: i=1; AJvYcCWaRH7T2tuju9wR7Q4STRPs+KdrKKB8DolkpjBdT1rWBbw21ye8rJuQdVoKIJy8ef6vPjRpYjU6984CzYxYGXL+@lists.infradead.org
X-Gm-Message-State: AOJu0YxscHp90axODYFtMBKtw+xCk0rSp9yLgwa+71Te4I87lc4BMG/D
	dPmVIy3Thh0qOVjRi678sHBr93glnKc2VXTMWx272JcQh6BT0dABaNLEGqNeQg==
X-Gm-Gg: ASbGncs3sCNNY0YgWLE1HGWcpo+VVPSMb9M2XKiardGEstCPSAYjEYUiWaBMQyfL9+U
	1q9QptcxTW/ZFuYFLEkHclLNUCmwRF38xFaO2rJdUM1HLuwPK8EYaUL/ExaHUt79hpey61eGdcK
	K/xeyXXIrJHToXJ6vkmfE+fLAHvMwh/aGoIPURttZMrr1pXujIGKdrf6zAsL4C3I5dRTUoZVwkM
	v7w8E52L9RsGevbiUlUnO3cmTvn0r8DYDr/h4gk2WljN95cVyJeUQbs69I=
X-Google-Smtp-Source: AGHT+IFWStgtABEgXeuwa+0us5wTIZE6ArS1wlJLYxBQNATuRowJR77uhfkJK4Vk9aSU1pZvjciMaw==
X-Received: by 2002:a17:902:e5cd:b0:215:9a73:6c45 with SMTP id d9443c01a7336-21614d45334mr158926955ad.22.1733661882268;
        Sun, 08 Dec 2024 04:44:42 -0800 (PST)
Received: from thinkpad ([36.255.19.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21617531ba7sm39465845ad.106.2024.12.08.04.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 04:44:41 -0800 (PST)
Date: Sun, 8 Dec 2024 18:14:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] PCI: rockchip-ep: Fix error code in
 rockchip_pcie_ep_init_ob_mem()
Message-ID: <20241208124436.vicbi72xyomahp3s@thinkpad>
References: <Z014ylYz_xrrgI4W@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z014ylYz_xrrgI4W@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_044444_159890_F06BFAA1 
X-CRM114-Status: GOOD (  16.42  )
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

On Mon, Dec 02, 2024 at 12:07:22PM +0300, Dan Carpenter wrote:
> Return -ENOMEM if pci_epc_mem_alloc_addr() fails.  Don't return success.
> 
> Fixes: 945648019466 ("PCI: rockchip-ep: Refactor rockchip_pcie_ep_probe() memory allocations")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> ---
> v2: Update the git hash for the Fixes tag because the tree was rebased I guess.
> 
>  drivers/pci/controller/pcie-rockchip-ep.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/pcie-rockchip-ep.c b/drivers/pci/controller/pcie-rockchip-ep.c
> index 1064b7b06cef..34162ca14093 100644
> --- a/drivers/pci/controller/pcie-rockchip-ep.c
> +++ b/drivers/pci/controller/pcie-rockchip-ep.c
> @@ -784,6 +784,7 @@ static int rockchip_pcie_ep_init_ob_mem(struct rockchip_pcie_ep *ep)
>  						  SZ_1M);
>  	if (!ep->irq_cpu_addr) {
>  		dev_err(dev, "failed to reserve memory space for MSI\n");
> +		err = -ENOMEM;
>  		goto err_epc_mem_exit;
>  	}
>  
> -- 
> 2.45.2
> 

-- 
மணிவண்ணன் சதாசிவம்

