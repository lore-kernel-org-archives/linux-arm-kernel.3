Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B04C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 18:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=rOrAEmmc0o2wzEyiwOq4DQ4uXK1/Mbcgtx+WsCmakwQ=; b=W6xzRuBLS69bOG
	2wHi/Fo79N0vPrmY5dKSH0YNddQUaQNADPL5hDCw7rGcX0dQ19KMuVUNZd4LnwRBO92sSF5sQtYsN
	WBIyKc5IRkKbEBGjwplDVsetDDbqPCQt6bqdIjt3hBtZboi1ocEQ02zCyDZiJE0L19+mC/+I/oLZV
	US1b9/4cnP+WByoOfqVDtjXPArijJ3BvBN5X/WUNA7hlAckmclrAkJqVKO6uPFW1bOWMB5E51pZVc
	9HG1CokcmMO119jRlVbTFeZ7m4cAMx7KD23kaxvA34FhER5kO82u0xeykwENlWqE9ge1R4FvmyJ8H
	tYeMOoUGrFDU2SL64G4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkbf-00000004L6E-11Zj;
	Wed, 05 Feb 2025 18:58:39 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkaH-00000004KtY-396c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 18:57:14 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3cfba354f79so1248365ab.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 10:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738781832; x=1739386632; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rOrAEmmc0o2wzEyiwOq4DQ4uXK1/Mbcgtx+WsCmakwQ=;
        b=q/YyquCpM6bD6FVGjlCLHnUIbhVqDuCusLqOZeQ5EAuXtF1nfMQbOoYJl7pMIc4L6U
         7ltGagTCBPEvtwBAT7oa6aMzDt71CWbiXlg9WUdchFczUkXRnF54LkQt8lymFy65TyPV
         2+xEeZh2+EqC6iurxDk8iB+O410jr4nWqq13VaO0BkeEmkQsNcFHnviwU23cLRfuNz6O
         wH4gD0CMpCxYZAmQQJ5s/UO274s412F1vSMN3QJnNeBHX3z1ib0yhPmcQoKt7GNMCh1s
         GM/yvk8NhHvJ81LOLNyaFnH2lfeDCUri6ejaEQtPb9kb4vCgyS61TCLfZrLwcqSby0FX
         AMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738781832; x=1739386632;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rOrAEmmc0o2wzEyiwOq4DQ4uXK1/Mbcgtx+WsCmakwQ=;
        b=Bjs0JpDbxDyV//blt2FiDmw5q4yMbvdtupEjZ/U2NPWXeKsn1Q9X+qQ5QRFXXWYc15
         iCF1K80D9ozqRl3qT7JCytwY6fHGpFhoNL/xAG5Doj/jqFdhIRftRI6qGjDc7RQ2VSxo
         kLqkTWam6+I/U8YRwbRdlmC2TB4sSCRB3flmpSg1L/D6ZEL7Pa8y6O5Uaqj1SFmT2tbO
         n0Cy1QaohypqppbnNfB0yqmwFB+eCyQnRPZ66qQ7DIn9IVD8GGaNedIFm/IVLakAMA8e
         3JWHVMQSI3VuFMTVM6hjeKdXeuqmgwsfoeqdnrUsthRMiEe8gnzfREmdCVtDxxFJkh0X
         NRJw==
X-Forwarded-Encrypted: i=1; AJvYcCV4P1ah7rgPBhxeRg3jFyvhcan/UjiFBzxhCk85BATBlIw1ECV6T8gSTsKwn3khhFWbphUD70KS96S00SvXECZm@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp79OHbb8wyBc4v+X70V+FFTXj05/KfEd24EVEmcvkyOwVShnX
	GODefkEAVDxnLPA3fOp5CJuPpm2z4VeL1XqGvi+fmpbYmoHo/eOvVTDK1/LVtyx/e8szxYz0y7i
	BJldemV98J/I/lxGFpDI+AQ==
X-Google-Smtp-Source: AGHT+IFWjXwnbjoiuM23Lh8ngijtdwE4nXRVNLab1fsF4fpL0OVJ9k6mAwaRhufdfdCX0QUJltSRVIg24JQ3/eImKg==
X-Received: from ilbbe10.prod.google.com ([2002:a05:6e02:304a:b0:3d0:e0a:64e1])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:2197:b0:3d0:1fc4:edf2 with SMTP id e9e14a558f8ab-3d04f41ec43mr42282665ab.7.1738781831860;
 Wed, 05 Feb 2025 10:57:11 -0800 (PST)
Date: Wed, 05 Feb 2025 18:57:10 +0000
In-Reply-To: <Z6KqDR3S_AWXXLJK@linux.dev> (message from Oliver Upton on Wed, 5
 Feb 2025 00:00:13 +0000)
Mime-Version: 1.0
Message-ID: <gsntpljw1apl.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH 2/2] perf: arm_pmuv3: Uninvert dependency between {asm,perf}/arm_pmuv3.h
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_105713_787076_8368DDD8 
X-CRM114-Status: GOOD (  13.62  )
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

Oliver Upton <oliver.upton@linux.dev> writes:

> On Tue, Feb 04, 2025 at 07:57:08PM +0000, Colton Lewis wrote:
>> perf/arm_pmuv3.h includes asm/arm_pmuv3.h at the bottom of the
>> file. This counterintiutive decision was presumably made so
>> asm/arm_pmuv3.h would be included everywhere perf/arm_pmuv3.h was even
>> though the actual dependency relationship goes the other way because
>> asm/arm_pmuv3.h depends on the PMEVN_SWITCH macro that was presumably
>> put there to avoid duplicating it in the asm files for arm and arm64.

>> Extract the relevant macro to its own file to avoid this unusual
>> structure so it may be included in the asm headers without worrying
>> about ordering issues.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>

> Is the intention of this change to allow asm/arm_pmuv3.h to be directly
> included? If yes, what's the issue with using perf/arm_pmuv3.h?

That isn't the primary intent, but it's a good side effect. Headers that
can't be directly included violate people's expectations.

> We already use definitions from the non-arch header in KVM anyway...

My intention here was just reorganizing a counterintuitive use of
headers. The arch header depends on definitions in the non-arch header
even though the inclusion relationship is the other way around.

But this patch doesn't matter as much as fixing the cyclical dependency.

