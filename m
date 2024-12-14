Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D387E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 23:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XnK2zDuvd06Q2CdiF2Jh3uNypUBp9FI0ZgGJeXwzVXE=; b=Z9Uy2mtm6hmKDiki9Tn/u3YbDT
	z2keVTnIrAGTlDNWc7x2n2nsFD8CNHbeYXuVBENqtz6ZMq/80NkBaOyv4Nyzr7JRD26AWlduHEg53
	Q8FlO71ncr0lTZ9/Dje3lTqX99XIP1zGKh6FMSlTH1oNUzNTQ0StQDVft06Bbed5PqO7uoxJpD9Ex
	UqRhEoai3+znyci06jAGddM0aoLurWP7BsLSirpT5C83YrjKHnhdIprHtVEzlbVkPbti9R26vxhRe
	mIPs69n/x9/0IpJExRt2OCCiASzVESubRvbm6SqERk/Q24wtIliZO14fpvQubGWNV5RIdsQ7WMfSP
	cyQ1AaMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMbJC-000000076Ar-4A5J;
	Sat, 14 Dec 2024 23:12:27 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMbI7-0000000760G-2kU9;
	Sat, 14 Dec 2024 23:11:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XnK2zDuvd06Q2CdiF2Jh3uNypUBp9FI0ZgGJeXwzVXE=; b=RnqVn1UnoQXWoLja4YR73nNs8V
	f4ojahwjcd60HFpXz2b0Zd3coUK1ak/NqeB6Q3bXPTRVnWcJ3EaBwBvSGBAiqfyqCtfVlzweOYtV4
	kxTXMtq/WxATh47oyPHXSKtBloW3pWaMupYtl8h23D/oAT6EXDslUk2oFIeMHGwKmQhj/2z0tbVxu
	dEjtwCJowbzD+pez8qS9vOtXmOz553JZnoIGLXMfC6grpNyQ9M6SROoQGOy9fE9QVrQmDb0wNZ/vy
	MpvIiEzBEbi+hBLufxhoLPKmkVM/kxtgOchxnS8J3x5/8UdQutVHqG1sS7KnIkmPqmFWBzVI7wBib
	HP51q6JA==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tMbHy-0000hg-VZ; Sun, 15 Dec 2024 00:11:11 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	hjc@rock-chips.com,
	krzk+dt@kernel.org,
	s.hauer@pengutronix.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: (subset) [PATCH v6 00/16] VOP Support for rk3576
Date: Sun, 15 Dec 2024 00:11:07 +0100
Message-ID: <173421785408.212079.5671999900653465901.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241214081719.3330518-1-andyshrk@163.com>
References: <20241214081719.3330518-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_151119_688794_A2BB69C2 
X-CRM114-Status: GOOD (  13.49  )
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


On Sat, 14 Dec 2024 16:16:59 +0800, Andy Yan wrote:
> Thanks for the basic work from Collabora, I can bringup a HDMI
> display out on rk3576.
> 
> PATCH 1 is a carryover from the working when add support for
>     rk3588[0], is very usefull when some people want me
>     help debug some issue online, so I really hope it can
>     be merged at this round.
> PATCH 2~8 are bugfix of rk3588 alpha blending which report and
>     test by Derek
> PATCH 9~13 are preparations for rk3576 support
> PATCH 17~18 are real support for rk376
> 
> [...]

Applied, thanks!

[01/16] drm/rockchip: vop2: Add debugfs support
        commit: 779964556c64cd3d76ddfeb34738ef78020fae84
[02/16] drm/rockchip: vop2: Fix the windows switch between different layers
        commit: 0ca953ac226eaffbe1a795f5e517095a8d494921

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

