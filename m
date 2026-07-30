Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB708C55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 22:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0e06MzEGQC6j+vk526i829qHWyXZ92YqgrmVpqb67/I=; b=0QAe4eIlRSexmAzKG/2HO4wO5e
	9phEKbTTsP7vRQIXm5jG2CC80WibOw/5rFsa1R/8D8xGrd9wJ9pbWIV7b4XfPWG93qyzc4qHf01C/
	Mm1T42/49Y1dlHR1ipEhg9sj1dThLjf8/iqwhaDJkNcidf31ZY30Sk60dgUnou4hpOdwEcU1G8HhR
	AA4a+G0hjxfiqR3zX+kTafrUutmwk/RW0SR32H9s9tmnCqwOhoXUg3SQ5BxQXRHLVIBy1/gH6UKG9
	X/yYgq1OQMlz/OxSU+Iba9vQO1DRBCI6MkxmGN8SJwGT9ree3UJvx7/f0Vg2czhvaakl0J6I/Y5Qj
	DOuOaaGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpZF4-0000000BQr4-2IOU;
	Thu, 30 Jul 2026 22:28:42 +0000
Received: from trager.us ([52.5.81.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpZF2-0000000BQqh-2DmO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 22:28:41 +0000
Received: from c-73-254-161-40.hsd1.wa.comcast.net ([73.254.161.40] helo=[192.168.1.225])
	by trager.us with esmtpsa (TLSv1.3:TLS_AES_128_GCM_SHA256:128)
	(Exim 4.92.3)
	(envelope-from <lee@trager.us>)
	id 1wpZEp-0000wX-Ap; Thu, 30 Jul 2026 22:28:27 +0000
Message-ID: <c3d43f56-b875-4bbd-b249-1a5f33cd54ed@trager.us>
Date: Thu, 30 Jul 2026 15:28:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/10] arm_mpam: detect and enable MPAM-Fb PCC support
To: Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Ritwick Sharma <ritwick.sharma@arm.com>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260730152539.2712312-1-andre.przywara@arm.com>
 <20260730152539.2712312-11-andre.przywara@arm.com>
Content-Language: en-US
From: Lee Trager <lee@trager.us>
In-Reply-To: <20260730152539.2712312-11-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_152840_584570_C7357323 
X-CRM114-Status: GOOD (  10.74  )
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


On 7/30/26 8:25 AM, Andre Przywara wrote:
> +static struct mpam_pcc_chan *mpam_pcc_chan_get(struct device *dev,
> +					       int subspace_id)
> +{
> +	struct mpam_pcc_chan *cur;
> +
> +	guard(mutex)(&pcc_chan_list_lock);
> +
> +	list_for_each_entry(cur, &pcc_chan_list, pcc_chans) {
> +		if (cur->subspace_id == subspace_id) {
> +			kref_get(&cur->refcount);
> +
> +			return cur;
> +		}
> +	}
> +
> +	cur = kzalloc_obj(*cur);
> +	if (!cur)
> +		return ERR_PTR(-ENOMEM);
> +
> +	cur->pcc_cl.dev = dev;
> +	cur->pcc_cl.tx_block = true;
> +
> +	cur->pcc_chan = pcc_mbox_request_channel(&cur->pcc_cl, subspace_id);
> +	if (IS_ERR(cur->pcc_chan)) {
> +		long err = PTR_ERR(cur->pcc_chan);
> +
> +		kfree(cur);
> +		return ERR_PTR(err);
> +	}
> +
> +	/* Timeout based on the "nominal latency" from the PCC ACPI table. */
> +	cur->pcc_cl.tx_tout = cur->pcc_chan->latency * 5;
I think this may need a unit conversion. ACPI 6.6 describes PCC nominal 
latency in microseconds, and the PCC mailbox driver appears to copy that 
value directly into pcc_chan->latency. However mbox_client::tx_tout is 
documented in milliseconds.

If I'm reading that correctly, assigning latency * 5 would make the 
timeout 1000 times longer than intended. Would something like this be 
better?

cur->pcc_cl.tx_tout = DIV_ROUND_UP_ULL((u64)cur->pcc_chan->latency * 5, 
USEC_PER_MSEC);

