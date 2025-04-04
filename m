Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7B7C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 06:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f87tNB8JBD2nIE3htroNP36O6UZdJ+0J/NLWPyqK/P0=; b=m6wqUPHxXP3U0MqiXk9O150zYa
	WeGk3I1yjorcjaDTW283Tm4sD2Vz3t4iO3y7vCBDAQ6s2Ul80Pp0JkBebJ9tgjqA/uSbOqIPK5ZJT
	2m/TM0YQz7y3SrhssDbrAOOIw7KEmVbBX37vjHwcM3zqdU0opU6E3vLBkCrGcoV1aQZDfZRpuA5Wf
	b+9FFIDHqpqiqlRF6XQGNoo0lpf7QsS9wq5Isom+fEQPMPAhd3Mqi9yKfTGGKMQpNC1GUDKAsqCpc
	srRrfixRBYCBRtrgjXWjIwRSBdgz28Psn3dl4gtqjdsK8HHNF2FBwVuzZsTKaOGwpus7eql2qT/fN
	PU/YUMgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0aCH-0000000Apxb-1sJV;
	Fri, 04 Apr 2025 06:06:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0a8i-0000000ApdT-2RFs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 06:02:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DF295A46C90;
	Fri,  4 Apr 2025 05:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884B6C4CEDD;
	Fri,  4 Apr 2025 06:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743746571;
	bh=IRMiqdgFfuR7YhdJiN5QWoj4YDPH4E1FMu5HHkdtHiE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QjLrGbxacrlxnEDINOoGe5zW/1gRvzVUB0eEu2DckGZX07yoz1LdqMxMHV0LvgY5N
	 XFu3hkroT0jzKNwM6yxxysCUOJ8+tzfd4am01efTd3+15QnbAvpNsZdGLev2eqyJk1
	 vD+BXsbgqgP47020tukOf1SJbQEa60oQGOjcDGGa5YQ6TpOlPDxB6GXlqtV+mba5vX
	 Zy0fFGrVfmC3viPWmKFNr4WUPKCaz1cM5y6PjUsgFpWEOjvvccgG8rRhxa3lGzDGkd
	 k5cY//rzcrWtCHV4vZbaPke68UAgDhCvftw3hYRpt1tSAggbx34smVGx7KjY6wEGDU
	 7Rm+oUrTk7bfA==
Message-ID: <ef25c226-6801-48b4-8347-3362415d9de3@kernel.org>
Date: Fri, 4 Apr 2025 08:02:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Add module support for Arm64 Exynos MCT driver
To: Youngmin Nam <youngmin.nam@samsung.com>,
 Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan
 <saravanak@google.com>, Donghoon Yu <hoony.yu@samsung.com>,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, semen.protsenko@linaro.org
References: <CGME20250402233425epcas2p479285add99d27dc18aabd2295bfcbdc8@epcas2p4.samsung.com>
 <20250402233407.2452429-1-willmcvicker@google.com> <Z+8xrLbya9/oFg7y@perf>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <Z+8xrLbya9/oFg7y@perf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_230252_755098_07B4F766 
X-CRM114-Status: GOOD (  10.84  )
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

On 04/04/2025 03:11, Youngmin Nam wrote:
>>
>> -- 
>> 2.49.0.472.ge94155a9ec-goog
>>
>>
> 
> Hi Will.
> 
> I tested this series on a E850-96(Exynos3830 based) board and it's working as a moudle.

Hi,

On which kernel did you apply these patches for testing?

> 
> # dmesg | grep mct
> [7.376224] clocksource: mct-frc: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 73510017198 ns
> 
> # lsmod | grep exynos_mct
> exynos_mct             12288  0
> 
> # cat /sys/devices/system/clocksource/clocksource0/current_clocksource
> arch_sys_counter
> # cat /sys/devices/system/clockevents/clockevent0/current_device
> arch_sys_timer
> 
> # cat /proc/interrupts 
>         CPU0    CPU1    CPU2    CPU3    CPU4    CPU5    CPU6    CPU7
>  12:    2566    2752    2467    4026    3372    2822    2115    3227 GIC-0  27 Level     arch_timer
> ...
>  77:       0       0       0       0       0       0       0       0 GIC-0 235 Level     mct_comp_irq
>  78:       0       0       0       0       0       0       0       0 GIC-0 239 Level     mct_tick0
>  79:       0       0       0       0       0       0       0       0 GIC-0 240 Level     mct_tick1
>  80:       0       0       0       0       0       0       0       0 GIC-0 241 Level     mct_tick2
>  81:       0       0       0       0       0       0       0       0 GIC-0 242 Level     mct_tick3
>  82:       0       0       0       0       0       0       0       0 GIC-0 243 Level     mct_tick4
>  83:       0       0       0       0       0       0       0       0 GIC-0 244 Level     mct_tick5
>  84:       0       0       0       0       0       0       0       0 GIC-0 245 Level     mct_tick6
>  85:       0       0       0       0       0       0       0       0 GIC-0 246 Level     mct_tick7
> 
> Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>

This means you reviewed *every* patch.

> Tested-by: Youngmin Nam <youngmin.nam@samsung.com>

Best regards,
Krzysztof

