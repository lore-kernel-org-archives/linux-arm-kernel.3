Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1500EC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 20:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gWUvkOjprNuOMIPwPmC1XXs07VAogGop9mYHI6E0LpU=; b=eM2QRIj8g3v/sYkp0r06UnTvqX
	bIeNfIb6Sf+1i84tOIlRtjurW8do1Uw6RQNj7R4DCn+e+uuLRDiOH51V1wjFCJJzViBKQEbK2tD6N
	WHFqdXN2mLlRTdrRqpJ8XiKtSOMDNIl+y4ev472EqQaMap3ycwYTPt+kLQIBPD/1EUtPEswNHtiWu
	qByLxWzfF2gQju5lMU32qrSYRWLSOzmKs2UCGu6zjYesIVzSE4AtDKiKrIKA5fiAdbUZYalKRmCdG
	ptVT5IJ6wfSz+VrBdXzkQdYYZA5dex/s/uPtYBbk0wWoIlwGGYcy+cmFOyzLVbPOTSrZbZVJZ7r+U
	J15Rqxlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rk3-0000000AlzQ-23RF;
	Tue, 29 Apr 2025 20:39:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rYp-0000000AkUQ-2etM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 20:28:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D0ECD5C2D38;
	Tue, 29 Apr 2025 20:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C5ADC4CEEA;
	Tue, 29 Apr 2025 20:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745958490;
	bh=V5504nCr5YVY+aUVaTaQum/nWhvhVD1JVWfcTWd0F+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cQQC5h66yl9wAfWNZ0V92DQXp/qI5ztJpLg4a33RjISyuiU2JAMKNRtlcQQeiWpkK
	 ViYWKkutM3w5EJ/Z1PBeW1veqhXwIjgl1ZdUhDryve/SV6ZZ8PVjrngTtaHFncvZUd
	 a/0niFuWzQ3ibyMKlTRJk3GyEGCiEdBLG0j/fvhu1ghYiNrCLLE+LEoCRT+jqfw4dc
	 DWfzj6z2+3VsUJEh+n0BTmDp2ff/U/1gcLXaq84I1k/1LDRzrB9n9s4s4EfBC0E/Es
	 UB3k+tRLSq6kRk02/pcFK9krOie/x+T69D3NHoOu1/zynqPm94D47ZE/4fzkSqmMMA
	 NE9PS7VOfSZxg==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	patches@lists.linux.dev
Subject: Re: [PATCH] arm: Add missing includes for mem_encrypt
Date: Tue, 29 Apr 2025 21:27:47 +0100
Message-Id: <174594001259.473241.3974467799211720649.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <0-v1-47aadfbd64cd+25795-arm_memenc_h_jgg@nvidia.com>
References: <0-v1-47aadfbd64cd+25795-arm_memenc_h_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_132811_718416_5EC8C818 
X-CRM114-Status: UNSURE (   7.38  )
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

On Thu, 17 Apr 2025 13:26:16 -0300, Jason Gunthorpe wrote:
> Doing:
>  #include <linux/mem_encrypt.h>
> 
> Causes a bunch of compiler failures due to missing implicit includes that
> don't happen on x86:
> 
> ../arch/arm64/include/asm/rsi_cmds.h:117:2: error: call to undeclared library function 'memcpy' with type 'void *(void *, const void *, unsigned long)'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   117 |         memcpy(&regs.a1, challenge, size);
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm: Add missing includes for mem_encrypt
      https://git.kernel.org/arm64/c/20125324c01d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

