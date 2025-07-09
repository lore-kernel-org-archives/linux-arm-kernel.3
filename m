Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D76AC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 22:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ej56GZoDfiEB41ozBqeCG5Oh6gi5hM+KQ3liG4bvyEs=; b=Amkkqyj6FsLW85/2fzYcMxaSxM
	pLXFXmVPJgl4CnencajClaTK+TegIFtRKQ0VpgzQDYEhyspcUKLW/JTkHbtgg3VAIIkpIoM/c3wqO
	fUq4lBTiUx1fQ38MZQFzohC8SEKQA5wPxzy7rFMWtlBDoT6jhe+5UOLRhj4cV61eSW7yb8swQbNf4
	tsa/k2Upmn7hrYXw2OHtjk5VEkoIz3gZsu7Qy4/Q+WTnaU6Fse4TpVg8/IA5U7bQSmB+bxsGRK+W7
	/R/klWSxwJpGr93QyER1A6QPnYVdoljiU49Tv8W6vawGMIa980Z6Eu53WlZAIWkpU05PVZHyLesmU
	Q1eYruDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdjQ-0000000AAbu-3yF3;
	Wed, 09 Jul 2025 22:57:40 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcTY-00000009vcR-2Wth
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 21:37:13 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-2ea6dd628a7so199282fac.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 14:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752097031; x=1752701831; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ej56GZoDfiEB41ozBqeCG5Oh6gi5hM+KQ3liG4bvyEs=;
        b=cSkiGAOpm5599rHNgmwOg2B7O5b8Nv8HJqZaivQMqOaze1cHk0y4XIRZIXnYS2gXlA
         aXEkKth86izXt+rp5+p2QZ4vyPfhbsiDSBdYPlxPtQ88Y+fjh8G8arXQhcNwmJE+zo0m
         Kr/hKuApacaJnhI769+OKxLH+Qy/UMGLRY8LzTPbmdnSA6NQcKePICg1D8y48Bn1yBdF
         SxvHzLvrsi2ZnJ8P9iOu63rPrnPDxrpzjrYrBCDgwjXNq2MmWp10iwIYxTp49dgVZFFY
         jSrmZjfgg7qM2+9shgdjElqlDzoLNpp1YiSzXNBHAg4ma6h0VaFJ1Vtzp07W0wy3slCc
         JQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752097031; x=1752701831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ej56GZoDfiEB41ozBqeCG5Oh6gi5hM+KQ3liG4bvyEs=;
        b=TdzfXRYl11mRdHL+DVxD5RLJCXDrbaXKAcsbRDLsrSN0DCvSZRffMRPqXfy+gU/1SN
         tButp3n6EoHMI1WVMbIYHVF1EcmWIHOORUVsscto8sdFsrOED1WUWAIqaBc5TmQejFV6
         ilDOUGoGkLsU+mgi6oIuD7zJLRh7SYjWI3tf2C6fr3H9UgejHssCGS03pOLot8SDlkuV
         DWWTr9N5R4NikLe/O9kN1j4yhebZzG5FO+t/WSR2AinuOlqWuUctPuhQ5hmFVubL7xuU
         0emGj+uSGxmfuPrA/zXBIzV5yhl8iT7EGEjbfETpbrkLR/acgN51+3rqLBSgG2wR3UWh
         WAxw==
X-Forwarded-Encrypted: i=1; AJvYcCWgqSBRUewtc2i/EU8HJsMsumzhp3HYlMgAZa8k1QsWQNtRcgWPVUbMHwAjNntJ4O8n1nXSHoEgYPEbqLO2OJZa@lists.infradead.org
X-Gm-Message-State: AOJu0YwnZxx2n9icNiui2kI1TIMsQ6j/kQCYAGlw/44l8UgVL4/6Nghq
	olgju767UgpfGb6W0OZahf4S7M3Kmjd3DpcZChS4HuHTHv110My1lsi4raZizvyZ1PTDeVFcFVO
	EV399WoHs0YWUttDghkStFr59uTQE9SJ0csVJBWUxFw==
X-Gm-Gg: ASbGncuFLj8rxOFC3Y+gFZUwzxT4S91Go6vnkxALHwnD8oyOhabGTvMJIhQFljgwoxs
	WsQn2Fgehq+WL4twvrYBjPyzpXz/ul5VgSovb/FmZZBKwBvat/ZJewqO2EhqT54rWZuoHF8Qtbp
	+vYtDF+YlHV0dn+yVr448UsOBP9Lwj/n5HXLTZzj2mqs0=
X-Google-Smtp-Source: AGHT+IFkQC/A6ox6MY05MYUw+CxjeUHI6gwfGQcb8/ByhkzLHUkzh1cpvqJdYCStR9o2v2KnGFlHUHdMYMFFGD7SDdg=
X-Received: by 2002:a05:6871:293:b0:2ea:841f:773c with SMTP id
 586e51a60fabf-2fef87e6153mr3338509fac.35.1752097030840; Wed, 09 Jul 2025
 14:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250709-gs101-cpuidle-v5-1-b34d3210286d@linaro.org> <20250709-chocolate-flamingo-of-nirvana-5de895@sudeepholla>
In-Reply-To: <20250709-chocolate-flamingo-of-nirvana-5de895@sudeepholla>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 9 Jul 2025 22:36:59 +0100
X-Gm-Features: Ac12FXwllShNhqvUQknysIBtFTk51NgLeP-HjV13-opUWbLkoeErzAnBiZILB3U
Message-ID: <CADrjBPqYSVO20a0ox9un0fq7dBss9sMGK1Q3ivCjCGaFyqhZFA@mail.gmail.com>
Subject: Re: [PATCH v5] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, William Mcvicker <willmcvicker@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_143712_663572_8A9B496F 
X-CRM114-Status: GOOD (  27.88  )
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

Hi Sudeep,

Thanks for your review feedback!

On Wed, 9 Jul 2025 at 17:10, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Wed, Jul 09, 2025 at 02:26:27PM +0100, Peter Griffin wrote:
> > Register cpu pm notifiers for gs101 which call the
> > gs101_cpu_pmu_online/offline callbacks which in turn program the ACPM
> > C2 hint. This hint is required to actually enter the C2 idle state.
> >
> > A couple of corner cases are handled, namely when the system is rebooting
> > or suspending we ignore the request. Additionally the request is ignored if
> > the CPU is in CPU hot plug. Some common code is refactored so that it can
> > be called from both the CPU hot plug callbacks and CPU PM notifier taking
> > into account that CPU PM notifiers are called with IRQs disabled whereas
> > CPU hotplug callbacks are not.
> >
> > Additionally due to CPU PM notifiers using raw_spinlock the locking is
> > updated to use raw_spinlock variants, this includes updating the pmu_regs
> > regmap to use .use_raw_spinlock = true and additionally creating and
> > registering a custom  pmu-intr-gen regmap instead of using the regmap
> > provided by syscon.
> >
> > Note: this patch has a runtime dependency on adding 'local-timer-stop' dt
> > property to the CPU nodes. This informs the time framework to switch to a
> > broadcast timer as the local timer will be shutdown. Without that DT
> > property specified the system hangs in early boot with this patch applied.
> >
>
> Assuming this is arm64 platform and using PSCI for all the power management,
> can you please briefly explain why all these dance is absolutely necessary
> when PSCI calls can be the clue for the EL3 firmware. I am basing my question
> on this information in the file:

Yes, you're correct it is an arm64 platform using PSCI. Unfortunately
I don't have access to the el3mon firmware code to speak super
authoritatively about it, but you're correct that it is essentially
working around a firmware limitation.

What I initially observed whilst working on suspend to RAM, when
hotplugging CPU's with just the PSCI calls the system hangs. Debugging
this and tracing versus the downstream production drivers the missing
piece was programming the "ACPM hint" to the CPU_INFORM registers.
Further debugging and power measurements also showed that the ACPM
hint is also required in addition to PSCI calls for the cpuidle states
to function correctly.

> /*
>  * CPU_INFORM register hint values which are used by
>  * EL3 firmware (el3mon).
>  */
>
> This clearly sounds like workaround for the firmware limitations. That
> needs to be clearly documented IMO.

Sure I can add a more verbose comment, that this is required to work
around firmware limitations in the PSCI implementation.

Thanks,

Peter

