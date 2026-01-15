Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F828D4114C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 09:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYXltDpL0E6P70x7/T7CUClUHHDXZGWswJd0N771/no=; b=UECR2vEsECoZwHYGw9DJ+g2gqG
	FTVXNohHA8+zxN3+vaSuh4jQr7ipEa8D0imYa9k65+CYRrFmxHYcLRXA2hK7j+wxzR+a6A49xV5KR
	EEU//bBV2QvVpeCvwCU9aQ7J/dA6NUQWMW+XOYqTEIXAwGPfnmyXbq/JUirG/UnoPrP0od0W4F/y3
	6P+wyRv3Wab3qTpI8lO3Sct6slzHyCADwYhaFdhVtLtA6Y4sJhkuUtqMT3B9KJoAQUNk+bdCUjzSc
	GaLFeQ6RVeljvwxKhJvpmRKsu+SwMjcyCjKvIo2s3nKmcrRp0IfDZrcdrPQQqBmmgCYibQOlmKR8V
	8c33n1FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJlc-0000000C4xn-2Qdw;
	Thu, 15 Jan 2026 09:35:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJlZ-0000000C4wU-2Rgo;
	Thu, 15 Jan 2026 09:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=JYXltDpL0E6P70x7/T7CUClUHHDXZGWswJd0N771/no=; b=xiJJHr00vXBCki2jKRfl7tFi2f
	eqiyJPSVUNN0luhQwYGJZnktZzI4n1QZVi88LLC7L81QBc0vY2milOMQeZDNs4s+g1pk+44cCdvOi
	MF7ue+wVuKChpRYstO/XH5qHSR184Y/ZG6lXa5aX4QFRid1J7T+v8DwkprcJFikwB+p3+U8JQQqmh
	RYnC0Oor3ntxhkEIqKJOHunUihBCM4Vcg8dXBNhKJpHtKomPlHmN0QpM7YuXVM2zkwljFWzP9ziKi
	7H+fwrDOW2jKcKJcYom28PUGJ/r3SORsAS/PVSqDWPSLVzaqJraIWe2ZApKvbDQkhVVVyDaxv6/tK
	5oeOphZQ==;
Received: from i53875b85.versanet.de ([83.135.91.133] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vgJlU-002RHj-Il; Thu, 15 Jan 2026 10:35:41 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: quentin.schulz@cherry.de, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v3 3/5] arm64: dts: rockchip: Enable HDMI output on
 RK3368-Lion-Haikou
Date: Thu, 15 Jan 2026 10:35:38 +0100
Message-ID: <10786293.qUNvkh4Gvn@diego>
In-Reply-To: <8f7880cc-5469-4ac1-9fcc-9bd33327e571@rock-chips.com>
References: <20260114230707.4175162-1-heiko@sntech.de>
 <20260114230707.4175162-4-heiko@sntech.de>
 <8f7880cc-5469-4ac1-9fcc-9bd33327e571@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_013545_682612_D4CFC4DD 
X-CRM114-Status: GOOD (  16.20  )
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

Hi,

Am Donnerstag, 15. Januar 2026, 02:25:34 Mitteleurop=C3=A4ische Normalzeit =
schrieb Chaoyi Chen:
> On 1/15/2026 7:07 AM, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> >=20
> > Enable the VOP and HDMI controller on the Lion-Haikou board.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> > ---
> >  .../boot/dts/rockchip/rk3368-lion-haikou.dts     | 16 ++++++++++++++++
> >  arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi    |  5 +++++
> >  2 files changed, 21 insertions(+)
> >=20
>=20
> I guess NPLL is an independent PLL available for VOP,=20
> could you give it a try?

not really sure what you mean here.

The VOP-binding specifies the aclk, dclk and hclk clocks.

The NPLL is a possible source for quite a lot of peripherals on the rk3368
aclk_cci_pre,  sclk_tcp, vepu/vdpu, hevc, isp, gpu, gmac

So it's definitly not dedicated to the VOP, and thus should not
change frequency for the VOP alone, because that could affect
other blocks.


Heiko



