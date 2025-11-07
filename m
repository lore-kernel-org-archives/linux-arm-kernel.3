Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B005CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 13:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uu0ZIPjTa43YK4+3U5QZ0hdnOMvXgZP4iC41BlLcD3I=; b=0QWWpiIUC7nDAgZU/G4PvAIzoc
	q/Nfsw+bPhMRwFk9i3vPNHAmIbqRuR6wMtFoVgHQacBoJeA/hilKoBdW9RiY6nwtakCrIWQuC3S4w
	Ix3MW55qCi+J/y3JGjY4utipURiK47xFD9xfgK9eRpcv1ZVZPKyFr0qL9TizTGDBcsh6Yuoj+bLUQ
	vqdZHHjnj15Sz4v13DQsb8Cty3/LXfYF+atIxQfGNwJUqoY2y3FweQCIFR7D1W47nxgLB6fXu4WOK
	+/Wk8Go9oS/7Zqh8qpW3+A+CfodMkdGAXt1B/7wWcEsK/DrOwZumbv5/YUwvWWqb+Cb+msyofOhQW
	TsT7OZmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHMXC-0000000HPBs-2Y5f;
	Fri, 07 Nov 2025 13:29:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHMXA-0000000HPBR-2eJQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 13:29:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10EA61515;
	Fri,  7 Nov 2025 05:29:36 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85B043F63F;
	Fri,  7 Nov 2025 05:29:42 -0800 (PST)
Message-ID: <4f5ad681-b531-48a1-8fae-a0c3b5a51a29@arm.com>
Date: Fri, 7 Nov 2025 13:29:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: tpdm: remove redundant check for drvdata
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Tao Zhang <tao.zhang@oss.qualcomm.com>,
 Mao Jinlong <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251107-fix_tpdm_redundant_check-v1-1-b63468a2dd73@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251107-fix_tpdm_redundant_check-v1-1-b63468a2dd73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_052944_719416_416ADEEE 
X-CRM114-Status: GOOD (  14.33  )
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

On 07/11/2025 06:16, Jie Gan wrote:
> Remove the redundant check for drvdata data because the drvdata here already
> has been guarranted to be non-NULL.
> 
> Fixes: 350ba15ae187 ("coresight-tpdm: Add nodes for dsb msr support")
> Fixes: 8e8804145a46 ("coresight-tpdm: Add msr register support for CMB")

This doesn't need to be backported as such, as it is a cleanup. I will 
drop the Fixes tag and merge this.

Suzuki

> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-tpdm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index 0e3896c12f07..06e0a905a67d 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -1402,11 +1402,11 @@ static int tpdm_probe(struct device *dev, struct resource *res)
>   		if (ret)
>   			return ret;
>   
> -		if (drvdata && tpdm_has_dsb_dataset(drvdata))
> +		if (tpdm_has_dsb_dataset(drvdata))
>   			of_property_read_u32(drvdata->dev->of_node,
>   					     "qcom,dsb-msrs-num", &drvdata->dsb_msr_num);
>   
> -		if (drvdata && tpdm_has_cmb_dataset(drvdata))
> +		if (tpdm_has_cmb_dataset(drvdata))
>   			of_property_read_u32(drvdata->dev->of_node,
>   					     "qcom,cmb-msrs-num", &drvdata->cmb_msr_num);
>   	} else {
> 
> ---
> base-commit: df5d79720b152e7ff058f11ed7e88d5b5c8d2a0c
> change-id: 20251107-fix_tpdm_redundant_check-a5a7bad4b7c8
> prerequisite-change-id: 20251028-add_static_tpdm_support-1f62477857e2:v4
> prerequisite-patch-id: eda8dd6884b831cb10affc22477aece39c78b408
> prerequisite-patch-id: 7beb8b17d54ff21bc57eab10b56e6ffcfa4d1963
> prerequisite-patch-id: f6f1e78dba3f1d3b1191ab827adab5a3b7b2326a
> 
> Best regards,


