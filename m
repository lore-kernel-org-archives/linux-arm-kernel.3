Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485ECC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 18:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4w8atz1CDFKd63DahuhoMvQqP++z9erhuWOgKzl/YqE=; b=VPOuEt7x7iAGDjbcBnbficyPIF
	fARkzbyk1EcURYjwklf/7CEm/KEYrVKjqwu8ozYGMRCmGvp+9wXWNfpXzGz/Xz5DoVu+X9BvRRsol
	t6DdNpfYz/Dkfu8pkghfXsH/jLJmVXhNc4c0d0MBtruXXbbzTPiSj2E7nnaFLlxq/xIESWaWmICn3
	JwWAOih8/wT8kgG1bsju/RLBxn+k0+ULXTuK2U3JMdTSg+nB48zPnnBbY0L1Q3Y8j+BiA1t0ow+g+
	g+tIWCRUGKYT4jtVhS23qw0AjYlTKW1fWOoFxY0QXzQVYfGWEtug/if+si58dD1R8AfoiAtCb9eE8
	Zw00Ep+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqcX6-0000000FEWm-3NQ5;
	Fri, 07 Mar 2025 18:34:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqcVT-0000000FETc-2PdZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 18:33:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 20F445C34F7;
	Fri,  7 Mar 2025 18:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E40CFC4CED1;
	Fri,  7 Mar 2025 18:33:09 +0000 (UTC)
Date: Fri, 7 Mar 2025 18:33:07 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: cki-project@redhat.com
Cc: will@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: =?utf-8?Q?=E2=9C=85_PASS=3A_Test_repor?= =?utf-8?Q?t?= for
 for-kernelci (6.14.0-rc5, upstream-arm-next, 14d05f12)
Message-ID: <Z8s746JHlqXt7TSo@arm.com>
References: <77413.125030711120800859@us-mta-168.us.mimecast.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77413.125030711120800859@us-mta-168.us.mimecast.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_103311_654305_3ADD1A92 
X-CRM114-Status: GOOD (  16.56  )
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

On Fri, Mar 07, 2025 at 04:12:05PM -0000, cki-project@redhat.com wrote:
> Hi, we tested your kernel and here are the results:
> 
>     Overall result: PASSED
>              Merge: OK
>            Compile: OK
> 
> Tested-by: CKI Project <cki-project@redhat.com>
> 
> Kernel information:
>     Commit message: Merge remote-tracking branch 'will/for-next/perf' into for-kernelci

Something wrong with CKI? In the past we used to get reports only after
updating the for-kernelci but now it seems to send several emails a day.
Is it related to the build error below? The above message implies that
it compiled successfully.

Thanks.

> You can find all the details about the test run at
>     https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1705137995
> 
> One or more kernel builds failed:
>     We also see the following known issues which are not related to your changes:
>          aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redhat:1705137995-aarch64-kernel
>                    Issue: [upstream] error: initializer-string for array of 'char' is too long [-Werror=unterminated-string-initialization]
>                           https://gitlab.com/cki-project/infrastructure/-/issues/473
> 
> 
> If you find a failure unrelated to your changes, please ask the test maintainer to review it.
> This will prevent the failures from being incorrectly reported in the future.
> 
> Please reply to this email if you have any questions about the tests that we
> ran or if you have any suggestions on how to make future tests more effective.

-- 
Catalin

