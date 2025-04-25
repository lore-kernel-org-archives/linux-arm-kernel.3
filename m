Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6E7C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 03:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nx8b8dHtUpwWDCmOWogh020pKYMgdStK6pQ0/rSN7EY=; b=eZpZVx2FWGoa40XXL67or/2jSr
	S2EC3j8fhZtFFkEJACehP/iaV9fHxh7Zyx98cTe5LXk9QEO4fzNZPM3NVWgH3TM2J1oXU8ay10agL
	+4OUEPTIwjjwZyiLG9JC23aSm79/ry0i7uG0Vgyj5RJpimdOJIGuUlM/unOKs1HIg+0utuO4d355J
	gAXSl3VWAYGdRcwUO6NJxkwemhJ10WP9ieiXTMsw5XvvISHeY6oBuTaGXjkXWTIogp3c35GBVu2fq
	vVrzqaqV4EERtIFUCvrTH/MT+qjSZOki9MiEmLDW6btA8Ah3gLEcqOX7buvAroJ9OGaH76Oj0cCt4
	o1V3363g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u89p6-0000000FrRQ-49mV;
	Fri, 25 Apr 2025 03:33:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u89mK-0000000FrDW-3bKo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 03:31:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5A21106F;
	Thu, 24 Apr 2025 20:30:57 -0700 (PDT)
Received: from [10.163.51.18] (unknown [10.163.51.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 26C303F59E;
	Thu, 24 Apr 2025 20:30:56 -0700 (PDT)
Message-ID: <ed3dc767-59e2-408d-88d4-bdc4999232c8@arm.com>
Date: Fri, 25 Apr 2025 09:00:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: trbe: Save/restore state across CPU low power
 state
To: Yabin Cui <yabinc@google.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Leo Yan <leo.yan@arm.com>, Jie Gan <quic_jiegan@quicinc.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250423230046.1134389-1-yabinc@google.com>
 <038a4c10-14c6-4671-8db1-fd38dc73bccf@arm.com>
 <CALJ9ZPM4+OtyzFHWxrOeNWdFyGy+xoLCch+bH8O3AJDgMFk61g@mail.gmail.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <CALJ9ZPM4+OtyzFHWxrOeNWdFyGy+xoLCch+bH8O3AJDgMFk61g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_203104_988545_A220B8CE 
X-CRM114-Status: GOOD (  24.14  )
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

On 4/25/25 00:07, Yabin Cui wrote:
> On Thu, Apr 24, 2025 at 1:46 AM Anshuman Khandual
> <anshuman.khandual@arm.com> wrote:
>>
>> On 4/24/25 04:30, Yabin Cui wrote:
>>> Similar to ETE, TRBE may lose its context when a CPU enters low
>>> power state. To make things worse, if ETE state is restored without
>>> restoring TRBE state, it can lead to a stuck CPU due to an enabled
>>> source device with no enabled sink devices.
>>>
>>> This patch introduces support for "arm,coresight-loses-context-with-cpu"
>>
>> But could "arm,coresight-loses-context-with-cpu" device tree property
>> be associated wit TRBE devices ? OR this state save and restore needs
>> to be handled in the firmware.
> 
> This property is handled by ETM/ETE driver. In ETM/ETE driver, the state has
> options to be saved by firmware or by the driver. On my test device, which
> is Pixel 9, the state is saved by the driver. I have also tested that TRBE state
> can be saved by the TRBE driver.

Basically if the state is saved and restored in the driver for the source
ETM devices, then the same should also happen for corresponding TRBE sink
devices as well ?

> 
>>
>>> in the TRBE driver. When present, TRBE registers are saved before
>>> and restored after CPU low power state. To prevent CPU hangs, TRBE
>>> state is always saved after ETE state and restored after ETE state.
>>>
>>> Signed-off-by: Yabin Cui <yabinc@google.com>
>>> ---
>>>  .../coresight/coresight-etm4x-core.c          | 13 ++++-
>>>  drivers/hwtracing/coresight/coresight-trbe.c  | 53 +++++++++++++++++++
>>>  include/linux/coresight.h                     |  6 +++
>>>  3 files changed, 71 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>> index e5972f16abff..1bbaa1249206 100644
>>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>> @@ -1863,6 +1863,7 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>>>  static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
>>>  {
>>>       int ret = 0;
>>> +     struct coresight_device *sink;
>>>
>>>       /* Save the TRFCR irrespective of whether the ETM is ON */
>>>       if (drvdata->trfcr)
>>> @@ -1871,8 +1872,14 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
>>>        * Save and restore the ETM Trace registers only if
>>>        * the ETM is active.
>>>        */
>>> -     if (coresight_get_mode(drvdata->csdev) && drvdata->save_state)
>>> +     if (coresight_get_mode(drvdata->csdev) && drvdata->save_state) {
>>>               ret = __etm4_cpu_save(drvdata);
>>> +             if (ret == 0) {
>>> +                     sink = coresight_get_percpu_sink(drvdata->cpu);
>>> +                     if (sink && sink_ops(sink)->percpu_save)
>>> +                             sink_ops(sink)->percpu_save(sink);
>>> +             }
>>> +     }
>>>       return ret;
>>>  }
>>>
>>> @@ -1977,6 +1984,10 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>>>
>>>  static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>>>  {
>>> +     struct coresight_device *sink = coresight_get_percpu_sink(drvdata->cpu);
>>> +
>>> +     if (sink && sink_ops(sink)->percpu_restore)
>>> +             sink_ops(sink)->percpu_restore(sink);
>>>       if (drvdata->trfcr)
>>>               write_trfcr(drvdata->save_trfcr);
>>>       if (drvdata->state_needs_restore)
>>> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
>>> index fff67aac8418..38bf46951a82 100644
>>> --- a/drivers/hwtracing/coresight/coresight-trbe.c
>>> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
>>> @@ -115,6 +115,13 @@ static int trbe_errata_cpucaps[] = {
>>>   */
>>>  #define TRBE_WORKAROUND_OVERWRITE_FILL_MODE_SKIP_BYTES       256
>>>
>>> +struct trbe_save_state {
>>> +     u64 trblimitr;
>>> +     u64 trbbaser;
>>> +     u64 trbptr;
>>> +     u64 trbsr;
>>> +};
>>> +
>>>  /*
>>>   * struct trbe_cpudata: TRBE instance specific data
>>>   * @trbe_flag                - TRBE dirty/access flag support
>>> @@ -123,6 +130,9 @@ static int trbe_errata_cpucaps[] = {
>>>   * @cpu                      - CPU this TRBE belongs to.
>>>   * @mode             - Mode of current operation. (perf/disabled)
>>>   * @drvdata          - TRBE specific drvdata
>>> + * @state_needs_save - Need to save trace registers when entering cpu idle
>>> + * @state_needs_restore      - Need to restore trace registers when exiting cpu idle
>>> + * @save_state               - Saved trace registers
>>>   * @errata           - Bit map for the errata on this TRBE.
>>>   */
>>>  struct trbe_cpudata {
>>> @@ -133,6 +143,9 @@ struct trbe_cpudata {
>>>       enum cs_mode mode;
>>>       struct trbe_buf *buf;
>>>       struct trbe_drvdata *drvdata;
>>> +     bool state_needs_save;
>>> +     bool state_needs_restore;
>>> +     struct trbe_save_state save_state;
>>>       DECLARE_BITMAP(errata, TRBE_ERRATA_MAX);
>>>  };
>>>
>>> @@ -1187,12 +1200,49 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>>>       return IRQ_HANDLED;
>>>  }
>>>
>>> +static void arm_trbe_cpu_save(struct coresight_device *csdev)
>>> +{
>>> +     struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
>>> +     struct trbe_save_state *state = &cpudata->save_state;
>>> +
>>> +     if (cpudata->mode == CS_MODE_DISABLED || !cpudata->state_needs_save)
>>> +             return;
>>> +
>>> +     state->trbbaser = read_sysreg_s(SYS_TRBBASER_EL1);
>>> +     state->trbptr = read_sysreg_s(SYS_TRBPTR_EL1);
>>> +     state->trblimitr = read_sysreg_s(SYS_TRBLIMITR_EL1);
>>> +     state->trbsr = read_sysreg_s(SYS_TRBSR_EL1);
>>> +     cpudata->state_needs_restore = true;
>>> +}
>>> +
>>> +static void arm_trbe_cpu_restore(struct coresight_device *csdev)
>>> +{
>>> +     struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
>>> +     struct trbe_save_state *state = &cpudata->save_state;
>>> +
>>> +     if (cpudata->state_needs_restore) {
>>> +             /*
>>> +              * To avoid disruption of normal tracing, restore trace
>>> +              * registers only when TRBE lost power (TRBLIMITR == 0).
>>> +              */
>>> +             if (read_sysreg_s(SYS_TRBLIMITR_EL1) == 0) {
>>> +                     write_sysreg_s(state->trbbaser, SYS_TRBBASER_EL1);
>>> +                     write_sysreg_s(state->trbptr, SYS_TRBPTR_EL1);
>>> +                     write_sysreg_s(state->trbsr, SYS_TRBSR_EL1);
>>> +                     set_trbe_enabled(cpudata, state->trblimitr);
>>> +             }
>>> +             cpudata->state_needs_restore = false;
>>> +     }
>>> +}
>>> +
>>>  static const struct coresight_ops_sink arm_trbe_sink_ops = {
>>>       .enable         = arm_trbe_enable,
>>>       .disable        = arm_trbe_disable,
>>>       .alloc_buffer   = arm_trbe_alloc_buffer,
>>>       .free_buffer    = arm_trbe_free_buffer,
>>>       .update_buffer  = arm_trbe_update_buffer,
>>> +     .percpu_save    = arm_trbe_cpu_save,
>>> +     .percpu_restore = arm_trbe_cpu_restore,
>>>  };
>>>
>>>  static const struct coresight_ops arm_trbe_cs_ops = {
>>> @@ -1358,6 +1408,9 @@ static void arm_trbe_probe_cpu(void *info)
>>>       cpudata->trbe_flag = get_trbe_flag_update(trbidr);
>>>       cpudata->cpu = cpu;
>>>       cpudata->drvdata = drvdata;
>>> +     cpudata->state_needs_save = coresight_loses_context_with_cpu(
>>> +             &drvdata->pdev->dev);
>>> +     cpudata->state_needs_restore = false;
>>>       return;
>>>  cpu_clear:
>>>       cpumask_clear_cpu(cpu, &drvdata->supported_cpus);
>>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>>> index d79a242b271d..fec375d02535 100644
>>> --- a/include/linux/coresight.h
>>> +++ b/include/linux/coresight.h
>>> @@ -362,6 +362,10 @@ enum cs_mode {
>>>   * @alloc_buffer:    initialises perf's ring buffer for trace collection.
>>>   * @free_buffer:     release memory allocated in @get_config.
>>>   * @update_buffer:   update buffer pointers after a trace session.
>>> + * @percpu_save:     saves state when CPU enters idle state.
>>> + *                   Only set for percpu sink.
>>> + * @percpu_restore:  restores state when CPU exits idle state.
>>> + *                   only set for percpu sink.
>>>   */
>>>  struct coresight_ops_sink {
>>>       int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
>>> @@ -374,6 +378,8 @@ struct coresight_ops_sink {
>>>       unsigned long (*update_buffer)(struct coresight_device *csdev,
>>>                             struct perf_output_handle *handle,
>>>                             void *sink_config);
>>> +     void (*percpu_save)(struct coresight_device *csdev);
>>> +     void (*percpu_restore)(struct coresight_device *csdev);
>>>  };
>>>
>>>  /**

