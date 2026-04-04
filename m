Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1157E88D9F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 15:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27Au/wFg3dQPsgstAr4YE9VS4hX/8jHjNObqAYPrTRg=; b=D4/eYz1wCysTC8P80PPJmzmucx
	HCNT0m622KT97otn635RSVviKFB8fsFGMM08qD+e+qE6HkCnxgMKMsbTqWRPHi+FIthloTtOTc4AI
	hbDbXt88t1gMst0tJL5zgsxDkCwjlaej1esETvXp+WWs0cwm0LExi1npgkpgiSP1xMLf1OwJO3U7/
	YuM0Muxz3gvSpX/uizSNZwMYpc8oOEowwkwyzCyeZ+/5OBpnnzIOCw/VE60RFnYH7Rd7RxjLnl1f/
	D4cN16WHMx5s1FYGmMparMfssJoYZFKYFnJUTGcKG8+H6tM/XahORaG7pomEUv6uG8tD3IHabE9aI
	Ibmu517A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w92zp-00000003ZNe-1zrI;
	Sat, 04 Apr 2026 15:33:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w92zn-00000003ZNG-1YtL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 15:33:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D010042A4B;
	Sat,  4 Apr 2026 15:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A51C19421;
	Sat,  4 Apr 2026 15:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775316790;
	bh=ZlzV4y4YHNwOQarGow9Y9+NJ3NB3R2lb3gtd1kS1GYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WGJ1G1dbHQ8YSJMkbnCewNVPp8K+F5tb/VYcQ14aSjrCJEv1HH52gd2YYgXlV8Ib3
	 oM84BZIxEeX7oHwVTYCtA0QLdf9bEOQz49KuKdnrYVCrtLs+rRHP/BKW19tHLW0PaE
	 ccvyaaLBTqJbL6t/UaOi82pWK4maeP3WZRoJuf8eKTlptNaNahXd3ZLSoaVPqcL+0l
	 5gz8kaM3/1xx9rM4cFVf+3ORaNavCSrwvmOcqPEUUn5eXFauqWS3RcTbY+dRSWFbY1
	 hQJ/MsDdvoI77roMMXUQp9RiotjlxhqK3x6TVCxGleYzHEVfnDEbh2FHKar231+aDw
	 0FmCStvs2QTVw==
Date: Sat, 4 Apr 2026 17:33:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org, arm@kernel.org, conor@kernel.org, 
	nicolas.ferre@microchip.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Microchip ARM64 device tree updates for v7.1
Message-ID: <20260404-warping-determined-caracal-cc0abb@quoll>
References: <20260403070637.2554408-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403070637.2554408-1-claudiu.beznea@tuxon.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_083311_452590_34458F24 
X-CRM114-Status: UNSURE (   9.95  )
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

On Fri, Apr 03, 2026 at 10:06:37AM +0300, Claudiu Beznea wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-dt64-7.1
> 
> for you to fetch changes up to 711cca0f1cfef57018654b969da4041c2bab68d3:
> 
>   arm64: dts: microchip: add EV23X71A board (2026-03-20 10:56:22 +0200)
> 
> ----------------------------------------------------------------
> Microchip ARM64 device tree updates for v7.1
> 
> This update includes:
> - device tree files for the Microchip LAN9691 SoC and its evaluation
>   board (Microchip EV23X71A)
> 

Thanks, applied

Best regards,
Krzysztof


