Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0237CD13DF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 03:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtZvvFsn7ntOWmU+f+LKjcOxYAtpK4lZ2ZorwARbkMQ=; b=rIpGoW29IIY+ELnIQ58LWyvVJI
	uZizPtFPGiXULE/OncVE1lQH4qxvN27j4csoUqir4WQqjFEPZQFdIvmT5CD7486Tf8ZVGPnmK/CqH
	8Eq0JtjjqzhoGSxJJ1tG5In5NW2+mKeQWoBosVU/qitg47WkjJRZwhVOIoaxqhAf65Kev4lBU+SVI
	RUgcxdUGXmEOZ4z6HoYx/YQ1uAk0keFUW+Z+aqLXp1BQsDIgWUePBQo+mBauSnxCPAlt/rdl3or7j
	nLDzq30BovUN0UaOZK6JiRpj3sta5zYeQwQyPd6hU2TZemqHu99KFCUYMII796Bz+goXCjTwqU14I
	5J3Kgg5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2x-00000004WwE-143e;
	Thu, 30 Apr 2026 03:26:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2N-00000004WTl-2MRj;
	Thu, 30 Apr 2026 03:26:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 40E9243B2D;
	Thu, 30 Apr 2026 03:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2178CC2BCC6;
	Thu, 30 Apr 2026 03:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519563;
	bh=uKdK5DO8u2N0tp/g6YrMeqTyIWEtsNmEtR2OQZOamME=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=V2/IHGrfyciCnZ68jtYyLcCX+9M7ThJMZaRbPHBvBmKoRk+K76qcgOuTXYyo/kQf/
	 h5OTplRTliCc4X63Y6FlfrVyvAdg5KYdnsvxSXwm9hkZAf8pdGxkdX/t+wSKmPKykm
	 3o2z+7QFO6wUIvvg+B0mdIk+nx1z6uoJGIDFvup9VAMO4drdvfxfJ8iFN05E11UcZy
	 rOwhunXd1D1ig0KRo5uu1vq5DA20gcZZ1Y5ckR+SNFRn+SNJ3mB2LionwukPg6k1ck
	 b3Kp9ZgtCTOh6fyut2FuoH+jqJa7iiIMSyJ3HPmYm6RuG1wUntuJYtMYTQhd5hUjoS
	 OIP4lynLo8F1w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CFE43809A07;
	Thu, 30 Apr 2026 03:25:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/6] change young flag check functions to return bool
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751951805.2274119.14382362682727203864.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:18 +0000
References: <cover.1774075004.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <cover.1774075004.git.baolin.wang@linux.alibaba.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_202603_629494_8648887B 
X-CRM114-Status: UNSURE (   8.75  )
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

This series was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Sat, 21 Mar 2026 14:42:48 +0800 you wrote:
> This is a cleanup patchset to change all young flag check functions to
> return bool, as discussed with David in the previous thread[1]. Since
> callers only care about whether the young flag was set, returning bool
> makes the intention clearer. No functional changes intended.
> 
> Ran mm selftests on Arm64 and x86 machines, and no issues were found.
> 
> [...]

Here is the summary with links:
  - [v2,1/6] mm: change to return bool for ptep_test_and_clear_young()
    https://git.kernel.org/riscv/c/a62ca3f40fea
  - [v2,2/6] mm: change to return bool for ptep_clear_flush_young()/clear_flush_young_ptes()
    https://git.kernel.org/riscv/c/06c4dfa3ced6
  - [v2,3/6] mm: change to return bool for pmdp_test_and_clear_young()
    https://git.kernel.org/riscv/c/42e26354c4ef
  - [v2,4/6] mm: change to return bool for pmdp_clear_flush_young()
    https://git.kernel.org/riscv/c/2d46a3974721
  - [v2,5/6] mm: change to return bool for pudp_test_and_clear_young()
    https://git.kernel.org/riscv/c/fb87c8827297
  - [v2,6/6] mm: change to return bool for the MMU notifier's young flag check
    https://git.kernel.org/riscv/c/1fc7dc675e26

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



