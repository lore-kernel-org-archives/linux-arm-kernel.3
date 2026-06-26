Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3656DCDE013
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 08:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Gh35kQAbF9NJda9I6lHvwWhKBgWUfcBmP3w8KkXOio=; b=bl/tBEFj8s7ko8pbZuUlcqQhh/
	Y7l7clnLMg0WeTI57u8zuT7EFEbUSo8jrQ9HEDFV6ZhYVx1B7sOIW2sUkvsZ1X0pNiw4jlClNzlyD
	hT8AbVTCCTIch2bRTY8v0hx6d8a84PH+8/5s5r2+O+Sqaxmuk+npxUYjRePZIusuMrPyak0IiFnfc
	84N9VPK8WeUMzccIlF0QWgjAby/YonLgjmiROgYtv4kLLD//YIBfdHxvsQKhdd6W2Fu9qbrqznCWs
	G+yQuun0n8DcAYHGiMQnUqVuRVNTH2ayzjqDmtp3+u0osL/Fy3tOtUAW+4G0FNuzycOC2mu0qkVNn
	j58wbTUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1ok-0000000Anrw-1J5X;
	Fri, 26 Jun 2026 08:21:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oX-0000000AnVK-0qZb;
	Fri, 26 Jun 2026 08:21:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FB9F60132;
	Fri, 26 Jun 2026 08:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A8B1F00A3A;
	Fri, 26 Jun 2026 08:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462087;
	bh=8Gh35kQAbF9NJda9I6lHvwWhKBgWUfcBmP3w8KkXOio=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=P2rMods2RZJ2WUH9fceMLGk+MpRiyzpYQRjH4L1pJ6AqR61HFQvucLW938qDFyqSa
	 FrkrECMukEjHEVzuIjf3V5yv1Q9p5xzHWGE+6HTZgD9e8Q+Z7nOezHkV6X/Sw+wiEW
	 UPxEJFogBt7IvXPhQEsLsvxrjA2ZUZ+sJUU/SjGsUQqENcjHgmsRWXaKB8JJOigNrD
	 z/e7SPqqHF1NDBLkiCfywon1PNKm2pb6Q3QrCHZx2g16/jVLKpx0YZhOf14SdseVff
	 79jb5rym05v6a+Y09V7n67Wwd7zqoPAjo6ZU1rDj2vUgGPcpWRf3ejlG4/+MASOcl2
	 CdcLmqI3QOqjA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 199D739389E8;
	Fri, 26 Jun 2026 08:21:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/5] mm/sparse-vmemmap: provide generic vmemmap_set_pmd()
 and
 vmemmap_check_pmd()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246207479.3816447.9419541647213093704.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:21:14 +0000
References: <20260404071720.3577290-1-songmuchun@bytedance.com>
In-Reply-To: <20260404071720.3577290-1-songmuchun@bytedance.com>
To: Muchun Song <songmuchun@bytedance.com>
Cc: linux-riscv@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org,
 chenhuacai@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, davem@davemloft.net, andreas@gaisler.com,
 akpm@linux-foundation.org, david@kernel.org, muchun.song@linux.dev,
 kernel@xen0n.name, alex@ghiti.fr, ljs@kernel.org, Liam.Howlett@oracle.com,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 ryan.roberts@arm.com, kevin.brodsky@arm.com, dev.jain@arm.com,
 anshuman.khandual@arm.com, yang@os.amperecomputing.com,
 chaitanyas.prakash@arm.com, wangyuquan1236@phytium.com.cn, ptesarik@suse.com,
 austin.kim@lge.com, vishal.moola@gmail.com, junhui.liu@pigmoral.tech,
 willy@infradead.org, alexs@kernel.org, chengkaitao@kylinos.cn,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org, linux-mm@kvack.org
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

On Sat,  4 Apr 2026 15:17:04 +0800 you wrote:
> The two weak functions vmemmap_set_pmd() and vmemmap_check_pmd() are
> currently no-ops on every architecture, forcing each platform that needs
> them to duplicate the same handful of lines. Provide a generic implementation:
> 
> - vmemmap_set_pmd() simply sets a huge PMD with PAGE_KERNEL protection.
> 
> - vmemmap_check_pmd() verifies that the PMD is present and leaf,
>   then calls the existing vmemmap_verify() helper.
> 
> [...]

Here is the summary with links:
  - [2/4] riscv/mm: drop vmemmap_pmd helpers and use generic code
    https://git.kernel.org/riscv/c/abff0ecf7602
  - [3/5] riscv/mm: drop vmemmap_pmd helpers and use generic code
    https://git.kernel.org/riscv/c/abff0ecf7602

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



