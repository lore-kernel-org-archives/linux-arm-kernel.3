Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EEBC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 17:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0pgvMEFH4dDM72O7Uqstxh2boVWKaTkYBkpKuFMd/wc=; b=TChbZ42SSYo+opN011ToSm4Fl5
	+uJ4j1+XRc80zVrMKuMb5HNP5joeQ7d2HN7EhqXqlBtqIRjNDx1jRAATLAkEXB9v7VXRIRTojAaMy
	je1K9/bdgYMq1hCnSqzgtDSrv0ybPVbNaUB/anrozzsjmGCqUwJPRyERQE8cQmurKdbxtP4iqs0Y/
	oFfkfSzT28TKAISqMwDpPoA49pyQJHZaQcUG5FT2/4oQAy72wAo+mjrPSmCreoPV4Xf+1Sp8lOQj/
	EsvPWa9XQAhc+7CW5xk514UDNrKhljnlax0POdLPUVEMQ5j52J96oqb5iz/KMB2Lb1aImzxj4B+tF
	jKr1hYrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaHhE-0000000FPfP-3p29;
	Fri, 11 Jul 2025 17:38:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGnk-0000000FJdU-0DD8;
	Fri, 11 Jul 2025 16:40:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B800316F8;
	Fri, 11 Jul 2025 09:40:29 -0700 (PDT)
Received: from [10.1.196.50] (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B3643F6A8;
	Fri, 11 Jul 2025 09:40:37 -0700 (PDT)
Message-ID: <a1a93c41-4c21-4b7a-a8b8-5d4e83d73931@arm.com>
Date: Fri, 11 Jul 2025 17:40:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/10] accel/rocket: Add job submission IOCTL
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, Daniel Stone <daniel@fooishbar.org>,
 Da Xue <da@libre.computer>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
 <20250606-6-10-rocket-v7-4-dc16cfe6fe4e@tomeuvizoso.net>
 <fcb3ca23-7ebd-4f48-92d2-969b24936b9b@arm.com>
 <CAAObsKBiSX0HcxJJjTNGgE4FD4eAYW5wvY=bROtdkZ1mqf_0VQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAAObsKBiSX0HcxJJjTNGgE4FD4eAYW5wvY=bROtdkZ1mqf_0VQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_094044_170353_0EEFBD27 
X-CRM114-Status: GOOD (  14.90  )
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

On 11/07/2025 5:00 pm, Tomeu Vizoso wrote:
> On Tue, Jun 24, 2025 at 3:50 PM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> On 2025-06-06 7:28 am, Tomeu Vizoso wrote:
>> [...]
>>> diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
>>> index 10acfe8534f00a7985d40a93f4b2f7f69d43caee..50e46f0516bd1615b5f826c5002a6c0ecbf9aed4 100644
>>> --- a/drivers/accel/rocket/rocket_device.h
>>> +++ b/drivers/accel/rocket/rocket_device.h
>>> @@ -13,6 +13,8 @@
>>>    struct rocket_device {
>>>        struct drm_device ddev;
>>>
>>> +     struct mutex sched_lock;
>>> +
>>>        struct mutex iommu_lock;
>>
>> Just realised I missed this in the last patch, but iommu_lock appears to
>> be completely unnecessary now.
>>
>>>        struct rocket_core *cores;
>> [...]
>>> +static void rocket_job_hw_submit(struct rocket_core *core, struct rocket_job *job)
>>> +{
>>> +     struct rocket_task *task;
>>> +     bool task_pp_en = 1;
>>> +     bool task_count = 1;
>>> +
>>> +     /* GO ! */
>>> +
>>> +     /* Don't queue the job if a reset is in progress */
>>> +     if (atomic_read(&core->reset.pending))
>>> +             return;
>>> +
>>> +     task = &job->tasks[job->next_task_idx];
>>> +     job->next_task_idx++;
>>> +
>>> +     rocket_pc_writel(core, BASE_ADDRESS, 0x1);
>>> +
>>> +     rocket_cna_writel(core, S_POINTER, 0xe + 0x10000000 * core->index);
>>> +     rocket_core_writel(core, S_POINTER, 0xe + 0x10000000 * core->index);
>>
>> Those really look like bitfield operations rather than actual arithmetic
>> to me.
>>
>>> +
>>> +     rocket_pc_writel(core, BASE_ADDRESS, task->regcmd);
>>
>> I don't see how regcmd is created (I guess that's in userspace?), but
>> given that it's explicitly u64 all the way through - and especially
>> since you claim to support 40-bit DMA addresses - it definitely seems
>> suspicious that the upper 32 bits never seem to be consumed anywhere :/
> 
> Yeah, but there's no other register for BASE_ADDRESS address in the TRM.

That only reaffirms the question then - if this value is only ever 
written verbatim to a 32-bit register, why is it 64-bit?

Thanks,
Robin.

