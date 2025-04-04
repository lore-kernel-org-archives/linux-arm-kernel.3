Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEAEC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 11:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z43T4l7A4PrfzgvbE6N3TxBHJh80BO98O9Crvshgqys=; b=JlQl/vAcJU6P9Ya/+1dEkzhU5g
	XoBuHvMkDZGgBvnU0HLoNse08LbBsJtynwZz25K5DqCsoGPV7z+JiAUI+LBomaugoGT+cdDXeg8TC
	LvKcej4zzUFv5f/hy0Y57KEGn0OUgyoYoQzUP0mMBwTVfvHzf47nJIvXTfi3xFB2RHmzw2/S7eOUc
	sEJoXXygzW6ihAOuVyPhilK5sAb/CLJbcWufsHzp6+LMUojrtXVIQBSebmaOFbRf5ESt7xKySDUxL
	RPoE91Ynp/4zHaGdsp/UpyAa2vhSRIYJ7ZXOjoCuds73iVAAnQy81nPgwwn8wDeCwH0bgREi69Lzk
	wvA4qNRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0fKs-0000000BYrs-1NPL;
	Fri, 04 Apr 2025 11:35:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0fEh-0000000BYD0-2fjJ;
	Fri, 04 Apr 2025 11:29:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743766160;
	bh=OaVOtSqyswMnScAeHQjW6coYcRHBe1m1bBclYABbBIY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=aklubG7CZTZ4oD+B+o7ONUyn7kOhXbLT+OLgD0232dAFXRmAWl0xxXUw9UaMAYP3v
	 h2Bbx0o5hWUp81wI02AbBgifEtyUu9yVlk9ZR2P0mQOKIQrKZGys9Rhk3wxQgW1y+C
	 toUou7tP3zhdGxiQObKB1KqwS8W42Nri+FFPHbTIngBnAB46XLLidiT6v1dsYlHvlh
	 W8HXAG6CYJglmXVM4RAwwz4MevjjOp2ea/eTSaddIXeR+zsw7P9QL4S1U3yM7AzFgV
	 TVOv8DzH2xIFAwdXthRPAig4G9vUtqWC4rntz9ahaNFEiaebeaK+8BK1blD+CnJ2Hf
	 xYktL8Tz9tY5Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4F61E17E0215;
	Fri,  4 Apr 2025 13:29:20 +0200 (CEST)
Message-ID: <3e10ed93-dadb-4d0b-b419-28ea492a1603@collabora.com>
Date: Fri, 4 Apr 2025 13:29:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: mediatek: Do not enable MTK_SOCINFO by default
 during compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250404112359.255053-1-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250404112359.255053-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_042923_868976_7A350DF4 
X-CRM114-Status: GOOD (  11.78  )
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

Il 04/04/25 13:23, Krzysztof Kozlowski ha scritto:
> Enabling the compile test should not cause automatic enabling of such
> drivers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/soc/mediatek/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> index d7293977f06e..006214f8e5ee 100644
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig
> @@ -81,7 +81,7 @@ config MTK_SVS
>   
>   config MTK_SOCINFO
>   	tristate "MediaTek SoC Information"
> -	default y
> +	default ARCH_MEDIATEK
>   	depends on NVMEM_MTK_EFUSE
>   	select SOC_BUS
>   	help


