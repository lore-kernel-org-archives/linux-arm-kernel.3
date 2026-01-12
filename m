Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC289CF45A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 16:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDFoVPFCEuqRSQZZZJ7CmDSD963kkF8yASASnM4iHc4=; b=lMe8JwWZ2gAUeBOBWm/OmQ3NYr
	FBIseuxC4N/XQekzePW2hUn0VBQ+DzdiMnQYK1QYkoUPKyOPa3JzhGAgk0uYq3OVNnQpuqCAKVBP6
	YufL/C3cPleXjxwHr9fWX8E7Q1WQhpcJGTPf38lualIkURxJfrDE6wvX5d1zTkT/Ezc5VoEzvYWCD
	fQW9JlGEXYakq1C1/P4/ViveBnIoZrJBovca2rSmEZnPIQaEerzQ7O/4dXoV0VNa551Ttr//jlBJF
	BnF+ectiTd1Z30CNl5Q7lOBZ9MzgJMttqZdq+R6eeTF5ZWvjSTOpP4VrECbz6AhlNIuybL8MVXcjr
	Mc2ifrUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfL3K-00000005kKZ-3afr;
	Mon, 12 Jan 2026 16:46:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfL3H-00000005kK8-26ab
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 16:46:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63C03497;
	Mon, 12 Jan 2026 08:45:49 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23FB13F59E;
	Mon, 12 Jan 2026 08:45:50 -0800 (PST)
Message-ID: <02781a6f-fc15-4eef-8747-90dc2ba4e20c@arm.com>
Date: Mon, 12 Jan 2026 16:45:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/45] arm_mpam: resctrl: Add support for 'MB' resource
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
Cc: "amitsinght@marvell.com" <amitsinght@marvell.com>,
 "baisheng.gao@unisoc.com" <baisheng.gao@unisoc.com>,
 "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
 "carl@os.amperecomputing.com" <carl@os.amperecomputing.com>,
 "dave.martin@arm.com" <dave.martin@arm.com>,
 "david@kernel.org" <david@kernel.org>,
 "dfustini@baylibre.com" <dfustini@baylibre.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
 "gshan@redhat.com" <gshan@redhat.com>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "kobak@nvidia.com" <kobak@nvidia.com>,
 "lcherian@marvell.com" <lcherian@marvell.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "peternewman@google.com" <peternewman@google.com>,
 "punit.agrawal@oss.qualcomm.com" <punit.agrawal@oss.qualcomm.com>,
 "quic_jiles@quicinc.com" <quic_jiles@quicinc.com>,
 "reinette.chatre@intel.com" <reinette.chatre@intel.com>,
 "rohit.mathew@arm.com" <rohit.mathew@arm.com>,
 "scott@os.amperecomputing.com" <scott@os.amperecomputing.com>,
 "sdonthineni@nvidia.com" <sdonthineni@nvidia.com>,
 "xhao@linux.alibaba.com" <xhao@linux.alibaba.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
 "maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>,
 "joey.gouly@arm.com" <joey.gouly@arm.com>,
 "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 Zeng Heng <zengheng4@huawei.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
 <20251219181147.3404071-26-ben.horgan@arm.com>
 <OSZPR01MB8798E323F3DC4A528C411FB58B85A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <OSZPR01MB8798E323F3DC4A528C411FB58B85A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_084559_691549_0123CEE7 
X-CRM114-Status: GOOD (  16.51  )
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

On 1/8/26 10:42, Shaopeng Tan (Fujitsu) wrote:
> Hello Ben,
> 
>> From: James Morse <james.morse@arm.com>
>>
>> resctrl supports 'MB', as a percentage throttling of traffic somewhere
>> after the L3. This is the control that mba_sc uses, so ideally the class
>> chosen should be as close as possible to the counters used for mba_local.
>>
>> MB's percentage control should be backed either with the fixed point
>> fraction MBW_MAX. The bandwidth portion bitmaps is not used as its tricky
>> to pick which bits to use to avoid contention, and may be possible to
>> expose this as something other than a percentage in the future.
>>
>> CC: Zeng Heng <zengheng4@huawei.com>
>> Co-developed-by: Dave Martin <Dave.Martin@arm.com>
>> Signed-off-by: Dave Martin <Dave.Martin@arm.com>
>> Signed-off-by: James Morse <james.morse@arm.com>>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>>  drivers/resctrl/mpam_resctrl.c | 212 ++++++++++++++++++++++++++++++++-
>>  1 file changed, 211 insertions(+), 1 deletion(-)
>>
[...]
>>  static int mpam_resctrl_control_init(struct mpam_resctrl_res *res,
>>                                       enum resctrl_res_level type)
>>  {
>>          struct mpam_class *class = res->class;
>> +       struct mpam_props *cprops = &class->props;
>>          struct rdt_resource *r = &res->resctrl_res;
>>  
>>          switch (r->rid) {
>> @@ -361,6 +531,20 @@ static int mpam_resctrl_control_init(struct mpam_resctrl_res *res,
>>                   * 'all the bits' is the correct answer here.
>>                   */
>>                  r->cache.shareable_bits = resctrl_get_default_ctrl(r);
>> +               break;
>> +       case RDT_RESOURCE_MBA:
>> +               r->alloc_capable = true;
>> +               r->schema_fmt = RESCTRL_SCHEMA_RANGE;
>> +               r->ctrl_scope = RESCTRL_L3_CACHE;
> 
> Could you please elaborate why RESCTRL_L3_CACHE is required here?

The location of the mba control in resctrl is named using the id of the
l3 cache and so needs to associated with it. James is working on some
documentation that will mention this along with other things.

> 
> Best regards,
> Shaopeng TAN
> 


Thanks,

Ben


