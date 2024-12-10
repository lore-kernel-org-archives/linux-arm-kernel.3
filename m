Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D333E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 13:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HuyGQ9BIUtmSl7RlIuvQXneAnQFAJ8SshLEhAtYpg4=; b=d0TSQRppWcoibWWyHbLEGmkzez
	BaKw3j/w+LNGypb85rCyHHF2pzAcfJdhTdv8zFADuU7oLJ9x0TgbnjvzAI70uM2E+BxE0/Ujrsw+V
	m6xx7dtMt35Odsh8+YhxVwW2BMsKaWhqS+YuTEp+4DKuoOS+Qi6Eg+isHnzrmFGq/3kHFIFGHsypT
	393kxjzyzeeNREShV1m389KcujDWZu96r9lBNzfSPyj7Ajq5URueizLeRwXgDXBPWjec7YzAd3ByO
	K3JoTnc9CokKH2YIXJFne3V9K+JHg/kwWDXQI2d1p/LAyduRxE1MUKKCX5uQOWEx72kap52VYILBj
	JLoizBBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0h0-0000000BdjS-3j3l;
	Tue, 10 Dec 2024 13:54:27 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0ff-0000000BdSO-0k1M;
	Tue, 10 Dec 2024 13:53:04 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1733838781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4HuyGQ9BIUtmSl7RlIuvQXneAnQFAJ8SshLEhAtYpg4=;
	b=fzW4BzaSnzstzxXv1KEIfRoWbbgMFMx3sgsdnLgtZ4FDeGfdKq5w0JA9VsYNnk0IJ2Fm60
	Y2MU7IQjSej2pP3bSUnfZzeMLIHYiWUKK9NzLA4y39egUYVqfBfd+f27g97u6tz8lsckWR
	G7wUQsnhTqhWdFQ9kmCHAhzgkLYGCrPRd6XrD5k0PGjvbBksxnUS2hRFxqKf3m7/hTOsZS
	iHegBt647qaaB+/ZQGP9OsG5rdbPT2wxWKuj38DMdxHWxUlNN4eYWSGGw8+Mw4dMuy1nvp
	X5mgK8LBqyiUHtt/ll0uc4VxGYcfEbCFfQlt2lCYV5RyTtYtWwDgbw0jFGTeBw==
Date: Tue, 10 Dec 2024 14:53:00 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Peter Geis <pgwipeout@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Alex Bee <knaerzche@gmail.com>, Conor
 Dooley <conor+dt@kernel.org>, Diederik de Haas <didi.debian@cknow.org>,
 Johan Jonker <jbx6244@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Liang Chen <cl@rock-chips.com>, Rob Herring
 <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, shironeko <shironeko@tesaguri.club>
Subject: Re: [PATCH 4/6] arm64: dts: rockchip: add hevc power domain clock to
 rk3328
In-Reply-To: <CAMdYzYquvGBzfWqvUOku7m1sM9qxmBHAL95cANDViUCT1oEEhQ@mail.gmail.com>
References: <20241210013010.81257-1-pgwipeout@gmail.com>
 <20241210013010.81257-5-pgwipeout@gmail.com>
 <e32fa593abfa6d08202b4f929e0b4bdb@manjaro.org>
 <CAMdYzYp+MQVYr1tOMEOn62vXZGVEYrtd1p9vn6YQzXdrJgSdyA@mail.gmail.com>
 <CAMdYzYquvGBzfWqvUOku7m1sM9qxmBHAL95cANDViUCT1oEEhQ@mail.gmail.com>
Message-ID: <8c604ada27457698ad6d33d22a39b45a@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_055303_502759_B550C155 
X-CRM114-Status: GOOD (  30.16  )
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

Hello Peter,

On 2024-12-10 14:23, Peter Geis wrote:
> On Tue, Dec 10, 2024 at 8:13 AM Peter Geis <pgwipeout@gmail.com> wrote:
>> On Tue, Dec 10, 2024 at 5:04 AM Dragan Simic <dsimic@manjaro.org> 
>> wrote:
>> > On 2024-12-10 02:30, Peter Geis wrote:
>> > > There is a race condition at startup between disabling power domains
>> > > not
>> > > used and disabling clocks not used on the rk3328. When the clocks are
>> > > disabled first, the hevc power domain fails to shut off leading to a
>> > > splat of failures. Add the hevc core clock to the rk3328 power domain
>> > > node to prevent this condition.
>> > >
>> > > rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks: { 3-....
>> > > }
>> > > 1087 jiffies s: 89 root: 0x8/.
>> > > rcu: blocking rcu_node structures (internal RCU debug):
>> > > Sending NMI from CPU 0 to CPUs 3:
>> > > NMI backtrace for cpu 3
>> > > CPU: 3 UID: 0 PID: 86 Comm: kworker/3:3 Not tainted 6.12.0-rc5+ #53
>> > > Hardware name: Firefly ROC-RK3328-CC (DT)
>> > > Workqueue: pm genpd_power_off_work_fn
>> > > pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> > > pc : regmap_unlock_spinlock+0x18/0x30
>> > > lr : regmap_read+0x60/0x88
>> > > sp : ffff800081123c00
>> > > x29: ffff800081123c00 x28: ffff2fa4c62cad80 x27: 0000000000000000
>> > > x26: ffffd74e6e660eb8 x25: ffff2fa4c62cae00 x24: 0000000000000040
>> > > x23: ffffd74e6d2f3ab8 x22: 0000000000000001 x21: ffff800081123c74
>> > > x20: 0000000000000000 x19: ffff2fa4c0412000 x18: 0000000000000000
>> > > x17: 77202c31203d2065 x16: 6c6469203a72656c x15: 6c6f72746e6f632d
>> > > x14: 7265776f703a6e6f x13: 2063766568206e69 x12: 616d6f64202c3431
>> > > x11: 347830206f742030 x10: 3430303034783020 x9 : ffffd74e6c7369e0
>> > > x8 : 3030316666206e69 x7 : 205d383738353733 x6 : 332e31202020205b
>> > > x5 : ffffd74e6c73fc88 x4 : ffffd74e6c73fcd4 x3 : ffffd74e6c740b40
>> > > x2 : ffff800080015484 x1 : 0000000000000000 x0 : ffff2fa4c0412000
>> > > Call trace:
>> > > regmap_unlock_spinlock+0x18/0x30
>> > > rockchip_pmu_set_idle_request+0xac/0x2c0
>> > > rockchip_pd_power+0x144/0x5f8
>> > > rockchip_pd_power_off+0x1c/0x30
>> > > _genpd_power_off+0x9c/0x180
>> > > genpd_power_off.part.0.isra.0+0x130/0x2a8
>> > > genpd_power_off_work_fn+0x6c/0x98
>> > > process_one_work+0x170/0x3f0
>> > > worker_thread+0x290/0x4a8
>> > > kthread+0xec/0xf8
>> > > ret_from_fork+0x10/0x20
>> > > rockchip-pm-domain ff100000.syscon:power-controller: failed to get ack
>> > > on
>> > > domain 'hevc', val=0x88220
>> > >
>> > > Fixes: 52e02d377a72 ("arm64: dts: rockchip: add core dtsi file for
>> > > RK3328 SoCs")
>> > > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
>> >
>> > While I was unable to formally verify this clock assignment,
>> > i.e. by using the RK3328 TRM or the downstream kernel source
>> > from Rockchip, it makes perfect sense to me.  Thanks for the
>> > patch, and please feel free to include:
>> >
>> > Reviewed-by: Dragan Simic <dsimic@manjaro.org>
>> 
>> It is unfortunate the TRM doesn't include the clock maps, because they
>> are extremely helpful when one can acquire them. It also doesn't help
>> that the TRM register definition only referred to this as "pll". I was
>> sent specifically the usb3 phy clock map for my work on the driver,
>> which had the location of each switch and divider along with the
>> register and bit that controlled it. That combined with the TRM
>> register map allowed me to find this error.
> 
> Apologies, that's the wrong response for this one.

No worries.

> This patch was the result of educated guess combined with testing. I
> grabbed all of the clocks that looked like they could affect things,
> then tested them one at a time until I isolated them to this clock. It
> lives alone with cpll as the parent and has no children according to
> the clock summary. (Though the writeup i mistakenly included above
> proves the clock map isn't always accurate).

I see, thanks for all your work on this patch!  It surely took quite
a lot of time to perform all the testing.

>> > > ---
>> > >
>> > >  arch/arm64/boot/dts/rockchip/rk3328.dtsi | 1 +
>> > >  1 file changed, 1 insertion(+)
>> > >
>> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
>> > > b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
>> > > index 0597de415fe0..7d992c3c01ce 100644
>> > > --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
>> > > +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
>> > > @@ -333,6 +333,7 @@ power: power-controller {
>> > >
>> > >                       power-domain@RK3328_PD_HEVC {
>> > >                               reg = <RK3328_PD_HEVC>;
>> > > +                             clocks = <&cru SCLK_VENC_CORE>;
>> > >                               #power-domain-cells = <0>;
>> > >                       };
>> > >                       power-domain@RK3328_PD_VIDEO {

