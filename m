Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463ECF3383D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nzDO8JHBjMy9LqMyHLjdL/DanHBIGqFXpaJScTCJtQ=; b=QBqJv/Y9y3459rB36hFsv6qf0H
	AN/iAUqv/iQYgx4bkZpeBTJu6zlksCgJ+Upc1hAZnQrv9DLLosysBL4UXkHMAGgevsp7dgN/mnt7q
	WUhwwEclZa7DSTy7e/DzSRIlWedVd2zUFF8LXbbw3GBMjA/1Nbkq2z36MANcWja1z4KijDzQS8qf/
	gCb5X1PlvfSxEaBsjeujstV9I9+qKJA8Ooyr10jpnFXk6SR8AswCuu1G3wt0e3AM6Z5NGYE1j8aMs
	pvsAmhEL67oBG1OXFY6tKudkqGHsAjXmr2BMZsQYtqUZq3gQ+Cu70HKRd2Lu0918jFxfYWAotnPt1
	NKSckokg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VfK-00000006eNU-0tnv;
	Tue, 17 Mar 2026 14:45:02 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VfD-00000006eKg-3wh8;
	Tue, 17 Mar 2026 14:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9nzDO8JHBjMy9LqMyHLjdL/DanHBIGqFXpaJScTCJtQ=; b=kPkW309+RbGupOYzxYbz0CwI8B
	jEeGsg5RfC93jrywAcCL34e1cun4dqZs3klL8EDztT2qCwquFn+lHGmIREkefKmcP8GUQZgL2mXG4
	djbLGdEgQAheNnsKH+o5Q67B+F3bb0E4ocgxAPTs9/E0K+QaauyLMxrdd82Jj2Lyq0HdghUhSIcXa
	5/aGP8YOr1JW/ivrCAbCMC59PwxSkF/i4FaVUFNmMTIjee1alVMKzxM+j5VbJevf8UpK8WUFbDm1y
	qMpwaOfwiRfpasKIvS4VYtxK58ZuDzYCM1iHkDEMhWQnCRM3bL4Jv6UpARZkODTX9vQasW7n8DnUe
	MH37YmVA==;
Received: from gwsc.sc.usp.br ([143.107.225.16] helo=[172.24.4.78])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1w2Vet-002Joh-2k; Tue, 17 Mar 2026 15:44:35 +0100
Message-ID: <14ad62c7-7046-4df6-8267-c868a9fde982@igalia.com>
Date: Tue, 17 Mar 2026 11:44:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] pmdomain: bcm: bcm2835-power: Increase ASB control
 timeout
To: Stefan Wahren <wahrenst@gmx.net>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com,
 stable@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 linux-pm@vger.kernel.org
References: <20260312-v3d-power-management-v7-0-9f006a1d4c55@igalia.com>
 <20260312-v3d-power-management-v7-2-9f006a1d4c55@igalia.com>
 <bdae424d-f4b5-4181-9421-4393fe3ac8fb@gmx.net>
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
In-Reply-To: <bdae424d-f4b5-4181-9421-4393fe3ac8fb@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_074455_981258_3A0EBE98 
X-CRM114-Status: GOOD (  18.66  )
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

Hi Stefan,

On 15/03/26 20:07, Stefan Wahren wrote:
> Hi Maíra,
> 
> Am 12.03.26 um 22:34 schrieb Maíra Canal:
>> The bcm2835_asb_control() function uses a tight polling loop to wait
>> for the ASB bridge to acknowledge a request. During intensive workloads,
>> this handshake intermittently fails for V3D's master ASB on BCM2711,
>> resulting in "Failed to disable ASB master for v3d" errors during
>> runtime PM suspend. As a consequence, the failed power-off leaves V3D in
>> a broken state, leading to bus faults or system hangs on later accesses.
>>
>> As the timeout is insufficient in some scenarios, increase the polling
>> timeout from 1us to 5us, which is still negligible in the context of a
>> power domain transition. Also, move the start timestamp to after the
>> MMIO write, as the write latency is counted against the timeout,
>> reducing the effective wait time for the hardware to respond.
>>
>> Cc: stable@vger.kernel.org
> I think, a Fixes tag would be helpful here. Also this fix should be the 
> first patch of the series or separate.

I'll send it separately with the Fixes tag. Thanks!

>> Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>>
>> ---
>> To: Ulf Hansson <ulf.hansson@linaro.org>
>> To: Ray Jui <rjui@broadcom.com>
>> To: Scott Branden <sbranden@broadcom.com>
>> Cc: linux-pm@vger.kernel.org
> This looks unusual. Is this intended?

As b4 doesn't support it natively, I used this strategy to send only
this patch to the linux-pm mailing list and not the whole series.

Best regards,
- Maíra

> 
> Best regards
>> ---
>>   drivers/pmdomain/bcm/bcm2835-power.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/pmdomain/bcm/bcm2835-power.c b/drivers/pmdomain/ 
>> bcm/bcm2835-power.c
>> index 
>> 0450202bbee2513c9116a36abaa839b460550935..1815eb4ee69b9b672b5e314402f1cc9897c57dcb 100644
>> --- a/drivers/pmdomain/bcm/bcm2835-power.c
>> +++ b/drivers/pmdomain/bcm/bcm2835-power.c
>> @@ -166,8 +166,6 @@ static int bcm2835_asb_control(struct 
>> bcm2835_power *power, u32 reg, bool enable
>>           break;
>>       }
>> -    start = ktime_get_ns();
>> -
>>       /* Enable the module's async AXI bridges. */
>>       if (enable) {
>>           val = readl(base + reg) & ~ASB_REQ_STOP;
>> @@ -176,9 +174,10 @@ static int bcm2835_asb_control(struct 
>> bcm2835_power *power, u32 reg, bool enable
>>       }
>>       writel(PM_PASSWORD | val, base + reg);
>> +    start = ktime_get_ns();
>>       while (!!(readl(base + reg) & ASB_ACK) == enable) {
>>           cpu_relax();
>> -        if (ktime_get_ns() - start >= 1000)
>> +        if (ktime_get_ns() - start >= 5000)
>>               return -ETIMEDOUT;
>>       }
>>
> 


