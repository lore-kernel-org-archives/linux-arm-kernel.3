Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E3BC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 15:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdTUXWFgkL92CXU6cIcvptUGYhZCceJlJ7Gz3ILYWTU=; b=2cbWQJwb2kaBNqAPHheHoipnBt
	40eYgRUIF8/xgzc4nIrMVoD7Y25dg1NR5ArBezCLwbqoeyepgaJjdimQ7ss6m6bP3OrZGVOyUu8op
	VrabsGrs/G4CezRc+ScFd0lq1FKC1gjJqUt1xqW1WKgwHEecPfPNeRjlpAeFlt/7kVQnpj5nWHvbv
	TV8ocSd48lSRbnibs2w1YO/kV7/5bUMARaZHSTTgTMfbHm860/Lua/IwEbQDSPk/pmPLYmX+DrNQ1
	bKdUv1w94n69wUB59PxpK1qApnKR40uyuHW8wM/e1R7O3iZSbYnnlL16FyWfIgiLa2d5/Bv4Rl53n
	y8DbPJKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXCF-00000009EsZ-3IiN;
	Wed, 09 Jul 2025 15:58:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZV88-00000008pOM-2ojZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 13:46:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB6E261437;
	Wed,  9 Jul 2025 13:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F22BAC4CEEF;
	Wed,  9 Jul 2025 13:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752068795;
	bh=5B9eTj/eINrz86OB0Vl7K+d6l0jqBjchJI8t7ZVdju8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fW60umIZ8r9SapgzB1+MLZSmSUj2ofqdmm07tcKj8GrIJnPV8uFb2CzTGyZixNJc4
	 3A/CWE+BurKOpi2QiGL5CVf7au0p9wq1Ou1FJIRqMgsqwRa1Tapgwj2DaxV91Vdc2Q
	 r3YYAlFnM9y6sc+ia1U0ZvQowEfnMy4TCCAY/bwP9eXdMOZxot10t59vGyziiyTHnP
	 jV65I/YysHW0Q5hAAHFRPwhueRoVwAusks6QE3mmsNVyklhD+apytHeiSeAn3sX0QP
	 ROB2iZ3FnhO/yDeb9lRtr4wquugtvp1TWQGjcvhFvQsvIYHmBYCOZQZvuXr4qZmlBN
	 7ox8dc/oYiuAg==
Date: Wed, 9 Jul 2025 14:46:30 +0100
From: Will Deacon <will@kernel.org>
To: Bruno Goncalves <bgoncalv@redhat.com>
Cc: Ondrej Mosnacek <omosnace@redhat.com>, cki-project@redhat.com,
	linux-arm-kernel@lists.infradead.org, liwan@redhat.com,
	jbastian@redhat.com, catalin.marinas@arm.com, ftjahjad@redhat.com,
	mmalik@redhat.com
Subject: Re: =?utf-8?B?4p2MIEZBSUwgKE1JU1NFRCA1IG9m?=
 =?utf-8?Q?_41=29=3A_Test_repor?= =?utf-8?Q?t?= for for-kernelci (6.16.0-rc5,
 upstream-arm-next, ec480130)
Message-ID: <aG5ytoziCzgLWF5R@willie-the-truck>
References: <78490.125070817230501180@us-mta-669.us.mimecast.lan>
 <aG5P2AclIvvkrTW-@willie-the-truck>
 <CAFqZXNuREvtOXyji5pqtZ1Ovn1xoX750JM8pKBwCU=5CF6zCqw@mail.gmail.com>
 <CA+QYu4re8avumV10juN3tn7Lbk81x0F9vOWh_UmXoGAvJ1UgDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+QYu4re8avumV10juN3tn7Lbk81x0F9vOWh_UmXoGAvJ1UgDQ@mail.gmail.com>
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

On Wed, Jul 09, 2025 at 01:38:52PM +0200, Bruno Goncalves wrote:
> On Wed, 9 Jul 2025 at 13:30, Ondrej Mosnacek <omosnace@redhat.com> wrote:
> > On Wed, Jul 9, 2025 at 1:24 PM Will Deacon <will@kernel.org> wrote:
> > > On Tue, Jul 08, 2025 at 09:23:02PM -0000, cki-project@redhat.com wrote:
> > > > One or more kernel tests failed:
> > > >     Unrecognized or new issues:
> > > >         Boot test
> > > >              aarch64
> > > >                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/redhat:1914252947-aarch64-kernel_upt_13
> > > >                    Non-passing ran subtests:
> > > >                        ❌ FAIL Panic
> > >
> > > Yikes, a panic! Unfortunately, I can't seem to find any more details:
> > >
> > >   - test_kernel_panic.log contains:
> > >
> > >       "Test aborted due to a kernel panic, please review the console.log file."
> > >
> > >   - console.log is empty
> > >
> > >   - The other output files don't contain a panic message
> > >
> > > Please can a CKI person dig up the panic message for me? I guess it died
> > > really early or something.
> >
> > not actually a CKI person and not sure what happened to the
> > console.log, but as a RH employee I can click through to the actual
> > Beaker job and the console.log is available there. Pasting the
> > relevant snippet below:
> 
> Thanks Ondrej,
> 
> adding more context, the panic happened when rebooting the machine,
> after the upstream arm kernel was installed, but it was not running.
> This panic happened
>  on the fedora kernel.

Thanks Ondrej, Bruno. I won't hold up the arm64 fixes pull request on
this, then.

Cheers,

Will

