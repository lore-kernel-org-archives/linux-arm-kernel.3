Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACB0CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 18:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+ZroGpNdJmwln/9q6Kw/hEokSx6KAAuSZ3AUY/4HU0=; b=wj1fR6/jhcLiS8yNQZtZrl7l4U
	8kHXrS8zzszctjlLPJWa6VmcyRdzH9cO2sNI3j7bV9irTsKalQL1LFY+tU6hBWPjtvSJWZZY//T4X
	n6PMrLF+ZFNH1QuQPlaGYhlG8UtuRBG71EPpzp2vFQ78cvvTP6fGeCXICPPcLjzevjQp0hUf4b0Jy
	QVmO4/YLTjF+L8nous6h9ypyRN8HjL3BHbxvZ/L+9hhEW22tw2Hfug1ljo5mormuDMoOeKcOHaklf
	lgWe/SYryUPuhmGIk0BUPC96E2jQjLndPjwJ+xjtp8kbP3yUqhaDuj+Cj4alBmt4VuOyTS+da8KFW
	sYUH3tJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umzMV-00000003GhB-1C2r;
	Fri, 15 Aug 2025 18:41:11 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxZR-000000030Ui-1ZGw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 16:46:26 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2445811e19dso18029675ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 09:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1755276384; x=1755881184; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G+ZroGpNdJmwln/9q6Kw/hEokSx6KAAuSZ3AUY/4HU0=;
        b=dgmKVkt7aU5mdmkjFVFyFpEC76VZ+kj1FG401ba+KB7J71ZGUHqEx45QeFTFCQWXGa
         qlenYHmKJ808YuzSYHXc2N1aslbk/7BDQzs9/uIy1N3p5qQ/4yk1Iaz1bCSCHAjD+ECE
         FWQTzYzgBB0cp+VZpwdMPtcuIA5a8zd/5sgrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755276384; x=1755881184;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+ZroGpNdJmwln/9q6Kw/hEokSx6KAAuSZ3AUY/4HU0=;
        b=dOetWqtzzxriOMGFMJA3HIWa0I4bFH/MqIHhzzNPlIT/A97OROYdcIfVEr6+oG5BbB
         HQQlLq38Qb+mjPdbC6Dieswb+pAf/Rn5A1E7YlGgPMLqMGwaK8wUUO9HKi0z/+k4b1aB
         4gR8jy2yqSd3c4CdJJar/fZauYelXN7peC9Ej3iv/q+sC1s0VadSxakm2gQVjE7BT0G+
         0NzV8NqSKOMwO3teO/ut1xsMca+sHnNZ1TYYLe4FjNQo+Efmx+u15h7zcrj5RzP4lq48
         VwGD6CryMwgBKIPi1M/Gpv8WxsOVt7f/psrrcZSuCgynf0/jcJu4LSHIfYNODS1wmZ1a
         aHxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ3Q2tG6PoOiFqkU4/U7lNc4A56uCIJEyCfW1rmrsTJf2Xbwvm84P0h0wiQzQXrgfa4RSuvwb1TTgu9M2vEL25@lists.infradead.org
X-Gm-Message-State: AOJu0YyEVtvBKK2EE8xmI9IfXDYDdvFsOVSgN0v1eSs3oCOycqSORMr7
	NG5+NGpuZSCQiirGZCQCVKPamQb3B8tlDEvVlzcboe3JXATbjPY3UzQ0ycTbwMnvDw==
X-Gm-Gg: ASbGncvAJ5X9WlP62ZlCAYW/qpAgGUMc8ySQj5q0pMZV4sV3szi5+9R58Dp8yLVcUXW
	6ICVqZbsfUvec1HafGHthDXAGHQkSsIcWgcRySkUwBCdD5a8DlXohfOT4u/UVqKipralFSmFxIR
	jt0QZ4D/SnFrf6JLW5nmCFwIf9+BDc5LeALhgGlgvgLkyETIRezmdsZpJ1zijP2UxXQmsQJWIXj
	O0ncUWQKPVcIrkUT0FCDP0cOAhWUuurJDB9P+EuqkKI0mTCk2qNGRw/TRaf2LUGpZ0l9hQsaar+
	b+Drh5ZUg3R91+BxaMcuGtbu2/9/Wo+j15/FUx5YGCs9u5zzvc61BH5/OW7GsAE6TOiQyKu3H1P
	6CJD1AlM0IiVkyl1pnyK/Vq8twg9+B+xqs5n/CGD0Ff5IpztLzWUAzdnVWIi0zr8JxQ==
X-Google-Smtp-Source: AGHT+IGaD7NipiYs8pCnXLAQK1a0gZQDqVBrHWQuhpKPItWLuIo1KSHzmEWzXChNb0FI2lLCfCq27w==
X-Received: by 2002:a17:902:cece:b0:234:f4da:7eeb with SMTP id d9443c01a7336-2446d5af738mr48517595ad.7.1755276384349;
        Fri, 15 Aug 2025 09:46:24 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d56d5bbsm17558665ad.147.2025.08.15.09.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Aug 2025 09:46:23 -0700 (PDT)
Message-ID: <79711a6c-8b59-43c9-bbbc-369be1608a49@broadcom.com>
Date: Fri, 15 Aug 2025 09:46:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: scmi: Add quirk to disable checks in
 scmi_dev_used_by_cpus()
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, james.quinlan@broadcom.com,
 Sudeep Holla <sudeep.holla@arm.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Peng Fan <peng.fan@nxp.com>, Mike Tipton <quic_mdtipton@quicinc.com>,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
References: <20250814225155.3519000-1-florian.fainelli@broadcom.com>
 <aJ7rBgce5eWSkkk3@pluto>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <aJ7rBgce5eWSkkk3@pluto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_094625_578915_7C3FD353 
X-CRM114-Status: GOOD (  39.35  )
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

On 8/15/25 01:08, Cristian Marussi wrote:
> On Thu, Aug 14, 2025 at 03:51:55PM -0700, Florian Fainelli wrote:
>> Broadcom STB platforms were early adopters of the SCMI framework and as
>> a result, not all deployed systems have a Device Tree entry where SCMI
>> protocol 0x13 (PERFORMANCE) is declared as a clock provider, nor are the
>> CPU Device Tree node(s) referencing protocol 0x13 as their clock
>> provider.
>>
>> Leverage the quirks framework recently introduce to match on the
>> Broadcom SCMI vendor and in that case, disable the Device Tree
>> properties checks being done by scmi_dev_used_by_cpus().
>>
> 
> Hi,
> 
>> Suggested-by: Cristian Marussi <cristian.marussi@arm.com>
>> Fixes: 6c9bb8692272 ("cpufreq: scmi: Skip SCMI devices that aren't used by the CPUs")
>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>> ---
>>   drivers/cpufreq/scmi-cpufreq.c     | 13 +++++++++++++
>>   drivers/firmware/arm_scmi/quirks.c |  2 ++
>>   drivers/firmware/arm_scmi/quirks.h |  1 +
>>   3 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
>> index ef078426bfd5..80647511d3c3 100644
>> --- a/drivers/cpufreq/scmi-cpufreq.c
>> +++ b/drivers/cpufreq/scmi-cpufreq.c
>> @@ -22,6 +22,8 @@
>>   #include <linux/types.h>
>>   #include <linux/units.h>
>>   
>> +#include "../drivers/firmware/arm_scmi/quirks.h"
>> +
> 
> I will post a patch to move this header up to avoid the uglyness of this
> include....

Sounds good, thanks!

> 
>>   struct scmi_data {
>>   	int domain_id;
>>   	int nr_opp;
>> @@ -34,6 +36,7 @@ struct scmi_data {
>>   static struct scmi_protocol_handle *ph;
>>   static const struct scmi_perf_proto_ops *perf_ops;
>>   static struct cpufreq_driver scmi_cpufreq_driver;
>> +static bool __maybe_unused scmi_cpufreq_dt_props_check_disable;
>>   
> 
> Not sure why you introduce an intermediate global bool to check...this
> defeats a bit the whole idea of the quirks framework which is based on
> static_keys and is supposed to be mostly transarent when quirks are not
> enabled....
> 
> Couldn't you just move the quirk inside the get_rate ?

Yes, I just had not realized that the execution of the quirk was already 
conditional, so it makes sense not to need any intermediate boolean.

> (maybe I am missing something around compiler behaviours..)
>   
> #define QUIRK_SCMI_CPUFREQ_CHECK_DT_PROPS		\
> ({							\
> 	if (true)					\
> 		return true;				\
> })
> 
>>   static unsigned int scmi_cpufreq_get_rate(unsigned int cpu)
>>   {
>> @@ -400,6 +403,9 @@ static bool scmi_dev_used_by_cpus(struct device *scmi_dev)
>>   	struct device *cpu_dev;
>>   	int cpu, idx;
>>   
> 
> +	SCMI_QUIRK(scmi_cpufreq_no_check_dt_props, QUIRK_SCMI_CPUFREQ_CHECK_DT_PROPS);
> 
>>   	if (!scmi_np)
>>   		return false;
>>   
>> @@ -427,12 +433,19 @@ static bool scmi_dev_used_by_cpus(struct device *scmi_dev)
>>   	return false;
>>   }
>>   
>> +#define QUIRK_SCMI_CPUFREQ_CHECK_DT_PROPS			\
>> +	({							\
>> +		scmi_cpufreq_dt_props_check_disable = true;	\
>> +	})
>> +
>>   static int scmi_cpufreq_probe(struct scmi_device *sdev)
>>   {
>>   	int ret;
>>   	struct device *dev = &sdev->dev;
>>   	const struct scmi_handle *handle;
>>   
> 
>> +	SCMI_QUIRK(scmi_cpufreq_no_check_dt_props, QUIRK_SCMI_CPUFREQ_CHECK_DT_PROPS);
>> +
> 
> ...removing this of course
> 
>>   	handle = sdev->handle;
>>   
>>   	if (!handle || !scmi_dev_used_by_cpus(dev))
>> diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
>> index 03960aca3610..aafc7b4b3294 100644
>> --- a/drivers/firmware/arm_scmi/quirks.c
>> +++ b/drivers/firmware/arm_scmi/quirks.c
>> @@ -171,6 +171,7 @@ struct scmi_quirk {
>>   /* Global Quirks Definitions */
>>   DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
>>   DEFINE_SCMI_QUIRK(perf_level_get_fc_force, "Qualcomm", NULL, "0x20000-");
>> +DEFINE_SCMI_QUIRK_EXPORTED(scmi_cpufreq_no_check_dt_props, "brcm-scmi", NULL, "0x2");
> 
> Also, are you sure about using version as "0x2" ? That is supposed to
> indicate the (optional) SCMI FW Version to which this quirk will
> apply...and with that it means whatever FW versioning you use in
> Broadcom to identify build versions....it is NOT the SCMI Protocol
> Version, so that also means that if/when you will change the advertised
> version, this quirk wont apply anymore...or equally if there are older
> version than 0x2 that are buggy they wont be quirked...

It's a good point, we should actually be matching on <= 0x2

> 
> One more doubt I have (despite me having suggested this solution) is
> that here you are quirking against a malformed deployed DT really,
> not against some SCMI FW anomaly in the Broadcom FW, but using the
> SCMI Quirks framework you are tying the quirk to the SCMI FW Vendor
> and maybe some specific SCMI FW Version....

Yes that is a very good point, maybe that's abusing the quirks framework 
so to speak.

> 
> ...so what will happen when you will update/fix your DT in the future ?
> Will you also take care to bump the BRCM SCMI FW version to disable the
> quirk in the DT deployed by your FW binary ?

Yes we would bump the version number to indicate that the Device Tree 
has always been fixed, both go hand in hand on our platforms. Or, as I 
suggested privately to address the stable back ports, maybe it would be 
better to do something like this:

@@ -430,6 +428,14 @@ static bool scmi_dev_used_by_cpus(struct device 
*scmi_dev)
                         return true;
         }

+       /* Older Broadcom STB chips had a "clocks" property that did not 
match
+        * the SCMI performance protocol Device Tree node, if we got 
there, it
+        * means we had such an older Device Tree, therefore return true in
+        * the interest of preserving backwards compatibility.
+        */
+       if (of_machine_is_compatible("brcm,brcmstb"))
+               return true;
+
         return false;
  }


which would be more in line with checking the Device Tree only, and it 
would also allow for unmodified backports to reach the stable trees. 
Contrary to what I suggested privately however, this check is done 
later, so we leave a chance for properly formed DT to return "true" 
earlier on.

What do you think? I am now leaning more towards that solution that 
leveraging the quirks as I agree it is somewhat unrelated.

Thanks!
-- 
Florian

