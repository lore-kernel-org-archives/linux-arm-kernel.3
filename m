Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68567E7E0BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 10:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0i6Utuu6JgKhE4d+9eKhjp/+AcsOBye70BAxNext3Kk=; b=Y7x0As2RVFkCxvTmAEaigwVW7D
	930Z2h0L3lRg6QAr1DOK7Ig5C7Ma3Sa02juFUv744/6jYwk+ev/fxE9cOASKkO4AAn+aNxraaG3Nr
	bRfcO6MgwsneP7wfbZ7MQinUZHOy7KUvlf3AMG/i+366QiV8z2vJX9Pwm81HslB3esEEvWLrDeMhj
	p5qmdpXx4uVzUHe3pPtc468Nnybv6cRmNgbZ45VqA+BiiTEmWnv36NgGuPxFjpk5UegoEWIydajCD
	eK2pYJhoqCB+VkxBspcqJQHJGHA4dbdCqqCky3UwOP7KSg4Izob9voPsKAwxYYSELw1+sukhSAguT
	uRmBk39Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpO7r-0000000FDOi-3N2T;
	Mon, 09 Feb 2026 10:04:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpO7o-0000000FDOJ-0fDd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 10:04:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 055A3339;
	Mon,  9 Feb 2026 02:04:02 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 480D03F632;
	Mon,  9 Feb 2026 02:04:03 -0800 (PST)
Message-ID: <9a8a163e-887a-45fc-aae5-45e564360c8b@arm.com>
Date: Mon, 9 Feb 2026 10:04:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/41] arm_mpam: Add KVM/arm64 and resctrl glue code
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
 "zengheng4@huawei.com" <zengheng4@huawei.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20260203214342.584712-1-ben.horgan@arm.com>
 <OSZPR01MB87983A126E58D3FE8A73A98F8B65A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <OSZPR01MB87983A126E58D3FE8A73A98F8B65A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_020412_342346_3F1F4057 
X-CRM114-Status: GOOD (  21.50  )
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

On 2/9/26 08:25, Shaopeng Tan (Fujitsu) wrote:
> Hello Ben,
> 
>> This new version of the mpam missing pieces series has a few significant
>> changes in the mpam driver part of the series. The heuristics for deciding
>> if features should be exposed are tightened. This is to fix some
>> inaccuracies and avoid overcommitting before needed - shout if this changes
>> anything on your platform. The final patch adds documentation which
>> explains which features you should expect. The ABMC emulation is dropped
>> for the moment as it requires resctrl changes to support for MPAM without
>> breaking the abi. The default 5% gap for min_bw is dropped in favour of a
>> simple default (kept for grace). The series is based on x86/resctrl [1] as
>> resctrl has telemetry patches queued which change the arch interface.
> 
> Could you please elaborate on why fs/resctrl changes are required to support only the counter assignment part of ABMC?
> Currently, many SoC chips have an insufficient number of memory bandwidth monitors.

Sure. When the counter assignment mode is 'mbm_event; resctrl assumes the mbm events are configurable. 
The 'event_filter' files at
    info/L3_MON/event_configs/<event>/event_filter 
are used to display and set this configuration.

In MPAM event configuration is not supported and so showing a read/writable 'event_filter' file is 
misleading to the user and needs to be hidden for MPAM support.

Just to give you a flavour of the change, here's a hack to show the correct thing for MPAM:

--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2338,6 +2338,9 @@ static int resctrl_mkdir_event_configs(struct rdt_resource *r, struct kernfs_nod
                if (ret)
                        goto out;
 
+               if (!resctrl_arch_is_evt_configurable(mevt->evtid))
+                       continue;
+


> We would be grateful if you could support the counter assignment part of ABMC.

It is not a big change in resctrl but I thought it best to not gate the rest of this series on
an additional change in another subsystem. I am current looking into this and hope to get the 
patches on the list early in the next cycle.

> 
> Best regards,
> Shaopeng TAN
> 
> 
Thanks,

Ben


