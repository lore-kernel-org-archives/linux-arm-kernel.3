Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A657CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 15:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLiOvdfBu1LQGrT07aeKL9SEbEIREO7O5xToFkLfyUE=; b=3iNA51ANK2Hz6i+0mYfASRzIUJ
	fAyCUuddzknc/jWFICtRr8OlPyv+YTPNtxr01+IAPeNVhSC0p/kmYjJIS11P6tkGNYzxg1BqbEQlF
	RGIFliucCsa9SP0SMD/g67XoAwMMrikQiMtxQEzuC2MV/8JZhJmP0zwgwwjjF+y8bc0zxzv4j1Mp9
	BIIih2yQpkpgwAqv/nRElQ+zQmvgKPlw7C0DpYa7MwUQJjRwep6Tok/cvDL/fhqiMb8womQwzOMp1
	3Cn9pT4Hu6aL9sDDX6U7eLiJbwtBpFp0SReL5iBRmt/omzBqwAbJPB4dLkUB0dNRo5DqNa0HKQGR7
	Ujq7S9+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2fr-00000006VAv-2Wth;
	Tue, 23 Jun 2026 15:04:27 +0000
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2fo-00000006VAM-0wXl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 15:04:26 +0000
X-Forwarded-Encrypted: i=1; AFNElJ9yFNJJBFmhIh06ktA/oUQGpPvGt5aEBYSG8o3L43A06KmfucafDcl7TZv6zDxBn5S6gr8uzBnyYEPppraTiwdy@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782227060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bLiOvdfBu1LQGrT07aeKL9SEbEIREO7O5xToFkLfyUE=;
	b=ILYIFQcQjciTLKVdTt+GAvr12f+EQFAhssnQMCMpnZW1GFEbY2KErXQcvH3R7aPtDcQr7e
	GOm21WcnhiFGP1s93cmLZUkgCgpvoThPhWEVgszdZ5xNIPO4T+x7u7IT5iKHHjgJPQPtDM
	lkQjPkrY8rn5dbEUNXVoupRBX7GPz5w=
X-Gm-Message-State: AOJu0Yy0+ecXl6CY7jla4o0TZuCakwob9UtoW61ZploR8ao0/Vpwb2Tw
	xek/VvMdoW8tEidug+RNM3BZLClGwu08W/Iw2Jcjdc2nK41qsgG3rCYel1nm26MAvU700cDONe0
	FThw6eImUS+nX+OTRWIayd2o7v5jD0uJSQ53uwq+7
X-Received: by 2002:ac8:5c8f:0:b0:516:4f62:85e6 with SMTP id
 d75a77b69052e-51a53db1948mr9720661cf.17.1782227047172; Tue, 23 Jun 2026
 08:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260621213155.6019-1-include@grrlz.net> <178222278590.523236.18181071715501850418.b4-ty@kernel.org>
 <CE64C9AC-32D5-495E-B713-552921468FB9@grrlz.net>
In-Reply-To: <CE64C9AC-32D5-495E-B713-552921468FB9@grrlz.net>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 23 Jun 2026 16:03:30 +0100
X-Gmail-Original-Message-ID: <CA+EHjTz+oNerTD3Ygj3EzOA4zm4BKfQYM45ydwVO=2amErkBAQ@mail.gmail.com>
X-Gm-Features: AVVi8CdKu39AfvQ4xyTggnIFcw_6d9wFkc4c5a-xa35cOd03y-_YXnLsNNh7uWk
Message-ID: <CA+EHjTz+oNerTD3Ygj3EzOA4zm4BKfQYM45ydwVO=2amErkBAQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260623_080424_823286_328EE7B7 
X-CRM114-Status: UNSURE (   9.75  )
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

On Tue, 23 Jun 2026 at 16:01, Bradley Morgan <include@grrlz.net> wrote:
>
> On June 23, 2026 2:53:11 PM GMT+01:00, Marc Zyngier <maz@kernel.org> wrote:
> >On Sun, 21 Jun 2026 21:31:55 +0000, Bradley Morgan wrote:
> >> Protected guest faults charge long term pins to the VM's mm. Teardown
> >> can run later from file release, where current->mm may be unrelated.
> >>
> >> Drop the charge from kvm->mm instead.
> >>
> >>
> >
> >Applied to fixes, thanks!
> >
> >[1/1] KVM: arm64: account pKVM reclaim against the VM mm
> >      commit: d098bb75d14fde2f12155f1a95ec0168160867ce
> >
> >Cheers,
> >
> >       M.
> >
>
>
> Hey, which tree did you apply it to?

https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git/log/?h=fixes

/fuad

>
>
> Thanks!

