Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863F0606F6AF
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JL+xIKgG;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PCRw8XNL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9SjWrhc7XGpfrZLDGv5e/UGJ5LKzUlRr1ymU5F3rbK4=; b=JL+xIKgG5Qy0Mm
	M/0oayvw1T82Ky63P56mMXiBKzxCMgziEq635uslIr31GppYTc6ASYtcy6WEvtmqmaexTjtkUKVH1
	QFoBu4dZEQsEY2Ve8lnTjyPgHKSwGh930dpBJj6CpogihGgTsHrDaf3G/zZ/RmvkhNZdKUf1/Pi6r
	cgyPX8hh5TyuATVpDqS2F9C80dZ/mGFjw386VypyRuIoXMCo2Cd+xD7+cC3FJrHr53J9/LTebPz4s
	rbR3fkvSjPNq2+kx+/a6I557yM6ZrXEelB3LQpE3CwwpXdwAyk4758LDBGGnvIdfa9s0/vOd5+0+q
	Awwrd6QFYGfhbIqClkvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrX-0000000F2ma-08lU;
	Sun, 01 Nov 2026 22:17:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdr5-0000000F1A3-3LfH;
	Sun, 01 Nov 2026 22:16:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 32AD660618;
	Sun,  1 Nov 2026 22:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43571F00A1C;
	Sun,  1 Nov 2026 22:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571406;
	bh=9SjWrhc7XGpfrZLDGv5e/UGJ5LKzUlRr1ymU5F3rbK4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=PCRw8XNLxhwpgQY+VNJEgyemCH7WcIUexDDLxDQtKsJZyKUtdTMN3MNlZltJ6M0iy
	 0sNvBS5zOI3cOGvEHXCS4FDiiBRJt4YTWvt0Z5W2pEwwNWqyPsD/jW7sJeFMWEVfwu
	 32f/8TpLwxDIfiPxqr6f6Sc8JtU205KYvtKUxdXIsWKDgfMrSec039M8wUBLONKqKV
	 C8h60HgiPJV6UBIQ+RJCyhEArenvuts1IeS5Ti1EIWkF9gSpCYTJmdYsxaCB3+MhvH
	 cKC00fZeAT+3Xb1OaF1XeCb/NrEIVbK+ayJvZHgHKBP7c9ZLF51en7iMywKamnPnBz
	 Vky2U/YXxjHxw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA1E838003B8;
	Sun,  1 Nov 2026 22:16:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] arch, mm: promote DEBUG_WX to CHECK_WX
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357140534.2624073.9989407542230376185.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:45 +0000
References: <20260926-direct-map-verify-wx-v2-1-efcd64a6b74a@kernel.org>
In-Reply-To: <20260926-direct-map-verify-wx-v2-1-efcd64a6b74a@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 aou@eecs.berkeley.edu, agordeev@linux.ibm.com, alex@ghiti.fr, bp@alien8.de,
 catalin.marinas@arm.com, chleroy@kernel.org, borntraeger@linux.ibm.com,
 dave.hansen@linux.intel.com, david@kernel.org, gerald.schaefer@linux.ibm.com,
 hca@linux.ibm.com, mingo@redhat.com, liam@infradead.org, ljs@kernel.org,
 maddy@linux.ibm.com, mark.rutland@arm.com, mpe@ellerman.id.au,
 mhocko@suse.com, npiggin@gmail.com, palmer@dabbelt.com, pjw@kernel.org,
 hpa@zytor.com, ritesh.list@gmail.com, linux@armlinux.org.uk,
 sshegde@linux.ibm.com, surenb@google.com, svens@linux.ibm.com,
 tglx@kernel.org, gor@linux.ibm.com, vbabka@kernel.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Sat, 26 Sep 2026 12:29:29 +0300 you wrote:
> Verification that the kernel does not have writable + executable
> mappings is about detecting security risks rather than a pure debug
> feature.
> 
> Major distribution configurations enable it in their kernels as well as
> defconfigs of most architectures that have ARCH_HAS_DEBUG_WX.
> 
> [...]

Here is the summary with links:
  - [v2] arch, mm: promote DEBUG_WX to CHECK_WX
    https://git.kernel.org/riscv/c/2e83e2ce34ff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



