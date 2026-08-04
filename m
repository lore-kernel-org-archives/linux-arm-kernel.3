Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2CFC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 18:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKk2rwqNObSX29y7QODtlnhHJqRzSQBC3KX0AgTlwX0=; b=aR1JaYhK6NMCR3wpsx2eAORoKi
	p6qCEKCPC2uEFZriDUkqCQ0ovZJEmNMfduseoQjUQeFIOb4b83cRk0NgOFCB131nrpS3rS9cl7141
	CeyZIDQN4tD7GiZ+3iUWC+4lsHqSg4VqViRis7VnEt00+n/N9xO9oR86E83GxzDiz+ZVUqpFy4kNA
	8FcR42XNh1Z/o2m+hoHLRt146fRXuvV5fXEb9Bei0lpltl3vKrkX+7qQJvemtztyUFqVKhUbeh5DG
	bC5BgrPDLpyAHgkCxW7JZCcKFPw4VWxyShLejAFKhBhsP5WvE8aqq04bQiOD6X/sewZkRMdZZ9N05
	cwok3LDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJvR-00000002cQt-1wOa;
	Tue, 04 Aug 2026 18:31:41 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJvO-00000002cQR-2u61
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 18:31:40 +0000
X-Forwarded-Encrypted: i=1; AHgh+RoM/PyoH46a9pUc9fmCX/RqCrLhA33HJY0NyybWuptjWOO5BFy1I6d1zDVDNV5dHmGSTAICjkEqeBxjf3+v7xZc@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785868296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EKk2rwqNObSX29y7QODtlnhHJqRzSQBC3KX0AgTlwX0=;
	b=MJELh5RRQguo+y0wuPazSlztR9J505xCeSFIHX0dmhXQoXdeyo9CUnDwP5rEpkWNQ/a03v
	ZbfEREgcBbDl3MroM4SVsPTvQmkhPkALr6BWAa7p9zYLkfNKr4hTSmxZIzZvP/L29XlLnn
	jkltlKPyJp74+pDKohZX0hNIehdJkTo=
X-Gm-Message-State: AOJu0YxXWfGfWhAykv0yfJHFKh/pZpoNKeLiY2l7lfoWkQjaOSkydE0n
	RALbvTDqVxRO8HcLMMVn9lTZVHcO2Jz2nrlzKVkZOqnTTvMbZPMTy3+yFIvrBWi4ReRzdY5z26P
	+fYjaXRRzYlWZBzgUVxZQbXQfo/RIDqYc8Ig5cvT2
X-Received: by 2002:a05:622a:e09b:20b0:50e:5eba:cadd with SMTP id
 d75a77b69052e-52ce693a6famr1913531cf.2.1785868280864; Tue, 04 Aug 2026
 11:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260804092421.1728880-1-fuad.tabba@linux.dev> <7e660a4c-af62-4751-a8cf-49151054f0df@sirena.org.uk>
In-Reply-To: <7e660a4c-af62-4751-a8cf-49151054f0df@sirena.org.uk>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 4 Aug 2026 19:30:44 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx9iLrnnaEVzV=3B+22bhh0DsPZRrBPvB6ZUT_CV5DvWA@mail.gmail.com>
X-Gm-Features: AUfX_my_-8pjyJaz0sfztFQlFvVHxrkE_nbOMypqyMRvyIlCd3fGeHs44ANLYm4
Message-ID: <CA+EHjTx9iLrnnaEVzV=3B+22bhh0DsPZRrBPvB6ZUT_CV5DvWA@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: selftests: Check ID regs are immutable after
 a failed run
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Peter Maydell <peter.maydell@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_113138_934950_A4014C86 
X-CRM114-Status: GOOD (  20.77  )
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

On Tue, 4 Aug 2026 at 19:14, Mark Brown <broonie@kernel.org> wrote:
...
> > +     if (!found) {
> > +             ksft_test_result_skip("%s (no immutable ID reg field to test)\n",
> > +                                   __func__);
> > +             kvm_vm_free(vm);
> > +             return;
> > +     }
>
> All test result reports for a given test should use the same string when
> reporting so that automation can figure out that results for a given
> test from different runs correspond to each other.  It's better to print
> a diagnostic message, then the ksft_test_result_() with the result for
> the framework.

Thanks, will fix in v2: the skip will report under the same name, with
the reason as a ksft_print_msg().

>
> > +     TEST_ASSERT(r < 0 && errno == EBUSY,
> > +                 "ID reg write after failed first run: r=%d errno=%d",
> > +                 r, errno);
> > +     TEST_ASSERT_EQ(vcpu_get_reg(vcpu, reg), val);
>
> > +     kvm_vm_free(vm);
> > +     ksft_test_result_pass("%s\n", __func__);
>
> Mixing TEST_ASSERT() and ksft_test_result_ in the same test program also
> interacts really poorly with automation, TEST_ASSERT() just kills the

Agreed, but it looks file-wide rather than specific to this test, so I
would rather leave it to your series than convert one function. Happy
to follow once that lands.

Cheers,
/fuad


> entire program so no result is reported for the actual failing test and
> any tests the program would attempt to run afterwards also vanish from
> the results.  If the test program is using the kselftest framework to
> report tests as this one is it should report the results via kselftest
> framework.  A better pattern would be something like:
>
>         if (r < 0 && errno == EBUSY) {
>                 ksft_print_msg("ID reg write after failed first run: r=%d errno=%d",
>                                 r, errno);
>                 pass = false;
>                 goto out;
>         }
>
> ...
>
>  out:
>         kvm_vm_free(vm);
>         ksft_test_result(pass, "%s\n", __func__);
>
> TEST_ASSERT() is a good fit for tests that are just one test case per
> program, then it plays nicely with tooling since the tooling just
> tracking the executable result and any output is diagnostic logging.

