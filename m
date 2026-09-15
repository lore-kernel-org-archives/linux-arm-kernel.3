Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F295C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 11:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZrYxZDKXW7IEEf7WCM1k4ukDkppclwvgA5i/DsICNw=; b=lDzxHFVm8tjvHBleSAtU4Qr13+
	nJx79NBFY8aEoCbYHWsk6CtG7H8pWg6DByagPfxXFInucavmHP0B60dozYEi/Al8yq7cB0IENrHSv
	3dFENKantW8l9nFXhQV3ZClBL2b+nIoA5m0hvG65vfayYVyZ5AgrsTCie6GWOnOvDeTQu/SGJZg4e
	tLWyD3IN+pdUo40P8TnBhpeOAT0p+lDWxyd/pKXtuerfHmDApEB0XJGvZ9PJENTqSE7wCenKTPcqp
	XTPMUFdEgmbytMBuFmemDovW5/kCh+NSeOAo0LEWO/F2tC7pZNUPXNXETcE7AA5xRDvUXE/Xg23Ko
	CagwylaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Quy-000000062JT-3FCk;
	Tue, 15 Sep 2026 11:01:40 +0000
Received: from out-217.mta0.migadu.com ([2001:41d0:1004:224b::d9] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Quw-000000062IA-1Wki
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 11:01:39 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=gNab9UB/dOuP7n3fh4ySHoj+tcM0Z+lxV3y78kbdIaM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789470096; v=1; x=1790074896;
 b=Jb3hY2eB38SeOUu3m5dTk/Qzs7VWRcrT8/SG9HEDy22a2K+p6FyGEIr9ljPToxkLnSjqU6GP
 grSmPrZ744/zlvVPo3zVESHMYJbjAU6HYj13b35KO4sFCM9y6w9p1TPZgdXk/p0BXkGcp7Os4Wk
 S6ehxCua4J60YtPQuIshqoY8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a6f5a99737a03bb3;
	Tue, 15 Sep 2026 11:01:36 +0000
X-Mizu-Trace-ID: a6f5a99737a03bb3
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b78e073980so4514e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 04:01:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxHWuaL7Ei8lYn6Jb1v70aWXQIMxRnk3Maom+XSd0xNiAxoJnsQ9aEqhudI9I3o1HcmAKfJmOYw6MJ26PFFq2WQ@lists.infradead.org
X-Gm-Message-State: AFuF++mPQtX5TaAa0cCo+8IWwJszhY1sfRmj8GMmskTiRxAvt1f5KjzR
	Wkn9nHuLc/bLTMxaBymIqar6ViRAXyohNPCMMpxlI638jNJkc8moIIkUNxgqpSWyFOHDpPI57Dv
	g48FwF+FRFJ88xBEb/zWHNXtiisQJmU9ReltSlbIx
X-Received: by 2002:a05:6512:ad0:b0:5ae:b726:5f1f with SMTP id
 2adb3069b0e04-5b8b2d4e62emr154752e87.8.1789470091337; Tue, 15 Sep 2026
 04:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260915070418.3209779-1-fuad.tabba@linux.dev>
 <20260915070418.3209779-3-fuad.tabba@linux.dev> <aqkiXqjSZyyqHZ5y@e143914.arm.com>
In-Reply-To: <aqkiXqjSZyyqHZ5y@e143914.arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 15 Sep 2026 12:00:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx14bh8nPQnNUwsk_hxES2xW7bs9H1MXFHdFKU3Xfgjqw@mail.gmail.com>
X-Gm-Features: AcwNN1Wt3ZBrIQYAxXdUQmdQ9vDJcACZrVELsbuq48nV4nCYU-mL2MgXk9sesGM
Message-ID: <CA+EHjTx14bh8nPQnNUwsk_hxES2xW7bs9H1MXFHdFKU3Xfgjqw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] KVM: arm64: Pin the host vCPU before adjusting its
 PC under pKVM
To: Joey Gouly <joey.gouly@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, seiden@linux.ibm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com, 
	steven.price@arm.com, vdonnefort@google.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_040138_622847_2D761D1C 
X-CRM114-Status: GOOD (  12.02  )
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

Hi Joey,

On Tue, 15 Sept 2026 at 11:48, Joey Gouly <joey.gouly@arm.com> wrote:
[...]
> * A pin only fails if the memory was never shared, drop the request if
> * it is a bad host pointer.
>
> Or something like the commit message says.

Ack.


> > +      */
> > +     host_vcpu = kern_hyp_va(vcpu);
> > +     if (hyp_pin_shared_mem(host_vcpu, host_vcpu + 1))
> > +             return;
> > +
> > +     __kvm_adjust_pc(host_vcpu);
> > +     hyp_unpin_shared_mem(host_vcpu, host_vcpu + 1);
> >  }
> >
> >  static void handle___kvm_flush_vm_context(struct kvm_cpu_context *host_ctxt)
>
> Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Thanks!
/fuad

>
> Thanks,
> Joey

