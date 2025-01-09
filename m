Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC5DE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 14:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2HYQeeVPCjwIOEhwKIFKTv2N4/f1ge+l+GkxBmu5oE=; b=dB1P+sy/VFpHQClfWK89n8696g
	G+G1v4suTFS99FoFTcbtjw3NEiMFHFzjK11g7wRVdwHYPMDrtkey9STbABqgAJfTET3xQPyAgRlIY
	Gc+M1oOeA5dShSTPstHXH9iEixVBKoSd1MxwJ2PZVET/1WqXaul3/PHMk/3q9qg/Rhjjc5mCj0ooN
	F6bDJ1iUTiCG5zH27eX+VNUXl5nSdpIlAMzV+ygUWt63T40RuhuFxiXnT17qYmcRMzdDTCe3lwvwn
	uartDjQguXtIZPjxJgOFl6jYAuTctVeMDZiLR6wu8EigIh/mJf1NY2qqKxFqtOJR6EdKUIaocsXi8
	w93acFQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtQO-0000000CDU1-3QzH;
	Thu, 09 Jan 2025 14:22:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtPC-0000000CDLS-1wDL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 14:21:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9FCB9A41CBE;
	Thu,  9 Jan 2025 14:19:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED12C4CED3;
	Thu,  9 Jan 2025 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736432460;
	bh=/5XAFJC/aw7ggNjtXwMtJmU4oJAVmMrLtugAnhzzmNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I+skzkeBWnWDG8Z3+0KwPbZBQ1//sUnQjIeqJKlmf+3RRPqTx8Z0l1FNdffLrLLaA
	 xeddefG05pPPbDqookOVPNANsdc5Z88CwFmZvapBcCcsG/K9cSfBcf7ZekkPOq8jP0
	 X3Sr+eWA5BKK/WllSUfsvEcBKPo+u/1mmCzMQu9HkbdH6FNyLpH9MmbdeUT4LBnaSy
	 huKAIfaOooRCeQ/jTh4hXFY96NGx94tMTgG3DNLPnJOeLMd9CPFegzEenelcZIAYjT
	 lUjGrXa+hZINSXrFS7GT3jM8tcWXRqK+znQd955xejIQ+V2OPtYhAKlLNokbPWnml+
	 hhuHt52mj5gcg==
Date: Thu, 9 Jan 2025 14:20:56 +0000
From: Will Deacon <will@kernel.org>
To: cki-project@redhat.com
Cc: bgoncalv@redhat.com, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: =?utf-8?Q?=E2=9D=8C_FAIL=3A_Test_repor?= =?utf-8?Q?t?= for
 for-kernelci (6.13.0-rc6, upstream-arm-next, 577490b6)
Message-ID: <20250109142053.GA10705@willie-the-truck>
References: <88638.125010818430600129@us-mta-121.us.mimecast.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <88638.125010818430600129@us-mta-121.us.mimecast.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_062102_623071_F2502210 
X-CRM114-Status: GOOD (  12.59  )
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

On Wed, Jan 08, 2025 at 11:43:03PM -0000, cki-project@redhat.com wrote:
> Hi, we tested your kernel and here are the results:
> 
>     Overall result: FAILED
>              Merge: OK
>            Compile: OK
>               Test: FAILED
> 
> 
> Kernel information:
>     Commit message: Merge branches 'for-next/core' and 'for-next/perf' into for-kernelci
> 
> You can find all the details about the test run at
>     https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1616589950
> 
> One or more kernel tests failed:
>     Unrecognized or new issues:
>         Boot test
>              aarch64
>                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/redhat:1616589950-aarch64-kernel_upt_14
>                    Non-passing ran subtests:
>                        ❌ FAIL distribution/kpkginstall/journalctl-check
>              aarch64
>                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/redhat:1616589950-aarch64-kernel_upt_37
>                    Non-passing ran subtests:
>                        ❌ FAIL distribution/kpkginstall/journalctl-check
>              aarch64
>                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/redhat:1616589950-aarch64-kernel_upt_50
>                    Non-passing ran subtests:
>                        ❌ FAIL distribution/kpkginstall/journalctl-check
>              aarch64
>                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/redhat:1616589950-aarch64-kernel_upt_57
>                    Non-passing ran subtests:
>                        ❌ FAIL distribution/kpkginstall/journalctl-check
>              aarch64
>                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/redhat:1616589950-aarch64-kernel_upt_65
>                    Non-passing ran subtests:
>                        ❌ FAIL distribution/kpkginstall/journalctl-check

Hmm, this looks bad but I'm struggling to spot the issue in the logs.

One thing I don't quite grok, however, is that the logs refer to both
"6.13.0-rc6" and "6.13.0-0.rc6.20250107gitfbfd64d25c7a.49.fc42.aarch64)",
neither of which correspond to the arm64 for-kernelci branch.

There are also some errors from grub, but I don't know whether or not
they are expected/benign:

 error: ../../grub-core/kern/disk_common.c:26:attempt to read or write outside
 of partition.
 error: ../../grub-core/kern/disk_common.c:26:attempt to read or write outside
 of partition.
 error: ../../grub-core/kern/disk_common.c:26:attempt to read or write outside
 of partition.
 error: ../../grub-core/kern/disk_common.c:26:attempt to read or write outside
 of partition.
 error: ../../grub-core/kern/disk_common.c:26:attempt to read or write outside
 of partition.

If there's a log showing a build of for-kernelci failing to boot, then
that would be really helpful. Can somebody from the CKI team point us in
the right direction, please?

Cheers,

Will

