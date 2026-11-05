Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106E1606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y5s5+Gsw;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WFc4big3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=slAjwWQDYVO39KamLXHsue/lfUEBTiuulu/3jpX05gc=; b=Y5s5+GswMmKbSI7vAql5PUrKek
	cRzUSho/5+jkL7GHHd0cjNXsF3BpxxhUwex/yE/ESN5MrqDHwmYnQ5CHN+RjGCM2heCQ9L7vC+wAz
	rFCAagDZaClMYSTcEBePoPuczdtJgrLntXdi/n/mgafsM0TNdXFLbeXuRbxKgK46QjjzvkkMiyvKZ
	uH73WCsvg4tN1HnZKQtp060+vyZQUAOS+OhGsM+dJV/gVjPjeGYVcFB6rrPeXv0YXce4SNBfhbOdr
	cIPjNWcytM4fP/O0H22aK7J3JEHUL1tSd1Eqb45Kcfw5meRwfh0josR/eLksb5Ar0OnwYd8FESZb7
	5Du3XDcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsc3-000000086jQ-2bhO;
	Thu, 05 Nov 2026 08:14:23 +0000
Received: from out-164.mta1.migadu.com ([95.215.58.164] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsc0-000000086i9-1lge
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:14:22 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=5dNzhcTaPSPAHoNbodXyj+zv2hdRrCEJXr1Y2dhrWX8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793866456; v=1; x=1794471256;
 b=WFc4big3zhaMRqLsJpcpWz6AzjcGnU7DIsWQe212eR0UXyRpD1jDQmKjNiKI6XS8vtVZ2f/l
 fgQdx5Rdg0QqnGt2NWDCLurrzj8JuKVwHEx8QNTdQwC9UGh18HNYDXHVy2BC8F/3VokeNoMHvwx
 foZm4RxFn83z3PLnPIY0F68k=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id fd2e72678ecd5b02;
	Thu, 05 Nov 2026 08:08:05 +0000
X-Mizu-Trace-ID: fd2e72678ecd5b02
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be3b2f17c1so3781e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 00:08:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw91dU8tLqqS0qikTmfyy2RHWudjqyoVexIEfzC+Zhc/b1w9ARC57EjbyVlnNhGuNlxQajTUZU0GM9H6HRPHDAW@lists.infradead.org
X-Gm-Message-State: APuU4Z/ARDTv9ZqyzsUHhN5IJxg+ekRdAnPrAC4AWGmHd1NBV0RmQFFj
	0MgBALcFSjV0orAXi+aw1SdVVtIjRLxYI+Cgk1Re9bEiF1r9NNmZqZZ/4xKx++1SZij7zcCTqkv
	EdhrvkA44DFlUIAPyzUTnbDKzZn8LR3vdxuu60VyV
X-Received: by 2002:a05:6512:3e02:b0:5bf:f0fb:2c9c with SMTP id
 2adb3069b0e04-5bffb1dc195mr77268e87.5.1793866080846; Thu, 05 Nov 2026
 00:08:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104124451.2148724-1-fuad.tabba@linux.dev>
 <20261104124451.2148724-2-fuad.tabba@linux.dev> <aut5t605onnuBWfk@kernel.org>
In-Reply-To: <aut5t605onnuBWfk@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 5 Nov 2026 08:07:24 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzEa-VZZ7TffdR0dY=92-iqX68yWkPR1zz7uzEX+c+f3A@mail.gmail.com>
X-Gm-Features: AclHuK__AB0z6apl_Wv0YuqPm4x2AvnN93O1z8V4Fr2KgOylyOBS-uUCz6gu5jo
Message-ID: <CA+EHjTzEa-VZZ7TffdR0dY=92-iqX68yWkPR1zz7uzEX+c+f3A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] KVM: arm64: Resume stage-2 teardown where the walk stopped
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_001420_605869_A504E918 
X-CRM114-Status: GOOD (  10.58  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 4 Nov 2026 at 18:30, Oliver Upton <oupton@kernel.org> wrote:
>
> Hi Fuad,
>
> On Wed, Nov 04, 2026 at 12:44:50PM +0000, Fuad Tabba wrote:
> > +u64 kvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
> > +                                  u64 addr, u64 size)
>
> Returning a signed value here would be a good idea so you can percolate
> walk failures back up to the caller. Since that WARN_ON() below may as
> well be a BUG_ON() in hyp code.

Ack.

> Otherwise, rest looks good.

Thanks Oliver!
/fuad

