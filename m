Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5AAFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yU5fi/v3zan09l5b6cJAYDMcf+8GT8TM0pjwVcb64JE=; b=S7xxnmmRxTTXLdl462bK0TycyT
	nPtCi0M22uW6mcZ8KD36yytCDJYPJ7qxeFGLBXWbZGYSk5SNQwhVJ/CIRfmeJNjI2PP8MRtU7+P5z
	Wz78sg2TFI5ymIKro0cHz/97xhZ+C8KT1/VoIe5h5hXuRZQgOLhIEX4Kj+H9QZtqP8QMYG5lYIcQK
	ijkS3tkJ+cDRB6WKH/KPHo1KCgh1diX4j5WympGB/JnOeQC8XTTw9C/Zqli9jTKT2Ih0/GE2xHXSP
	+90wC3b6V+k/DG4ccBbgAhbzfJMnT5MrgdUujvwFE31ZOwMx32Tjv6QdhDZ08urj90P5MnNhQPVE/
	LIVKRT5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1WY-00000003NyT-2Qiy;
	Wed, 29 Apr 2026 09:48:06 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1WT-00000003Nxu-3gAj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 09:48:04 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yU5fi/v3zan09l5b6cJAYDMcf+8GT8TM0pjwVcb64JE=;
	b=joF9WSqBy8iDBkOIo6eAfyuk9ZJYs4ZNyLIPXSdliYryWxhIff6iKBaSgdfhTQq7/NlP68r3D
	CGd3QC14Q9FBddM8mQ7UEqgeOGMCpvJLQRlP/TsXyRydn8V8E6WVktNHD6u9Zwi1bWOkKe0zSIo
	hdBTpfa3CccCxCLP8i211Lk=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4g5C3y4rNHz1prLd;
	Wed, 29 Apr 2026 17:41:18 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 4EC8420226;
	Wed, 29 Apr 2026 17:47:48 +0800 (CST)
Received: from [10.174.179.37] (10.174.179.37) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 29 Apr 2026 17:47:47 +0800
Message-ID: <ac35cd6d-231d-f89e-89e4-b92e0eae5633@huawei.com>
Date: Wed, 29 Apr 2026 17:47:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 next 00/10] arm_mpam: Introduce Narrow-PARTID feature
Content-Language: en-US
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>, "ben.horgan@arm.com"
	<ben.horgan@arm.com>, "Dave.Martin@arm.com" <Dave.Martin@arm.com>,
	"james.morse@arm.com" <james.morse@arm.com>, "reinette.chatre@intel.com"
	<reinette.chatre@intel.com>, "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
	"tglx@kernel.org" <tglx@kernel.org>, "will@kernel.org" <will@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "bp@alien8.de" <bp@alien8.de>,
	"babu.moger@amd.com" <babu.moger@amd.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "mingo@redhat.com" <mingo@redhat.com>,
	"tony.luck@intel.com" <tony.luck@intel.com>, "gshan@redhat.com"
	<gshan@redhat.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"TY4PR01MB16930EB1ACB3A3356A92169BC8B232@TY4PR01MB16930.jpnprd01.prod.outlook.com"
	<TY4PR01MB16930EB1ACB3A3356A92169BC8B232@TY4PR01MB16930.jpnprd01.prod.outlook.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>
References: <1d9cee5a-38be-7115-51ef-b7109aa4ab5e@huawei.com>
 <TY4PR01MB169309175E789FEDACA22619F8B372@TY4PR01MB16930.jpnprd01.prod.outlook.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <TY4PR01MB169309175E789FEDACA22619F8B372@TY4PR01MB16930.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.37]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_024802_574999_C0250E77 
X-CRM114-Status: GOOD (  17.01  )
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

Hi Shaopeng,

On 2026/4/28 12:20, Shaopeng Tan (Fujitsu) wrote:
> Hello Zeng Heng,
> 
> 
> I hope this email finds you well.
> 
>> As indicated in the patch series tags, this patch set applies to the
>> linux-next repository, specifically the master branch at:
>> https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> 
> This patch series could not be applied correctly to the master branch.
> 


Thank you very much for your reply.

I checked the patch and found that patch 2 has the following context
conflict, which is not a logical conflict:

~~~
diff a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c 
(rejected hunks)
@@ -223,7 +223,7 @@ int resctrl_arch_set_cdp_enabled(enum 
resctrl_res_level rid, bool enable)
  		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = 
false;

  	if (enable) {
-		if (mpam_partid_max < 1)
+		if (mpam_intpartid_max < 1)
  			return -EINVAL;

  		partid_d = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_DATA);

~~~

This conflict is caused by the following commit:

~~~
commit f758340da529ccb12531c3f83d5992e912f6c8d5
Author: Zeng Heng <zengheng4@huawei.com>
Date:   Mon Apr 13 17:00:41 2026 +0800

     arm_mpam: resctrl: Fix MBA CDP alloc_capable handling on unmount

~~~

This is merely a context conflict. Please feel free to resolve it
locally for now, or I will fix this patch conflict in the next version
as soon as possible.

Apart from this, the remaining patches apply cleanly against the latest
linux-next or linux mainline tree.


> 
>> Keep me in the mail list for follow-up responses if you want my feedback
>> in time. I was accidentally dropped from the mail list in a previous
>> thread (see
>> https://lore.kernel.org/all/TY4PR01MB16930EB1ACB3A3356A92169BC8B232@TY4PR01MB16930.jpnprd01.prod.outlook.com/).
> 
> I've confirmed that your email address was correctly in the recipient field, and the email was sent successfully on my end.
> Also, it seems that I sometimes don't receive your emails.
> I'm not entirely sure why this is happening, as my email settings appear to be configured correctly.
> 
> 

 From the lore archive records, it exactly appears that my email address
was indeed not included in the recipient list. Please double-check:
https://lore.kernel.org/all/TY4PR01MB16930EB1ACB3A3356A92169BC8B232@TY4PR01MB16930.jpnprd01.prod.outlook.com/

I believe this was simply a typo. And Looking forward to hearing from
you.


Best regards,
Zeng Heng

