Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF59C5AE49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhwEdgw1eS6x2GnAB8+xUx5g7XCO3z3euQwzEiNsX54=; b=z7E6z68uy7MwBGRLf89/0f7ejZ
	LvZUw/1heA2Wg6s+GIJgqnkyvjYbynHY+7MrvrY6AkbzjczFmIAMMu0hLqJEXgm+R7Qtl/pIDj8tm
	Wh5IVNYpBSHaTiS7ARCh6Xg8t31mvcFxCyhSAPEOwU4NB7WSdpMyGKBlhQC5xgEOnrjPAWGbMK0td
	EW5pUhuJPWaexWmdb/PuPxud1aCijBv2KrxSYaefbHQzvchRPt29ZYF34irLNx/RrP/RI65ykZOJ1
	i8ode18E9EEMnZH7nLmVD+e9bRrNAxsJvh+K4+Ch6KVSCr7l9vwL6r1CJkmYerOwmdEeo7FwwRFS+
	TNQbXd9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQtW-0000000Bzny-1CM2;
	Mon, 10 Aug 2026 14:22:26 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQtU-0000000BzmS-0nzp;
	Mon, 10 Aug 2026 14:22:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=GhwEdgw1eS6x2GnAB8+xUx5g7XCO3z3euQwzEiNsX54=; b=Rb+8A/uRKck+KYbV+gowS7WzxV
	DfEICFdVFXlH3BV2lGwqafae9rR5+A+KRKrVTEJdo2+Zm3iA6Fdl21Z7TOWoBrZfLf+ZEn5IQ/yEp
	qIq5ZiO4tPAejsEuF7uwHZ5jRqZysqLrDLRxwR8yw2AseH3jXNGY7ByFjYSAysWC4r/eEH5Qi3ygo
	w+ej4UMDyRImiJuhq2P6if1CHgXISymSHwK087IVmXKFxT8BvIGyFpmAoNbiruUlZQELi4DUAROcz
	eEiY1WpUPY9M18OZMd1vC3iMv2EwpyINY12xu0buLMQyVUZO9hQjfU6YjuyBugBqG14N0NmmZLLKC
	SEW/N98w==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Michael Riesch <michael.riesch@collabora.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com
Subject: Re: [PATCH v3] arm64: defconfig: enable Rockchip Multimedia drivers
Date: Mon, 10 Aug 2026 16:22:06 +0200
Message-ID: <7979630.8F6SAcFxjW@diego>
In-Reply-To: <63bbce33-9427-4585-a1bb-dc4af05e981f@kernel.org>
References: <20260808-rockchip-defconfig-additions-v3-1-0ed67877e94d@collabora.com>
 <5738059.NG923GbCHz@diego> <63bbce33-9427-4585-a1bb-dc4af05e981f@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_072224_246453_01BC8BF0 
X-CRM114-Status: GOOD (  17.97  )
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

Am Montag, 10. August 2026, 07:47:52 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Krzysztof Kozlowski:
> On 08/08/2026 16:06, Heiko St=C3=BCbner wrote:
> > Am Samstag, 8. August 2026, 02:42:26 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Sebastian Reichel:
> >> Enable multimedia related drivers used by the Radxa ROCK 5B (used as an
> >> example, the config options are relevant for most Rockchip RK3588 and
> >> RK3576 boards), so that all hardware is supported by the default confi=
g.
> >>
> >>  * Synopsys MIPI CSI2RX - RK3588 CSI2 Controller
> >>  * RKVDEC - RK3588/RK3576 video decoder for H.264 and H.265
> >>  * Sony IMX415 - Sensor used by the Radxa Cam 4K module
> >>  * Rocket - RK3588 NPU driver
> >>  * Verisilicon IOMMU - IOMMU used by RK3588 AV1 video decoder
> >>  * Innosilicon CSI D-PHY - RK3588 CSI PHY (one of them)
> >>
> >> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> >=20
> > I'm not sure what the actual rule for defconfig changes is.
> >=20
> > In some past thread I remember (hopefully correctly) Krzysztof saying
> > that the arm64 defconfig is not supposed to be a distro-config, so
> > enabling each and every driver was not the goal.
> >=20
> > On the other hand, he did not repeat that in his reply to your v1 ;-) .
> >=20
> > We're at -rc7 tomorrow, so it'd be 7.4 material anyway, so enough time
> > to get "complaints" I guess ;-) .
>=20
> I believe defconfig is still mostly for us and the patch fits this
> purpose - you need these to fully use mentioned upstream hardware.
>=20
> I learnt that few distros (I think Fedora) use defconfig directly
> instead of customizing it like Ubuntu does, so anyway maybe we should
> enable everything for given hardware.

thanks a lot for the clarification, I'll roll with that in the future :-)


Heiko



