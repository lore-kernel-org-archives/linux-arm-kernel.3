Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A713C10ED659
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gp9QHxFNn9MEXObE94zyKvLYfXnceVRsZVzUesWqGrY=; b=NUE75Sqi6mBwbUJKrO8Gxac3k5
	Hku7PcUEUA88kIrEVT1PdREBDAa7c++Q3k8SDNXl/gN0TQ2G8mL5L5LIb9wJ+LA98kXvSBEBk7o4X
	7Q7swy28pSmB4airzFhEP2qsnP3CYQBN5uhOVQxbrimTCrEvUBjMwT/6ozGlsMTXfdrKchJL7Uicn
	qGZtcmqPKZbffVa7LgejyWIanhjoTV5VJIreE8D9klAEHv2o76Bx3WAfngghPFpqf8OGH0qv2ssrl
	/suwcsEM9FUEp0ZP7JXoxdgw4i8qlVQQg9t0b+YHdH4BB+ZubWvTGboRlN39YivIaAwntvALLXdDT
	b4c318uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65oK-00000007Js5-0mRI;
	Fri, 27 Mar 2026 11:57:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65oI-00000007Jrw-2V7Z;
	Fri, 27 Mar 2026 11:57:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C97FF60133;
	Fri, 27 Mar 2026 11:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A7DC19423;
	Fri, 27 Mar 2026 11:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774612625;
	bh=y1RW/9S9unAXA+oodhH5vVUMi8x3886TICOzSz9gIiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D6E2y2gBO/BU0CDdIMOXmOhlBjIXaP9lyFu3dxakbPk4wxVR+igCBAP64Gl0g9Flz
	 gbpzWq8ZNTfWLZBo/cadPLVW+4ZxietRThPixyENWsd9tu4FSR1N+Bj1jAz0+pcOhC
	 DYTmS4Cgj10BLQWELxHbPnsk6oEMt+kFTXdVXRtV3l0KoEvvnxUhbAQaiOpMlPFiOW
	 0h7qwfwEhVAlhiPE8/wrMys8gTgUjqeRfbVtaV+qAPtKc8YF8kcBsK1lDM9dGkndD5
	 EcuhOfZ3fbhHMN4bSKYEc/jrJGVNt8oHt+yQIvu1+KCX0Y4mf9qANLI50KRkStITFn
	 0NEyO23vkv2Ew==
Date: Fri, 27 Mar 2026 12:57:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL v2] Rockchip dts fixes for 7.0 #1
Message-ID: <20260327-lumpy-mule-of-health-7efec3@quoll>
References: <5057236.GXAFRqVoOG@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5057236.GXAFRqVoOG@phil>
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

On Mon, Mar 23, 2026 at 10:58:16PM +0100, Heiko Stuebner wrote:
> Hi SoC maintainers,
> 
> As requested by Krzysztof, here is a more condensed PR.
> 
> Changes in v2 are that I dropped fixes for dt-schema errors and fixes
> for commits introduced not closesly to the current release. These have
> been moved to the current branches.
> 
> The Pinebook regression fix actually also is for a commit from august
> last year, but fixes an actively tracked regression, so maybe carries
> a bit more weight.
> 
> 
> Please pull
> 
> Thanks
> Heiko
> 
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.0-rockchip-dtsfixes1-v2
> 
> for you to fetch changes up to 29d1f56c4f3001b7f547123e0a307c009ac717f8:
> 
>   Revert "arm64: dts: rockchip: Further describe the WiFi for the Pinebook Pro" (2026-02-22 23:28:06 +0100)

Thanks, applied

Best regards,
Krzysztof


