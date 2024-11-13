Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9153D41C17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 08:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWsc/NGPBKbLunRB28228bKvgfTYrGKEsZc+DwIU9Lo=; b=bRBetwgerE3UDsD4ohDX3Zy0sl
	8Ejzzuu8NmuSqeIiV6B9CIII3ZDvw7HMuiFTh03YE9wm+dd42+TzhB01pyQLidNXQjoi8d7lNy7vm
	2wMLrHUSMFqUsLMuvWvzDemXQoKifHZKhv3/Ayi2dEJUs1R3bcY+REmMGHkh2+ZiylfXrcWl77shg
	kFWPx3+OrL7RilLTH1wv5UWe+YwQ5VJSf60lFTyVx459tGRNrv16w7ueMG3LUNZ4qUEiK9LOkiuaP
	2e1lCYz3/YnKzEaGJ0x+thpIPAMPKX7zODYE0DjsPawJc43IaDhwAcl7tbwpXKSLQxFEQpPhq4cXI
	WKhguZMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB95i-000000069MK-0wnn;
	Wed, 13 Nov 2024 08:51:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB93u-000000069BQ-0UXi;
	Wed, 13 Nov 2024 08:49:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731487755;
	bh=jSmParmBON0VgUFC+Mx/yo9mY1y/AlAIgrDz1AJ5hSw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mZUDjZ3AmomdyDvJ4r5PVRRRNhRCKWV6nCFN3WTbLIzKeLbeWAWWrYz2+A+xzwL/3
	 x8hSDVeuxFd0tbMq4TiP9ypb/mmiynaKGX/T5iHSDuHcVoJOCRXm+E8GAsCwfr/izi
	 PhICQ+oMRoklrhxETnUsijNTF/DbJDhIPj0fNXYZT8lLoHN4Cn+oucd8U/I7TC7kq/
	 D8AvoiD8EsqMtljqGWw5hjymtHAgKf4ezFM9vAYZkZHD/e0ba44cMVKxGcfdkI2IAC
	 eewotvWbtWFvuJqBUJ4OHMOWVAhUaj5UdRiUTax6LOrAkicDSyHse7YmhKjlqAXYlf
	 xpZEe041g3kyA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B31E817E1395;
	Wed, 13 Nov 2024 09:49:14 +0100 (CET)
Message-ID: <d5215862-2e46-48d2-9b12-2f59b78e0c59@collabora.com>
Date: Wed, 13 Nov 2024 09:49:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] PCI: mediatek-gen3: Remove unneeded semicolon
To: Yang Li <yang.lee@linux.alibaba.com>, matthias.bgg@gmail.com, kw@linux.com
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Abaci Robot <abaci@linux.alibaba.com>
References: <20241111010935.20208-1-yang.lee@linux.alibaba.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241111010935.20208-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_004918_360493_2F5EB4DA 
X-CRM114-Status: GOOD (  13.19  )
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

Il 11/11/24 02:09, Yang Li ha scritto:
> This patch removes an redundant semicolon.
> 
> ./drivers/pci/controller/pcie-mediatek-gen3.c:414:2-3: Unneeded
> semicolon
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11789
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/pci/controller/pcie-mediatek-gen3.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index f333afb92a21..be52e3a123ab 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -411,7 +411,7 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
>   		if (pcie->num_lanes > 1)
>   			val |= FIELD_PREP(PCIE_SETTING_LINK_WIDTH,
>   					  GENMASK(fls(pcie->num_lanes >> 2), 0));
> -	};
> +	}
>   	writel_relaxed(val, pcie->base + PCIE_SETTING_REG);
>   
>   	/* Set Link Control 2 (LNKCTL2) speed restriction, if any */



