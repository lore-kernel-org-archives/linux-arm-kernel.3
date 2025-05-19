Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E7CC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 17:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUyCcOfCIf+2WqUBH26X/vT2c127e3sqHK+WEBFTQMk=; b=Qydsq17piJZOTsUJ5/oafE7UvT
	mWhLBvU5UX2f7JCMh7/IcEXpG+6NmD3ICo8XAhcCzqy3yEVKC49/e9FgRRIuNbtSpprIEBputI7Gs
	YLMYfLtE5P+YudYBfdvnYDKhWMivoy/y3MjMwBHtGZ8tQ2+6qrz3xkRe4O0pIqHquTQWsAr4naTm8
	9HEiziy/PYHv0qKWS1E4L0p9c6hZvIJLjdDdvmUnfamF8zPjmWXxOaJdCWHg6aDpZYZsm2q7pV97v
	EycF2v2rCpLWhEl9Oox0G7ZNRk/5I+g5QVKWgRcsukDBzZnH/PmYdE1wuo5bpqP0pZVbBeARo9zn+
	kMIPi3JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4eE-0000000A1Zm-2vyJ;
	Mon, 19 May 2025 17:51:34 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH41A-00000009vGX-0ByP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 17:11:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1747674670;
 bh=TUyCcOfCIf+2WqUBH26X/vT2c127e3sqHK+WEBFTQMk=;
 b=CRHCQhBKB3ZMYAIqvfykSQZBGaP2urEE6DPARoaaEzqSTKfQyNQ/LgMTkZY69//REF6Bqgyy9
 z+YDZAAcyOeLhATW5lN+jl1Lg1qLxQ1Pjy1AAp26vjcTKKDqLULBVQsdaLacD7lsM8fMl9gjsBn
 z8eXyvr0Kq9DUX/eDRslNC7B1kgNgCyuDAMNVD02gSXZGzuiadz4W81nVSc23HYIKe6V3zdLc8Z
 V3tA0T0FHAaP0mz/FNl0f4WHSbEdugKvy6MBYr/UFziou8BRIWY7aLj9NChE7NK6E9QmGYC2a9Y
 wLVqUx9ntbs2zWH2+brYQJeZidCOiqWrtGG4qodCVUZA==
X-Forward-Email-ID: 682b662cf094abf9f55ccb7b
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <e2220468-29b4-4c92-a153-c65db19fd270@kwiboo.se>
Date: Mon, 19 May 2025 19:11:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] pmdomain: rockchip: Add support for RK3528
To: Yao Zi <ziyao@disroot.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 linux-rockchip@lists.infradead.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250518220707.669515-1-jonas@kwiboo.se>
 <20250518220707.669515-3-jonas@kwiboo.se> <aCthtDxm25RU_fd3@pie.lan>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <aCthtDxm25RU_fd3@pie.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_101112_191891_B7F735D5 
X-CRM114-Status: GOOD (  19.65  )
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

On 2025-05-19 18:52, Yao Zi wrote:
> On Sun, May 18, 2025 at 10:06:49PM +0000, Jonas Karlman wrote:
>> Add configuration and power domains for RK3528 SoC.
>>
>> Only PD_GPU can fully be powered down. PD_RKVDEC, PD_RKVENC, PD_VO and
>> PD_VPU are used by miscellaneous devices in RK3528.
> 
> Thanks for your work!
> 
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> ---
>>  drivers/pmdomain/rockchip/pm-domains.c | 27 ++++++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>
>> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
>> index 4cce407bb1eb..242570c505fb 100644
>> --- a/drivers/pmdomain/rockchip/pm-domains.c
>> +++ b/drivers/pmdomain/rockchip/pm-domains.c
>> @@ -35,6 +35,7 @@
>>  #include <dt-bindings/power/rk3366-power.h>
>>  #include <dt-bindings/power/rk3368-power.h>
>>  #include <dt-bindings/power/rk3399-power.h>
>> +#include <dt-bindings/power/rockchip,rk3528-power.h>
>>  #include <dt-bindings/power/rockchip,rk3562-power.h>
> 
> But I had some trouble applying this patch on either Rockchip SoC tree
> or linux-pm. Looking through the context, seems the patch depends on
> some RK3562 PMU driver changes, which I couldn't find with some brief
> searching among the list.

Strange.

> 
> Which branch is the series based on?

My local branch was based on top of next-20250509 + latest
mmind/for-next (a95d16b0324b) merged.

Regards,
Jonas

> 
>>  #include <dt-bindings/power/rk3568-power.h>
>>  #include <dt-bindings/power/rockchip,rk3576-power.h>
>> @@ -216,6 +217,9 @@ struct rockchip_pmu {
>>  #define DOMAIN_RK3399(name, pwr, status, req, wakeup)		\
>>  	DOMAIN(name, pwr, status, req, req, req, wakeup)
>>  
>> +#define DOMAIN_RK3528(name, pwr, req)		\
>> +	DOMAIN_M(name, pwr, pwr, req, req, req, false)
>> +
>>  #define DOMAIN_RK3562(name, pwr, req, g_mask, mem, wakeup)		\
>>  	DOMAIN_M_G_SD(name, pwr, pwr, req, req, req, g_mask, mem, wakeup, false)
>>  
>> @@ -1215,6 +1219,14 @@ static const struct rockchip_domain_info rk3399_pm_domains[] = {
>>  	[RK3399_PD_SDIOAUDIO]	= DOMAIN_RK3399("sdioaudio", BIT(31), BIT(31), BIT(29), true),
>>  };
>>  
>> +static const struct rockchip_domain_info rk3528_pm_domains[] = {
>> +	[RK3528_PD_GPU]		= DOMAIN_RK3528("gpu",  BIT(0), BIT(4)),
>> +	[RK3528_PD_RKVDEC]	= DOMAIN_RK3528("vdec",      0, BIT(5)),
>> +	[RK3528_PD_RKVENC]	= DOMAIN_RK3528("venc",      0, BIT(6)),
>> +	[RK3528_PD_VO]		= DOMAIN_RK3528("vo",        0, BIT(7)),
>> +	[RK3528_PD_VPU]		= DOMAIN_RK3528("vpu",       0, BIT(8)),
>> +};
>> +
>>  static const struct rockchip_domain_info rk3562_pm_domains[] = {
>>  					     /* name           pwr     req     g_mask  mem wakeup */
>>  	[RK3562_PD_GPU]		= DOMAIN_RK3562("gpu",         BIT(0), BIT(1), BIT(1), 0, false),
>> @@ -1428,6 +1440,17 @@ static const struct rockchip_pmu_info rk3399_pmu = {
>>  	.domain_info = rk3399_pm_domains,
>>  };
>>  
>> +static const struct rockchip_pmu_info rk3528_pmu = {
>> +	.pwr_offset = 0x1210,
>> +	.status_offset = 0x1230,
>> +	.req_offset = 0x1110,
>> +	.idle_offset = 0x1128,
>> +	.ack_offset = 0x1120,
>> +
>> +	.num_domains = ARRAY_SIZE(rk3528_pm_domains),
>> +	.domain_info = rk3528_pm_domains,
>> +};
>> +
>>  static const struct rockchip_pmu_info rk3562_pmu = {
>>  	.pwr_offset = 0x210,
>>  	.status_offset = 0x230,
>> @@ -1538,6 +1561,10 @@ static const struct of_device_id rockchip_pm_domain_dt_match[] = {
>>  		.compatible = "rockchip,rk3399-power-controller",
>>  		.data = (void *)&rk3399_pmu,
>>  	},
>> +	{
>> +		.compatible = "rockchip,rk3528-power-controller",
>> +		.data = (void *)&rk3528_pmu,
>> +	},
>>  	{
>>  		.compatible = "rockchip,rk3562-power-controller",
>>  		.data = (void *)&rk3562_pmu,
>> -- 
>> 2.49.0
>>
> 
> Thanks for your effort,
> Yao Zi


