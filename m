Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD656E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 17:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MG2PC3Zfg+MmD5FAuZEOrUx3DYBcgDBYhI0nzWQqYMA=; b=m7vZL7XZ/2mjYzPRQ08jewnslV
	OIxKbqij9rsJaYjd8D9Iye+BnbSRXVpF4j5cwtbj6Qfn2/UgrQ1AyoL08gjc3r2ICgNbbHmV+pdgo
	mx7zl4lPSWNjdOg4a6quGWx0IS8yOwQrouIFi3uQ5CzO7IOfumabawrB46LQuM32Vmo6YxrwoNHPd
	6tnZ9OvcPGghlOEZ/X/zLimMyhL1yaox82Hphg96uZwkSoT5/t78X5FoKHyoCTU0vY2wq5jIcfwkL
	G/j+3gQeR61ftn+BsL+xuh7bAwZMTorhdpj2b1GsgO1vP8Pp0z1fYQktjLjm2IqDLJBwcXmyZKLWC
	SGgfy4Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvvy-0000000CmLR-1ATW;
	Thu, 09 Jan 2025 17:03:02 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvoz-0000000Cl6C-1DKF;
	Thu, 09 Jan 2025 16:55:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MG2PC3Zfg+MmD5FAuZEOrUx3DYBcgDBYhI0nzWQqYMA=; b=WU4NeVokegoniUiiC5jCKGjvm0
	L+cq8Id3ZkAy5uCzvERdkXJshZEOIHAmda35OBfioAkpeWDkt+N7VJsJ30Ao/hkfNWCX4Yt2f0flx
	r+FXYshIcSIqMKdBUlBdzZJbM13YK37S6972hxdn8owuXUB6+4eHz02boN6daHKufuk4MTUZ4gUGf
	TCNnIE+PvF4sARzmTvXqHDSTrURFv7WCJM+j9/S5Nc/DZenNfyyehgJf4/HDiMlQephclug3ejEIV
	AVSjQ7NKWKi0MmtEwhe7RzomsUAZkRA1wYoCIV2Xkbh39D+71saWAHoK9UpYIyuDDEovXvjPDQyYt
	PU7QKG/w==;
Received: from i5e860d05.versanet.de ([94.134.13.5] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tVvoj-0003hx-4C; Thu, 09 Jan 2025 17:55:33 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Peter Geis <pgwipeout@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Alex Bee <knaerzche@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <didi.debian@cknow.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liang Chen <cl@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: add hevc power domain clock to rk3328
Date: Thu,  9 Jan 2025 17:55:19 +0100
Message-ID: <173644170631.2899934.14806787138893349994.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241214224339.24674-1-pgwipeout@gmail.com>
References: <20241214224339.24674-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_085549_330397_44E8068E 
X-CRM114-Status: GOOD (  14.67  )
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


On Sat, 14 Dec 2024 22:43:39 +0000, Peter Geis wrote:
> There is a race condition at startup between disabling power domains not
> used and disabling clocks not used on the rk3328. When the clocks are
> disabled first, the hevc power domain fails to shut off leading to a
> splat of failures. Add the hevc core clock to the rk3328 power domain
> node to prevent this condition.
> 
> rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks: { 3-.... }
> 1087 jiffies s: 89 root: 0x8/.
> rcu: blocking rcu_node structures (internal RCU debug):
> Sending NMI from CPU 0 to CPUs 3:
> NMI backtrace for cpu 3
> CPU: 3 UID: 0 PID: 86 Comm: kworker/3:3 Not tainted 6.12.0-rc5+ #53
> Hardware name: Firefly ROC-RK3328-CC (DT)
> Workqueue: pm genpd_power_off_work_fn
> pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : regmap_unlock_spinlock+0x18/0x30
> lr : regmap_read+0x60/0x88
> sp : ffff800081123c00
> x29: ffff800081123c00 x28: ffff2fa4c62cad80 x27: 0000000000000000
> x26: ffffd74e6e660eb8 x25: ffff2fa4c62cae00 x24: 0000000000000040
> x23: ffffd74e6d2f3ab8 x22: 0000000000000001 x21: ffff800081123c74
> x20: 0000000000000000 x19: ffff2fa4c0412000 x18: 0000000000000000
> x17: 77202c31203d2065 x16: 6c6469203a72656c x15: 6c6f72746e6f632d
> x14: 7265776f703a6e6f x13: 2063766568206e69 x12: 616d6f64202c3431
> x11: 347830206f742030 x10: 3430303034783020 x9 : ffffd74e6c7369e0
> x8 : 3030316666206e69 x7 : 205d383738353733 x6 : 332e31202020205b
> x5 : ffffd74e6c73fc88 x4 : ffffd74e6c73fcd4 x3 : ffffd74e6c740b40
> x2 : ffff800080015484 x1 : 0000000000000000 x0 : ffff2fa4c0412000
> Call trace:
> regmap_unlock_spinlock+0x18/0x30
> rockchip_pmu_set_idle_request+0xac/0x2c0
> rockchip_pd_power+0x144/0x5f8
> rockchip_pd_power_off+0x1c/0x30
> _genpd_power_off+0x9c/0x180
> genpd_power_off.part.0.isra.0+0x130/0x2a8
> genpd_power_off_work_fn+0x6c/0x98
> process_one_work+0x170/0x3f0
> worker_thread+0x290/0x4a8
> kthread+0xec/0xf8
> ret_from_fork+0x10/0x20
> rockchip-pm-domain ff100000.syscon:power-controller: failed to get ack on domain 'hevc', val=0x88220
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: add hevc power domain clock to rk3328
      commit: 3699f2c43ea9984e00d70463f8c29baaf260ea97

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

