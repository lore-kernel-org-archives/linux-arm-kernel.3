Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D1ECF65DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xAe6f3N2n6bbqsz2DCjAXYNczPYRCiPzRDAZXc0IYt8=; b=J/nvrvpmLLEm2qMLXE7V9OBUQq
	Y75pv3sUBxL/6HbbCSVx37+UdVMZAyUjJAJNIkJfp7AgULU4mv5cjyZ1aa7T4XH3tpqlR9Cr/Xjl0
	o1O5X0JF2+dexEMjun1dMznxznTQa7z5UDrVGP0w2fBPwds83/JY5g+Vvw+S3Nwf/SCcxW66iHWf3
	jYLw0KaXWIA/deTZghebrdsAn+fc6HXxtKSLrbihUzYuf7G4AnotDe8nf/qOCSG9yT4GcANZfSN78
	3G39ysxL84nj+/ul9/rKwOjc8NCr94iuotXExnoHbfFeMHlGxFTjGOr+4tnuX0qXBzJpYWFUA2gnN
	rhg4eQ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLR1-0000000CUVp-1z1W;
	Mon, 26 Jan 2026 12:11:11 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLQy-0000000CUJH-1DhF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:11:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=xAe6f3N2n6bbqsz2DCjAXYNczPYRCiPzRDAZXc0IYt8=;
	b=sLcuE2prG4LYTvO7k6nsDzHaUg17oytddjyh0XMcu27j0O5VV+gybAFvXyBmghtRUzSF/aa/M
	CoiF2NP3bZ9FHsiskyrZepMk6tAqgQcBiCPtiWJeo+XjAYdhbk9w3RAx0B5LPSNU9ZFZRTyByFr
	Xbb/693FoRcaj7TV3O6xbME=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4f06g00Kytz1prKP;
	Mon, 26 Jan 2026 20:05:16 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id C7FCC404AD;
	Mon, 26 Jan 2026 20:08:44 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 26 Jan 2026 20:08:44 +0800
Received: from [10.67.112.52] (10.67.112.52) by kwepemq100003.china.huawei.com
 (7.202.195.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 26 Jan
 2026 20:08:44 +0800
Message-ID: <6977594B.4020902@hisilicon.com>
Date: Mon, 26 Jan 2026 20:08:43 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Shawn Lin <shawn.lin@rock-chips.com>, Ulf Hansson <ulf.hansson@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Jaehoon Chung
	<jh80.chung@samsung.com>, <xuwei5@hisilicon.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: hisilicon: hikey960/970: Convert to
 use standard mmc alias
References: <1769171049-74327-1-git-send-email-shawn.lin@rock-chips.com> <1769171049-74327-2-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1769171049-74327-2-git-send-email-shawn.lin@rock-chips.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.112.52]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq100003.china.huawei.com (7.202.195.72)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_041108_532587_03BBDCB5 
X-CRM114-Status: GOOD (  10.79  )
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

On 2026/1/23 20:24, Shawn Lin wrote:
> Convert the long-deprecated mshc alias to standard mmc alias.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

LGTM,

Reviewed-by: Wei Xu <xuwei5@hisilicon.com>

Thanks!
Best Regards,
Wei

> ---
> 
> Changes in v2: None
> 
>  arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 4 ++--
>  arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> index ed84ab9..c6056a8 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> @@ -20,8 +20,8 @@
>  	compatible = "hisilicon,hi3660-hikey960", "hisilicon,hi3660";
>  
>  	aliases {
> -		mshc1 = &dwmmc1;
> -		mshc2 = &dwmmc2;
> +		mmc1 = &dwmmc1;
> +		mmc2 = &dwmmc2;
>  		serial0 = &uart0;
>  		serial1 = &uart1;
>  		serial2 = &uart2;
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts b/arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts
> index 7c32f5f..65764b3 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts
> @@ -19,8 +19,8 @@
>  	compatible = "hisilicon,hi3670-hikey970", "hisilicon,hi3670";
>  
>  	aliases {
> -		mshc1 = &dwmmc1;
> -		mshc2 = &dwmmc2;
> +		mmc1 = &dwmmc1;
> +		mmc2 = &dwmmc2;
>  		serial0 = &uart0;
>  		serial1 = &uart1;
>  		serial2 = &uart2;
> 

