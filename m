Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B340CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 10:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5v+zWwwJPJ+6upaLSj7GZeordEUySthm51XOvMAy040=; b=eceXSpJjO573/UKXCqgm0u1MO6
	u8nZScWM0qnfH40TYUftmjJRy5IIGfzbU1A6My/A9VaBev10dlLorZRvCqHk3FruocaPyxVb/JOV4
	S1LbyMUMKuY7Eg6fAncjXe50ml540JKJKhhpued93DJgf276LpkrrK47Ki0NB80VyG7b3vb14QuUj
	HmmG10XzgDFc+JNc52GuijKYrHtlY6YL/l1Ke+RH0bNulIMhH6qgvsvPB96Qs/l8q9T+DHfU0oj2R
	VU9Q5IG6DoECyM8wH3SSOXj5gabHTxw8RwFfB+H81lvHsqMjGNNzzTWbC/iAxV1hVsHGAw1zkoCVX
	oCAPwrRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCEP7-00000008Z5l-3YAZ;
	Thu, 01 Oct 2026 10:52:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCEP7-00000008Z5J-1He0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 10:52:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E8869418A4;
	Thu,  1 Oct 2026 10:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFDE61F000FF;
	Thu,  1 Oct 2026 10:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790851964;
	bh=5v+zWwwJPJ+6upaLSj7GZeordEUySthm51XOvMAy040=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O1A+EKm20eeiMQW5rVeHqHTUdrdzjgpqeAM2j6LLSTlsFSr2nqsw188zHDCXLytcC
	 qn5EmGljjmkKXFg+RI31wTMHavfCkKvhK5OgrDAXpCPewd6zb85JN4yrrf4nLdLFkM
	 377C1qhlPR3t61itb6HDJT/HG5O2Uhxg0vzMrn87RepV42GPp7m37vVixuUeGcQg4C
	 xZg5Ywct6UDJERvP+k9+fuAUg/IeiADWYb/8K13CCzbTT0BVapHxO51noeJZkemmKh
	 s1qw2gLU/9jmSqbT66teOHHfDvShWIFbysmxEZaeZxOXY74Yzz4Ti/a2iXMScEQ8Ep
	 9O8obJOPgS9tw==
Date: Thu, 1 Oct 2026 12:52:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 3/3] Renesas DTS updates for v7.4
Message-ID: <20261001-relaxed-annoying-swine-56f50e@quoll>
References: <cover.1789722868.git.geert+renesas@glider.be>
 <cover.1789722875.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1789722875.git.geert+renesas@glider.be>
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

On Fri, Sep 18, 2026 at 11:37:05AM +0200, Geert Uytterhoeven wrote:
> The following changes since commit 8dc2615d5702059b2b71fca6f93c0d7d10ae54cb:
> 
>   arm64: dts: renesas: r8a779f0: Set UFS lane count (2026-09-14 10:07:09 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v7.4-tag1
> 
> for you to fetch changes up to b43aa6a6ebe8ca8bdd75ee688e1eb2d0d16a888e:
> 
>   arm64: dts: renesas: r8a779f0: Add GICv3 ITS and update PCIe nodes (2026-09-15 10:46:16 +0200)
> 
> ----------------------------------------------------------------
> Renesas DTS updates for v7.4

Thanks, applied

Best regards,
Krzysztof


