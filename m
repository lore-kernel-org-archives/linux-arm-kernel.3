Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8870FCDB471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 15:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IzQcYtj8kWYNRbeGvvHR4FtJasPw1L4TgvKaoF8K5u8=; b=nplcNs07JlZ1fzxORuKDx0bhSn
	h9SD8tDjx5O3Ji7U/HrsbBef7eD7EADhGpihs49/hCFybYBhWOgFdBk3IzHtB1u8fzo2cV58zDhUF
	UtwxxxxD/4M4B8oVTPh+faoIOqYq16dmMuv2qQE9vbPHI4gyRWycdvjA5YvygJnWxQSkde6ItH+UB
	/UAY/bIUXETbhBZq6YuPNOIZtpplqambfiX6iWt/sNBURglVmMyedFMBcsr22OC+zILFbTzmeTI09
	vgg3Ouu0ozmoqnyIl/3UTdBDLj1k2XFCgLKSafF0ypUcsO3+sdJ8cne4McYfY/+m2anF9yvqWXCqU
	WErxif/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3LS-00000006Z5v-0O5D;
	Tue, 23 Jun 2026 15:47:26 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3LO-00000006Z4V-3kFU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 15:47:24 +0000
X-Forwarded-Encrypted: i=1; AFNElJ8yljAuKtJiSvfBoRC2qwaTtN7uaOxHlUJaAqfA/FQzfuez2C+WthHkuyDLAkp7c3oo/UBOkSf7IXoRHFRXqZZM@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782229638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IzQcYtj8kWYNRbeGvvHR4FtJasPw1L4TgvKaoF8K5u8=;
	b=wpIqy77XtmffNkzTSH87GjcS6mNqGk3AWb0noQ431gZzHCsarJsKhmR7hkoFALqwX1CTjS
	JsWo5wQTU41tc763mVqw1J+3H6QkcSPG6VAJSHZz9uCOZJ60pBUHIA5MDZqM6vv6RfeLfb
	qfqbEKAVYklxMzMgUSrtgALBV/uivwI=
X-Gm-Message-State: AOJu0Yx0cIdH0jAzhZ2tNBHkYRpsNeGRIGczmwIGpj3VSmnJOxtOyyOZ
	DLfk56dXK0jVZzX9T4HJhoJKTdwkH944FLxCt3p5IqJ4C7teioJUTW/N4u2x87XlhsbcujcX/CA
	VmwHK1Rw7AWm+5YzxA5hNX16Ulf3X9TXVUFZCpIDP
X-Received: by 2002:a05:622a:1246:b0:519:f8a0:16b4 with SMTP id
 d75a77b69052e-51a522c6f26mr10190471cf.14.1782229623483; Tue, 23 Jun 2026
 08:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260621213155.6019-1-include@grrlz.net> <178222278590.523236.18181071715501850418.b4-ty@kernel.org>
 <CE64C9AC-32D5-495E-B713-552921468FB9@grrlz.net> <CA+EHjTz+oNerTD3Ygj3EzOA4zm4BKfQYM45ydwVO=2amErkBAQ@mail.gmail.com>
 <54A2BB77-5E81-4730-82A1-DB457118784C@grrlz.net>
In-Reply-To: <54A2BB77-5E81-4730-82A1-DB457118784C@grrlz.net>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 23 Jun 2026 16:46:26 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx4t1zw_C8qd=NVHjCMzBfq9PGJRxGtqDGi5eF7T5nmFw@mail.gmail.com>
X-Gm-Features: AVVi8Cflc8_rf7lxBP42NY_9cWCjn7YBQICKN6FR5h2msr8y21OBnBEdKtU1bzc
Message-ID: <CA+EHjTx4t1zw_C8qd=NVHjCMzBfq9PGJRxGtqDGi5eF7T5nmFw@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: account pKVM reclaim against the VM mm
To: Bradley Morgan <include@grrlz.net>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_084723_148585_1A81DDDA 
X-CRM114-Status: GOOD (  13.08  )
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

Hi Bradley,

On Tue, 23 Jun 2026 at 16:11, Bradley Morgan <include@grrlz.net> wrote:
>
> On June 23, 2026 4:03:30 PM GMT+01:00, Fuad Tabba <fuad.tabba@linux.dev>
> wrote:
> >On Tue, 23 Jun 2026 at 16:01, Bradley Morgan <include@grrlz.net> wrote:
> >>
> >> On June 23, 2026 2:53:11 PM GMT+01:00, Marc Zyngier <maz@kernel.org>
> >wrote:
> >> >On Sun, 21 Jun 2026 21:31:55 +0000, Bradley Morgan wrote:
> >> >> Protected guest faults charge long term pins to the VM's mm. Teardown
> >> >> can run later from file release, where current->mm may be unrelated.
> >> >>
> >> >> Drop the charge from kvm->mm instead.
> >> >>
> >> >>
> >> >
> >> >Applied to fixes, thanks!
> >> >
> >> >[1/1] KVM: arm64: account pKVM reclaim against the VM mm
> >> >      commit: d098bb75d14fde2f12155f1a95ec0168160867ce
> >> >
> >> >Cheers,
> >> >
> >> >       M.
> >> >
> >>
> >>
> >> Hey, which tree did you apply it to?
> >
> >https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git/log/?h=fixes
> >
> >/fuad
> >
> >>
> >>
> >> Thanks!
> >
>
> Thanks fuad.
>
> May I ask if this would be put onto ACK?

Yes, I'll pick it into ACK.

Cheers,
/fuad

>
> Since this affects pixel devices.
>
> (E.g, my pixel 7....)
>
> Thanks!

