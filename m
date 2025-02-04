Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A015C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 11:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wth3Fuy6HUShqBeMg9u6kTiEf1ds1dKniLrHYbgEIcI=; b=Svbv4WTjwiOlmkyHIzOzay3bc5
	rRf5FdUcFdJJ/pkibuwzEr4pI0dZW8hrNSVrv0viZexm4IhFw2hUBBehG5+FZRVBfaZtvAac5iEny
	vgxAxNL/7xPMQJc5hohhRMwL/9ayz203CMdA1b4woAAxLptzXinhdXULf7NNa0kuyTDusDe4/YTJX
	4w7Tmom/rTPkXtMWb+uqo0vSzv6ui+PW99421OKShgy+z953ecesiK/+nQHYPvslkAIWdWXIwE8yv
	SRG/KOaFqnBtC0lIEAeMdvpmhemBE5MT3nqIMX5dg2O8+6zR7srgwQqCqkakGkTIbBkVwHqFVvCoi
	tE3nHTMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfGvj-00000000FsZ-1ZvZ;
	Tue, 04 Feb 2025 11:17:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfGuN-00000000FhZ-1ECM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 11:16:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D44065C6064;
	Tue,  4 Feb 2025 11:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24F50C4CEDF;
	Tue,  4 Feb 2025 11:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738667758;
	bh=FeL2TosPcBAfuz2g2DJBleqk/dsYY999hW7HTPSHOak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WFui/9VVNocvYIkOgFXarghxNT84d0Xx1yOirXsTrYqJPMcnkAimwmWfv2MwGUfPA
	 cGCADqVvkWl8ZavwQiDB3g7GU4uDI4jnLfFn/a7ZlYuHlAyYzAR8rCIKILKVU5yVtY
	 6Du39GdYIOe2Gzn7Xw9TWIxTcC7tE9KXnsO5kh1sGW9JDUt5432pn2xw1C8OtRXDRI
	 95HtRCXdFweAFqK3fQuU/1hC1an3Dp09TOVkIm3Kk3z7G8Jg/kDhjwtz77k+oRn6O2
	 dvjDD9Ougd/4/d63yYRImhkaVdJnLzPFxjYxregW6kOzI2pyP6xJWiaYk6+Aa2HeXe
	 0E3Hr14kZARdg==
Date: Tue, 4 Feb 2025 11:15:53 +0000
From: Will Deacon <will@kernel.org>
To: cki-project@redhat.com, kees@kernel.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	akpm@linux-foundation.org, masahiroy@kernel.org
Subject: Re: =?utf-8?Q?=E2=9D=8C_FAIL=3A_Test_repor?= =?utf-8?Q?t?= for
 for-kernelci (6.14.0-rc1, upstream-arm-next, 2014c95a)
Message-ID: <20250204111552.GA893@willie-the-truck>
References: <35056.125020404510900229@us-mta-503.us.mimecast.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35056.125020404510900229@us-mta-503.us.mimecast.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_031559_372370_578C982A 
X-CRM114-Status: UNSURE (   9.81  )
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

[+Kees]

On Tue, Feb 04, 2025 at 09:51:05AM -0000, cki-project@redhat.com wrote:
> Hi, we tested your kernel and here are the results:
> 
>     Overall result: FAILED
>              Merge: OK
>            Compile: FAILED
> 
> 
> Kernel information:
>     Commit message: Linux 6.14-rc1
> 
> You can find all the details about the test run at
>     https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1654629441

It looks like the build fails thanks to a rust panic:

00:00:10   EXPORTS rust/exports_helpers_generated.h
00:00:11 panicked at main.rs:52:36:
00:00:11 Unable to generate bindings: ClangDiagnostic("error: unknown argument: '-fzero-init-padding-bits=all'\n")
00:00:11 make[4]: *** [rust/Makefile:332: rust/bindings/bindings_helpers_generated.rs] Error 101

Presumably introduced by dce4aab8441d ("kbuild: Use
-fzero-init-padding-bits=all"). I'm guessing that option isn't supposed
to propagate to .rs sources?

Will

