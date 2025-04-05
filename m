Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A0CC36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 00:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlcpWwDciVN/d0MAXL0hW/B3Bzg3zZltilufPP70KUU=; b=GecYRaGP+CyU/lssBXiHGXTM+D
	iQsOrawN5VS6KibGDRMd5RcqOVu5fqeLcAsdYGrerrwLaghbp3QqBQ5d4M1/iUxcxfSm+gxIV72ee
	dkFlh9PENisXfgDNe9K0S7C5hG49wtCEJ5I0WEq16DuWS86o2mX7fFZYp5I60DYUgiB7r/Ii4ecX6
	wbk5iidYLVDmBi1xVYKf+45mAg1yiNofR1VqALla4+kxfWoMxV5PDZK2mGzBfdFYs5uHd8NBhKVnA
	6oEd2Hh/e7rqYaJhbJX9/z/ClwDiYDVA0CWD+Xu7oe4V7k8CUQYRIqJN0MrMM3ROtLUToz7huqmiM
	9Lwcg+DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0rZ2-0000000DDhP-3NFB;
	Sat, 05 Apr 2025 00:39:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0rOQ-0000000DCLx-3Gdu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 00:28:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E7165A41905;
	Sat,  5 Apr 2025 00:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32630C4CEDD;
	Sat,  5 Apr 2025 00:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743812893;
	bh=52hIKm/EcVzVGzamHJCHAV9kvjOFBdWT2MrAaflINn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mx/9IGX0EyzAZ8DYWIGiIPqsEb3ZehO/Qex5lKxqbdyjPov96p61yngnyEByTZj4l
	 GCKmmlzVwjTpJmjJX3UGbOEAwab1rKTdlQ42D3Be6IZQ6+HVErKO3dufk/2mQgvxvm
	 p4nllFE2uHZWkKibUvmY9b/m2z1NAQuqJcGRQ1dsCE76FSmY+wHPUYKPYzFgAkjKgh
	 zrskcVjTd3PtkCNNCaHQ6/bzXin0OqEHo50xi92jwVT7h1620UsurYsZoCG1YAKX5H
	 hVR8ZShg7+dv4VqagRZC5bzbR/liHOHab6ysOMKv3XFeu1rv0+AzelpwlgJBzt2W0D
	 u2U5pk9fETtAQ==
Date: Fri, 4 Apr 2025 17:27:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	clang-built-linux <llvm@lists.linux.dev>,
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: v6.14-12245-g91e5bfe317d8: Boot regression: rk3399-rock-pi-4b
 dragonboard-410c dragonboard-845c no console output
Message-ID: <20250405002757.GA836042@ax162>
References: <CA+G9fYve7+nXJNoV48TksXoMeVjgJuP8Gs=+1br+Qur1DPWV4A@mail.gmail.com>
 <20250403011849.GA3138383@ax162>
 <CA+G9fYtrsLHvMH=ofmdS3MMsMTEj3k0PD7=qsRsA4WkSqLkCzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+G9fYtrsLHvMH=ofmdS3MMsMTEj3k0PD7=qsRsA4WkSqLkCzQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_172814_881055_936A8018 
X-CRM114-Status: GOOD (  11.61  )
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

On Thu, Apr 03, 2025 at 04:17:44PM +0530, Naresh Kamboju wrote:
> I’ve re-run the tests to validate the boot behavior on the Rock Pi 4 board
> with different Clang nightly versions and the latest mainline kernel.
> 
> The combination using clang-nightly:20250319 successfully booted the
> Rock Pi 4 board.
> However, the combination using clang-nightly:20250401 failed to boot
> the same board.
> 
> "name": "clang",
> "version": "21.0.0",
> "version_full": "Debian clang version 21.0.0
> (++20250401112529+290d7b82cb5d-1~exp1~20250401112547.1360)"
> 
> Reference:
>  - https://lkft.validation.linaro.org/scheduler/job/8196258
>  - https://lkft.validation.linaro.org/scheduler/job/8196275

Thank you for verifying. Do you test with clang-20 and if so, are tests
at that same revision passing? I want to make sure this is an LLVM
regression before trying to get into figuring out how to bisect with
your setup. Another way to do that is to see if clang-nightly boots are
failing on the stable branches, which would point to Linux not being at
fault.

Cheers,
Nathan

