Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D46C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 22:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=PJyyD6VmEYWxcK330MV1aDFyCcL0XkNUkxzA2EFgIdQ=; b=uGt9eROBKJYRIS
	FDy1G/rfL7mhK451uT+LHzLYIkY+BCakLbMQ49aWjIQ7HSs9i9c5/BpTHLpV0H8k0l17kF6zyFGnu
	DVgPEIMk7MGwtSKlqpu4ZosrJLujWjWmGel0uX0dZpOJ5EB+BQ40JSZ/vTQzphqxIL9fMBE/NXSIb
	zFi3fLfcH3HMvGHo+fZZIMmpM/t9YiLXE4GOl8QDliXDNURkh0ZD4sCJ92SKadjPAl2j9/lqkhUdt
	zaCA/ig5FIMuibgIzk1B89J2Mb5KV875WHY5khQg4AIQrFt5qsb91IDyxz8AZKE5isGWX+TpSbfZu
	oo/359TdoTniVxD73isQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcu7I-00000005wQa-2JWe;
	Tue, 28 Jan 2025 22:31:32 +0000
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcu5x-00000005w7P-0T6N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 22:30:10 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3ce7b6225aeso99434775ab.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 14:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738103407; x=1738708207; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PJyyD6VmEYWxcK330MV1aDFyCcL0XkNUkxzA2EFgIdQ=;
        b=YSSNtq32cSZ8jwHO2xSlWgNGP93+BYqhSgADqtGYlWSO9Ik8K2/MigNMntceHkI7AM
         CGaAQyz3tMJ0ls2m9rtRUearfpQEs3+flY/21YkPagdyLFi9a9AwMuSvmOegkahXNMYP
         ketUaRiI8dXG0OLCCnotihhwf1UnBp6S+gZa75jFO6Ul58TGpVc78tShblP2s/4unVxk
         nA9IBWBINIgKHHbdpk5kXu17dWo4HBara7rt6EimqLMrzSr9Kr1VXqBT98PEGi823Kjj
         Y3oo0PrWdyhyadExyRzP/8zFXu6qyB9HIaRql5cuPJecLXFBrLrIXCqlj8ikrV5jXHNv
         KjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738103407; x=1738708207;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PJyyD6VmEYWxcK330MV1aDFyCcL0XkNUkxzA2EFgIdQ=;
        b=eB0k308iHL8weuVHrPOLYcJIG/AMwZEQkkwvv7dRmVKyXIYa2CXlnA8+bs7+J6Qic+
         UY2gbQEgN2dDhjW4Qse19p1V1hwNsi3GY6c2SDu+JEp8pSZmy9DrrUdYdtV2r9PU7SX5
         nWi1LP/Czh+6TrWHy2nM+e/S4d3E7OXpNiXXzMIGRr9idFNQEqf1txm9L6xryzYAGt9X
         AstiQi93rkQDPcdQRugOsMdjHY9XbVGdap1/JzK/RHidwP0DRfgEVpY7QTgxb0St/pZX
         jwKs/AlbFzXc/sMtPQTbE/QIBO2Wx272mZVHqAsdzOsQeblr3qjXS807LU9eC032VTto
         /oXg==
X-Forwarded-Encrypted: i=1; AJvYcCVw9YKzQEWKyIz9Y0OW2cJGaJsjOOoVdYKDmYsDW161lLrI6EJOq+ubzNimaSoTB2NDj2hMmdKNtNeFFvfXjwb0@lists.infradead.org
X-Gm-Message-State: AOJu0YxjyFbGWgAxhK9ms5HR5eINmlqstvlM7FEyeRe2iSNvWsGqSUfM
	xB/EVJ/iEco2QMwRGdk+sPpVk3juGaUOYGtXZwbdPRUtrnYvTxQhsoIvfrODGDKXVMlhZ3xILr9
	8kF7N8VwyjB7pzUL3oYNKaA==
X-Google-Smtp-Source: AGHT+IEzKUN81fJKc8eE6WAbDE6ZVYHJOboxJYYulvMty+JLLQCGAA/P2PHrSwX2t2Fmqv3l22wjepYmRho8Tz2r6Q==
X-Received: from ilbby2.prod.google.com ([2002:a05:6e02:2602:b0:3a7:cfdb:57d])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1fc2:b0:3ce:78ab:dcd1 with SMTP id e9e14a558f8ab-3cffe4a7bf1mr8589345ab.19.1738103407532;
 Tue, 28 Jan 2025 14:30:07 -0800 (PST)
Date: Tue, 28 Jan 2025 22:30:06 +0000
In-Reply-To: <a6152acf-67e1-4800-857f-cffb35a5d738@arm.com> (message from
 Suzuki K Poulose on Tue, 28 Jan 2025 15:55:00 +0000)
Mime-Version: 1.0
Message-ID: <gsnt5xly372p.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [RFC PATCH 4/4] perf: arm_pmuv3: Keep out of guest counter partition
From: Colton Lewis <coltonlewis@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	yuzenghui@huawei.com, mark.rutland@arm.com, pbonzini@redhat.com, 
	shuah@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_143009_151991_0F2B028B 
X-CRM114-Status: UNSURE (   6.21  )
X-CRM114-Notice: Please train this message.
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

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

> On 27/01/2025 22:20, Colton Lewis wrote:
>>    	/* Disable all counters */
>> -	armv8pmu_pmcr_write(armv8pmu_pmcr_read() & ~ARMV8_PMU_PMCR_E);
>> +	if (cpu_pmu->partitioned)
>> +		armv8pmu_mdcr_write(armv8pmu_pmcr_read() & ~ARMV8_PMU_MDCR_HPME);

> typo: s/armv8pmu_pmcr_read/armv8pmu_mdcr_read

Good catch. Thanks

