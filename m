Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0DDCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 16:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8Ln0E2EYX0hgUtgTinZr9sxm74DUJHmYoPn7suZ91U=; b=QIRcI6AO5s5i2iWBXKvTaHI5pe
	Gq2woQbbbyxyP7hAcQYscTDwjuWbtKIYhGeZ1exBxG364FkZppZ3JJjAXt3h0aI+twQCC45Lv1Qn9
	3Wk4hP46eojfoZI+G0yCVhwju4JikZeqOmyjYpYTXDeyL/HCEcfFhalKGYzQO+veRmOS3cYTFJ9At
	bGsi/6wTTsoXlqAXHRtQccItG8rbHeXYW0jO1mCjq6y4OghO4J4P9cG5fAo1KEazYpAjWX/v/BABV
	4sE3/4826xVm3j5Jt4XrcditALAF2vTwtlz0evlhpnUpRGzdiDwge5g3zor7dPJ141zehcvMl7gva
	klFjWm5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNgW-0000000FUEN-29e8;
	Wed, 10 Sep 2025 16:28:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNgT-0000000FUBq-1R56
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 16:28:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B95F16F2;
	Wed, 10 Sep 2025 09:28:28 -0700 (PDT)
Received: from [10.57.5.181] (unknown [10.57.5.181])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1D1B73F63F;
	Wed, 10 Sep 2025 09:28:33 -0700 (PDT)
Message-ID: <0c04e952-0b11-4249-9588-85edd0859bfd@arm.com>
Date: Wed, 10 Sep 2025 17:28:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] coresight: cti: Use of_cpu_phandle_to_id for
 grabbing CPU id
Content-Language: en-GB
To: Alireza Sanaee <alireza.sanaee@huawei.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: coresight@lists.linaro.org, dianders@chromium.org,
 james.clark@linaro.org, jonathan.cameron@huawei.com, krzk@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linuxarm@huawei.com, mark.rutland@arm.com, mike.leach@linaro.org,
 robh@kernel.org, ruanjinjie@huawei.com, saravanak@google.com
References: <20250905161830.37-1-alireza.sanaee@huawei.com>
 <20250905161830.37-5-alireza.sanaee@huawei.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250905161830.37-5-alireza.sanaee@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_092837_421938_6DCBBADC 
X-CRM114-Status: GOOD (  13.53  )
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

On 05/09/2025 17:18, Alireza Sanaee wrote:
> Use the newly created API (of_cpu_phandle_to_id) to grab CPU ID.
> 
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>   .../hwtracing/coresight/coresight-cti-platform.c    | 13 +------------
>   1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
> index d0ae10bf6128..2629962dbe3e 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
> @@ -41,18 +41,7 @@
>    */
>   static int of_cti_get_cpu_at_node(const struct device_node *node)
>   {
> -	int cpu;
> -	struct device_node *dn;
> -
> -	if (node == NULL)
> -		return -1;
> -
> -	dn = of_parse_phandle(node, "cpu", 0);
> -	/* CTI affinity defaults to no cpu */
> -	if (!dn)
> -		return -1;
> -	cpu = of_cpu_node_to_id(dn);
> -	of_node_put(dn);
> +	int cpu = of_cpu_phandle_to_id(node, NULL, 0);
>   
>   	/* No Affinity  if no cpu nodes are found */
>   	return (cpu < 0) ? -1 : cpu;

Assuming this is going in via DT tree:

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Suzuki


