Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821CFC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5YtMi32FHQ7+fawZb+ziAVgUu2Jkosuh7gVhJkARHqY=; b=kxzAbGrzYYZuK9FuYXsv8SwS7l
	ah0Gq/g4SC7wGbPz8wRULH4N9RGbMmcu9Z2N2q60Bj62l6RIefcCovqQzLKuL42tsdMk2VqtT/EB8
	JFhrnbgxjHuLkmOVh1W1vD7pJWUBbvgnWuA3LGu1Sj5vQxGkLYDK9U3hdm+OmVVY/GUIdYR0hhq7A
	ADvXS/NtIx5PSczcC7FAidQKs4SpyYxrVznRBBoZE4XN/5/8dqWrga35INQfH4a8BTDKdSsP2mW5l
	WyPXRcaMAdEFw973L6OTiPmRT3j9tqvbd/psvl3owQ5Y+CylObLbJ8iEAr8pb8H9G20T10a3DVZKk
	6B/WrENg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj08j-0000000FpL7-2dhl;
	Fri, 14 Feb 2025 18:10:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizQc-0000000FhLp-3EFT
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Feb 2025 17:24:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5YtMi32FHQ7+fawZb+ziAVgUu2Jkosuh7gVhJkARHqY=; b=bnBYAKdza7esrv4m0uc8HRXnn9
	lfEmdh123d3laBppTpxxRcIpNitKudOylw4LHbQHJSIa2S8vjoFVUlmzRzkMQT8nVDDCKivcVq8h2
	fPzH5GSXlHsyFbsMOoPf3N2CMZvSVCCzJ1D0CsLp0lw16V3J8QHCIAFdLi1Hnv355BhRa4PH9YKSD
	T24T8lq/UQnn5gmw4oG2mUrf8cmFE2mSIz4l26VS3PL+AJhI3mbqBqBevEYhUv8MD70W/jcNl/4xw
	1p1VtiNyvL5F14ZFuL/H2pcTxMuP861AkKyZ+pTgC3/pWtYtxFfKH8515TpMImR6THm1yILf4WRVb
	OmK61bsQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizQZ-00000001HSd-2iN3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 17:24:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 30CE55C5A25;
	Fri, 14 Feb 2025 17:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF84C4CED1;
	Fri, 14 Feb 2025 17:24:27 +0000 (UTC)
Date: Fri, 14 Feb 2025 17:24:24 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Morse <james.morse@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, wangkefeng.wang@huawei.com,
	Guohanjun <guohanjun@huawei.com>
Subject: Re: [PATCH v13 4/5] arm64: support copy_mc_[user]_highpage()
Message-ID: <Z698SFVqHjpGeGC0@arm.com>
References: <20241209024257.3618492-1-tongtiangen@huawei.com>
 <20241209024257.3618492-5-tongtiangen@huawei.com>
 <Z6zWSXzKctkpyH7-@arm.com>
 <69955002-c3b1-459d-9b42-8d07475c3fd3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69955002-c3b1-459d-9b42-8d07475c3fd3@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_172436_038045_9E499C09 
X-CRM114-Status: GOOD (  25.52  )
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

On Fri, Feb 14, 2025 at 10:49:01AM +0800, Tong Tiangen wrote:
> 在 2025/2/13 1:11, Catalin Marinas 写道:
> > On Mon, Dec 09, 2024 at 10:42:56AM +0800, Tong Tiangen wrote:
> > > Currently, many scenarios that can tolerate memory errors when copying page
> > > have been supported in the kernel[1~5], all of which are implemented by
> > > copy_mc_[user]_highpage(). arm64 should also support this mechanism.
> > > 
> > > Due to mte, arm64 needs to have its own copy_mc_[user]_highpage()
> > > architecture implementation, macros __HAVE_ARCH_COPY_MC_HIGHPAGE and
> > > __HAVE_ARCH_COPY_MC_USER_HIGHPAGE have been added to control it.
> > > 
> > > Add new helper copy_mc_page() which provide a page copy implementation with
> > > hardware memory error safe. The code logic of copy_mc_page() is the same as
> > > copy_page(), the main difference is that the ldp insn of copy_mc_page()
> > > contains the fixup type EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR, therefore, the
> > > main logic is extracted to copy_page_template.S. In addition, the fixup of
> > > MOPS insn is not considered at present.
> > 
> > Could we not add the exception table entry permanently but ignore the
> > exception table entry if it's not on the do_sea() path? That would save
> > some code duplication.
> 
> I'm sorry, I didn't catch your point, that the do_sea() and non do_sea()
> paths use different exception tables?

No, they would have the same exception table, only that we'd interpret
it differently depending on whether it's a SEA error or not. Or rather
ignore the exception table altogether for non-SEA errors.

> My understanding is that the
> exception table entry problem is fine. After all, the search is
> performed only after a fault trigger. Code duplication can be solved by
> extracting repeated logic to a public file.

If the new exception table entries are only taken into account for SEA
errors, why do we need a duplicate copy_mc_page() function generated?
Isn't the copy_page() and copy_mc_page() code identical (except for the
additional labels to jump to for the exception)?

-- 
Catalin

