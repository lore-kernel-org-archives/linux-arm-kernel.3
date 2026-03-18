Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD81103E160
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 11:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2FYu3eYmosXCPk9EhFLN1puzsoxOcAP2QckJBCO/sU4=; b=eUj2VXt/hvr7UzCOuu3RMfCb2r
	n0FaQY1v/8n4nRRRGi03ty5qN/coPRs8Z87dfJOQrPY0Du82s9Xs5Tx4LFZJn1XJMqfmEr6tjx08w
	KhY5J5eGRd9VCWu/eMOYFHLjTIdhPQhGE/mkdvN5pnc81/X4hB9ucu+k3tE9ML+lH+7rIzFJRXF4k
	5uUMXOUfEtc+bEdM7UM6ljtXfXYAcXB8nNBmbJQwwFK8aLC+9X16XL6eUj89j5Uh/tTFPwQWPCA5l
	eVQSIB13/9JbSGxQelcokRB1vZkHrHoEkuWvWMA+hrOWYIlO6xQo8pGuBCqYxp5Meh9XYWKO3eEj8
	O+3+7dVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ohU-00000008GWH-3l68;
	Wed, 18 Mar 2026 11:04:32 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ohR-00000008GVT-2BQ4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 11:04:32 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2FYu3eYmosXCPk9EhFLN1puzsoxOcAP2QckJBCO/sU4=;
	b=lk8ZWqHLIcI0LXKJaHrGm2T5kDXFOOiaf5ImfkVWeD6oo2Zzhi0Z/a2P8BX7+qf8P6jD7U/jB
	wpn8TX8oB1NSWdTe1nUPssAs3XKF8XHcrUhhrNrL3kOTGITWo14UthyQPVAeA1JsVLR5d/KLuZ/
	JGZ3b9EOpSfLAkwE2shDR50=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fbQmQ0HBkzcb1V;
	Wed, 18 Mar 2026 18:58:30 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 3C81940569;
	Wed, 18 Mar 2026 19:04:09 +0800 (CST)
Received: from [10.174.179.37] (10.174.179.37) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 18 Mar 2026 19:04:07 +0800
Message-ID: <57e9ddeb-f767-8eae-1123-0d9085fe01f0@huawei.com>
Date: Wed, 18 Mar 2026 19:04:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 21/40] arm_mpam: resctrl: Hide CDP emulation behind
 CONFIG_EXPERT
Content-Language: en-US
To: Ben Horgan <ben.horgan@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<dave.martin@arm.com>, <david@kernel.org>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <james.morse@arm.com>,
	<jonathan.cameron@huawei.com>, <kobak@nvidia.com>, <lcherian@marvell.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <punit.agrawal@oss.qualcomm.com>,
	<quic_jiles@quicinc.com>, <reinette.chatre@intel.com>,
	<rohit.mathew@arm.com>, <scott@os.amperecomputing.com>,
	<sdonthineni@nvidia.com>, <tan.shaopeng@fujitsu.com>,
	<xhao@linux.alibaba.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<corbet@lwn.net>, <maz@kernel.org>, <oupton@kernel.org>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <kvmarm@lists.linux.dev>,
	<linux-doc@vger.kernel.org>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-22-ben.horgan@arm.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <20260313144617.3420416-22-ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.37]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_040430_570403_FF900F83 
X-CRM114-Status: GOOD (  20.13  )
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

Hi Ben,

On 2026/3/13 22:45, Ben Horgan wrote:
> When CDP is not enabled, the 'rmid_entry's in the limbo list,
> rmid_busy_llc, map directly to a (PARTID,PMG) pair and when CDP is enabled
> the mapping is to two different pairs. As the limbo list is reused between
> mounts and CDP disabled on unmount this can lead to stale mapping and the
> limbo handler will then make monitor reads with potentially out of range
> PARTID. This may then cause an MPAM error interrupt and the driver will
> disable MPAM.
> 
> No problems are expected if you just mount the resctrl file system
> once with CDP enabled and never unmount it. Hide CDP emulation behind
> CONFIG_EXPERT to protect the unwary.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Adding this ugliness in the hope of avoiding patch churn and extra
> reviewer work. I am looking into the resctrl changes needed to fix this.
> ---
>   drivers/resctrl/mpam_resctrl.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 903d1a0f564f..cab3e9ccb5c7 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -82,6 +82,18 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>   	u32 partid_i = RESCTRL_RESERVED_CLOSID, partid_d = RESCTRL_RESERVED_CLOSID;
>   	int cpu;
>   
> +	if (!IS_ENABLED(CONFIG_EXPERT) && enable) {
> +		/*
> +		 * If the resctrl fs is mounted more than once, sequentially,
> +		 * then CDP can lead to the use of out of range PARTIDs.
> +		 */
> +		pr_warn("CDP not supported\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (enable)
> +		pr_warn("CDP is an expert feature and may cause MPAM to malfunction.\n");
> +

Agree that a proper fix will require modifications to resctrl to handle 
the limbo state across mount sessions. Hiding CDP behind CONFIG_EXPERT 
is acceptable as a short-term mitigation to prevent users from 
accidentally hitting the mentioned issue.

Reviewed-by: Zeng Heng <zengheng4@huawei.com>

