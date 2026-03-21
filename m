Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA471099B54
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 06:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6XtsZWAGk48YVYztLl6cAEeAXe1IPKu+44shW3xOrgY=; b=h6JhHVqZeX11+73DbaJQolRs+9
	oJocMmBO7hB7853YwIpUrauvglOC23qU+G+xN1zkjs9GW5Jsj0jfECNoyCqZJEylWigRnCzTuk/5x
	gqzSQnXSq1JrH24li/30znVRRkkCWuDGtxH+AMrb4EYA/0NQyxJnRKBa6ppjxDdfJF8Cd636Coi8G
	dw5mGv+1LJCsZGisVXvchwxt3U7lZJjbl0nE5koDG8O8dDEjqQtRSEx4hS9jZtA3ZO6IsaPJ7jh5D
	by7QtfV38+tHmx2FlFWprZu61KS8QjLrRD3khYEVhwpyt4vzK9KqOQH8jE9D+Bd8G5QPJk1Sn4+Ro
	eQ426S5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3qC8-0000000EASX-2hQ4;
	Sat, 21 Mar 2026 06:52:25 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3qC5-0000000EARX-1uod
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 06:52:22 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=6XtsZWAGk48YVYztLl6cAEeAXe1IPKu+44shW3xOrgY=;
	b=bXlRLg4TwkHJ1RiyPirjTWfv5/n5S1rURH/vmeyW5+fGRIJyT/9Tn3N9jAjgAIOuIQ8tBZJXP
	znGmNesxk+8dCkNGKaXeT3O4ep0JEHioF+3VlwVUpvWyAAOHGftOFPTcGLKJcgwu2WqaiOXIbTT
	bNj3OjIPrtPri/qeurXk6iU=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fd92R746Kz12LFf;
	Sat, 21 Mar 2026 14:46:39 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id B41F940567;
	Sat, 21 Mar 2026 14:52:09 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 21 Mar 2026 14:52:09 +0800
Received: from [10.67.113.213] (10.67.113.213) by
 kwepemq100003.china.huawei.com (7.202.195.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 21 Mar 2026 14:52:09 +0800
Message-ID: <69BE4018.6020600@hisilicon.com>
Date: Sat, 21 Mar 2026 14:52:08 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Shawn Guo <shawnguo@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
	<xuwei5@hisilicon.com>
Subject: Re: [PATCH] arm64: dts: hisilicon: hi3798cv200: Add missing dma-ranges
References: <20260227072210.1350159-1-shawnguo@kernel.org>
In-Reply-To: <20260227072210.1350159-1-shawnguo@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.113.213]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq100003.china.huawei.com (7.202.195.72)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_235221_723357_1A6ADBF0 
X-CRM114-Status: GOOD (  12.45  )
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

Hi Shawn,

On 2026/2/27 15:22, Shawn Guo wrote:
> Reboot starts failing on Poplar since commit 8424ecdde7df ("arm64: mm:
> Set ZONE_DMA size based on devicetree's dma-ranges"), which effectively
> changes zone_dma_bits from 30 to 32 for arm64 platforms that do not
> properly define dma-ranges in device tree.  It's unclear how Poplar reboot
> gets broken by this change exactly, but a dma-ranges limiting zone_dma to
> the first 1 GB fixes the regression.
> 
> Fixes: 2f20182ed670 ("arm64: dts: hisilicon: add dts files for hi3798cv200-poplar board")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shawn Guo <shawnguo@kernel.org>
> ---
>  arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> index f6bc001c3832..2f4ad5da5e33 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> @@ -122,6 +122,7 @@ soc: soc@f0000000 {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0x0 0x0 0xf0000000 0x10000000>;
> +		dma-ranges = <0x0 0x0 0x0 0x40000000>;
>  
>  		crg: clock-reset-controller@8a22000 {
>  			compatible = "hisilicon,hi3798cv200-crg", "syscon", "simple-mfd";
> 

Applied to the HiSilicon arm64 dt tree.
Thanks!

Best Regards,
Wei

