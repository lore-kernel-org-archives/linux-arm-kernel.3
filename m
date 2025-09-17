Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D60CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 02:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BUwtzzWENgb+4uof6HRJWRasSImfgUkNGUDary8rx6M=; b=CcpksYpyMpbgEi6aF/f9p+C75T
	ZZ3sxQdleg6K4M7+3VIGY8Ae8+OvLgXmu/XC+v/lksmx7Y5g4JAYIM9/QUJCLa7iyhveMLmCY4Mhw
	O5SofjDO0bJJoFniGWa18jkZ3uLcpCfKBKQ+XZM1BO3IxAiS6wpgniUDzSnBJbXJg4KUpEf8q+Vuy
	KueciVpuxAUkTCfgssmMUnryC9yE5GQ7hUP+wJ0Wwj3u8MHSGKs8GfdFVVRGdsr7Vp9pKF09hdJh0
	BypLP6JYiTV/4ZqCzePQrTEpEi3RrTTg2R/XKmk6WQbBEGXyijpRM9y1Cg0nYsqSLmdibRcg3GNrg
	ymkTW+RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyi5l-00000009zRA-33zL;
	Wed, 17 Sep 2025 02:40:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyi5f-00000009zP1-1g4h;
	Wed, 17 Sep 2025 02:40:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 18C3644AEC;
	Wed, 17 Sep 2025 02:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0BF2C4CEFA;
	Wed, 17 Sep 2025 02:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758076815;
	bh=S0LGJmfDGnE9fg7KBnzD+2AHLv2B7h2ODLru9DI0lsg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Q2kToCabJnESW8vUmYIu1ab7o3eKbUVQ9kdfBJ5+bFVzM6d+DtAc8KVtPusjYCkkW
	 lfDeTry07jpkrR88IDvRwTSm3FlaZ3DRQ6C++gAnt82jJ0z+Scrrn5/YRjgzwA/HN3
	 00XOAJwZMLLA9HO7PYsBVjZTl/U8OOd6x+xQPVndCWFi4sV0hwZG8LvrJ5/ZQjM8dU
	 g80BovHTnqKi3d7f1jLzDsU2LDkK8EhzlmQ9Ajml61y/5qXBl0YvlIuYhH5VvVi8p4
	 O3PqYNJ19XigxUlBZqKp2vk/Cv2tkyyhAPwjYXzX5Qsgrgr/oifjbHdpTeNPeic3Xx
	 l1L+BkrtQRVLQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C6539D0C1A;
	Wed, 17 Sep 2025 02:40:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/3] kexec: Fix invalid field access
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175807681600.1444719.17902386827099362069.git-patchwork-notify@kernel.org>
Date: Wed, 17 Sep 2025 02:40:16 +0000
References: <20250827-kbuf_all-v1-0-1df9882bb01a@debian.org>
In-Reply-To: <20250827-kbuf_all-v1-0-1df9882bb01a@debian.org>
To: Breno Leitao <leitao@debian.org>
Cc: linux-riscv@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org,
 akpm@linux-foundation.org, bhe@redhat.com, coxu@redhat.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, kernel-team@meta.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_194015_460172_79C13DCC 
X-CRM114-Status: UNSURE (   9.71  )
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

Hello:

This series was applied to riscv/linux.git (for-next)
by Paul Walmsley <pjw@kernel.org>:

On Wed, 27 Aug 2025 03:42:20 -0700 you wrote:
> The kexec_buf structure was previously declared without initialization.
> commit bf454ec31add ("kexec_file: allow to place kexec_buf randomly")
> added a field that is always read but not consistently populated by all
> architectures. This un-initialized field will contain garbage.
> 
> This is also triggering a UBSAN warning when the uninitialized data was
> accessed:
> 
> [...]

Here is the summary with links:
  - [1/3] arm64: kexec: Initialize kexec_buf struct in load_other_segments()
    (no matching commit)
  - [2/3] riscv: kexec: Initialize kexec_buf struct
    https://git.kernel.org/riscv/c/95c54cd9c769
  - [3/3] s390: kexec: Initialize kexec_buf struct
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



