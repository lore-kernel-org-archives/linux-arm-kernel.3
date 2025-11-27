Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC450D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 11:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mZsplBCRwX+WcRF8Ggqr0MqXJ3iJ+az1Q4IhqCDbrQ=; b=tZ0eF5WIXVtmSG1nn8RuNNEEI0
	AV3fClJNHAcb/k7q5V1QaUMWv0T7OwMt2pg/GpIgmrGwVxcKpq67yDsl6HI5azuHEs9/dYt2VhEO5
	GuCq9kqV8CGdvuSmRduIUVj+bznogNiNeBepjYAVtAjXc8RqufxweixhGJztslI/OW8sWp7wW/VNR
	h2a4SjtxYvuXIOwOArE9YPZ2KOMmI4KOnLf0LNJS5xAIfPKOAn04R2sY+rnEA5ECzA/jInOCTCKd0
	nwYb7B09gvoDXAERAeWXEnqnbQsHrt6MuLu1V1593BvJgE68ndw2NPwaI+IVDh5vdiDqU2N5rm0/i
	BhZyc1ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOaUs-0000000GUS5-3ALE;
	Thu, 27 Nov 2025 11:49:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOaUq-0000000GURJ-1iBU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 11:49:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A691143C3E;
	Thu, 27 Nov 2025 11:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89531C4CEF8;
	Thu, 27 Nov 2025 11:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764244151;
	bh=a/kReGcHVvaERE9/x1uk/qCU7+Pg0X/4SJddlzphN8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pN0oEcxHvXSVWBR+Tg/We3L+BzPX064pT28Fb9XMIND2buLCcWRwlJHh6PNGulnoV
	 nT+/whAlG8jXGNmtaGJz9J2QIE7f7FatKzleLv4w3xjYfwNlNAVBZQkNXk0G3ypq61
	 T6x3KQXcyqX0wfu9DmYdOl8VCpwt9gp713Xi9JpKk3sDbzKxW1zODHjkh0m62Z6YEC
	 WUG0kJLo+1bM4ep1sNaCS4vV97PX7jdfLmw+ahhXKPwh46iEY+yar9tt+T8rdaOUb3
	 r22Zj1Wjsb/P2CKKWLOR4clQ9bzYaaYWNfL1ND1jv3ENWNEdlz7HjfjCG0C/vHulZ6
	 spJ9VJcPdMitg==
Date: Thu, 27 Nov 2025 11:49:07 +0000
From: Will Deacon <will@kernel.org>
To: cki-project@redhat.com
Cc: catalin.marinas@arm.com, yoyang@redhat.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: =?utf-8?Q?=E2=9D=8C_FAIL=3A_Test_repor?= =?utf-8?Q?t?= for
 for-kernelci (6.18.0-rc7, upstream-arm-next, b5fb0949)
Message-ID: <aSg6s9gsWz8_1Q8O@willie-the-truck>
References: <15220.125112518430500117@us-mta-125.us.mimecast.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15220.125112518430500117@us-mta-125.us.mimecast.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_034912_488614_EE09ED65 
X-CRM114-Status: UNSURE (   9.64  )
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

On Tue, Nov 25, 2025 at 11:43:01PM -0000, cki-project@redhat.com wrote:
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
>     https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2179290550

Looks like LTP fails to compile?

Building ltp
    [CC]    growfiles
growfiles.c: In function 'main':
growfiles.c:289:15: error: macro 'strrchr' requires 2 arguments, but only 1 given
  289 | char *strrchr();
      |               ^
In file included from ../src/global.h:83,
                 from growfiles.c:44:
/usr/include/string.h:291:11: note: macro 'strrchr' defined here
  291 | #  define strrchr(S, C)                                         \
      |           ^~~~~~~
In file included from /usr/include/features.h:540,
                 from /usr/include/sys/types.h:25,
                 from /usr/include/uuid/uuid.h:38,
                 from /usr/include/xfs/linux.h:13,
                 from /usr/include/xfs/xfs.h:9,
                 from ../src/global.h:18:

Will

