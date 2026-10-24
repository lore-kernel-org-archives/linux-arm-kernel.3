Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5640A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 21:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kKpyHkmG;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SuA/SCHV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WKjXGirCGBWaGZ6gv0IsyrzVZH7S81bL8FiRWNXjU/Q=; b=kKpyHkmG5kcyYT
	dIIkMG32/95EYBGCxxHig3iR2xNJly7uBIiUpedG6Vkry5eF+qIPUiWRHFI7R8qqruDk9NksGrepL
	CBtcPh+afmc9fRvGaGwbWuevrpHbixD7/wt8XSDiMByGyCJIYNpMyJ2CbIJijAeqGGlIbpHeP3N8h
	YupYgiM/OLTQXzwROi0xvjuFjKPteltW7MhljwPgOMMfZPcOz2WyIqAfiLsfQscnUZrPymUdUNLzC
	QnJ/6XnuzFoxXMjey4zl/s2XMKhlVVxjd2J1nJhUgKbkB8RswQrPdxfkvm8HZmZH74Bm8Vx1k5eUB
	ZrreWenvF8xX2H59jUOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKjIQ-00000000YCw-1UnA;
	Sat, 24 Oct 2026 21:28:58 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKjIN-00000000YCZ-1ceo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 21:28:56 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso19709895e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 14:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792877333; x=1793482133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WKjXGirCGBWaGZ6gv0IsyrzVZH7S81bL8FiRWNXjU/Q=;
        b=SuA/SCHVR2aMAjZ9Ckja+D6x+Iby9VlA7J0GoyNghYHwCE+Ve0nD2DGdNif8BdhAzV
         LVV1J9tQh0kHuozuEyR2AHAYX5WGlFwiDK63gHiAFjy+2qxz1rtoVph0/S/6cY5ol9wq
         mM5z6lDUDndDiqXkxMssXABHGLu5PUUCC/qReoQxys1m0n0ezLhwrqoQrz0/SUPcPHU8
         F1yPf0Tmo5V9Igvyi8IIzspeIaxsHv/DSSpQRFXGHroPDxSJxUSlea/p9mN5lunNzEO6
         vMANx7XVAIEqElX0cWQOgqft/6BZRwUS6W4W6BKeqVg60VeHnrG0z2xCZojaKB5nsdSX
         37jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792877333; x=1793482133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WKjXGirCGBWaGZ6gv0IsyrzVZH7S81bL8FiRWNXjU/Q=;
        b=Nre6TYbWHaBvyQ6T6Y9VaI/18OTfhSLoo+SSxPCOBEfFdFKZeBpMyI5l4rS19B2lU1
         X4L0jXR5FdKI4Lm6nK1Bk1dFElxCi8NTcOW29nyXqhYk/KCC3vAhvfc0zurnnpYFeKMB
         hf5TVynn9QOYN9gUlWWYUr9xJWZZxJrQc3AcSvdLQ4SlITow15ipA9tZFebalwwVebQ5
         nPZJSeBQPwxZ0uiX9kTs8w7zaHeJaz3zHyMXdQV2BP2pWUrYR88kBNPFr9pDbi+ZQTlv
         9fxN0u7EE/yp8ygjik4kbAkGS6yyxZVnEfEIp+ZeWhY7KXAbB6Yp9soqyyRcC851PgFX
         UN5g==
X-Forwarded-Encrypted: i=1; AKwUvBzlMH7E3o3jdcBGxmDavisb3cf0VUhPtP7JbRnsYe43RO/v7jddmBC4eTDhby3M8BMj9BCd4fDhxX4prE3ufMq/@lists.infradead.org
X-Gm-Message-State: AFq9FYJsG2IUfRTGSPAj9Gq1oBXT89UVBCBpJ0WsmfN+RZcx5M30RmYq
	USYgd/JrzSfiY4otEJdrJdSg2lbXtHhCpWjaGa3LhDWYDyKAoYnGujlKXeWJskDqt00=
X-Gm-Gg: AYBFou2biUunQ7Nnhau7LJBVs/vEqWcHTS8PtoQ52g9NUp7LdhXpMYJDXQ0q7pkMDVm
	cdTZlb5iX1tZjqfxIUEqdVWssNJh5ArwsiH2p8qsGj5snVgyiXM9HqbZLAQ2yRZQUkdCiIZ5Hf6
	hwFH//B1wQBlI6Jtff/aRuqNggx6Ceq8il8NP8YeuR1d8ik4/hG1+91YV6lcsnQQ4R8/azwiLDc
	lZZvIranytjJp/wYwAbqXDjvBwRENput4JRA+4Pp/YRgKNTVT+e386oViZ7/49WK1PW3ikfE9Yt
	J3ghnETP+PC9yGpEg+Wc5HReASq1Sj2vhhk0LyPjSc+i9DzEN9jVlhM2ihVRYC4HFM0YmnNnmKh
	MkiIu8sEG8SdsAIRkmAoj1vUNG619UxY2HjB0KSfMnpkF+ASuRRC0P5uEEdjx+kGeOvOYMCwL6k
	CauBlU2jCTApXA2Xvxq3od1fmuWS3gr29HIFclyoTnvRx6xEpUjK86+wuHGukJGvNS5L8QFkyGv
	2KAiAXfk1aSLqg1zWD6CheyumN+hX/LlogMIf4v7ndhEjZnEgm7eK8WTCuzCqtMllITp4o9xg5y
	zyAu
X-Received: by 2002:a05:600c:1987:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4a35ac3a7b1mr41192835e9.2.1792877333059;
        Sat, 24 Oct 2026 14:28:53 -0700 (PDT)
Received: from ASHA ([2001:630:3c1:164:1a66:daff:fe85:4026])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2e8f25sm77497285e9.14.2026.10.24.14.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 14:28:52 -0700 (PDT)
From: Amir Noohi <amirmnoohi@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Igor Velkov <iav@iav.lv>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Christoffer Dall <cdall@linaro.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] genirq/manage: Provide irq_set_percpu_irqchip_state()
Date: Sat, 24 Oct 2026 21:28:44 +0000
Message-ID: <20261024212844.3405617-1-amirmnoohi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <87se1v8f2r.wl-maz@kernel.org>
References: <20261024022450.629980-1-amirmnoohi@gmail.com> <20261024022450.629980-2-amirmnoohi@gmail.com> <87se1v8f2r.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_142855_451563_C7FFBCD1 
X-CRM114-Status: GOOD (  15.59  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Marc,

On Sat, 24 Oct 2026 13:21:00 +0100, Marc Zyngier <maz@kernel.org> wrote:
> It really feels like a leap of faith.
>
> There is nothing that says that it is safe to call this without
> holding the global lock. For all we know, drivers have been relying on
> it for a good decade, and I don't feel confident letting things rip
> just because it (mostly) works with the GIC.
>
> At the very least, something exposed by the irqchip (a per-IRQ flag?)
> should tell you whether it is safe to elide the lock.

Agreed, and v2 does that. There's a new IRQCHIP_PERCPU_STATE_LOCKLESS
flag, and irq_set_percpu_irqchip_state() only skips the descriptor lock
if the chip implementing irq_set_irqchip_state() has it set. Otherwise,
or if there's a bus lock, it just calls irq_set_irqchip_state(), so
drivers that don't opt in see no change.

Only GICv3 sets it, in a separate patch. For SGIs/PPIs/EPPIs its
callback only touches the local redistributor (gic_data_rdist_sgi_base()
and the RWP poll), nothing shared. FWIW, irq-gic.c, irq-gic-v3.c and
irq-gic-v5.c are the only drivers with both per-CPU devid interrupts and
an irq_set_irqchip_state() callback. KVM's own timer chip (GICv5, no HW
deactivation) doesn't set it either, so those keep the lock.

On GICv2 in QEMU it still takes the lock like mainline does (333k vs
321k acquisitions in lock_stat, within 4%), and on GICv3 it doesn't
take it at all. arch_timer, arch_timer_edge_cases, vgic_irq and
vgic_init pass on the Altra. Under QEMU with lockdep, DEBUG_PREEMPT and
DEBUG_ATOMIC_SLEEP, the selftests pass on GICv3 (VHE and nVHE) and
GICv2 (the vGICv3 ones skip there). No splats.

I made it a chip flag since it's about the callback, but I can make it
per-IRQ if you prefer.

Thanks,
Amir

