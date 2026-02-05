Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42799E83F05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 05:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3j7oMtDKDwgmxPpHoB2ia4cL+Yka4MhiJhRJIaSSN7Q=; b=0i3YEFjrszTNpMLOdJ2wW6iacq
	Mf0wygsYOOi+ZCpW2V0uHT7VnHfN3Xd7fS88RGVqXcXpowiMHFb2n+L3wGaH4LAuuuxnyZZ2TqKX7
	vaza45WuFwUdNzVBdzK+k0nrSpY/BQ349rulYLaquICwNvo6v88Sot4wJJb+cOnkYG54y+45Sz/m3
	En8EYON9bZLJJjXVQP3xgQ10zNvkuJ7u0OEniidvVEKBV9DTF3v/hqTJTGaYyPqm96giL8j4A3xoq
	cuj2nHo0b8nFzhR2ljAhXxtwIWrrrhtSovyOsdO17Tkz+lROWWLMbhYXZOwsJbwpxIHLSIPwuUkFw
	dvwh/IJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnrpi-00000009S1A-3kTq;
	Thu, 05 Feb 2026 05:23:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnrpg-00000009S0n-2l4H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 05:23:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 37FC243A0C;
	Thu,  5 Feb 2026 05:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89459C4CEF7;
	Thu,  5 Feb 2026 05:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770268991;
	bh=ptywbAJew2XYurULYzSEzlK6ebrZCkri2+g8YABW9MM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q7BIDWLjdeeldEH1VS9Wd9aYiDzNb+QzgvJH56Yz4QlBkNR+WTnHIOO+ZNiX1Ia+U
	 /Uv2AYuvcbxhZJS7YbK5FoUN9eEi6d5Mfi5V5sg9UDuNBD9uOTmk7wpvGuUuLnfV7C
	 3HnxEPSv583aIe7nAy9JpQmnLIMnVXGD1kAq/uMAqeTwTLHMUpJbYkhtS4Fr7g4GTE
	 skyRXTk2leYf8COD7LEGWUeUUYgn1L7/gQvRZjoJdplgZi4U7y7gy5vIKg45/hH0KM
	 gnCW2J7hYWyQaG/Rvmbyh3uJkBMrSjoN4rRuy9S0fyiWK3lkCoN/b9nEYsWJBlLeH4
	 2B9ID4mCOayig==
Date: Thu, 5 Feb 2026 13:23:06 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Subject: Re: [GIT PULL] soc: fixes for 6.19, part 3
Message-ID: <aYQpOu_htw-c2tnt@QCOM-aGQu4IUr3Y>
References: <d9748b0a-1b06-4d7e-93b0-3ceb96784fc1@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9748b0a-1b06-4d7e-93b0-3ceb96784fc1@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_212312_720944_AC6B5C10 
X-CRM114-Status: GOOD (  13.04  )
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

On Wed, Feb 04, 2026 at 01:17:21PM +0100, Arnd Bergmann wrote:
> The following changes since commit 63804fed149a6750ffd28610c5c1c98cce6bd377:
> 
>   Linux 6.19-rc7 (2026-01-25 14:11:24 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.19-3
> 
> for you to fetch changes up to c3cb2722e28969650c58d6defb09d57339a2a223:
> 
>   Merge tag 'qcom-drivers-fixes-for-6.19' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes (2026-01-29 10:02:11 +0100)
> 
> ----------------------------------------------------------------
> soc: fixes for 6.19, part 3
> 
> Shawn Guo is moving on from maintaining the NXP i.MX platform and hands
> over to Frank Li. Shawn has maintained the platform for 15 years after
> initially upstreaming support for i.MX6 and i.MX23/28, and his work has
> helped make this the most important industrial embedded Linux platform.
> Roughly one out of five devicetree files in mainline kernels are for
> the wider i.MX platform.  Many thanks to Shawn for the taking care of
> the platform all these years!

Arnd,

Thank you for these warm words!  I really appreciate your great effort
on arm-soc maintainership in the past decades.  It made platform
maintainers' life a lot easier! 

Thanks,
Shawn

