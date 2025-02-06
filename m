Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00A3C02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 10:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFg8SnvcNiGDxxF/V6z+jdfY4vA+W4zHjpU15mW2h2g=; b=apJVjlzdUATWmFulLVTqOqj0nw
	T/YeSRjYdrRnrd3KSON5AujiyIbPnUAbAGibm7RzxBYiu3E7g72K0+25LZgWm6p3Xl9pI5Hu5UDXo
	9WIyFUPo4ALZulekXkGRLjh2iF4ezEuEnutqc5G6G5JFnA5Np++sTUIjTvsXaET/bjCXOaxSL5WpY
	iNvGDE5WMPcNoBhIT4lAo7b6YCDB+WPpUebpvnCi9sZNEPxVtJQlzM+OeorkvdNVynweDckDXz2Ua
	IkFHkH4JnYMrIONejG5agHzE2gnJ137IODOiJvXmizDX5X/Iu6cKdWps5zWV+sUyG7/SPpvV9WLiv
	a6eDtDdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfysp-00000005wqh-1xcj;
	Thu, 06 Feb 2025 10:13:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfyjg-00000005vil-139T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:03:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E2AD12FC;
	Thu,  6 Feb 2025 02:04:15 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BA033F63F;
	Thu,  6 Feb 2025 02:03:49 -0800 (PST)
Date: Thu, 6 Feb 2025 10:03:46 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>, maz@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	eauger@redhat.com, fweimer@redhat.com, jeremy.linton@arm.com,
	oliver.upton@linux.dev, pbonzini@redhat.com, stable@vger.kernel.org,
	tabba@google.com, wilco.dijkstra@arm.com, will@kernel.org
Subject: Re: [PATCH 7/8] KVM: arm64: Mark some header functions as inline
Message-ID: <Z6SJAkogWN9D7ZKf@J2N7QTR9R3>
References: <20250204152100.705610-1-mark.rutland@arm.com>
 <20250204152100.705610-8-mark.rutland@arm.com>
 <b76803b7-c1b3-426b-a375-0c01b98142c9@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b76803b7-c1b3-426b-a375-0c01b98142c9@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_020352_356371_51B4D380 
X-CRM114-Status: GOOD (  16.87  )
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

[resending as I corrupted MarcZ's email when moving from CC into TO]

On Wed, Feb 05, 2025 at 09:50:30PM +0000, Mark Brown wrote:
> On Tue, Feb 04, 2025 at 03:20:59PM +0000, Mark Rutland wrote:
> > The shared hyp swtich header has a number of static functions which
> > might not be used by all files that include the header, and when unused
> > they will provoke compiler warnings, e.g.
> 
> With at least LLVM 18 we still have some issues with unused statics
> arising from the aliased function definitions:
> 
> In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:8:
> ./arch/arm64/kvm/hyp/include/hyp/switch.h:699:13: warning: unused function 'kvm_hyp_handle_iabt_low' [-Wunused-function]
>   699 | static bool kvm_hyp_handle_iabt_low(struct kvm_vcpu *vcpu, u64 *exit_code)
>       |             ^~~~~~~~~~~~~~~~~~~~~~~
> ./arch/arm64/kvm/hyp/include/hyp/switch.h:701:13: warning: unused function 'kvm_hyp_handle_watchpt_low' [-Wunused-function]
>   701 | static bool kvm_hyp_handle_watchpt_low(struct kvm_vcpu *vcpu, u64 *exit_code)
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> The simplest thing would be to expand the alises into simple wrapper
> functions but that doesn't feel amazing, I don't know what people's
> taste is there?

Adding 'inline' seems to work, which seems simpler?

That said, I'm going to go with the below, adding 'inline' to
kvm_hyp_handle_memory_fault() and using CPP defines to alias the
function names:

| static inline bool kvm_hyp_handle_memory_fault(struct kvm_vcpu *vcpu,
|                                                u64 *exit_code)
| {
|         if (!__populate_fault_info(vcpu))
|                 return true;
| 
|         return false;
| }
| #define kvm_hyp_handle_iabt_low         kvm_hyp_handle_memory_fault
| #define kvm_hyp_handle_watchpt_low      kvm_hyp_handle_memory_fault

I think that's clearer, and it's more alisnged with how we usually alias
function names in headers. Other than these two cases, __alias() is only
used in C files to create a sesparate exprted symbol, and it's odd to
use it in a header anyhow.

Marc, please should if you'd prefer otherwise.

Mark.

