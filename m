Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F729C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 16:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7IID4PyXQxI5yRdGT/vr39ldUga9qszpD4Yso9Zw9NY=; b=iefG+QyeBj0jxzLuTOWjfGfnPZ
	vRuFJV5E0p61dk6Ygj6aAYCTAGj3p/1dzSw2d1oqUG20u+Yu4UoWYEwt3HqK14vuPYENH4B9RLR4n
	G4v26/uFBBwCIl+TNOuGuQEAE1oSGLfx8Y0hPZzF7uIelRyjZShot/FySCFzuh8XnVVOGGPbFWNpV
	c8E6wVmczSIYyWYIoh8y2wF6HwBr/Wv1vbeGq6NIiISXQPm/1f6Aa+33r3WOfcLKuuC/Zb7liAP46
	+2YvWsHqL11m6FfyjcXJywXWYmHBu18dtBg8/uTXfGJozzrgHVOaf3NJeS0ij8w/keiMIkFjjaFqF
	Yzj0aHhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tibnE-0000000Bh98-1aLU;
	Thu, 13 Feb 2025 16:10:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tibMR-0000000Bask-238t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 15:42:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6D29CA42707;
	Thu, 13 Feb 2025 15:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB3FC4CED1;
	Thu, 13 Feb 2025 15:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739461362;
	bh=IWZ1m6D71Ih3aPqwbP8TPp827j7GpuMxcd/gfEsT9gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N84CjDBfnuZnlNeMYLPB+2IoMaeSUzH12i4CS5PHBtpMFlBNVepg6Ph1a0yDonsYf
	 glAKPiciVq32UG4CW1Il21gQyrMQfY7Sk+qSZCLhJmxaC2rw49Gom6JJuFx83vBwSd
	 HE46/ydRpThL5EcIaIQAgiCC4CMB461VB6hDJkzw3jpoGCCffzJpBPfa4rZGadxTvj
	 L6AovLdHoPY0eJO+bUidUDDYvVmqkeH1Rq4Ud+ZbcKtTVW/v59y3UIGBIT/SdRl7wS
	 FfsEPWY8o2VXmI0KjZ3+i+5Nxvay08r51MyJ57E+GbR2LyTE7fIAMldEObNwZz4BLf
	 eT0SBPU5z78kA==
Date: Thu, 13 Feb 2025 15:42:38 +0000
From: Will Deacon <will@kernel.org>
To: cki-project@redhat.com
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	steve.price@arm.com
Subject: Re: =?utf-8?Q?=E2=9D=8C_FAIL=3A_Test_repor?= =?utf-8?Q?t?= for
 for-kernelci (6.14.0-rc2, upstream-arm-next, a64dcfb4)
Message-ID: <20250213154237.GA11897@willie-the-truck>
References: <64234.125021309531800883@us-mta-201.us.mimecast.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64234.125021309531800883@us-mta-201.us.mimecast.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_074243_591525_B10B2686 
X-CRM114-Status: UNSURE (   9.21  )
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

[+Steven]

On Thu, Feb 13, 2025 at 02:53:16PM -0000, cki-project@redhat.com wrote:
> Hi, we tested your kernel and here are the results:
> 
>     Overall result: FAILED
>              Merge: OK
>            Compile: FAILED
> 
> 
> Kernel information:
>     Commit message: Linux 6.14-rc2
> 
> You can find all the details about the test run at
>     https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1669747201
> 
> One or more kernel builds failed:
>     Unrecognized or new issues:
>          aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redhat:1669747201-aarch64-kernel

00:14:01 drivers/gpu/drm/panthor/panthor_fw.c: In function ‘panthor_fw_read_build_info’:
00:14:01 drivers/gpu/drm/panthor/panthor_fw.c:641:53: error: initializer-string for array of ‘char’ is too long [-Werror=unterminated-string-initialization]
00:14:01   641 |         const char git_sha_header[sizeof(header)] = "git_sha: ";
00:14:01       |                                                     ^~~~~~~~~~~

Will

