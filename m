Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2354C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 16:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AYIfCRubgr3ytaWw4YwTKH2zepYd5oozfTRIaPeKYo=; b=KkJ+i2B+kJBPkKThRYzDqdg61L
	Okpw22PZN9M0rqKKmr/4AwvPCbGEzmO6IW4qaH1DKBpz26x48drSKb8HwNd8ziasSlg61Hrt0SIAh
	LQyB/u/L0P4E3tbQqqF7SI3hF/P6JHAEE+sdsMjkGOF1fJGKy7TpSzk9mIKcJ4f2QpilUobuWgReq
	wrzJNubU+cRsDBUpygyOk/I1UbKJOgLQahlY1sFPixf5h9N/47/UQ27KHQS63ChVQgicDwn/+xuLP
	/wHTJUUhnv3aUlQG7TC8XyTS1Y/0l0FJXzc3S8aQ0utieOjYyMeGDmfYlGWPbj7gtXnyLozWphB3j
	i0APv9/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9nv8-0000000AGo2-2qZU;
	Tue, 29 Apr 2025 16:34:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9noP-0000000AFjl-1HJC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 16:28:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 344015C0C37;
	Tue, 29 Apr 2025 16:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C15EC4CEE3;
	Tue, 29 Apr 2025 16:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745944080;
	bh=N2yloLqzeCYmCLu5QV8WhOHX/p5K2Q2uHfqHQcwn9VI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fax++9eoc5gEmi/RxNw+zJsseUJgTlD/AJdUz9fH1BumzRBF96udkuEqNhE76I+8f
	 1bS8LbohlL+sSCpFY0h+ohk+xIhfQz1H/xUhP1jDXy3St0NzAVehHOgIuzye92kwYe
	 LKP8WTq5mFFrNHQp8cBvVFbYVzKJDMOrVaH5NhzHrvsvtZBStw2xbUPSQ1dJtcIlMG
	 oL+F3heySAMsaq9+k8iUqA3Z98MVDYlRkOhtIjuVfFacA+q49vTJ3/RyXW3uv8SRAi
	 YJpaJiBn9gZUbkLol1zxgH6T7bHayqifIfUYcylyJ3EHPNvOEvncFQNUnumeA1xx9m
	 isJCx55e6Kvyg==
Date: Tue, 29 Apr 2025 17:27:55 +0100
From: Will Deacon <will@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] documentation: Add nodebugmon for arm64 platforms
Message-ID: <20250429162754.GA26677@willie-the-truck>
References: <20250416062706.2735563-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416062706.2735563-1-anshuman.khandual@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_092801_444990_382E9642 
X-CRM114-Status: GOOD (  24.74  )
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

On Wed, Apr 16, 2025 at 11:57:06AM +0530, Anshuman Khandual wrote:
> Add an entry for nodebugmon which has been used on arm64 platforms.
> 
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v6.15-rc2
> 
>  Documentation/admin-guide/kernel-parameters.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index d9fd26b95b34..f4a313d6c0ab 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4085,6 +4085,13 @@
>  			/sys/module/printk/parameters/console_suspend) to
>  			turn on/off it dynamically.
>  
> +	nodebugmon
> +			[HW,ARM64] Disable debug monitor
> +			Disables the debug monitor exception handling on the platform
> +			regardless whether breakpoints and watchpoints are programmed
> +			or not. This prevents debug exceptions from being enabled via
> +			MDSCR_EL1 register.

Hmm. I appreciate the effort to document this, but I'm not sure that the
text above is really going to help anybody.

Firstly, this option goes hand-in-hand with a debugfs control
("debug_enabled") and so the two would ideally be documented together.

Secondly, I think the documentation should talk about the user-visible
effects that the control has... and that's where I get stuck! This has
been there since day 1 but I'm not really sure what it's useful for. I
_do_ remember needing it to use the DS-5 debugger back in the day, but
looking at what the option does (it mostly prevents the kernel from
touching MDSCR_EL1.{MDE,KDE} which effectively disables hardware
breakpoints and watchpoints for kernel/user and single-step for kernel)
I don't see why that's relevant for halting debug. The architecture says
that EDSCR.HDE can be used by the external debugger to enter debug state
and I don't see anything to suggest that MDSCR_EL1 settings interfere
with this.

Maybe the problem was that the external debugger left a load of live
breakpoint registers around after detaching, so this was a way to
suppress those? I don't remember :/

I wonder if we can remove this?

Will

