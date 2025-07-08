Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66974C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+KIGxp1CkEgq5QeOKsG0ykxm/nmLGoH7zIoPCk6sho=; b=uSipuexu4PFsmlSGwQCGUouQCA
	gQuLtDUYBB2gDdgrNidc956ypkyS5fu4xUCIqsbEJJkbOSOmKxjAb0LqY5Ye/YfBcpYcXpNWQJ2Wb
	uWhkQOCxenYjFg8PgQPco7S0MYoniikdWSwdD2pjzIe6mAFwC1yyISgN9pE+9DML5K5/iq4CfC2cB
	0pKg9WM40xhYI5+nhaj4ict+S/hT6dFKHTO4K21AxteA4E74/zi3b98R1vXGeCc3HFLYQAyp+DcJ7
	smbIz6tcDznUZgpHOjwfzSMWxAtQ2f1RxpKnCgMkN+/2xMaV4eb1byEzqsRInAncJYKRsz9PNkMDY
	mpTR9gZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEAE-00000006Mnx-04Qk;
	Tue, 08 Jul 2025 19:39:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCEQ-000000068FF-21Aj;
	Tue, 08 Jul 2025 17:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3+KIGxp1CkEgq5QeOKsG0ykxm/nmLGoH7zIoPCk6sho=; b=jD20jJtZ+HIZcJj87/3ciydR7C
	YNfU2VtEF7pKxsTGaMVTlYQJ98TPAOWNQAk9qRFll6RB/V8wO1qltPXp4PfDfmxi4UwZk26QvMn6C
	9r2T2mbvIZd7X23kZV/q0nNEV1lb+fI3dDhVpFUvMDsTUAQL5M/rNPa7IBj8Rkn8Lm9pSAeK4szaH
	o9S7ilW0U+BpuOJIkpJ9iOjoPqrhHLyp+fjkgdo7tR/mTCPPnI2sVc2CIGEVyZVUr9lFuH4UWzQiQ
	pXwm3bvGRSuVrmtLAJMa7k7MYUmg8IbBmT924zzk0/ACsveeOqqiAREqficvw6skKM9vx7i5c/vjs
	F6qy7LXA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCEN-00000008lgM-2OYZ;
	Tue, 08 Jul 2025 17:35:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=3+KIGxp1CkEgq5QeOKsG0ykxm/nmLGoH7zIoPCk6sho=; b=lIWxiG+lxhv+WZLVxW7jiYFUAX
	BI0smJ10GR33zPSRs+M8CwtohW+p/5bvlhyEi2BtFT7t0/DSVFqFCixuTcu7YanJw2KatF88VxQgt
	Ypi04+CHzte8m0OTtzx8ELO8GER2LTTAlqvHnAj1viMh68gTbEmbBoy4srQnTjIO02qhf9qRlcKXW
	zNTZIRf0keZ3AA1a5qf6vKo/kEB4Zdwq+u/ryo8X+D9wtjhg8atw9IkjqxF7LnA+DdvpVAqEWOQTD
	UmlaUhhEcKloAH9FiOKs6Vymn5hPygrWopXG0FZfqn9+gE53r64cUeim7EcRhrbmGA26CxOWhbsPO
	GDfnDcVw==;
Received: from i53875a8d.versanet.de ([83.135.90.141] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZCE6-0005cC-0X; Tue, 08 Jul 2025 19:35:30 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	Heiko Stuebner <heiko@sntech.de>
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: vop2: fail cleanly if missing a primary plane for a video-port
Date: Tue,  8 Jul 2025 19:35:14 +0200
Message-ID: <175199006057.1731917.1862299195201447039.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250610212748.1062375-1-heiko@sntech.de>
References: <20250610212748.1062375-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_183547_724022_464B1E4E 
X-CRM114-Status: GOOD (  12.28  )
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


On Tue, 10 Jun 2025 23:27:48 +0200, Heiko Stuebner wrote:
> Each window of a vop2 is usable by a specific set of video ports, so while
> binding the vop2, we look through the list of available windows trying to
> find one designated as primary-plane and usable by that specific port.
> 
> The code later wants to use drm_crtc_init_with_planes with that found
> primary plane, but nothing has checked so far if a primary plane was
> actually found.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: vop2: fail cleanly if missing a primary plane for a video-port
      commit: f9f68bf1d0efeadb6c427c9dbb30f307a7def19b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

