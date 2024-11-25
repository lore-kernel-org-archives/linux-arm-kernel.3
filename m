Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00BCD58D5D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 15:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NIe7AGQYKQNMAd48kNHL/M+pRSmMGo9NLbf4gIJomIc=; b=gjhtgOPvQdjIO7Suzj9oKEO2F7
	mzNw8u8EuekiHZtaXBfX//6latIwjOzp1ZZ7qy+kwZSI2Zn9Y51MPt48APdaT3MvGcvmISdAwhdnE
	YOD0o9jiGrs5ORILQ4V7rqJ8sWv8WrHh6/LbNutzCI7DpNZrHh5xN1tSSHV2MjNXskzN9g8ItWwiP
	tE4YLsA96FJA2ZJfIVVDt0NwCJc0sZ8aG9eMYXzmnqSvTykuRh9q8vQ0ZEfclhfr9OgBe3/2iELMU
	Kt1vxPm/wD2RqE90NTRfPs20SgLF/lbvzCIUifdSnap2rStNVzfpq8NdSzSlmg1llYWhz6v55++M6
	z5B/AkYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFajv-00000008PR3-1iuh;
	Mon, 25 Nov 2024 15:11:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFaiw-00000008P8j-1KtW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 15:10:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7D1E2A417A3;
	Mon, 25 Nov 2024 15:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E252BC4CECE;
	Mon, 25 Nov 2024 15:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732547401;
	bh=AaaAPFJGZp2LBZRcY6RK8JEEDW9gxNwMYtG0oEKWzxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kvWoQhRuB4aZNFKG5yXtkv9mm/py0uiCAtfh8yuPaOdAXssmU7ieGRl2ynsJyxSbP
	 qfEsTA6gn2HlUo8xCAYl/H1B1rJAqLmNnaZ8I2cFgrSwF6TBQob8Z29r2x5DHAte2H
	 0y4M5k6o6bnn4rHWTa/roMlz/Fem+I3wntDwppXQplF6fqokTIt4ta6h+G3ES2cmf5
	 Jdn7y2DSljDBu9dlwAxn0MT+6kJydprPQsmF0b+2tuxDuhzixZEOdjcgAbl19NMYGC
	 AFI4K5z0zdZhV2QlHHNBqaYWVEhgOgTRAXUb36GiGxk2XsLCNNeAi2sIx5kRsWbhl5
	 8/3Wz+HGm8+SQ==
Date: Mon, 25 Nov 2024 10:09:59 -0500
From: Sasha Levin <sashal@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] arm64 updates for 6.13-rc1
Message-ID: <Z0STR6VLt2MCalnY@sashalap>
References: <20241118100623.2674026-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241118100623.2674026-1-catalin.marinas@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_071002_489324_B5142240 
X-CRM114-Status: GOOD (  10.06  )
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

On Mon, Nov 18, 2024 at 10:06:23AM +0000, Catalin Marinas wrote:
>  - MTE: hugetlbfs support and the corresponding kselftests

Hi Catalin,

It looks like with the new feature above, LTP manages to trigger the
following warning on linus-next:

[  100.133691] hugefork01 (362): drop_caches: 3
tst_hugepage.c:84: TINFO: 2 hugepage(s) reserved
tst_tmpdir.c:316: TINFO: Using /scratch/ltp-CckaqgMrC1/LTP_hug5PSMw8 as tmpdir (ext2/ext3/ext4 filesystem)
tst_test.c:1085: TINFO: Mounting none to /scratch/ltp-CckaqgMrC1/LTP_hug5PSMw8/hugetlbfs fstyp=hugetlbfs flags=0
tst_test.c:1860: TINFO: LTP version: 20240930
tst_test.c:1864: TINFO: Tested kernel: 6.12.0 #1 SMP PREEMPT @1732504538 aarch64
tst_test.c:1703: TINFO: Timeout per run is 0h 02m 30s
<4>[  100.355230] ------------[ cut here ]------------
<4>[  100.356888] WARNING: CPU: 0 PID: 363 at arch/arm64/include/asm/mte.h:58 copy_highpage+0x1d4/0x2d8
<4>[  100.359160] Modules linked in: crct10dif_ce sm3_ce sm3 sha3_ce sha512_ce sha512_arm64 fuse drm backlight ip_tables x_tables
<4>[  100.363578] CPU: 0 UID: 0 PID: 363 Comm: hugefork01 Not tainted 6.12.0 #1
<4>[  100.365113] Hardware name: linux,dummy-virt (DT)
<4>[  100.365966] pstate: 63402009 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
<4>[  100.366468] pc : copy_highpage+0x1d4/0x2d8
<4>[  100.366780] lr : copy_highpage+0x78/0x2d8
<4>[  100.367090] sp : ffff80008066bb30
<4>[  100.368094] x29: ffff80008066bb30 x28: ffffc1ffc3118000 x27: 0000000000000000
<4>[  100.369341] x26: 0000000000000000 x25: 0000ffff9ce00000 x24: ffffc1ffc3118000
<4>[  100.370223] x23: fff00000c47ff000 x22: fff00000c4fff000 x21: ffffc1ffc3138000
<4>[  100.370739] x20: ffffc1ffc3138000 x19: ffffc1ffc311ffc0 x18: ffffffffffffffff
<4>[  100.371285] x17: 0000000000000000 x16: ffffa302fd05bcb0 x15: 0000ffff9d2fdfff
<4>[  100.372778] x14: 0000000000000000 x13: 1ffe00001859f161 x12: fff00000c2cf8b0c
<4>[  100.374124] x11: ffff80008066bd70 x10: ffffa302fe2a20d0 x9 : ffffa302fb438578
<4>[  100.374877] x8 : ffff80008066ba48 x7 : 0000000000000000 x6 : ffffa302fdbdf000
<4>[  100.376152] x5 : 0000000000000000 x4 : fff00000c2f239c0 x3 : fff00000c33e43f0
<4>[  100.376962] x2 : ffffc1ffc3138000 x1 : 00000000000000f4 x0 : 0000000000000000
<4>[  100.377964] Call trace:
<4>[  100.378736]  copy_highpage+0x1d4/0x2d8 (P)
<4>[  100.379422]  copy_highpage+0x78/0x2d8 (L)
<4>[  100.380272]  copy_user_highpage+0x20/0x48
<4>[  100.380805]  copy_user_large_folio+0x1bc/0x268
<4>[  100.381601]  hugetlb_wp+0x190/0x860
<4>[  100.382031]  hugetlb_fault+0xa28/0xc10
<4>[  100.382911]  handle_mm_fault+0x2a0/0x2c0
<4>[  100.383511]  do_page_fault+0x12c/0x578
<4>[  100.384913]  do_mem_abort+0x4c/0xa8
<4>[  100.385397]  el0_da+0x44/0xb0
<4>[  100.385775]  el0t_64_sync_handler+0xc4/0x138
<4>[  100.386243]  el0t_64_sync+0x198/0x1a0
<4>[  100.388759] ---[ end trace 0000000000000000 ]---

-- 
Thanks,
Sasha

