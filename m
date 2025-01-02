Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89890E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 11:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWWdQI5YGXL9JjfkAaD/HifjsZDxm5MvpsRItIGecwY=; b=bTC9np2cHxiowmckx7FsPLsFYy
	7FqQmYlI8oruH12STXgrFPXclOGAASfo23fkGhq4sFeMJVGbQJqHyS5tJd8GoM1QWwdCEnfBVY5rU
	j2yk3Ap8EVjaouGqvxgVAC9fOpyNxnGAw6+wPoXAXTaRbiqZEJcWgPyEDTIVjgBdhgN3/ZyEJ6T0/
	w/As5DLIBQA+y0UqiNs139Sz33aMf3MHIGBiUUEVeFYxVHMyOvYm0FDVBF7oQfQNEweIIXAIG/pk1
	myRj2Wq6bi+oXSeF/fhLCS+ALzjuLPxRH+CPWDv4Zwe2jW3cf/XLa49R/N6upS5x0YfuWXh0GMqhg
	gWTrNZKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJMu-0000000AFhl-0d8P;
	Thu, 02 Jan 2025 11:28:00 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJLk-0000000AFcD-3j9k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 11:26:50 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4YP4B014z9zrS7M;
	Thu,  2 Jan 2025 19:24:56 +0800 (CST)
Received: from kwepemd500014.china.huawei.com (unknown [7.221.188.63])
	by mail.maildlp.com (Postfix) with ESMTPS id D73471800D1;
	Thu,  2 Jan 2025 19:26:38 +0800 (CST)
Received: from [10.67.121.2] (10.67.121.2) by kwepemd500014.china.huawei.com
 (7.221.188.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Thu, 2 Jan
 2025 19:26:38 +0800
Message-ID: <677677ED.7060902@hisilicon.com>
Date: Thu, 2 Jan 2025 19:26:37 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <xuwei5@hisilicon.com>
Subject: Re: [PATCH] arm64: dts: hisilicon: Remove unused and undocumented
 "enable-dma" property
References: <20241115193454.3619297-1-robh@kernel.org>
In-Reply-To: <20241115193454.3619297-1-robh@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.2]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd500014.china.huawei.com (7.221.188.63)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_032649_116437_F1D40EBE 
X-CRM114-Status: GOOD (  13.48  )
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

Hi Rob,

On 2024/11/16 3:34, Rob Herring (Arm) wrote:
> Remove "enable-dma" property which is both unused in the kernel and
> undocumented. Most likely they are leftovers from downstream.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> index a589954c29e2..12f621cedf89 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> @@ -728,7 +728,6 @@ spi0: spi@f7106000 {
>  			reg = <0x0 0xf7106000 0x0 0x1000>;
>  			interrupts = <0 50 4>;
>  			bus-id = <0>;
> -			enable-dma = <0>;
>  			clocks = <&sys_ctrl HI6220_SPI_CLK>, <&sys_ctrl HI6220_SPI_CLK>;
>  			clock-names = "sspclk", "apb_pclk";
>  			pinctrl-names = "default";
> 

Thanks!
Since the "enable-dma" and "bus-id" both are not used by the pl022 driver,
when applying this patch, I have removed the "bus-id" and changed the 
commit message as well.

The detail is as following:
https://github.com/hisilicon/linux-hisi/commit/4a45f8c502a8b8a836c3c932a18d538856097ac7

Best Regards,
Wei

