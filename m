Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46391C02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2nQiAX5kbnc2+092r6wL3DXI8snZnGo3iGbU34BwyOs=; b=4R583/K7PLGUXwHm0ion4ximq7
	oEZIfEPxSJnybyiuhrjwAK6TT26aQZx3sxn/WR4LDzjdcKmRpjYnohrmChHAH8FUs3RGmahvPz8aS
	P3TYIRVXELbzx+4TS4JcXRN+m7EfFI9Av0J27db4z/h+7IQwWJKRN0LWO0KXVAAWuVzZLOPJUZViC
	zzwTKUUrsOZzdJUW4tH2K8ZhmiPf/xvrX7otP3UFd5nxn7UNGuJnhxU+W1T4Sfvfi4FOEgYuRtqNY
	ZRc+UY70yE0XBh2qd01JXlGI5H6sQxgDXK2jdpDgLm7tStdQmoEGT+BLkEyDQn40pAMLEj6g/e10T
	3v6a27eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg09o-000000069KT-2T26;
	Thu, 06 Feb 2025 11:34:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzXa-000000061nJ-40z2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:55:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5E7A1CC4;
	Thu,  6 Feb 2025 02:55:49 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 548BC3F5A1;
	Thu,  6 Feb 2025 02:55:24 -0800 (PST)
Date: Thu, 6 Feb 2025 10:55:21 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, eauger@redhat.com, fweimer@redhat.com,
	jeremy.linton@arm.com, oliver.upton@linux.dev, pbonzini@redhat.com,
	stable@vger.kernel.org, tabba@google.com, wilco.dijkstra@arm.com,
	will@kernel.org
Subject: Re: [PATCH 7/8] KVM: arm64: Mark some header functions as inline
Message-ID: <Z6SVGbr7cvrVnNMz@J2N7QTR9R3>
References: <20250204152100.705610-1-mark.rutland@arm.com>
 <20250204152100.705610-8-mark.rutland@arm.com>
 <b76803b7-c1b3-426b-a375-0c01b98142c9@sirena.org.uk>
 <Z6SJAkogWN9D7ZKf@J2N7QTR9R3>
 <86seortkve.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86seortkve.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_025527_034694_DE8D3AE8 
X-CRM114-Status: GOOD (  18.21  )
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

On Thu, Feb 06, 2025 at 10:42:29AM +0000, Marc Zyngier wrote:
> On Thu, 06 Feb 2025 10:03:46 +0000,
> Mark Rutland <mark.rutland@arm.com> wrote:
> > That said, I'm going to go with the below, adding 'inline' to
> > kvm_hyp_handle_memory_fault() and using CPP defines to alias the
> > function names:
> > 
> > | static inline bool kvm_hyp_handle_memory_fault(struct kvm_vcpu *vcpu,
> > |                                                u64 *exit_code)
> > | {
> > |         if (!__populate_fault_info(vcpu))
> > |                 return true;
> > | 
> > |         return false;
> > | }
> > | #define kvm_hyp_handle_iabt_low         kvm_hyp_handle_memory_fault
> > | #define kvm_hyp_handle_watchpt_low      kvm_hyp_handle_memory_fault
> > 
> > I think that's clearer, and it's more alisnged with how we usually alias
> > function names in headers. Other than these two cases, __alias() is only
> > used in C files to create a sesparate exprted symbol, and it's odd to
> > use it in a header anyhow.
> > 
> > Marc, please should if you'd prefer otherwise.
> 
> Nah, that's fine by me.
> 
> My only issue was with marking functions as inline, and yet storing
> pointers to these functions. But it looks like the compiler (GCC 12.2
> in my case) is doing a good job noticing the weird pattern, and
> generating only one function, even if we store multiple pointers.

That's fair -- I'm fairly certain that we do this elsewhere too, but I
can switch to __maybe_unused if we're worried that might bite us in
future?

Mark.

