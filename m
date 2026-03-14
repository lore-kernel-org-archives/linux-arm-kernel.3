Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC80410706CF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 11:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pitGF8feeYoU9z0ShuGiXGeYGsglIxDIx9Xzdmi8SCw=; b=rQqq4wz8ymWgmR1pCC6Sre8NcW
	mupl7vMlWt++mo0uFjHNL4yEnTPfUiYN1JMCn3RR3CnyBBbkZM3DMDl+OReja1UhUIqNINRmMq9Dx
	BKynCwgP06cm5PZrEhzGESsNNmk+s1ycvKMunHK9hz3rPMpZcFiivwgERVPuKSHspktZLOPtc/KWu
	EbgmLSkeUUznVsgHFRypcTbYAtBUK3yeqCiMIGRttSp61vn/JI7FNk0WoKFzoe9lsR+8XaiRZkBKT
	WjLOQY7nQZ395iW3yj+p0dCEVxTfBVR524yKu7iwLdwQp3vQRkataMpt63mTwn6e6kvggKiyRXy5z
	ttCbVUVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Mvs-00000001lr0-2Uc0;
	Sat, 14 Mar 2026 11:13:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Mvq-00000001lqg-1JY4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 11:13:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BCD9140577;
	Sat, 14 Mar 2026 11:13:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE73C116C6;
	Sat, 14 Mar 2026 11:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773486801;
	bh=ODoh/uo3L3wh5IaDZ19WEIvexQISgRPELpqrwmRuJ4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DhxZUKcin2Cr5jeR/rtmpjTHba2BfrwSpJjdC5nNn0oHMcoPKEAK5WnLZ+ue9fMZP
	 NnfSWzsfLyumXGwgkv1rJSeoEtibMqNJW8IRhBbUho+nWZUzTAsuE3zdHlshSvWun3
	 mpiYYgLKomX/QJgdGpdoY9/hh6SxuOA0bKH1+q43IaoaUg0J3HwI6CISSKQqlnvH/z
	 T7FrAZ01h0GuDcqrHqm0xYTJyILZg/Fh+Gy1ZoWux5/LUDoaFtxNZpSw6ynmm+dtue
	 h1UpjpDdjKscBfoItqXDzYK8OVR1kJdDd5qOkOu5HD5kB5+RJPP3OOXEX37gXRqsmv
	 e6SzcDQe+FZtw==
Date: Sat, 14 Mar 2026 12:13:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@lists.linux.dev, Magnus Damm <magnus.damm@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 4/4] Renesas DTS updates for v7.1
Message-ID: <20260314-arboreal-bold-vicugna-cdca27@quoll>
References: <cover.1773399669.git.geert+renesas@glider.be>
 <cover.1773399675.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1773399675.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_041322_373209_E40D908E 
X-CRM114-Status: UNSURE (   9.96  )
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

On Fri, Mar 13, 2026 at 12:13:00PM +0100, Geert Uytterhoeven wrote:
> The following changes since commit 85c2601e2c2feb60980c7ca23de28c49472f61f1:
> 
>   arm64: dts: renesas: r8a78000: Fix out-of-range SPI interrupt numbers (2026-03-06 13:15:21 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v7.1-tag1
> 
> for you to fetch changes up to 0928a28daf017504e14920f4131bb99e3bc39dba:
> 
>   ARM: dts: renesas: armadillo800eva: Add wakeup-source to st1232 (2026-03-13 11:00:48 +0100)

Next analysis tells me:

Days in linux-next:
----------------------------------------
 1 | ++ (2)
 2 | ++++++ (6)
 3 |
 4 |
 5 | ++++++++++++++++++++++ (22)

Please keep non-fix patches in the next for at least 3 next releases, so
you are sure any community tests/complains reached you. It is
unreasonable to expect that community will test your for-next patch
immediately the next day.

I merged other pulls but this one I will leave for few days more.

Best regards,
Krzysztof


