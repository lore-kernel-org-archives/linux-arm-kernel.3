Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFCF103E173
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 13:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzqcnl/zvt0EBa0YX4d6s+M1CBNs1lPaqKw1XiykpH8=; b=IgpsX8lUiWGEQGQpu/mw2ESv78
	bo7r8cdD1s9ve8wCXoLWPqRjbFx7bVH4UHbz6sAWdnfBdX03tPUldwo39PpEsOG8XygxZxOxIAUI+
	VLRKWliC9+vPTMMEvFZT1/M9pVrPNDutrHXvf0M2XmPFWV/O83B3bZAb54v3oaRMuQi4eqEdjK1qL
	aGUbErebTVBX/CzVfD/rmk4U/cFbQ74/lHeMMrYd9g3tJ8j01AcwdRzPXdBPHphY+MwSnIpd8EPTn
	D1DLmzOCrM+QoLvyQ3fiBX4r7Ec8y5F7ji82BDoeTUdXMDCGiyApTKnUFFRAxz5MleQiy2AnBNHD+
	8rbnpfjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qqa-00000008TXl-2fAG;
	Wed, 18 Mar 2026 13:22:04 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qqY-00000008TWu-11eg;
	Wed, 18 Mar 2026 13:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yzqcnl/zvt0EBa0YX4d6s+M1CBNs1lPaqKw1XiykpH8=; b=ZXREdaq5zuN6bOhowRFcwcEVyo
	R02VpxHX8fZpb8HI57O9wC0deWdcTxk4NPA97r5p5vT3SnJZa+UYDYtizwllrAigkyLRYcYJuqacS
	rwW5E9TgxIXnYcpAFwhRaWqvotCUZCS9Y8/4pjNZdI0EGtKXNit3VK/Q1CZw/iDhMfVLEJEPjQVMz
	vRtURzxEQMU+q/cLf+XJRIEdvauJgP2gUiZ4cGsB7HXOcqygL9zA539hYoxEH9c99fSQVmjVluSq1
	L6Po2KctGc0f4wD1rjxsC/QrPVKDM7ucyASSdIa85L37Y27Pmfo+4AyS4bmdJGrcRJbKG4AGzzddv
	gtOn7anA==;
Received: from [189.7.87.203] (helo=[192.168.0.2])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1w2qqO-002nl8-Pi; Wed, 18 Mar 2026 14:21:53 +0100
Message-ID: <455b46d5-435a-40ae-991f-6735ff041849@igalia.com>
Date: Wed, 18 Mar 2026 10:21:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pmdomain: bcm: bcm2835-power: Increase ASB control
 timeout
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Stefan Wahren <wahrenst@gmx.net>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 kernel-dev@igalia.com, linux-pm@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
References: <20260317-bcm2835-power-timeout-v1-0-19db323c51f9@igalia.com>
 <20260317-bcm2835-power-timeout-v1-1-19db323c51f9@igalia.com>
 <c803299f-709b-4b57-b7fc-46ef3bb4c9ee@gmx.net>
 <5fe9332f-fbce-469e-8f19-dd3d7ef54c5f@igalia.com>
 <CAPDyKFoooZbU9W_Y1aSx+HuCfjHZGn9XR4_CB8YgDmCBWTB-Tg@mail.gmail.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <CAPDyKFoooZbU9W_Y1aSx+HuCfjHZGn9XR4_CB8YgDmCBWTB-Tg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_062202_284615_C9996E7E 
X-CRM114-Status: GOOD (  19.22  )
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

Hi Ulf,

On 18/03/26 10:06, Ulf Hansson wrote:
> On Wed, 18 Mar 2026 at 13:54, Maíra Canal <mcanal@igalia.com> wrote:
>>
>> Hi Stefan,
>>
>> On 18/03/26 08:51, Stefan Wahren wrote:
>>> Hi Maíra,
>>>
>>> Am 17.03.26 um 23:41 schrieb Maíra Canal:
>>>> The bcm2835_asb_control() function uses a tight polling loop to wait
>>>> for the ASB bridge to acknowledge a request. During intensive workloads,
>>>> this handshake intermittently fails for V3D's master ASB on BCM2711,
>>>> resulting in "Failed to disable ASB master for v3d" errors during
>>>> runtime PM suspend. As a consequence, the failed power-off leaves V3D in
>>>> a broken state, leading to bus faults or system hangs on later accesses.
>>>>
>>>> As the timeout is insufficient in some scenarios, increase the polling
>>>> timeout from 1us to 5us, which is still negligible in the context of a
>>>> power domain transition. Also, replace the open-coded ktime_get_ns()/
>>>> cpu_relax() polling loop with readl_poll_timeout_atomic().
>>> personally I would have moved all readl_poll_timeout_atomic changes in
>>> the second patch, to avoid possible conflicts in stable. But no strong
>>> opinion about this.
>>>
>>
>> TBH personally, I also agree. But, as I don't have a strong opinion
>> about it, I prioritized addressing Ulf's feedback in the last version
>> [1].
> 
> The first version of the patch moved the call to ktime_get_ns(), so I
> thought we might as well use readl_poll_timeout_atomic() directly,
> instead of fixing up the open-coded loop.
> 

Yeah, it makes sense. I'm okay with both options, so if Stefan agrees
with it, I'm fine in moving forward with this approach.

Best regards,
- Maíra

> Kind regards
> Uffe
> 
>>
>> [1]
>> https://lore.kernel.org/dri-devel/20260312-v3d-power-management-v7-0-9f006a1d4c55@igalia.com/T/#mf96146960ec7ffeea32e732c95ccf9548af21748
>>
>> Best regards,
>> - Maíra
>>
>>> Best regards
>>>>
>>>> Cc: stable@vger.kernel.org
>>>> Fixes: 670c672608a1 ("soc: bcm: bcm2835-pm: Add support for power
>>>> domains under a new binding.")
>>>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>>>> ---
>>>>    drivers/pmdomain/bcm/bcm2835-power.c | 12 ++++--------
>>>>    1 file changed, 4 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/pmdomain/bcm/bcm2835-power.c b/drivers/pmdomain/
>>>> bcm/bcm2835-power.c
>>>> index
>>>> 0450202bbee2513c9116a36abaa839b460550935..eee87a3005325848547ce1f5fd729b168a641460 100644
>>>> --- a/drivers/pmdomain/bcm/bcm2835-power.c
>>>> +++ b/drivers/pmdomain/bcm/bcm2835-power.c
>>>> @@ -9,6 +9,7 @@
>>>>    #include <linux/clk.h>
>>>>    #include <linux/delay.h>
>>>>    #include <linux/io.h>
>>>> +#include <linux/iopoll.h>
>>>>    #include <linux/mfd/bcm2835-pm.h>
>>>>    #include <linux/module.h>
>>>>    #include <linux/platform_device.h>
>>>> @@ -153,7 +154,6 @@ struct bcm2835_power {
>>>>    static int bcm2835_asb_control(struct bcm2835_power *power, u32 reg,
>>>> bool enable)
>>>>    {
>>>>        void __iomem *base = power->asb;
>>>> -    u64 start;
>>>>        u32 val;
>>>>        switch (reg) {
>>>> @@ -166,8 +166,6 @@ static int bcm2835_asb_control(struct
>>>> bcm2835_power *power, u32 reg, bool enable
>>>>            break;
>>>>        }
>>>> -    start = ktime_get_ns();
>>>> -
>>>>        /* Enable the module's async AXI bridges. */
>>>>        if (enable) {
>>>>            val = readl(base + reg) & ~ASB_REQ_STOP;
>>>> @@ -176,11 +174,9 @@ static int bcm2835_asb_control(struct
>>>> bcm2835_power *power, u32 reg, bool enable
>>>>        }
>>>>        writel(PM_PASSWORD | val, base + reg);
>>>> -    while (!!(readl(base + reg) & ASB_ACK) == enable) {
>>>> -        cpu_relax();
>>>> -        if (ktime_get_ns() - start >= 1000)
>>>> -            return -ETIMEDOUT;
>>>> -    }
>>>> +    if (readl_poll_timeout_atomic(base + reg, val,
>>>> +                      !!(val & ASB_ACK) != enable, 0, 5))
>>>> +        return -ETIMEDOUT;
>>>>        return 0;
>>>>    }
>>>>
>>>
>>


