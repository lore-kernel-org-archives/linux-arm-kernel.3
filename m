Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0447FD59F50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 22:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=3V7ABHshgDafwAwYHEV+MXsyHyX7z1eKDaoAGOxARUw=; b=XTjF4NgTYN2qeA
	V3ShPeMjgnixtGh3y4R2E1+9sP0YWS/N4T8SN/WO0zrJj9iG/F6gxOP2nhMPuTIkryD5xCXlrm1kh
	VVaN0RFFQY9CNqwRzSwjYMbjCoqUpZjeMDYH9klYIQzC/8lEyDuPQjg8QeL00glg5EZvBZ/IVHgst
	nc3SKYlNbeD9+KxqwhntT3Hw34xXRewBGHIFSNYuCWbM6VCNP6P90kbVgMUy/rlAK/L3epGAvV01l
	c0JBsU6Alth/+K+Jm01NrzrOcq/+DI3u17z8+9JTJSWwsboXLBILmlxc0BCEco61ukNHXOHRRMKmt
	EyueXw+wFuzMnKykl+MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUBkk-00000001BAc-0YIG;
	Fri, 12 Dec 2025 22:36:46 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUBkh-00000001B9q-2V1c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 22:36:44 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-65b349639dbso1482638eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 14:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765579002; x=1766183802; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3V7ABHshgDafwAwYHEV+MXsyHyX7z1eKDaoAGOxARUw=;
        b=gur5VrLZU834N2MvHxHugzM3Dr7J3dvNc4a5pjCNR05aek1HuAlkcQrFyIJW5v8He2
         LeKrfrlfJ2pDSePOaqK/GvNtOeYPT6+xE8LBpsVI9QUqOwMsRozUc85QU+nZcogxGMM9
         LYtWcegjIFfYrQalKWOY3/CRUJ8fb/8A4C3tzkdb5SZ+20IGOBjYHXPsQGDBkI1IJnW0
         W77cjxnLJuVWAeZ64CJMRR3Ip79WntyqnN46DfA7EtOrn0tWugHw6lXxR5kxuflgVEDp
         oOrH1nE+9THnhJL6/n30OouMSU9pvEz2SwFKpRtZK96SEDz+vNbgCvSDnehvcna/a8U9
         pKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765579002; x=1766183802;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3V7ABHshgDafwAwYHEV+MXsyHyX7z1eKDaoAGOxARUw=;
        b=fMf4YSr9WbrWS/1Z4JaMOlYOK7kIwhiLiTHgORy3Y3nyNB6ffQ9dzmidoLpUtEhIcd
         jlXsbzurUNx7XO24Vakqw4rZmW8QT0P01NKL7Nz8T2A2Oemsg+77xcOdaQANNbPR/w8C
         QmGFJYjqPwVC3PU3ljk4+CH/v6V0lilQ4mewGXkkka1p2oaLCx/B1I/6srNQVzynISXT
         QCTHiuIogClEemyt3dGNlRFyFF4OXd8sZqh+4CNnw8fTOWrjA9eTToHJTZ0laKya/koP
         zxL1akA9KzxQIPaMg5yVVGWQrHVr/Xkvk97gkDohxyRdPhxLMFDYq659lYFk+m522BiG
         5C+A==
X-Forwarded-Encrypted: i=1; AJvYcCW5vHnFapcj+bqLmuxVC/9JDQ7NTtMuDHq5Pngk0OL2eXrg+4AusMVvHm7E9EagLxvfu68Lzry0QFfSlvg86PkU@lists.infradead.org
X-Gm-Message-State: AOJu0YzVnjzPMNjeZ706dA8assD7z5+SaQBjKJX/kUimkCSgRefNq9Fl
	Px6oeHoWeDHbjvtxTy1Xshwni9SvRwViFVCjHgAaMl78RB1myWx6TCJmvPMNdOt4bZ34JuTxltt
	8lik7utq3DC4ppf40AkdYdyVp7g==
X-Google-Smtp-Source: AGHT+IHkZVgWFjBleB6izi/mYS6b4xrdOCdIwFPbm2svitIfX3LWxEQK52duuNdAGmZBwWfL5PIEmP5Eu+rxvNmu9A==
X-Received: from ilbbl8.prod.google.com ([2002:a05:6e02:32c8:b0:434:972f:bf90])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:2223:b0:659:858f:f1d3 with SMTP id 006d021491bc7-65b44ff60f4mr1625746eaf.0.1765579002046;
 Fri, 12 Dec 2025 14:36:42 -0800 (PST)
Date: Fri, 12 Dec 2025 22:36:41 +0000
In-Reply-To: <aTimpRFfr9wI9Hw5@kernel.org> (message from Oliver Upton on Tue,
 9 Dec 2025 14:45:57 -0800)
Mime-Version: 1.0
Message-ID: <gsntbjk32upy.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v5 20/24] perf: arm_pmuv3: Handle IRQs for Partitioned PMU
 guest counters
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oupton@kernel.org>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_143643_658953_65C38AAB 
X-CRM114-Status: GOOD (  15.95  )
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

Oliver Upton <oupton@kernel.org> writes:

> On Tue, Dec 09, 2025 at 08:51:17PM +0000, Colton Lewis wrote:
>> Because ARM hardware is not yet capable of direct interrupt injection

> PPI injection, it can do LPIs just fine.

Clarification noted. I will update the message.

>> @@ -961,6 +964,12 @@ static irqreturn_t armv8pmu_handle_irq(struct  
>> arm_pmu *cpu_pmu)
>>   		 */
>>   		perf_event_overflow(event, &data, regs);
>>   	}
>> +
>> +	govf = pmovsr & kvm_pmu_guest_counter_mask(cpu_pmu);
>> +
>> +	if (kvm_pmu_is_partitioned(cpu_pmu) && govf)
>> +		kvm_pmu_handle_guest_irq(govf);
>> +

> The state ownership of this whole interaction is very odd. I would much
> rather that KVM have full ownership of the range of counters while the
> guest is loaded. By that I mean the PMUv3 driver only clears overflows
> on PMCs that it owns and KVM will do the same on the back of the IRQ.

If I'm understanding correctly this is a code location concern, because
the host driver has to handle the interrupt in this function or a callee
of this function.

I will do it that way. It would be duplicating a small amount of logic
in kvm_pmu_handle_guest_irq() but I see your reasoning.

> Similarly, KVM should be leaving the "guest" range of counters in a
> non-overflow condition at vcpu_put().

Noted from your comments on kvm_pmu_put()


> Thanks,
> Oliver

