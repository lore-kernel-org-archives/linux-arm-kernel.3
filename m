Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14CA606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 08:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cgy0QR/f;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uGjSfdrp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Umtx2QekNJJOh/UY3thL10Al6ydHDa8XNgIJCQa01dk=; b=Cgy0QR/fBCyUVe8whZk1i5h5bh
	M5wNZhqO7RpOmOQaWaXgdv6yujNwYQ0gxLNdhUMxKlFE1bxUOrIvUOIEIyPYl3FIQBSXov/l+xhye
	e0449+Wl+kiyLZXKzcO+OCrZpChrcZ9dhi7lqjL9EX1qE876QmpQ4fVa8mxxbVrONVQCnpaEflwsI
	Mb6sgwVpG92iM0xCSGQ0kO7AvOIUIgoLQ7stn6ZdtCB8uUNOZAhu/GCu2GbvLbtIPtZX0bnvpw1Dh
	1P/4w5ZgMcXRLCtwIInXyx/EAwCwDgtcEYE/k8guOP8Qy93c65mlRjX6A79DKKFc4RFfjvYTUcXWT
	TLIpiNuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKthD-00000000ssG-1isr;
	Sun, 25 Oct 2026 08:35:15 +0000
Received: from out-48.mta0.migadu.com ([2001:41d0:1004:224b::30] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKthA-00000000srV-0iaJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 08:35:14 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Umtx2QekNJJOh/UY3thL10Al6ydHDa8XNgIJCQa01dk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792917308; v=1; x=1793522108;
 b=uGjSfdrplDOps2BuAWNcL5410gudeaqjHCx9Vt8qgynyLhrCdk8lXZ+dv3XtOKrJiZZuDpFE
 09ss2XW9F5NI2eZl8P/1BQGsYmiPPAYZrMltrH37NzbNdle/mXshOS3iUf/4pjGLMT4yWUgl/6H
 IZ1riYhqPQ6x9o839jtvz008=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 393bf66a8604dd34;
	Sun, 25 Oct 2026 08:35:08 +0000
X-Mizu-Trace-ID: 393bf66a8604dd34
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be3b2f17c1so4005e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 01:35:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxE6gG4vft/DzGHhamVpiN+GPLoLWgmu/wZShWxJqC18aYW4rqA3wEDUbcstxdR8rOIk8WClbHruGpJhZnwUkPe@lists.infradead.org
X-Gm-Message-State: AFq9FYIMG9aTg9FwHmmGSEHb0YnlLhjY1uF6Al3YG+lX8LsqYJkNQ9Eo
	v/ZDUzGQlQgVUKzg3CToyR3cGqEuZlSbgG8ElZDVKVIG1tIwzNmaFESc8kMDXyixi0uAH/di/hf
	QrhXiRZGLHeNX2MvvpHbSFmRzNLWxEJ6p+qnEwJEI
X-Received: by 2002:a05:6512:3a8a:b0:5bb:ff6f:b4bd with SMTP id
 2adb3069b0e04-5bfb79cfb9dmr89930e87.14.1792917307506; Sun, 25 Oct 2026
 01:35:07 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261024161118.1007472-1-sashal@kernel.org>
In-Reply-To: <20261024161118.1007472-1-sashal@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 25 Oct 2026 08:34:31 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxKRThB+kp33nALkEejj2L8vDxE=SZYw+0KyHodYu0y8g@mail.gmail.com>
X-Gm-Features: AclHuK_kP_F3xF9Iyo3ZWQZWl_t2OJWVWAHcLTFVaYw38-o0EI2yWRjxxMOJhA0
Message-ID: <CA+EHjTxKRThB+kp33nALkEejj2L8vDxE=SZYw+0KyHodYu0y8g@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: selftests: Skip ignored AArch32 ID regs in
 the failed-run test
To: Sasha Levin <sashal@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_013512_781624_04063150 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sasha,

On Sat, 24 Oct 2026 17:11:18 +0100, Sasha Levin <sashal@kernel.org> wrote:
> test_idreg_frozen_after_failed_run() checks that changing a feature ID
> register after a failed first KVM_RUN is rejected with -EBUSY, and does
> so for every register in test_regs.
[...]

I reproduced this on the FVP AEM model configured with no AArch32 at
any EL and with PMUv3, under nVHE: set_id_regs fails on
ID_DFR0_EL1_PerfMon without this patch and passes with it. It also
passes on QEMU (which supports AArch32 at EL0) under VHE, nVHE and
pKVM.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

