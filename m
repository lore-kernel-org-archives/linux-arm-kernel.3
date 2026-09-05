Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBC5C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 02:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3df1ugh6rUzruXPX+OJp8A2wl50vXoeEbMwgMt7JGQ=; b=48Gvgs0ziGzdNvlspja/c+kX00
	YXxln6nKLKkRzAYxDKJPOai6CebZ9vMbYp1p1khGLNloUSvo2dwwLpMA4FNU6ttKmTEtlhRvQbFfO
	iyBjilmVOmAZrYHrDE0wcK0hl5WwFmk37Y4bYhKhNmPNtjRdOIotJPgCsPjMfu4IGwJla1BpuF7wt
	ph306T7Xmq5Td/B1IBCErYqek1dej5eNmlSnd3jv93gEiUlnGuk0uT4RdsTe6ioXr7t4eIWMJz7dQ
	DbARi2E2uI+7gW9Z8Cl/WVsCsOQyrryWRrEj1aUiXt4M18f6fg5wxWKjJN/wD4yOHCLLVg0+YRNz6
	69RG5KeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2gV5-00000003cD4-25cX;
	Sat, 05 Sep 2026 02:51:27 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2gV2-00000003cCg-2RZR;
	Sat, 05 Sep 2026 02:51:26 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788576680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C3df1ugh6rUzruXPX+OJp8A2wl50vXoeEbMwgMt7JGQ=;
	b=f+IfZYh02MvNdVrnFsEjZ4G++kBTWkOlKuUw+3PKhov/C0rvmt5d9hVpCYJeWEkZQCnoAf
	IsBOB9SJ/ukPY/NofPwrkYw4/z4/oXTPBhLpYDvle2leiszhwQKjoObZ/al6KWOFkgr5ZG
	msUKYm/quktS/uhLadceUv1RSYYg2tLiW/GzUBhTVp0f3D4TLdl4OX4CfSoo6FS/M/01AB
	Q4KfMrCdPHnia7NSvCqRo7ij0Q0+L+fFwaMn43ahpuAdX08lHZPdi6SclPCDbjU08RL7jM
	5sRU0wxlnItYPGPuGdk1dpMqhWM0jfej/m32kMv1Gh6Jr5b8o/ENLOEOS9NoHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788576680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C3df1ugh6rUzruXPX+OJp8A2wl50vXoeEbMwgMt7JGQ=;
	b=ifFd0LWf4Jb0hg6moZmbTBt5hEpYB5RTHdy3YrlSBNWGwFhsR4JqdoTOpD87JnjOj19VlF
	UniHL//75eSm+VAg==
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Radu Rendec <radu@rendec.net>, Marc Zyngier <maz@kernel.org>, Anup Patel
 <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>
Subject: Re: Interrupt chip driver maintainence
In-Reply-To: <871pb9841j.ffs@fw13>
References: <871pb9841j.ffs@fw13>
Date: Sat, 05 Sep 2026 04:51:18 +0200
Message-ID: <87ld9g9zrt.fsf@yellow.woof>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_195124_766620_B344665E 
X-CRM114-Status: UNSURE (   8.50  )
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

Thomas Gleixner <tglx@kernel.org> writes:
> I'm wading through my inbox full of patches for interrupt chip drivers
> and I'm thoroughly annoyed. The way how this works today is not
> sustainable.
>
> Patches end up in my and Radu's inbox and all we can do is go through
> them mostly on a formal basis, but it's out of our scope to look at the
> correctness vs. a particular hardware. In the past I just picked up
> patches when I had the gut feeling they are remotely correct, but I'm
> tired of this.

I have hardware to test the SiFive PLIC. I also spent quite some time
staring at the specification attempting to cleanse the mess we have for
plic_irq_eoi() (which sadly yielded nothing).

I can help looking at patches. Would that help moving things forward?

Nam

