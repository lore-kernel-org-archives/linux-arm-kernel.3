Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D15DC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 12:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Subject:To:MIME-Version:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=soa12xpDKYauQ81XHGDxr8sPbhIxAUt2rh6LK0gbPNk=; b=1gbowTlFA4kRoW1sVvyHa2vaE2
	t/sfrm2kDcW5kJEpCv6NsPCHJX+lfqVjAPswihQSVpS9EIv9L/lYHvoUt9Tbvv61HrnVVG3kHmTbA
	/YdYKEyXdNmMAfysOmiPMjNRxvZi+wO/9ju6riHBA4kNY0lpiVLJnHitJfgEDwnSraen+q6qqyKja
	xl+HsFjwUGZ3sqHDCbmmnzoFbbLPMRCNyoorTKEt2n7bP2gJCIeusPjhr/+fxNYpQ1qXMRj2GJCrl
	vrxkCdEJ7uj9DpmAAE13szKfggbcwjiUxZKbl5jqsfLQUKaa32OAYxYg57CuA7dNjZK9Wfws7DSoz
	MSIjYoOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuW8Z-00000005tO2-3hlO;
	Tue, 18 Mar 2025 12:33:39 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuW5m-00000005t7K-34Lr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 12:30:48 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ZHB0j2WWmzvWpW;
	Tue, 18 Mar 2025 20:26:45 +0800 (CST)
Received: from kwepemd500014.china.huawei.com (unknown [7.221.188.63])
	by mail.maildlp.com (Postfix) with ESMTPS id 99638140367;
	Tue, 18 Mar 2025 20:30:38 +0800 (CST)
Received: from [10.67.121.2] (10.67.121.2) by kwepemd500014.china.huawei.com
 (7.221.188.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 18 Mar
 2025 20:30:38 +0800
Message-ID: <67D9675D.6030001@hisilicon.com>
Date: Tue, 18 Mar 2025 20:30:21 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<coresight@lists.linaro.org>
Subject: Re: [PATCH] arm64: dts: hi3660: Add property for fixing CPUIdle
References: <20250310093708.9332-1-leo.yan@arm.com>
In-Reply-To: <20250310093708.9332-1-leo.yan@arm.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.2]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd500014.china.huawei.com (7.221.188.63)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_053046_953837_35402425 
X-CRM114-Status: GOOD (  11.02  )
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

Hi Leo,

On 2025/3/10 17:37, Leo Yan wrote:
> During CPU low power modes, ETM components will lose their context.  Add
> the "arm,coresight-loses-context-with-cpu" property to ETM nodes to save
> and restore ETM context for CPU idle states.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---

Applied to the HiSilicon arm64 dt tree.
Thanks!

Best Regards,
Wei

>  arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi
> index 79a55a0fa2f1..4c6a075908d1 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi
> @@ -17,6 +17,7 @@ etm@ecc40000 {
>  			clocks = <&crg_ctrl HI3660_PCLK>;
>  			clock-names = "apb_pclk";
>  			cpu = <&cpu0>;
> +			arm,coresight-loses-context-with-cpu;
>  
>  			out-ports {
>  				port {
> @@ -34,6 +35,7 @@ etm@ecd40000 {
>  			clocks = <&crg_ctrl HI3660_PCLK>;
>  			clock-names = "apb_pclk";
>  			cpu = <&cpu1>;
> +			arm,coresight-loses-context-with-cpu;
>  
>  			out-ports {
>  				port {
> @@ -51,6 +53,7 @@ etm@ece40000 {
>  			clocks = <&crg_ctrl HI3660_PCLK>;
>  			clock-names = "apb_pclk";
>  			cpu = <&cpu2>;
> +			arm,coresight-loses-context-with-cpu;
>  
>  			out-ports {
>  				port {
> @@ -68,6 +71,7 @@ etm@ecf40000 {
>  			clocks = <&crg_ctrl HI3660_PCLK>;
>  			clock-names = "apb_pclk";
>  			cpu = <&cpu3>;
> +			arm,coresight-loses-context-with-cpu;
>  
>  			out-ports {
>  				port {
> @@ -160,6 +164,7 @@ etm@ed440000 {
>  			clocks = <&crg_ctrl HI3660_PCLK>;
>  			clock-names = "apb_pclk";
>  			cpu = <&cpu4>;
> +			arm,coresight-loses-context-with-cpu;
>  
>  			out-ports {
>  				port {
> @@ -177,6 +182,7 @@ etm@ed540000 {
>  			clocks = <&crg_ctrl HI3660_PCLK>;
>  			clock-names = "apb_pclk";
>  			cpu = <&cpu5>;
> +			arm,coresight-loses-context-with-cpu;
>  
>  			out-ports {
>  				port {
> @@ -194,6 +200,7 @@ etm@ed640000 {
>  			clocks = <&crg_ctrl HI3660_PCLK>;
>  			clock-names = "apb_pclk";
>  			cpu = <&cpu6>;
> +			arm,coresight-loses-context-with-cpu;
>  
>  			out-ports {
>  				port {
> @@ -211,6 +218,7 @@ etm@ed740000 {
>  			clocks = <&crg_ctrl HI3660_PCLK>;
>  			clock-names = "apb_pclk";
>  			cpu = <&cpu7>;
> +			arm,coresight-loses-context-with-cpu;
>  
>  			out-ports {
>  				port {
> 

