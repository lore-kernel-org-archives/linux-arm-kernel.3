Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963B6D14899
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 03:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4wKAGkCZEe39pTChgi73m7wO7Ejxj689GXAAP95ccw=; b=OUbwbG02UqJBjm6ZksUcNvisUt
	TSoaAbz1t6ysbGWL7mNzaQwA2W5CDjehL3uOgvCL3hDAMR+yphErj3r/56AVpM13ltdZxh5u/kQHj
	w6gtb0L9Jrd2DAovhFdiS40NF3RLJNgLtbvfzNK0EYBt97qVz8e8CP98MDnXwKD0mv4S8uFFWlAXs
	FHvIPT+oDIjsTeTV6rjItid1u5MjhUuJT3Bg8UtOxJmrfM7CXj89TsupS5M1vFRsWefD614CzmJdY
	Io4Zp+Za1v58cBjHLEbgqn5SABKi9tlWdX6WZruUMBo2YwKb4U2LaPr9oKsmyLIEvjTPk9KHG4C6v
	mQfEJgNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdgQQ-0000000FrjI-3udT;
	Thu, 08 Jan 2026 03:11:02 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdgQO-0000000Frim-2A1e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 03:11:02 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-29f2676bb21so25526895ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 19:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767841859; x=1768446659; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W4wKAGkCZEe39pTChgi73m7wO7Ejxj689GXAAP95ccw=;
        b=lhivx5HpiSNhpgw4Nce39xXESC+yqWxUKM6zQ/sAOtSsJkkepFCkCyb6qsKuKT5FFk
         YSQc7lK/6+fuVnxRXaqs6wGRBA1x7ok3dy3r2QvoUODQy7EoZ78NCYZ1R5vzFRGLNICT
         XCBxB7cSPahGusQEvz0eD2gRo/tvugQHewEvf6CyByJOOI31DQ48bLNKXi8tteKdJtNd
         8zp/BSDbNulTzHxTkaff1djePKg3QJTGRDjCvmGDvQid6WTMD7iZ20OrCmIQiEqDebXN
         8+/BxnijW9KWGhwpyR7rr1A3K0QgKqp9anPWowKPE0VzEQ4DmmN45Sj9cICHt93J0WVa
         1aDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767841859; x=1768446659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4wKAGkCZEe39pTChgi73m7wO7Ejxj689GXAAP95ccw=;
        b=Kvi5jLL7Sa3RIMCxoPdzIhNUHIOhtnHbMsUw45dd43npz3yJWebTx0dwhrxat775ob
         SUcHL5IMvFzRgEusp9TLAjMXJoh7ZeLZDMHJ43h0tXU5XIERqRC9rgLWiHjO8ICg56KV
         n56WD7baJdd135nqaItIDK4kixZzti805BdLt1ESocseFBJV/lf8e3QFon8iOS89Avsf
         u7KwPOQNOBul+f8qn4zChwUTsrlYp+hT1fRtePgiC4RxQEy/gj7iHdF9kjCTn07+PvI4
         v8Cn0BnLLWardc3uF5oel5DKbrpWB0Sjmu9kyngX8kKP8/miEr7JHQSa4acQ0LCaCg6N
         weSw==
X-Forwarded-Encrypted: i=1; AJvYcCXJH1DsOTov3vaM3kUbbNDsknFrRmISmm4gyEOFGGeiF7sui7q+HmV5wkyUMSyN0zfFzJEqYRxxtyjFoJqkeqY4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/3mVdmNd1y+En7EcDr3wHY8V/tGZTB3wXTSJMLanHc2u3z4Zf
	y/orWGhBX1pc4Gg+zCBLcLLe6PnaK0RK7Msc0+khvrNxpkAwCBQR7WHObKm6KijzRBE=
X-Gm-Gg: AY/fxX4kBYbf9jcB7EGQb8n4EcCh5aEuoP/GkPqqEJiq4nIZs91m5CYElfsT1YFLaeE
	XOWXb88PUJPakJxHyRGSUJmprd424/IhJpisETyXF9JqmAWcTlUy6ECYOvd2x6y9tzM353kpngQ
	VDUxXNM4kqX4iVGXpW+XTiG5EiiRjPMOytxSMtnJGY9IfpQ90R06slNpewKZbTRGiEUDWGZ2wXQ
	w7B69FtvF0agamSMrjrQ6JcBjqB6/wEG00VXxr6YtRgc0H5MICcXp6kBQDsQNPLjbA+ArnR8x3X
	N4BgiZ9g9zcyoTS0thb9sit0OB+xTKYnBRL1i0FjOLuJq1hY5iwGGc23mR1nKczOGjwbFY0KWRE
	pNFvmcVIx7BF5Z3oZFQOA1uqjIqtxz2gYdm8QNhMIK2Yl7Bfoh8e1w0bHauY/Ux9N5jqpIlrU2o
	L9MtflvXVNBvU=
X-Google-Smtp-Source: AGHT+IF2GALJIvh/2Rj4DhZwH99ewpTJcYda51Qr0IK1kRHh6QlqlfYPgE0EbGL75vFlvU/nTxL8+A==
X-Received: by 2002:a17:903:32d1:b0:298:3892:3279 with SMTP id d9443c01a7336-2a3ee4363abmr40555275ad.17.1767841858523;
        Wed, 07 Jan 2026 19:10:58 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3f3115682sm26328735ad.55.2026.01.07.19.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 19:10:57 -0800 (PST)
Date: Thu, 8 Jan 2026 08:40:55 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jie Zhan <zhanjie9@hisilicon.com>
Cc: rafael@kernel.org, ionela.voinescu@arm.com, beata.michalska@arm.com, 
	pierre.gondois@arm.com, zhenglifeng1@huawei.com, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com, 
	jonathan.cameron@huawei.com, prime.zeng@hisilicon.com, yubowen8@huawei.com, 
	lihuisong@huawei.com, zhangpengjie2@huawei.com, wangzhi12@huawei.com
Subject: Re: [PATCH v5 0/3] cpufreq: CPPC: Update FIE arch_freq_scale in
 ticks for non-PCC regs
Message-ID: <6pvkd3y43bscjkw7seyszxazu3fnowogfckp27o6yuupriiuqg@vsol4t42o3uy>
References: <20251223072119.3372582-1-zhanjie9@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223072119.3372582-1-zhanjie9@hisilicon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_191100_569237_50B19C39 
X-CRM114-Status: GOOD (  17.51  )
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

On 23-12-25, 15:21, Jie Zhan wrote:
> Currently, the CPPC Frequency Invariance Engine (FIE) is invoked from the
> scheduler tick but defers the update of arch_freq_scale to a separate
> thread because cppc_get_perf_ctrs() would sleep if the CPC regs are in PCC.
> 
> However, this deferred update mechanism is unnecessary and introduces extra
> overhead for non-PCC register spaces (e.g. System Memory or FFH), where
> accessing the regs won't sleep and can be safely performed from the tick
> context.
> 
> Furthermore, with the CPPC FIE registered, it throws repeated warnings of
> "cppc_scale_freq_workfn: failed to read perf counters" on our platform with
> the CPC regs in System Memory and a power-down idle state enabled.  That's
> because the remote CPU can be in a power-down idle state, and reading its
> perf counters returns 0.  Moving the FIE handling back to the scheduler
> tick process makes the CPU handle its own perf counters, so it won't be
> idle and the issue would be inherently solved.
> 
> To address the above issues, update arch_freq_scale directly in ticks for
> non-PCC regs and keep the deferred update mechanism for PCC regs.
> 
> We have tested this on Kunpeng SoCs with the CPC regs both in System Memory
> and FFH.  More tests on other platforms are welcome (typically with the
> regs in PCC).
> 
> Changelog:
> v5:
> - Minor cleanup of cppc_perf_ctrs_in_pcc_cpu() (Thanks to Rafael).
> - Add a function description for cppc_perf_ctrs_in_pcc_cpu().
> - Pick up tags from Lifeng and Pierre, Thanks!

Applied. Thanks.

-- 
viresh

