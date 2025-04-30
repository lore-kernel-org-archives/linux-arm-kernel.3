Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0003BC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 20:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=477PHwtL5TNDtw9yERMTqK+bm+SW5j6JJbM2jEsH4cs=; b=l+85Myshrkkc9zbg+fGocts9/R
	2GdiKzAj7S05qk9U880cRuyHJ0aE42tVZI2MdxkXzhF4faIwskKUbXMIhF8jR7bDQUmvRLmlA2jfR
	61u5JVwAyUjlOND57BRW7DGi6wILWpaeQJuef8cH/+5QcvlMEXCMIw9Z8Og0Ov+H4dwiZo4Nx4fyT
	JYKb8YHX2DxFHs1QhkbCr8Uho4wAq/wxR7Vo8sZA9vXoUKW3XPFB+p85i9BVt/nHxkYx1xe8ivkZY
	IdagmgwSycZitIAOBoqc6+TMZfsR+khJXD+RLuHkGkuAJuCLX3Orf3umKzd2Loz9xRtZql6Po4rKh
	JsAvgSIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAEDM-0000000Dwhb-41Lj;
	Wed, 30 Apr 2025 20:39:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAE57-0000000DvLv-3o9A
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Apr 2025 20:31:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=477PHwtL5TNDtw9yERMTqK+bm+SW5j6JJbM2jEsH4cs=; b=vJ2tCZXI9P7yHCgbR27Ak9/+7k
	m1y5oQGEttxpwu72HJ1D2A7iskAr04fQYQyJEWtM+LbkpT0o5WF89v5ffXpcUk7x9xvr+keUdU/lG
	dz+W5h3COX7Uu/dEQILjHqwafr1mk48zIgQ3YNkA4f/luhlEgjxDhIB7076bmIVaYenGrRCO513Qp
	LV4YdtG4Ifb4Awewmko46FLYLU8iTjVhKkLKbimqaLQO4wC404gafdewOR1Rfb4zYNAcfnj5vtUvf
	kyXJTtNkI+CsUs5cSbau25sZutDUwF/FHS+wzw6cWdWVi75++2GH2Km8VHRHhCwH0bQ+MokZzmLyH
	6RwezUWA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAE53-0000000DrJi-45EV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 20:31:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746045056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=477PHwtL5TNDtw9yERMTqK+bm+SW5j6JJbM2jEsH4cs=;
	b=SG/touyuWU8T26H/R6+Rjf3K8kQAvheDXhewyHARI9TePnN+ltaprjOhHOo66WCYDxXzI2
	zYdCFibtU6xQXVYEh/6n5kFRRi8UNJqYQQE95p/j7od0fE2lNzxIjPPXVtgwAYVCl7aYHD
	TQ+qUmajg6Sz6xXlNCJF/mU+pGIjKa4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746045056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=477PHwtL5TNDtw9yERMTqK+bm+SW5j6JJbM2jEsH4cs=;
	b=SG/touyuWU8T26H/R6+Rjf3K8kQAvheDXhewyHARI9TePnN+ltaprjOhHOo66WCYDxXzI2
	zYdCFibtU6xQXVYEh/6n5kFRRi8UNJqYQQE95p/j7od0fE2lNzxIjPPXVtgwAYVCl7aYHD
	TQ+qUmajg6Sz6xXlNCJF/mU+pGIjKa4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746045057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=477PHwtL5TNDtw9yERMTqK+bm+SW5j6JJbM2jEsH4cs=;
	b=ifWUo/aXxrRpgDc8iELJdN/0C8sqMFxb5/gwyp7AsFTSQnq9zxbCJgxWuA6NMC2MdukIlC
	FIpJMSthcsB1gwVuK1Uz+6I3Zhg1Rksa2Tdr2+28cp5KEupVCHsvp1RlluEfew+VOjkD+v
	pCmtnYCLmspzlPYfR4num4A0IJQe3vo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-XIPS5AraMsei6wH8l2SB9w-1; Wed, 30 Apr 2025 16:30:55 -0400
X-MC-Unique: XIPS5AraMsei6wH8l2SB9w-1
X-Mimecast-MFC-AGG-ID: XIPS5AraMsei6wH8l2SB9w_1746045054
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8feffbe08so7901486d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 13:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746045054; x=1746649854;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kLCLNjhH9N/SbhZgwe55OZ5mfyV+uMRJ+/FIl8sp4MU=;
        b=Ch7EkOU4/DusqZ61tvJ2v10pH3PSCRHo6hqi4II30mYrGBqD/V+jA2fpnAJrVAvOuK
         NqJCc4v3OJNiBxV16hMkv2Ymbl6wgNQct3yG8UAKJ/HiZYtDYdRHn3jWtfNqVsVRlt+r
         YNxAhjBKzmSyOIEl5VsHK+GSO8Xe/z/XQScDKWi9ta+GJJxxjBrA6sz9kd1h28yagz+e
         d/cSE2iWtSrLf4GjyvO3t9P1HanVGKUGHE3e/jJoIfJ6B/KcbugM8qZFRRZxIL6xcrWI
         o5+eZAF+UGQn7RY1esCW4stb1QZbpGhW6PkvfxlmC11sjORXTufY9IH1eKDUTPZ34/br
         f34w==
X-Forwarded-Encrypted: i=1; AJvYcCVfJ8PEXJpGXz6PGwG9YyFJLRa5TYGZW7SY3mZNHDrrTFEggaILx6hNy4Kma6ZAJzClqJkAeHTRZHMyvZ5JU4yF@lists.infradead.org
X-Gm-Message-State: AOJu0YzwafupbtYGIBF/Rl7F4MIaVsiiw8dnzKZUpEEdrmKSV2EzbgUr
	wVn37todHjjD69eB1Ks4eLEBrnH6+ejg/0o3VZ6ZWpXa1T08aBNqhZ0jWZs9x/hFUY1GOz8rU2c
	Y+l2C5wiQoFwaBdJW571VrbbvaDqVESjmpe7lw/yv5ivYOUkH+cnjuPCS5XG+QDwNw7SoA2pb
X-Gm-Gg: ASbGnctYF8zAIL0LyLBydMyc/BSpBbFR54L3kIURj4/PWecIrKeiX7rla6mZfYZhhiz
	DvXBD2TKB3ZrQ79YCTbBIhre20pG6/kqUwTl5fmgoSvgn6jAJ30mnt8RgEJ82yTPVjA8j0gPel2
	tHXgMrKr+K1ohI9dK4g33KiQA6dIBU1aGhXHIkhVD09raQaF55iCJ0PtNFSOpX9PYIu97s9SsPj
	sm336yfs1W3PgFqiMih/1JIX+dPgj/ALxOAiEUUmeQjJnp0wv4LcZQN3wIq+wZ/GZqsXcxhrbul
	PrzasuzDRMzzXnTvzlSmEedhGXdEoQ2/xaFSYiQRDhiLFdF29R7OXd+VfUs=
X-Received: by 2002:a05:6214:2584:b0:6e8:fb92:dffa with SMTP id 6a1803df08f44-6f4fe081236mr60226186d6.25.1746045054687;
        Wed, 30 Apr 2025 13:30:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqMC1VAUYkFR8BRk72B9YM6tHcI7coSFQe+I2l2BvKOrJizso3ayI0TGKXXExNYQxM53jAuA==
X-Received: by 2002:a05:6214:2584:b0:6e8:fb92:dffa with SMTP id 6a1803df08f44-6f4fe081236mr60225826d6.25.1746045054231;
        Wed, 30 Apr 2025 13:30:54 -0700 (PDT)
Received: from ?IPv6:2607:fea8:fc01:8d8d:5c3d:ce6:f389:cd38? ([2607:fea8:fc01:8d8d:5c3d:ce6:f389:cd38])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4fe70a277sm12416546d6.55.2025.04.30.13.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 13:30:53 -0700 (PDT)
Message-ID: <53a26378fce90c8bbfa57a582992324560aa0274.camel@redhat.com>
Subject: Re: [PATCH v3 0/4] KVM: lockdep improvements
From: mlevitsk@redhat.com
To: kvm@vger.kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Randy Dunlap
 <rdunlap@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, Will Deacon
 <will@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, Kunkun Jiang
 <jiangkunkun@huawei.com>, Jing Zhang <jingzhangos@google.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Keisuke Nishimura <keisuke.nishimura@inria.fr>, 
 Anup Patel <anup@brainfault.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Atish Patra <atishp@atishpatra.org>,
 kvmarm@lists.linux.dev, Waiman Long <longman@redhat.com>,  Boqun Feng
 <boqun.feng@gmail.com>, linux-arm-kernel@lists.infradead.org, Peter
 Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Sebastian Ott
 <sebott@redhat.com>, Andre Przywara <andre.przywara@arm.com>, Ingo Molnar
 <mingo@redhat.com>, Alexandre Ghiti <alex@ghiti.fr>, Bjorn Helgaas
 <bhelgaas@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, Joey Gouly
 <joey.gouly@arm.com>, Borislav Petkov <bp@alien8.de>, Sean Christopherson
 <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Alexander Potapenko
 <glider@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org, Shusen Li
 <lishusen2@huawei.com>,  kvm-riscv@lists.infradead.org
Date: Wed, 30 Apr 2025 16:30:51 -0400
In-Reply-To: <20250430202311.364641-1-mlevitsk@redhat.com>
References: <20250430202311.364641-1-mlevitsk@redhat.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _A_TNDc4Bt5LSZ6tpGfxp7ZG5NrpOaePI1SypeD8Z5A_1746045054
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_213058_165279_BEEB4A10 
X-CRM114-Status: GOOD (  17.08  )
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

On Wed, 2025-04-30 at 16:23 -0400, Maxim Levitsky wrote:
> This is=09a continuation of my 'extract
> lock_all_vcpus/unlock_all_vcpus'
> patch series.
>=20
> Implement the suggestion of using lockdep's "nest_lock" feature
> when locking all KVM vCPUs by adding mutex_trylock_nest_lock() and
> mutex_lock_killable_nest_lock() and use these functions=09in the
> implementation of the
> kvm_trylock_all_vcpus()/kvm_lock_all_vcpus()/kvm_unlock_all_vcpus().
>=20
> Those changes allow removal of a custom workaround that was needed to
> silence the lockdep warning in the SEV code and also stop lockdep
> from
> complaining in case of ARM and RISC-V code which doesn't include the
> above
> mentioned workaround.
>=20
> Finally, it's worth noting that this patch series removes a fair
> amount of duplicate code by implementing the logic in one place.
>=20
> Best regards,
> =09Maxim Levitsky
>=20
> Maxim Levitsky (4):
> =C2=A0 arm64: KVM: use mutex_trylock_nest_lock when locking all vCPUs
> =C2=A0 RISC-V: KVM: switch to kvm_lock/unlock_all_vcpus
> =C2=A0 locking/mutex: implement mutex_lock_killable_nest_lock
> =C2=A0 x86: KVM: SEV: implement kvm_lock_all_vcpus and use it
>=20
> =C2=A0arch/arm64/include/asm/kvm_host.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3=
 --
> =C2=A0arch/arm64/kvm/arch_timer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +-
> =C2=A0arch/arm64/kvm/arm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 43 ------------=
----
> =C2=A0arch/arm64/kvm/vgic/vgic-init.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 4 +-
> =C2=A0arch/arm64/kvm/vgic/vgic-its.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 8 +--
> =C2=A0arch/arm64/kvm/vgic/vgic-kvm-device.c | 12 ++---
> =C2=A0arch/riscv/kvm/aia_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 34 +------------
> =C2=A0arch/x86/kvm/svm/sev.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 72 ++----------------------=
-
> --
> =C2=A0include/linux/kvm_host.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++
> =C2=A0include/linux/mutex.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17 +++++--
> =C2=A0kernel/locking/mutex.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +--
> =C2=A0virt/kvm/kvm_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 59 +++++++++=
+++++++++++++
> =C2=A012 files changed, 100 insertions(+), 167 deletions(-)
>=20
> --=20
> 2.46.0
>=20
>=20


I forgot to send first patch in the series, resending.

Best regards,
=09Maxim Levitsky


