Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEDDC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 09:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vcmamsXZ0fnBe29ARjk2ggFDuHZEz3s5gcXYyHugDA8=; b=2cC11twkrwcb6gPvBfLwOCA+vI
	KqC4NmRcBG2IhllBJaWue/MifxiNzdrscGPqGVjxX/1+iyGHVQG1UQhlSd+GQBmuH5ljRF0BKNA90
	CPqnWsLz1rOwl5E1AIesM7oT8bMgN8VfV+7xztL5ASj5tWpmPM7tQ8aNVnaLenaMfAfKBXq80HMKf
	/+5/JYF/9V52eDq5wPGdyJlq+891eiqoL6v/5LZqkTRNL0U1uT7hZTcPEqyojJCci5tuQebVk8DlD
	sA6RIqmD6I3/cINNgqpGpPRQFANETaMH1Ln/fxt8c1qmfMogBB3OPE9toH1Y6iKCUaKjzR6q7H8RC
	+ADcu45Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynZv-00000000VZ8-1E7U;
	Tue, 25 Aug 2026 09:36:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynZu-00000000VYy-1jvK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 09:36:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E517601DE;
	Tue, 25 Aug 2026 09:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E5751F000E9;
	Tue, 25 Aug 2026 09:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787650581;
	bh=vcmamsXZ0fnBe29ARjk2ggFDuHZEz3s5gcXYyHugDA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Dh2c0GPBlwbL3vCHjE1mrgvlnjipa8nagbdBLUom1qGSLIemPsop4oY19jPNT+r20
	 KG9zIRiapwjXPykBmYQhvoUpjWTuDjnVKi0rKLosIdHuRIgzeHPAD0dpH8yn8a+ia0
	 Te1OSOvqVc9Z2gnM4RRir2jRIDaGvxrHCKWdBde5K0cUn0/WzN1OOoNpA6G/tVYcnV
	 esSIM2mCN1vvzi/XWJZZz6egU4hMsPLjUQbbuIPS74Zaw4k4VEBbu+oyKmFbpQvbGx
	 1c3vV7KB2I0sya3qzz4JwayIr427jWmcdnvDQ3uHxojI/eh88cQ+DV6gG3zrzEBl9C
	 +I/WX1LJU3Ifg==
Date: Tue, 25 Aug 2026 10:36:16 +0100
From: Will Deacon <will@kernel.org>
To: cki-project@redhat.com
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	fs-test@redhat.com
Subject: Re: =?utf-8?Q?=E2=9D=8C_FAIL=3A_Test_repor?= =?utf-8?Q?t?= for
 for-kernelci (7.2.0-0, upstream-arm-next, 68f892e9)
Message-ID: <ao1iEBnm5A9O392d@willie-the-truck>
References: <48084.126082415530700603@us-mta-193.us.mimecast.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48084.126082415530700603@us-mta-193.us.mimecast.lan>
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

On Mon, Aug 24, 2026 at 07:53:04PM -0000, cki-project@redhat.com wrote:
> Hi, we tested your kernel and here are the results:
> 
>     Overall result: FAILED
>              Merge: OK
>            Compile: OK
>               Test: FAILED
> 
> 
> Kernel information:
>     Commit message: Merge branch 'for-next/core' into for-kernelci
> 
> You can find all the details about the test run at
>     https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2786230383
> 
> One or more kernel tests failed:
>     Unrecognized or new issues:
>         xfstests - btrfs
>              aarch64
>                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/redhat:2786230383_aarch64_kernel_kcidb_tool_1200070648_9
>                    Non-passing ran subtests:
>                        ❌ FAIL generic/363
>              aarch64
>                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/redhat:2786230383_aarch64_kernel_kcidb_tool_1200071179_9
>                    Non-passing ran subtests:
>                        ❌ FAIL generic/301
>                        ❌ FAIL generic/363

Hmm, the URLs to the failing logs don't seem to work, e.g.:

https://beakerpy3.engineering.redhat.com:8443/recipes/1200071179/tasks/1200562254/results/1201884692/logs/avc.log

Will

