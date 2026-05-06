Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AB8CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 08:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SemQ4rk+1S+T2WbH6vQx/Uai5q2lfPayKiOeZcu/Etc=; b=ZvBy8tbnb1xWdeCKbSDkf8slHr
	y7ZuhZLtwFSD7jkCwyp4GDEstwX/4hOCUkwCfumTdLKHp4Eb4NMxoQiuqknwwTvibpgSkqjlo2+Rl
	GFOA6xyHbH3lc9gwAWzgHdamS6K/2mOhCq0v+ZfPwvA7bwtCSJaUENm467NDTHEndelrC5eiSM+TO
	9GuOiCkgJeZrGe3JxDUGL+k1bSRGliNgsN4EN/zIv9JBEnpnMqPLQqxlQoHoMl7AzW7xZ6SDOxA0Q
	tbZQ9MMNUZMpO/NLHs8NkpBwMqoJ7hXDpGIq3y5p3pFrb4P0iiynYoZq+ntQGkc5bvCVlqgXhDxhd
	zLL2SoHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXHg-000000006ou-0qJm;
	Wed, 06 May 2026 08:07:08 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXHe-000000006o1-1Qwc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 08:07:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778054818; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=SemQ4rk+1S+T2WbH6vQx/Uai5q2lfPayKiOeZcu/Etc=;
	b=SxnIepaZZtRufwBLUVm8gxqlpEoHuRr9rC455ES+TAcPkbjoVJEPTINFJTNdAzznkARUqEfkKB02sAJygGvp7T+/MnT6n3js+a2IkhewMz1t3o90pDjljX11NPneGZeZuSc9tvDIvEBD9N/+j+7qbn3nlOpuaZLZWD+n/4WlM8w=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=tianruidong@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0X2NRCzf_1778054813;
Received: from 30.221.149.96(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0X2NRCzf_1778054813 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 06 May 2026 16:06:54 +0800
Message-ID: <24e7a997-9479-447e-a1e2-cfab9a904668@linux.alibaba.com>
Date: Wed, 6 May 2026 16:06:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] ras: aest: Add panic_on_ue module parameter
To: Umang Chheda <umang.chheda@oss.qualcomm.com>,
 Ruidong Tian <tianruidond@linux.alibaba.com>, Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
 will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
 mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
 <20260505-aest-devicetree-support-v1-4-d5d6ffacf0a5@oss.qualcomm.com>
From: Ruidong Tian <tianruidong@linux.alibaba.com>
In-Reply-To: <20260505-aest-devicetree-support-v1-4-d5d6ffacf0a5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_010707_561991_730EFD2F 
X-CRM114-Status: GOOD (  18.16  )
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



在 2026/5/5 20:23, Umang Chheda 写道:
> The driver unconditionally calls panic() whenever an unrecoverable,
> uncontainable UE (UET_UC or UET_UEU) is detected. There is no way
> for the user to suppress this behaviour, which makes it difficult to
> test UE injection or to run in environments where a kernel panic on
> every UE is undesirable.
> 
> Add a module parameter `aest_panic_on_ue` When set to 0 the driver
> logs the UE and continues instead of panicking.
> 
> Usage:
>    # Boot time (kernel cmdline)
>    aest.aest_panic_on_ue=0
> 
>    # Runtime
>    echo 0 > /sys/module/aest/parameters/aest_panic_on_ue
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>

Hi Umang,

Thanks for the patch.

I understand that this parameter is intended to facilitate UE injection 
testing and to avoid kernel panics in certain environments. However, we 
need to carefully consider the potential risks.

When a UC (Uncontainable Error) or UEU (Unrecoverable Error) occurs, the 
hardware state may be unpredictable, and data integrity cannot be 
guaranteed. Allowing the system to continue running instead of panicking 
in these scenarios could lead to silent data corruption or other 
unforeseen side effects, which poses a significant risk to system stability.

For the sake of robustness and data safety, I do not believe we should 
expose an interface that allows users to suppress panic on such critical 
errors.

If the goal is primarily to ease testing, I suggest handling this via 
local driver modifications in your test environment rather than 
upstreaming it as a configurable runtime option.

Best regards,
Ruidong

> ---
>   drivers/ras/aest/aest-core.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ras/aest/aest-core.c b/drivers/ras/aest/aest-core.c
> index b4f4c975da1d..9ce782a66edf 100644
> --- a/drivers/ras/aest/aest-core.c
> +++ b/drivers/ras/aest/aest-core.c
> @@ -22,6 +22,11 @@ DEFINE_PER_CPU(struct aest_device, percpu_adev);
>   #undef pr_fmt
>   #define pr_fmt(fmt) "AEST: " fmt
>   
> +static bool aest_panic_on_ue;
> +module_param(aest_panic_on_ue, bool, 0644);
> +MODULE_PARM_DESC(aest_panic_on_ue,
> +		 "Panic on unrecoverable error: 0=off 1=on (default: 1)");
> +
>   #ifdef CONFIG_DEBUG_FS
>   struct dentry *aest_debugfs;
>   #endif
> @@ -342,9 +347,11 @@ void aest_proc_record(struct aest_record *record, void *data, bool fake)
>   			aest_record_info(
>   				record,
>   				"Simulated error! Skip panic due to fault injection\n");
> -		else
> +		else if (aest_panic_on_ue)
>   			aest_panic(record, &regs,
>   				   "AEST: unrecoverable error encountered");
> +		else
> +			aest_record_err(record, "UE detected, panic suppressed\n");
>   	}
>   
>   	aest_log(record, &regs);
> 


