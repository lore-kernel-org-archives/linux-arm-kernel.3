Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77856606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HSGwCrVi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=eICjr8r5;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=PcBfgrn1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GjKSpRpZJGQx4i7CWLGU6DV5BbDSRkOyHaDAbETweWc=; b=HSGwCrVinrVgtB
	Ve3x7qcSjl7LGi0lfOPz7XemU3FpP2jD7hscPijp5WljVz1xvFi+fiS7OEUjLuCxRDgagcbBJAl1J
	OkkChc+NEe7JXFvvtkP8f/Sn9SkQndt++QOtEhI7/9OPwIGgPARlD251+1m+VAKxELI/MRKfpuj/L
	zPIIX3YcjxbGUvRJTydzVBy5xT1vBbE//dpVHAkxIrJxhvFrZBcPMBcwBuOacT1pdvf15rLvXggXa
	dSGnwzv11QN33VCbyDd9yt7R6PkEIe7wYFSoRq/o8yKKS3Pi8lSun7Mng78xmXd7itI0q9Bpxvsbh
	wJDQOUX3z1tYNQ5B6JHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOu1D-00000008LlM-1lMZ;
	Thu, 05 Nov 2026 09:44:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOu1B-00000008Ll5-2QYX
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 09:44:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=GjKSpRpZJGQx4i7CWLGU6DV5BbDSRkOyHaDAbETweWc=; b=eICjr8r51nugmlGKiAfTsNOhxU
	4MolkQgcf52PhRr/82re2Y9Hrq2kRb8Kvmf39p5Xjbqm4ml0KM2OVHeL0w6C2/SkE+8ObaraX9D1I
	HDFLDM98V5AjMDdXHkVTtYIHPAe4AH5IwvA+SOZv/nZyhsM4M27pnb9hH8IOzqe2cixT0Pk50yxoE
	dQ20Q/YDOWsMmRWCApKvWv+AmiZSWX5zLTR7DtWyfHAajjM0dEjNuAg7Rrlq5VyuJxk8kxH/VwJdR
	cm5p59Y+6/9qjfNvul32dpIEqJcD/eU26HrQZRD66QKia0CWao8XE97bA8Zq84QLGKk3xA3PMsCSH
	moyyMHCA==;
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOu18-00000002lvC-1Sn5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 09:44:24 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=GjKSpRpZJGQx4i7CWLGU6DV5BbDSRkOyHaDAbETweWc=;
	b=PcBfgrn19D2DPfo95DuEzm6OFu5RY+m8UPdP/upFN71tmXSD57TKNJOu+iXrE5NKU32m/ahXe
	emItw+oQ7WxufQV/uh3LC5vkzaDwgQGUUxv1AGVBpzWmNy/Sb8IHcLoz/E9PB5eTv+aPx9cAzba
	53t0+gklnFqnZg9heaijTyw=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jKy7R6xHzz1cyQD;
	Thu,  5 Nov 2026 17:44:03 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id B351240586;
	Thu,  5 Nov 2026 17:44:15 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 17:44:15 +0800
Message-ID: <88f7174c-8f78-4232-9edc-1eeeef71eff6@huawei.com>
Date: Thu, 5 Nov 2026 17:44:14 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: Restore the cached configuration when a write
 to an MSC fails
To: Andre Przywara <andre.przywara@arm.com>, <james.morse@arm.com>,
	<ben.horgan@arm.com>, <reinette.chatre@intel.com>, <fenghuay@nvidia.com>,
	<gshan@redhat.com>, <jonathan.cameron@oss.qualcomm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261104101541.563113-1-ruanjinjie@huawei.com>
 <7fcc1d9a-1c19-4827-b602-0db416af2e2f@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <7fcc1d9a-1c19-4827-b602-0db416af2e2f@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_094422_955127_25999FFE 
X-CRM114-Status: GOOD (  25.90  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



在 2026/11/4 19:24, Andre Przywara 写道:
> Hi,
> 
> On 11/4/26 11:15, Jinjie Ruan wrote:
>> mpam_apply_config() caches the new configuration before writing it to
>> the RISes. When mpam_touch_msc() fails, the cache keeps the new values,
>> so a retry with the same schemata is skipped as a no-op and never
>> reaches the hardware.
> 
> Do we really need this? Has this been observed to solve a problem?
> If any of the MSC accesses fail (for MPAM-Fb only), we already tear down
> the whole MPAM driver immediately, so any subsequent accesses wouldn't

Yes we call mpam_fb_disable_mpam() for MPAM-Fb .

I originally worried about the MMIO path and it turns out not need
the rollback too and the current behavior is correct, see below.

last CPU of the MSC related cpu goes offline
       ↓
    hardware back to default value
       ↓
  user writes schemata  → mpam_apply_config() update comp->cfg[partid]
        ↓
   mpam_touch_msc() → smp_call_on_cpu()
        → -ENXIO only if accessibility has no online CPU
        → comp->cfg[partid] keeps the new values     <- this is right
          ↓
  a CPU of the MSC comes back online
     → mpam_reprogram_msc() replays new comp->cfg[] into the hardware


> work. So I think there is little point in trying to fix or restore any
> configuration?

I think we should drop this patch.

> 
> Propagating errors up the call chain is another issue, but I don't think
> we need to care about any hardware settings in case of a failure.
> 
> Cheers,
> Andre
> 
>>
>> Restore the cached configuration on failure so the retry writes it to
>> the RISes again.
>>
>> Only arm64 MPAM systems are affected; x86 does not support MPAM.
>>
>> Fixes: 60e33a1864fd ("arm_mpam: propagate MSC access errors for
>> mpam_reprogram_ris_partid()")
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> Cc: <stable@vger.kernel.org> # 7.4.x
>> ---
>>   drivers/resctrl/mpam_devices.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/
>> mpam_devices.c
>> index c067b6d57d71..bb667a416660 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -3412,6 +3412,7 @@ static bool mpam_update_config(struct
>> mpam_config *cfg,
>>   int mpam_apply_config(struct mpam_component *comp, u16 partid,
>>                 struct mpam_config *cfg)
>>   {
>> +    struct mpam_config old_cfg = comp->cfg[partid];
>>       struct mpam_write_config_arg arg;
>>       struct mpam_msc_ris *ris;
>>       struct mpam_vmsc *vmsc;
>> @@ -3439,8 +3440,10 @@ int mpam_apply_config(struct mpam_component
>> *comp, u16 partid,
>>                        srcu_read_lock_held(&mpam_srcu)) {
>>               arg.ris = ris;
>>               ret = mpam_touch_msc(msc, __write_config, &arg);
>> -            if (ret)
>> +            if (ret) {
>> +                comp->cfg[partid] = old_cfg;
>>                   return ret;
>> +            }
>>               ris->in_reset_state = false;
>>           }
>>       }
> 

-- 
Best regards,
Jinjie


