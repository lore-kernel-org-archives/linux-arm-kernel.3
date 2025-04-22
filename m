Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1310C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 08:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExZLetcvxE5cBA+S0eq35KtFXi1B8Hxv1YG9uHpMxOw=; b=zKtbnZLkwrA/5LhGambzNwqodh
	IKQTKTc4zyzIAXQ3rSZhaUjbypgV/X/VnGgLfdK2YhPUj6oysNIpLKxPaw/JOP06h9XkLzfFQyDtF
	Juvaudu9j7Ja1XQEYpgeXGYZGTrVH82kWV80OM05OZW5zfi8mSjEtQCwQYueqsuD3IbCQFWY3FQaZ
	eQtsxGwDnmRutR/bynDWPNxM1sTq60UcaYvRfvOfP0a0g798ytgUNAH+MXqHfYxWlltQdyNJto7wj
	aLiHh0WYDZ3eLhAZ4tx7PdpGjP3y9gCoc1qqGA/pQM0Q8D4Vy3v6E0SYps+UxVSALSTnSlhZJ3JIO
	Kfe7uQpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78ct-00000006EMu-0MzA;
	Tue, 22 Apr 2025 08:05:07 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77rG-000000065Yi-3YeM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 07:15:56 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ZhYMq1Pgcz2CdX1;
	Tue, 22 Apr 2025 15:12:23 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 11B3A1800B1;
	Tue, 22 Apr 2025 15:15:52 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 22 Apr 2025 15:15:51 +0800
CC: <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linuxarm@huawei.com>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 3/3] MAINTAINERS: Add hisilicon pmu json events under
 its entry
To: Junhao He <hejunhao3@huawei.com>, <peterz@infradead.org>,
	<mingo@redhat.com>, <acme@kernel.org>, <namhyung@kernel.org>,
	<mark.rutland@arm.com>, <alexander.shishkin@linux.intel.com>,
	<jolsa@kernel.org>, <irogers@google.com>, <james.clark@linaro.org>,
	<leo.yan@arm.com>, <john.g.garry@oracle.com>, <will@kernel.org>,
	<mike.leach@linaro.org>, <yangyicong@hisilicon.com>,
	<jonathan.cameron@huawei.com>
References: <20250418070812.3771441-1-hejunhao3@huawei.com>
 <20250418070812.3771441-4-hejunhao3@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <e5f55b03-8026-3042-6ce9-586b7f1dad2f@huawei.com>
Date: Tue, 22 Apr 2025 15:15:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20250418070812.3771441-4-hejunhao3@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_001555_040128_554860AF 
X-CRM114-Status: GOOD (  10.58  )
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

On 2025/4/18 15:08, Junhao He wrote:
> The all hisilicon pmu json events were missing to be listed there.
> 
> Signed-off-by: Junhao He <hejunhao3@huawei.com>
> Reviewed-by: James Clark <james.clark@linaro.org>

Acked-by: Yicong Yang <yangyicong@hisilicon.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 00ff21b955bc..bf9588a94919 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10474,6 +10474,7 @@ W:	http://www.hisilicon.com
>  F:	Documentation/admin-guide/perf/hisi-pcie-pmu.rst
>  F:	Documentation/admin-guide/perf/hisi-pmu.rst
>  F:	drivers/perf/hisilicon
> +F:	tools/perf/pmu-events/arch/arm64/hisilicon/
>  
>  HISILICON PTT DRIVER
>  M:	Yicong Yang <yangyicong@hisilicon.com>
> 

