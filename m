Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEE1EA813E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 16:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arFHHZJkZv6zoXOAENB21Ixwvc0GG+Q+ZTUsj1Yb4J8=; b=1/StzBcg4rRkSv1vfbvY4Fqyp2
	dYhbYsUngyFm3sJrA0iPcX7fFpRI9XvcdE5gQnd5I0aFB+24lfDWvI45MxIdjcaYGM3QCQ3v7vfCg
	UiZ/0Xr0aWa7VTAIEXd6UsCFQ4t3RNVccKSz4kP5D2ul6Gic1Xie1LgCdtplX7unip1O7OQoOQ4XH
	H8AdxHQC/hgjwBNNGQPZsaIqZS2M799UMuf7xKBAAjENK+Es3Re8bH8dcvgkGtybx9wG6PV3Y00bE
	GhMUnNgKbhpBEWdQmaKEEMWPuOAhjWMkPV3c0pubK9Y3c80NUAH6rA50fwXQiemYopC4fW7Oio3dG
	RkeTxGyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqOI-0000000HCkd-30hS;
	Tue, 10 Feb 2026 16:15:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqOF-0000000HCk8-0ztY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 16:15:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AB9B339;
	Tue, 10 Feb 2026 08:14:53 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C179F3F632;
	Tue, 10 Feb 2026 08:14:56 -0800 (PST)
Date: Tue, 10 Feb 2026 16:14:54 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, will@kernel.org, maz@kernel.org,
	broonie@kernel.org, oliver.upton@linux.dev, miko.lenczewski@arm.com,
	kevin.brodsky@arm.com, ardb@kernel.org, suzuki.poulose@arm.com,
	lpieralisi@kernel.org, scott@os.amperecomputing.com,
	joey.gouly@arm.com, yuzenghui@huawei.com, pbonzini@redhat.com,
	shuah@kernel.org, mark.rutland@arm.com, arnd@arndb.de
Subject: Re: [PATCH v12 2/7] arm64: cpufeature: add FEAT_LSUI
Message-ID: <aYtZfpWjRJ1r23nw@arm.com>
References: <20260121190622.2218669-1-yeoreum.yun@arm.com>
 <20260121190622.2218669-3-yeoreum.yun@arm.com>
 <aYY2CyHWtplQ-fuS@arm.com>
 <aYouAv_EjICIN8oA@arm.com>
 <aYsAaaQgBaLbDSsW@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYsAaaQgBaLbDSsW@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_081503_400834_5F082907 
X-CRM114-Status: GOOD (  36.51  )
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

Hi Levi,

On Tue, Feb 10, 2026 at 09:54:49AM +0000, Yeoreum Yun wrote:
> > On Fri, Feb 06, 2026 at 06:42:19PM +0000, Catalin Marinas wrote:
> > > On Wed, Jan 21, 2026 at 07:06:17PM +0000, Yeoreum Yun wrote:
> > > > +#ifdef CONFIG_ARM64_LSUI
> > > > +static bool has_lsui(const struct arm64_cpu_capabilities *entry, int scope)
> > > > +{
> > > > +	if (!has_cpuid_feature(entry, scope))
> > > > +		return false;
> > > > +
> > > > +	/*
> > > > +	 * A CPU that supports LSUI should also support FEAT_PAN,
> > > > +	 * so that SW_PAN handling is not required.
> > > > +	 */
> > > > +	if (WARN_ON(!__system_matches_cap(ARM64_HAS_PAN)))
> > > > +		return false;
> > > > +
> > > > +	return true;
> > > > +}
> > > > +#endif
> > >
> > > I still find this artificial dependency a bit strange. Maybe one doesn't
> > > want any PAN at all (software or hardware) and won't get LSUI either
> > > (it's unlikely but possible).
> > > We have the uaccess_ttbr0_*() calls already for !LSUI, so maybe
> > > structuring the macros in a way that they also take effect with LSUI.
> > > For futex, we could add some new functions like uaccess_enable_futex()
> > > which wouldn't do anything if LSUI is enabled with hw PAN.
> >
> > Hmm, I forgot that we removed CONFIG_ARM64_PAN for 7.0, so it makes it
> > harder to disable. Give it a try but if the macros too complicated, we
> > can live with the additional check in has_lsui().
> >
> > However, for completeness, we need to check the equivalent of
> > !system_uses_ttbr0_pan() but probing early, something like:
> >
> > 	if (IS_ENABLED(CONFIG_ARM64_SW_TTBR0_PAN) &&
> > 	    !__system_matches_cap(ARM64_HAS_PAN)) {
> > 		pr_info_once("TTBR0 PAN incompatible with FEAT_LSUI; disabling FEAT_LSUI");
> > 		return false;
> > 	}
> 
> TBH, I'm not sure whether it's a artifical dependency or not.
> AFAIK, FEAT_PAN is mandatory from Armv8.1 and the FEAT_LSUI seems to
> implements based on the present of "FEAT_PAN".
> 
> So, for a hardware which doesn't have FEAT_PAN but has FEAT_LSUI
> sounds like "wrong" hardware and I'm not sure whether it's right
> to enable FEAT_LSUI in this case.

In principle we shouldn't have such hardware but, as Will pointed out,
we might have such combination due to other reasons like virtualisation,
id reg override.

It's not that FEAT_LSUI requires FEAT_PAN but rather that the way you
implemented it, the FEAT_LSUI futex code is incompatible with SW_PAN
because you no longer call uaccess_enable_privileged(). So I suggested a
small tweak above to make this more obvious. I would also remove the
WARN_ON, or at least make it WARN_ON_ONCE() if you still want the stack
dump.

However...

> SW_PAN case is the same problem. Since If system uses SW_PAN,
> that means this hardware doesn't have a "FEAT_PAN"
> So this question seems to ultimately boil down to whether
> it is appropriate to allow the use of FEAT_LSUI
> even when FEAT_PAN is not supported.
> 
> That's why I think the purpose of "has_lsui()" is not for artifical
> dependency but to disable for unlike case which have !FEAT_PAN and FEAT_LSUI
> and IMHO it's enough to check only check with "ARM64_HAS_PAN" instead of
> making a new function like uaccess_enable_futex().

Why not keep uaccess_enable_privileged() in
arch_futex_atomic_op_inuser() and cmpxchg for all cases and make it a
no-op if FEAT_LSUI is implemented together with FEAT_PAN? A quick grep
shows a recent addition in __lse_swap_desc() (and the llsc equivalent)
but this one can also use CAST with FEAT_LSUI.

BTW, with the removal of uaccess_enable_privileged(), we now get MTE tag
checks for the futex operations. I think that's good as it matches the
other uaccess ops, though it's a slight ABI change. If we want to
preserve the old behaviour, we definitely need
uaccess_enable_privileged() that only does mte_enable_tco().

-- 
Catalin

