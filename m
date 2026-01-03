Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35EFFC617E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 10:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGpUw0Ox/Jp3kMXH8XGSAcDFluSymyYJIP4RuNh5bqs=; b=q9tB88GkJqquJMNSrnDrMiVZxJ
	MzZgQQ9Vi96EdFXoCcI86TYoyIifH/Xk8vKL8GU3ODaxPZ38HjEMfBxTe4M+Yj2co0SY4edTEeYqL
	dkUJOOpKwVYOklybSejZeBMzotAFnC47Ezx8h4op7udXKQIWgViYYVSjHBXYAuwCAFKRbeq0iQAb3
	lKcKKDCki/ArMaRli5d1kx/jRaz9G4/8QFpoFj3IVYuvpbYz7nSL1svBdjSrFtnKwUuY9OVBGJgOM
	XkctXyjdJOqBNWSyMFhpHlAMgtqfmNnZr5TDkG0OSsoQz6FNuk4dmySJb9LJF5rRKxVund26VOz42
	bHQN+zqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbzJl-00000009Hul-032x;
	Sat, 03 Jan 2026 10:57:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbzJj-00000009HuK-0Cg3
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 03 Jan 2026 10:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yGpUw0Ox/Jp3kMXH8XGSAcDFluSymyYJIP4RuNh5bqs=; b=WWqgZuM48b7FbOoOeeyE8QCA++
	8iVDuXNHU1VUP6ASEGefeZkliQobPiqAk1F6yJLREFzWtOZUh54RqolYady6Bam3Lyh7wcOPgL0Bn
	xiImINu2TwwQ1ch7KXaBfCefMnxAIWx2hFElPfCTW5OZIBkkFMjnsx+pvpl1Fc0OOQiyqwWpVsIsh
	howQWwax+RnGJvEU+dsz1cbQc/h8416AK0NrK0VI5QEBukFrn9Axubtx5dc5txBW5leW8pbOzzctu
	896Z7chtLjvosptBE4zCCkFKaBp8D6MV2cE6jo8McPNeymM0/lHanbXtCVzv9Xj5hfFeu5WcYzHBb
	OYPDAzHw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbzJg-00000006Tj1-0Op7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 10:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767437815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yGpUw0Ox/Jp3kMXH8XGSAcDFluSymyYJIP4RuNh5bqs=;
	b=BAnF2WpJY5PCKjpyunmTQAFvf6LNuMDSSQP+MyuGzG61kc6OyIn78p+ySTuF4XG03EeoRc
	1bhb8ASswxJvhHlREo3LAD1+AEjzFuS4k/1K/MfMr4goLoiO7oqe7c493QeFqei0KnaE65
	OjG1LkTQ71Mp4zA1XldwbvR8e+HIT4w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767437823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yGpUw0Ox/Jp3kMXH8XGSAcDFluSymyYJIP4RuNh5bqs=;
	b=e48SpL+wVjq+Besk63t6agZ+KxHd/sR+iFjGcyt2KBKIe2bra/kXA6O5dGDwak6m9/+X4I
	NQhnIZkbA6yqiOrETTxUCP+WHKezZXQgnji+xHVMAC5d5vgbKKCCRZRG7dnsYtuJ0KWWfi
	+j7ds22ks4o5PIB+5HO6G2YVxVZdZJo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-80-zNokpBgqPf6VSRWU69Yn0Q-1; Sat,
 03 Jan 2026 05:56:49 -0500
X-MC-Unique: zNokpBgqPf6VSRWU69Yn0Q-1
X-Mimecast-MFC-AGG-ID: zNokpBgqPf6VSRWU69Yn0Q_1767437807
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0451619560A5;
	Sat,  3 Jan 2026 10:56:45 +0000 (UTC)
Received: from fedora (unknown [10.45.224.28])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 3114119560A7;
	Sat,  3 Jan 2026 10:56:36 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sat,  3 Jan 2026 11:56:44 +0100 (CET)
Date: Sat, 3 Jan 2026 11:56:35 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Keke Ming <ming.jvle@gmail.com>
Cc: mhiramat@kernel.org, peterz@infradead.org, linux@armlinux.org.uk,
	catalin.marinas@arm.com, will@kernel.org, tsbogend@alpha.franken.de,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/5] uprobes: transition from kmap_atomic to
 kmap_local_page
Message-ID: <aVj146EunyaOQzxO@redhat.com>
References: <20260103084243.195125-1-ming.jvle@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260103084243.195125-1-ming.jvle@gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_105704_299460_E66B1E06 
X-CRM114-Status: UNSURE (   8.24  )
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

On 01/03, Keke Ming wrote:
>
> Keke Ming (5):
>   riscv/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
>   arm64/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
>   mips/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
>   arm/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
>   uprobes: use kmap_local_page() for temporary page mappings
>
>  arch/arm/probes/uprobes/core.c     |  4 ++--
>  arch/arm64/kernel/probes/uprobes.c |  4 ++--
>  arch/mips/kernel/uprobes.c         |  4 ++--
>  arch/riscv/kernel/probes/uprobes.c |  4 ++--
>  kernel/events/uprobes.c            | 12 ++++++------
>  5 files changed, 14 insertions(+), 14 deletions(-)

Thanks,

Acked-by: Oleg Nesterov <oleg@redhat.com>


