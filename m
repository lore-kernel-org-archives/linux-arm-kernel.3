Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABB0C61DD7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 12:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=msvDF/LcXKGcuEENSdT1nkJoOjtd4vV0hLHcxOpOB/Y=; b=Gu2aMMSIW6DZxzOh2E3jT6Ts12
	SJbuzCLaPrHEDMHgPgz88djDXwgP8SCZ9wWtPObD8mLExEPOekw3ygAjyweS4mcsVTP4kf4qLiQQd
	E3V8p+GJhMikzyCAyf9xsO2COngqCbctOgQLi8d/Ns0IT4EdU7QrFzSCrH8SNXsULbRgfmT3CTVLv
	V1G8bSOcdSodSbIvNkOb51HanKRWU0FQswpnjg7vun44U+9jWYVgm3oqmPguJ32nLeT8vFzNbL0tY
	nnnNHZW9GCfUmRlSC7wMdTzazeMv1yH4j3NCOsHPnThXlPLljqdJ65GYitzhftoySLwzokoQSAVLc
	I8q6DZTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzvTf-00000005iKp-0wkk;
	Fri, 28 Aug 2026 12:14:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzvTd-00000005iK7-10Yy;
	Fri, 28 Aug 2026 12:14:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=msvDF/LcXKGcuEENSdT1nkJoOjtd4vV0hLHcxOpOB/Y=; b=ZNaQRRzJ6UqWH8EuUm79pM+zlc
	Gd/esYsnOYqhYI2iVEjEAB9i584MruJIlnem5CqaHGU91jt/WCjkeZkjmFXrHJUSnZDFduLW8eGJp
	rX7r+7aPLUk1s/t4EQRVmgTWA6kua4gZrfcjhwKNrUTUxrtQ+ufikb7K1ZHK2CFu77NrZqcfJHtR/
	iDkE/JqPz5aLRXLLkTdg14II7gx05qL8vtvlmJgtP0LgJptN2vCP5jB6ar0H9s3eBGghQMNQIpTN0
	E1uPFBV6EFZLTCYRnie2bgBGB7XIXR+FNA3jBpjk+IpRMDHxpQyaBvV+Gex6C+IDq4carWtV8SN3Y
	5hnak8uw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rudi Heitbaum <rudi@heitbaum.com>
Cc: Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: onboard_dev: add the Rockchip rk1808
Date: Fri, 28 Aug 2026 14:14:22 +0200
Message-ID: <4512468.iIbC2pHGDl@diego>
In-Reply-To: <apFpPP1O45BWXDv5@5be1eda4e59e>
References: <aouw7rH6FZxscUTO@0d3a7a881997> <5096877.GXAFRqVoOG@phil>
 <apFpPP1O45BWXDv5@5be1eda4e59e>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_051433_339068_0064F2C3 
X-CRM114-Status: GOOD (  20.79  )
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

Hi Rudi,

Am Freitag, 28. August 2026, 12:55:56 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Rudi Heitbaum:
> On Thu, Aug 27, 2026 at 03:25:23PM +0200, Heiko Stuebner wrote:
> > Am Montag, 24. August 2026, 04:52:02 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Rudi Heitbaum:
> > > The rk1808 is the npu die in an rk3399pro package. It is wired to one
> > > of the usb3 controllers rather than to an external port, and it needs
> > > its reference clock running before it will boot, which is exactly what
> > > this driver exists to do for onboard devices.
> > >=20
> > > It takes no supply from the driver: the rails are sequenced elsewhere.
> > > Only the clock matters here, and that is already optional and handled
> > > generically.
> >=20
> > the "elsewhere" might need a bit more explanation to verify it's the ri=
ght
> > implementation. Even if the regulators are always-on or something, we
> > still want the supplies defined - for future uses.
>=20
> As follow up on the bringup of the Rock-Pi-N10, the proposed change to th=
e dtsi
> for the rk3399pro-vmarc-som is here, but needs the provision of the usb f=
irst.
> https://github.com/heitbaum/linux/commit/6b114b6fff4022c330003d7f70ce0991=
5ffd774f

I might have formulated that strangly, what I meant was, who is enabling
the power supplies.

The "NPU Power" part of any rk3399pro schematics (should) list 5 power
supplies for the NPU block itself:

NPU_LOGIC_VDD
    --> regulator likely named NPU_VDD_LOG_S0
        --> enabled by NPU_PWREN_2 gpio fixed regulator

NPU_EFUSE_VQPS
    --> regulator likely named NPU_VCC1V8_EFUSE
        --> enabled by NPU_EFUSE_EN_H gpio fixed regulator

NPU_CORE_VDD
    --> regulator likely named NPU_VDD_S0
        --> TCS4525 regulator with voltage being set via the i2c controller
             inside the NPU - but enabled by the NPU_PWREN_6 gpio from
             core RK3399.

NPU_CPU_VDD
    --> regulator likely named NPU_VDD_CPU_S0
        --> enabled by NPU_PWREN_4 gpio fixed regulator

NPU_ADC_AVDD_1V8
    --> regulator likely named NPU_VCC_1V8_S3
        --> enabled by NPU_PWREN_3 gpio fixed regulator

Naming might vary, I found just some EVB schematics.

Someone needs to enable these, so the question was, who is doing that?

Thanks
Heiko




