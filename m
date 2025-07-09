Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886B5C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 14:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqgxckOkdWcypcGRGw90U5McGBij4ejOFNJaaAiKWDU=; b=0NUv+J11cQRcwyy9uG3Lf187He
	slZJvlZC3Hf31Nl4dGjdBplR7jRwAL5LTWEAdqys8lR4UXxhXN/F/bb9JIBuZPAkdCAYEBdir7nZ2
	8l3YLm0+QHkM15qFPk/nNLqVpW2O/J/hlkg6B+nQewtz7Stxx7Hfc9WJAh1SJa4RqRAJRs8/z5fKH
	Dz6RaX8fmjApTKCTsWkd5PuJP/ihh76ihz/uFYRsbH6pQqf1CkTSfZO7qBI6DldLfO53VEHMzbQiC
	n0wIKfGu7bMvOtZ88Qxi4cs0o1MOH75VhWd6Ui+TPerGRZ5fJFwbqZU0u9GbngOP3oFu8Gb3tOtc1
	+KvhNHxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVYW-00000008vpM-0o5r;
	Wed, 09 Jul 2025 14:13:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSo9-00000008TPY-3yDf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 11:17:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 60BCB61467;
	Wed,  9 Jul 2025 11:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67402C4CEF5;
	Wed,  9 Jul 2025 11:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752059869;
	bh=UNVhGeKbHvkfsd2g0Ny63efM/Jmjr1G2Ke//ifJFi7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R+u3GkwG7Y14q+cZHB3/pmvubqc/QFi1nauYtWKfDPMPL6Utjw1B3RdgGjRuVONPi
	 RMcNYD6i0DFCCbNrJAfhu7NtZX2vzeDvK1QRRk/R768w6GJrkUP6OLqHxxh+NC3koF
	 W/ElZr+a2GJ8+db7l3oYkg6HLSiCRwH6doDPEVNkPGUj8U8jcyAw3BABJIZGMN3L1p
	 J7FFbR8RiGCdBRBow0VvxVgMqnjQc6Z7Ts7mpV4/chVjiZ5MzbUq3qpCPej5Dl22tQ
	 MjwfYHV3pLujzftexOuPbHtnwNVqXZZpKW2/JEiogAtMvwm2TaZWmrNHQo/B7nm6SS
	 9lF6h+UjidBZg==
Date: Wed, 9 Jul 2025 12:17:44 +0100
From: Will Deacon <will@kernel.org>
To: cki-project@redhat.com
Cc: bgoncalv@redhat.com, omosnace@redhat.com,
	linux-arm-kernel@lists.infradead.org, liwan@redhat.com,
	jbastian@redhat.com, catalin.marinas@arm.com, ftjahjad@redhat.com,
	mmalik@redhat.com
Subject: Re: =?utf-8?B?4p2MIEZBSUwgKE1JU1NFRCA1IG9m?=
 =?utf-8?Q?_41=29=3A_Test_repor?= =?utf-8?Q?t?= for for-kernelci (6.16.0-rc5,
 upstream-arm-next, ec480130)
Message-ID: <aG5P2AclIvvkrTW-@willie-the-truck>
References: <78490.125070817230501180@us-mta-669.us.mimecast.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78490.125070817230501180@us-mta-669.us.mimecast.lan>
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

On Tue, Jul 08, 2025 at 09:23:02PM -0000, cki-project@redhat.com wrote:
> Hi, we tested your kernel and here are the results:
> 
>     Overall result: FAILED
>              Merge: OK
>            Compile: OK
>               Test: FAILED
> 
> 
> Kernel information:
>     Commit message: Merge branches 'for-next/core' and 'for-next/fixes' into for-kernelci
> 
> You can find all the details about the test run at
>     https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1914252947
> 
> One or more kernel tests failed:
>     Unrecognized or new issues:
>         Boot test
>              aarch64
>                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/redhat:1914252947-aarch64-kernel_upt_13
>                    Non-passing ran subtests:
>                        ❌ FAIL Panic

Yikes, a panic! Unfortunately, I can't seem to find any more details:

  - test_kernel_panic.log contains:

      "Test aborted due to a kernel panic, please review the console.log file."

  - console.log is empty

  - The other output files don't contain a panic message

Please can a CKI person dig up the panic message for me? I guess it died
really early or something.

Cheers,

Will

