Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CF6CC6B3C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 11:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3/545MMauWox9XIqD1AT683YEgMh8C8atV6TY+ZI68=; b=e2DPX6xdAw5NsYtgoxRtoIWNZ6
	c57igLARgdr2Gg4UMlQGRcKJY+xA4k45uffak/5GIUCSrQ4T4OoV5TrW2TWYjl3syCzXZaFVdXsTM
	Xkyen2zBqrpJAC0Fz40K5dIJaA2DBfdAkSDDc2mQMFD7OsfbYhxrcl27u8jQmML1e3lOcq1FrMRgK
	W9ELNCMrMeyqma7eCW/gSxIgFwNk3YSEDNfCsYpsIv0MKO7D7feWC2LR8pDqh8MqQ/WaCcRRuUjTp
	zKLO377PEpuzTLkbXNOcgLiXel6S8T7x6Dmtgm5IiNyRU2BSecHIea2YIfHbWu9erOmLSOTe07gPr
	BPLDoh9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJa9-0000000HYvz-2uHp;
	Thu, 15 Oct 2026 11:25:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJa3-0000000HYtr-3Qmi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 11:25:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4F1E1516;
	Thu, 15 Oct 2026 04:24:57 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E93E3F673;
	Thu, 15 Oct 2026 04:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792063501; bh=Z1lDdmdOJoTDQFFR9wnCGZXrEBJ0ZDQnFAo49BevXUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ox6HS10fQVaXJ2hCnpNjqhoDwbW/U9VRV0FedPe1YzsWl96uEtS8WlxtcYKaJn7Vh
	 1bufjIKWoGExs/1LhYF60d7paHhyZxlLP9X6ruJP0qlQMmwuZqnjzOY0rWD58bvBDm
	 czIHoFu6LcxZt/2vjXfQSPaPlNwrE476zcah6MgY=
Date: Thu, 15 Oct 2026 12:24:57 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: cki-project@redhat.com
Cc: linux-arm-kernel@lists.infradead.org, mmalik@redhat.com,
	will@kernel.org, omosnace@redhat.com
Subject: Re: =?utf-8?Q?=E2=9D=8C_FAIL=3A_Test_repor?= =?utf-8?Q?t?= for
 for-kernelci (7.3.0-rc4, upstream-arm-next, d820e3ba)
Message-ID: <atC4Ce9AQxjCwYIB@arm.com>
References: <81706.126101500420900200@us-mta-510.us.mimecast.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81706.126101500420900200@us-mta-510.us.mimecast.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_042503_994461_F0F789A1 
X-CRM114-Status: GOOD (  11.88  )
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

On Thu, Oct 15, 2026 at 04:42:05AM -0000, cki-project@redhat.com wrote:
> Hi, we tested your kernel and here are the results:
> 
>     Overall result: FAILED
>              Merge: OK
>            Compile: OK
>               Test: FAILED
> 
> 
> Kernel information:
>     Commit message: Merge branch 'for-next/fw-rmi' into for-next/core
> 
> You can find all the details about the test run at
>     https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2947827228
> 
> One or more kernel tests failed:
>     Unrecognized or new issues:
>         selinux-policy: serge-testsuite
>              aarch64
>                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/redhat:2947827228_aarch64_kernel_kcidb_tool_1200470666_8
>                    Non-passing ran subtests:
>                        ❌ FAIL Test
> 
>     We also see the following known issues which are not related to your changes:
>         Issue: [upstream] Hardware - Firmware test suite - auto-waive failures
>             URL: https://gitlab.com/cki-project/infrastructure/-/issues/779
>             Affected tests:
>                 Hardware - Firmware test suite [aarch64]

Is this another infrastructure issue? From the logs:

+ nft -f /root/selinux-testsuite/tests/sctp/nftables-flush
/root/selinux-testsuite/tests/sctp/nftables-flush:1:17-24: Error: Could not process rule: No such file or directory
delete table ip security
                ^^^^^^^^

Thanks.

-- 
Catalin

