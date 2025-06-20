Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B650C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 12:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0C9MM4OsqgQiWdEyOemkFhKPHATIgnWheEh+BcMBbYc=; b=Kmc6Du7OMR/mCp2VV4zx5V589K
	A6/vQuaLA9RkxO9xlsuUKqskitaOGgECwGoxe5a9X+wG02RALKPrNRJty2aKhfWsfvbUd10I1Ydd1
	LkVvtMnmAUW2zpAIZagBJW9vLiJPDnDOP+d8OJXVqmdXiGycAusFP8HpiHaDDxA0AgZgCQDS3TrP/
	Sal2iq4awAnQlpSjvN+4S8G/I0pweaxV/ZG5n/tMHRmx2cjrKjWzMTVbN7nrwkDXZVQUYCjInuAOw
	H/WlK8SXG4+gGbl9NHbn1s+aLLqj1sIFoZI6uEOgRoQaE1hbqkne6ynuD+b74BYuCEEOA9lf9jv5I
	bE2VoQXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSaYI-0000000FXfc-48kg;
	Fri, 20 Jun 2025 12:09:02 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSaJR-0000000FVrP-1DZl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 11:53:43 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bNwmL1s95z6L5KT;
	Fri, 20 Jun 2025 19:51:14 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id BCA871402FE;
	Fri, 20 Jun 2025 19:53:32 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 20 Jun
 2025 13:53:31 +0200
Date: Fri, 20 Jun 2025 12:53:30 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Junhao He <hejunhao3@huawei.com>, <linuxarm@huawei.com>
CC: <suzuki.poulose@arm.com>, <james.clark@arm.com>, <leo.yan@arm.com>,
	<anshuman.khandual@arm.com>, <coresight@lists.linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jonathan.cameron@huawei.com>, <yangyicong@huawei.com>,
	<prime.zeng@hisilicon.com>
Subject: Re: [PATCH v2 1/3] coresight: tmc: Add missing doc of
 tmc_drvdata::reading
Message-ID: <20250620125330.00004fa7@huawei.com>
In-Reply-To: <20250620075412.952934-2-hejunhao3@huawei.com>
References: <20250620075412.952934-1-hejunhao3@huawei.com>
	<20250620075412.952934-2-hejunhao3@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_045341_476912_188A33CB 
X-CRM114-Status: GOOD (  14.06  )
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

On Fri, 20 Jun 2025 15:54:10 +0800
Junhao He <hejunhao3@huawei.com> wrote:

> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> tmc_drvdata::reading is used to indicate whether a reading process
> is performed through /dev/xyz.tmc. Document it.
> 
> Reviewed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> Signed-off-by: Junhao He <hejunhao3@huawei.com>
> ---
>  drivers/hwtracing/coresight/coresight-tmc.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 6541a27a018e..3ca0d40c580d 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -220,6 +220,7 @@ struct tmc_resrv_buf {
>   * @pid:	Process ID of the process that owns the session that is using
>   *		this component. For example this would be the pid of the Perf
>   *		process.
> + * @reading:	buffer's in the reading through "/dev/xyz.tmc" entry
Hi,

Perhaps reword:

"buffer is being read through "/dev/xyz.tmc" entry" or
"buffer read in progress through "/dev/xyz.tmc" entry"

I've not checked what this actually means - just looking at what you have here.

>   * @stop_on_flush: Stop on flush trigger user configuration.
>   * @buf:	Snapshot of the trace data for ETF/ETB.
>   * @etr_buf:	details of buffer used in TMC-ETR


