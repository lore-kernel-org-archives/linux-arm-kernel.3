Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69481D2AB0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 09:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4DQvH1yTgG5s6YS3jDzL8kWS0Q+9gf6Jcq6GQyOq6Y=; b=bk5EdIL956goJyuymWjFTc79oX
	1epPVvG6hW79ib+66XC0HIf9Q9hdceWU+u/klfp+r7T2i/mGH6ORkeZlge2YwvuQt0kqLsENY6qD7
	J8aq41YV6bZRX4wUZFrnHGPtqgioyMNdar7DcHqjNoPV6YpDHnghvANQuOnVOHRAcp+Xl2ENRYKoV
	omRydnJJKMJg5cauaJoBtwpgeHIsP/SrSvtDqNmBccKF0ShFUTJvm/J+ZbcF2Bq5gtHjOxnrcYdLP
	8p8PnxWfCB/v0j8xzGvbvXHl7W0bxXPW+vi6lqDKfoR7c8yg9sbbpZ8hJLNrwmV5M5OVSrVwrnBCf
	dOch+5dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5isT-0000000DvRd-2LtH;
	Tue, 29 Oct 2024 09:51:05 +0000
Received: from mail-40134.protonmail.ch ([185.70.40.134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ipg-0000000DuzI-1fbL;
	Tue, 29 Oct 2024 09:48:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=o53zroy6ajgonks5kukapksxvi.protonmail; t=1730195289; x=1730454489;
	bh=q4DQvH1yTgG5s6YS3jDzL8kWS0Q+9gf6Jcq6GQyOq6Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=SKYZtxN3mE3tar1YfOo5pLhOlG+mttIq/SgsTrUVfwGTflWm9nYNvE1mw2m7Gr34U
	 g5n40mS65rQFWoP4aCQ6cimcVqz+7Z17NLi4swjXiZiRlkWbcMugArERgJl4vQcDm5
	 dv5RfcJeQ+uT6lhLCh0CC1xGnldek39Pigi4+0dLvyAv6mahebJaZL+TdiaYAvV6JC
	 /wzah0Egxke/FGxpbxTSqKeJER3BsczWmqxHoZxg6bvcekgh0vEudy/gzjH8/Bx10j
	 aBI/KW5yBGGIo1J7SZrZSFTxpL8i+Fm6kSmSJfMlJQjuBrKJXXMxR0Zy3kv3aNueoK
	 hXCVWS8VVQcbg==
Date: Tue, 29 Oct 2024 09:48:02 +0000
To: Andy Yan <andyshrk@163.com>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, Daniel Stone <daniel@fooishbar.org>, Dragan Simic <dsimic@manjaro.org>, Diederik de Haas <didi.debian@cknow.org>
Subject: Re:Re:Re: [PATCH v6] rockchip/drm: vop2: add support for gamma LUT
Message-ID: <J0qrwbZdhKG3-7KhE30DvtMh7V3jQTrQ8RnHPcIHV_yBxiXRucga5al9iptkXm3NWrGKwuxOqyIOw-HiP5aIXY5D5GUOZ3Fu17rgj8Cy3B4=@proton.me>
In-Reply-To: <6a92e23a.56c.192d5ae32d5.Coremail.andyshrk@163.com>
References: <20241016223558.673145-2-pZ010001011111@proton.me> <DurUfF_0TBHKv4DHKIP3ggQh_85nRY0usYWn_fu_oJ45txO7dGKv-OK5rl6EDEPmX5l8WzrwPCzAvYz0xFPfeKGyx7enu1g-prsWIpilv88=@proton.me> <2bb58a1c.6287.192d1dc9b2d.Coremail.andyshrk@163.com> <6a92e23a.56c.192d5ae32d5.Coremail.andyshrk@163.com>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: a2358035855d74cd8a3bb089158398ae3faf8474
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_024813_212074_BC77CCDF 
X-CRM114-Status: GOOD (  13.22  )
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

Hi Andy

> =E5=9C=A8 2024-10-28 14:42:28=EF=BC=8C"Andy Yan" andyshrk@163.com =
=E5=86=99=E9=81=93=EF=BC=9A
>=20
> > Hi Piotr=EF=BC=8C
> > Tested on top of Linux 6.12-rc5 with rk3566-box-demo in a buildroot + w=
eston environment:
> > weston --backend=3Ddrm-backend.so -i 0 --continue-without-input
> > weston-simple-egl
> >=20
> > simple-egl will draw a triangle on the desktop.
> > After the patch applied=EF=BC=8Cthe triangle will flicker again and agi=
an=E3=80=82
> > So it break some function=E3=80=82
> > I've been quite busy lately, and it will take some time before I can an=
alyze what the specific reason is.
>=20
>=20
> Sorry, it's my fault. After more experiments, I found that the flickering=
 I observed is not related to your patch.
> This should be a probability-related issue associated with alpha blending=
=EF=BC=8Cwhich can be Fixed with patches in
> my series[0]
> [0] https://lore.kernel.org/linux-rockchip/75a13dbb.acb8.192289a8005.Core=
mail.andyshrk@163.com/#r

Np :)

> And for the gamma patch=EF=BC=8C I think there are still some small areas=
 that can be improved.
> Please see my comment bellow:

Amended! thanks.

I will wait until weekend with next version, maybe there will be more
comments.

