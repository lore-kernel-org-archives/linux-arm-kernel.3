Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF7E606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 15:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wJD86OKD;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=WqqR29Pp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ETh+qmqMfEkr1Nqt6XulXH2AGIO17TLVulw6TLSaZMI=; b=wJD86OKDKHWQDN
	s5/UxkmRwItYCw+ZxsoBCV4hwTrieDwUYg0lQ5ERmq0UKCQ/Px5IEhWxPDh6AhteQHy/6VnXbit0D
	z6WdIFw8etzm9O7x00Pn97rKIkmOnhd5xqwqu67lBhBaj0E267YDuUfjaYHTiNTLoKQCI5jsN5/2C
	hVEaDeb4x3QK65Xdq7SDMTHQ3LiXRATXpbxYeCKshaEekFhubwn+ytGXU8Xf4+dpvVu8ruB+qI4g8
	aNwidSRTvNh8iRdjn79M3PHqdZnN6onOEV5ysHr/Bw1rprK2qzdBBVdDLEA8mTRlp8u2syueBZF50
	B1mI93ZQ/oEXO8zW0Whg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLiw6-000000058yG-1jSH;
	Tue, 27 Oct 2026 15:18:02 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLiw3-000000058wy-1P2d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 15:18:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=ETh+qmqMfEkr1Nqt6XulXH2AGIO17TLVulw6TLSaZMI=;
	b=WqqR29Pp2Vlx3OtcVC4Kr5NLZdfz36TZwerg6Vvb+gD0YAnJXORe6etAKcnNWw
	uE1Co0o2Y7LJo227IPd9b2kGO5RK7InACI86Iw03UmPow3sgoWrkWUt3vds8mwJA
	2WqpE3JztnOLl97KqK8CDPEEISdgUHR8IE8OB6NDGVeX0=
Message-ID: <a48de7cb-31dd-465e-9080-6dc05d6b5703@163.com>
Date: Tue, 27 Oct 2026 23:17:33 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v1] coresight: funnel: inport schedule by priority can
 not take work
To: Leo Yan <leo.yan@arm.com>
Cc: suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
 alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261025131308.7158-1-xuchao066@163.com>
 <20261027084133.GA766279@e132581.arm.com>
From: Chao Xu <xuchao066@163.com>
In-Reply-To: <20261027084133.GA766279@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCgvCgCnSaGKwOBqOhCZCQ--.49558S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFykGF17XF1xtw45Xr13Jwb_yoW8ZFWrpF
	Wvk3yYkFsYgr4jywnrtF4UWF13tw4vvayxXr95Kr40gw1YqrykZF1xKrykKFn7uF4rGr13
	tr4ayr92gFyUWw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UV7K3UUUUU=
X-CM-SenderInfo: x0xfxtbrqwlqqrwthudrp/xtbC6Aola2rgwIojVAAA3b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_081759_814832_0B28F0DE 
X-CRM114-Status: GOOD (  19.35  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

在 2026/10/27 16:41, Leo Yan 写道:

> Hi,
>
> On Sun, Oct 25, 2026 at 09:13:07PM +0800, Chao Xu wrote:
>> Before enable funnel, priority must be set. Changing the port
>> priorities in real time is not supported.
>> If the priority control register is written when one or more of ports
>> are enable, then the write is silently rejected.
> Could you cite the relevant documentation in commit log?
>
>    The CoreSight SoC-600 TRM, section 9.11.2, PRIORITYCONTROL, a funnel
>    rejects priority register writes whenever any port is enabled. The
>    current sequence therefore prevent the configured priorities from
>    taking effect.
>
>    Write the priority register before enabling the first port.
v2 patch add.
>
>> Signed-off-by: Chao Xu <xuchao066@163.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-funnel.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
>> index af40814ce560..17f985798d7f 100644
>> --- a/drivers/hwtracing/coresight/coresight-funnel.c
>> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
>> @@ -66,8 +66,8 @@ static int dynamic_funnel_enable_hw(struct funnel_drvdata *drvdata, int port)
>>   	functl &= ~FUNNEL_HOLDTIME_MASK;
>>   	functl |= FUNNEL_HOLDTIME;
>>   	functl |= (1 << port);
>> -	writel_relaxed(functl, drvdata->base + FUNNEL_FUNCTL);
>>   	writel_relaxed(drvdata->priority, drvdata->base + FUNNEL_PRICTL);
>> +	writel_relaxed(functl, drvdata->base + FUNNEL_FUNCTL);
> Please move the priority write into the first port branch:
>
>    /* Claim the device only when we enable the first slave */
>    if (!(functl & FUNNEL_ENSx_MASK)) {
>            rc = coresight_claim_device_unlocked(csdev);
>            if (rc)
>                    goto done;
>
>            /* Update priorities while all ports are disabled */
>            writel_relaxed(drvdata->priority,
>                           drvdata->base + FUNNEL_PRICTL);
>    }
here is more better then v1 patch, v2 patch will be sent.
>
> Thanks,
> Leo


