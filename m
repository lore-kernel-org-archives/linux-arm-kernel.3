Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92795C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 06:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQxgJfHSslLCLqBFzZrAEBhUZs3i+XkbehvsL/mOGgM=; b=Wso7hmgmO2cg1hGmOU1n/hbIWW
	ldH8ZH7/gX6LxA4WX+9wxAeTK4p0o8D/xQ0Ig3sSXH7Jx6pXyvA4i383R3S93goJF6VeHClHQxvYD
	at9TArgXpjuGd6Tms+/R8AXFtMeVoUWxH59jhaXHjW6C719QQJT2aZiJ/d6FywzPhSTh2Wvwn/zPJ
	QmTw6KUk2U5e8hLscITQhnt+Ns2w5/CDbihz1JArcwjTsl2hRsWEx/Ki2sEv1aL7U086UdjCv9F6J
	WVPSfxgj8Uog/BCJP07LqNoOdBLK6qIksZDL2O9bnVBwrXMsJpC110pXkRMyCkD/hrV6sljKLNV03
	tuHzxczA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5zyi-00000002QQD-2oBQ;
	Mon, 14 Sep 2026 06:15:44 +0000
Received: from out-9.mta0.migadu.com ([2001:41d0:1004:224b::9] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5zyf-00000002QPO-1RCh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 06:15:44 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=bco0eZaaCo0kOj6rwGEtGduTKDKE8JkIclgbB8/hdn4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789366537; v=1; x=1789971337;
 b=f0yZo3TZkx3q8X2Udjh97WWztZpEcl/NpmvYriLw3uVHfZaav+7ChIxzaUZfWL1e1MSmx9Aq
 xDGIFGa3e+Aatlhyoxitom6H3KDonENnxDzPoQIDQ32U+TzrsAmhw9vfZxP75q9G/41sSKDui2F
 CqC82DDzTj7kWj0PnU5CbQAc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 41162ae18597462d;
	Mon, 14 Sep 2026 06:15:37 +0000
X-Mizu-Trace-ID: 41162ae18597462d
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b78e073980so4925e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 23:15:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzZo66i9WAbXTdh22YbVfiAnlgA4FHTNPPJIk2MHvoWIkWG4/CeR1y18KW7iMQ24CCo5ycbsZBu2rkxEBUKXpBW@lists.infradead.org
X-Gm-Message-State: AFuF++nSGf4OWUynYOnEmUBKexlcO6xnyOrEkHegZj2twj4dHDawc6A4
	2VpyQBTFMzvl7XeiOuT60owPKhUXag9CLoHWOHbkex2z1b6m7A+M/K/E+2jKajcdQZthdRmqRvh
	TeniPC9iXI8HK4Khf4E6I54c9o3S/Qqy4TcIky197
X-Received: by 2002:a05:6512:3503:b0:5b4:9dba:4ecf with SMTP id
 2adb3069b0e04-5b8af7af84amr10114e87.13.1789366532332; Sun, 13 Sep 2026
 23:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260907070002.3333525-1-fuad.tabba@linux.dev>
 <20260907070002.3333525-11-fuad.tabba@linux.dev> <86ik4b7uvh.wl-maz@kernel.org>
In-Reply-To: <86ik4b7uvh.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 14 Sep 2026 07:15:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw0mERkhV+nf7KdbzOCbGGqJ6N31360dOFKshj5td38LQ@mail.gmail.com>
X-Gm-Features: AcwNN1Vrar7EeAIoZzg3TV6xpg1zXNdc3Yebl-ujX0EmE0S2Uy_2l65154ZS_Tw
Message-ID: <CA+EHjTw0mERkhV+nf7KdbzOCbGGqJ6N31360dOFKshj5td38LQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/17] KVM: arm64: Prevent host PC adjustments for
 protected vCPUs
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_231541_597355_3135D888 
X-CRM114-Status: GOOD (  13.97  )
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

Hi Marc,

...

> So this is the sole reason why we need to access the kvm structure,
> and the cause for all of this churn. Can't this be written as some
> form of:
>
>     kvm = vcpu_get_kvm(vcpu);
>
>     [do whatever is needed]
>
>     vcpu_put_kvm(vcpu, kvm);
>
> where get/put do the pinning/unpinning as required? These helpers
> would become NOPs on VHE, for example.

I've put the get/put pair one level up instead, in __kvm_adjust_pc()
itself: pkvm_adjust_pc_get() returns the vCPU to adjust and
pkvm_adjust_pc_put() copies PC_UPDATE_REQ back, both no-ops outside
the nVHE build and outside protected mode. The kvm read goes back to
the base's kern_hyp_va(vcpu->kvm), and exception.c keeps its
signatures.

> And this stuff could simply be a similar set of helpers in
> __kvm_adjust_pc(), the original one.

That's where it lives now, and this patch no longer touches
handle___kvm_adjust_pc().

> > +    /* The host copy is authoritative, used only while pinned. */
> > +    if (hyp_pin_shared_mem(host_vcpu, host_vcpu + 1))
> > +        return;
>
> Huh. Really?

After taking a closer look I realized that we have a live bug, and
this is actually a fix. The base dereferences the host vCPU unpinned
in this handler, and the vCPU and its VM are mapped at EL2 only once
pinned, at the first KVM_RUN. KVM_SET_VCPU_EVENTS with
ext_dabt_pending gets to __kvm_adjust_pc() before that, and the
hypervisor panics on the read. Any process with /dev/kvm on a pKVM
host can trigger it, since 6.17 (efa1368ba9f4b). I'll send it as a
separate fix before sending V3 (later today).

Cheers,
/fuad

