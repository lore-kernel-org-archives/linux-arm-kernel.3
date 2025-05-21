Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA2DC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 08:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9AmbypxTI2jYnMAk64SlQ+j1NqP5vso4Kd6MKkEcWA=; b=WxCXRyOQh+zRBro4ZF0sKvRYd4
	f0Ab8qX1lRNxbXMvR4a5lz6rvf57T4kvCWgtQZkLTZE5asvN0FsHaOE4gfngnviZDaqYwtcfzzCcr
	THBZP3vbtUQDsuxXINsMupPqVl0rSdBGdURuD/+7pgNnruRsB22Owb2b5ajQAlOlA2WaQ8T9S22qW
	iWsG2srUA1d2EW1457j2++crZzYnJE/AuBzXw3qZ6AG2+MJmxqS5nPI8LLX9XF77X6QKj+vRFtN9t
	Vb8g79goJoduLD91vvtAMFlsaaA3pzjmM7VZlMMsxXPsKcQTrrdQmq5nkVXFdg5NRtYKPPSNTD1BU
	TI5yiBbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHevp-0000000FAmo-1XD9;
	Wed, 21 May 2025 08:36:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHetn-0000000FAhI-17pm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 08:34:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 218C66000A;
	Wed, 21 May 2025 08:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1889C4CEE4;
	Wed, 21 May 2025 08:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747816440;
	bh=5rhP6BXYcMO+UC1wBGbbY4oDMf55LFy7XhHiHHdmmfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nsfyPClBWOd0lT3ekcSbF2zji8H58Xuscc8nxITWFdBLKTgRtV+ubU6R/J8C3ILQQ
	 CrJ+JbuNOKocsXkkhSJv634rA5Bhjr2eWnDu6Aft61CvUouX8pDygkkl8u14r4mVSj
	 Sg9lLdMOz6rAuFZAMFkVrMALMShsN1VuwIqQxc9J7+WiXnZOJg3ivm03I6Tl8KX078
	 cAZ02Q8WOK30jK/C1FcOkbndC0KR2iJTRe/NUHFemUfQwqJf5ld+Z2+TABz6wCOf3x
	 qtKhwtrOArdXLbAjr545YqqorLtueUuBr5FGo3kfW0Tf6Byn6gb2F47wIjrKKL6LnW
	 GCMDeUumghKyA==
Date: Wed, 21 May 2025 09:33:56 +0100
From: Will Deacon <will@kernel.org>
To: cki-project@redhat.com
Cc: linux-arm-kernel@lists.infradead.org, mmalik@redhat.com,
	catalin.marinas@arm.com, omosnace@redhat.com
Subject: Re: =?utf-8?Q?=E2=9D=8C_FAIL=3A_Test_repor?= =?utf-8?Q?t?= for
 for-kernelci (6.15.0-rc7, upstream-arm-next, 187899f4)
Message-ID: <20250521083355.GA20084@willie-the-truck>
References: <02407.125052016130402593@us-mta-266.us.mimecast.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02407.125052016130402593@us-mta-266.us.mimecast.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Tue, May 20, 2025 at 08:13:02PM -0000, cki-project@redhat.com wrote:
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
>     https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1827578492
> 
> One or more kernel tests failed:
>     Unrecognized or new issues:
>         selinux-policy: serge-testsuite
>              aarch64
>                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/redhat:1827578492-aarch64-kernel_upt_23
>                    Non-passing ran subtests:
>                        ❌ FAIL Test

These selinux failures don't seem related to the arm64 tree afaict:

+ nft -f /root/selinux-testsuite/tests/inet_socket/nftables-flush
/root/selinux-testsuite/tests/inet_socket/nftables-flush:1:17-24: Error: Could not process rule: No such file or directory
delete table ip security
                ^^^^^^^^
/root/selinux-testsuite/tests/inet_socket/nftables-flush:2:18-25: Error: Could not process rule: No such file or directory
delete table ip6 security

Will

