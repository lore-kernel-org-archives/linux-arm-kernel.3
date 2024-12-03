Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F21E6C5F0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 02:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjMkX0FWa0V9wXUyOrM/F9rNNXBn3JwpSVSYdg5vpNY=; b=h84HJkI14WyENtoIeXpoj/jcDZ
	TNAqy06XbW2MW2VBt38q4xbJm00O8GXhEQlcbmRRm9ChJQTL0MXh1jq/r8PjU6oJ05ZWk/7WchHLu
	aOZ79UZGk0kphaLzeNBSmATPDZCmvzqPN1Oqkn3pgTPgD6CkTYH1ADte8RB7guGIaKdf4/6CvPvJ6
	GGpwVQspC6QxDUJEnW81CF9frnudea6ZYwuamUaLDUOiTFHy5IYSot/T5cMgIejovRGjY7nNAVDTP
	qPb+zzxLVd3u8eZVUmZOYsVb47puM54PiwKBQh54c+P68yXi4sg7qs3pZSUkQD2OF99rNFfwuEc7H
	RajGsHFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIJ3b-000000084b6-242G;
	Tue, 03 Dec 2024 02:54:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIJ2b-000000084PI-19mW;
	Tue, 03 Dec 2024 02:53:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C3B875C476C;
	Tue,  3 Dec 2024 02:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66EE1C4CED1;
	Tue,  3 Dec 2024 02:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733194412;
	bh=5NrfrujeFDf+fSH5kneC5axcRATmJ0Nz3tqBpohP0O4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=MDMb89+cXWpckQeitaTf+4Fsdz2GcREa0ZeO+jAxqBDf4AoOIZerr12+iiwTXJfJm
	 EwC95pmrY2tOpTHpeMcaus/DE/qIC1pcf4TkH6uEavp1i6l3zu3Q7DjAGRJWoo4aee
	 KfS5xOuGxQ46w0C7bKs8UyWctftKF1sR1ItCFb14YznnkNWp7EYFWDEFgwkfaPwZ07
	 Z7gkyitCytSLX4UOySYqy7S9PhV7e85pRkvmvpdc6ITUdCzBdhvoq4ne8X9QxWQ6H5
	 hx63iPyVu9bjUV+GYRhMcBcpwJbOoeQC49b65w3JbzM6Eff8jcZWxllOTh/VcYGQ9r
	 9UTP8UDzDsJwg==
Message-ID: <df0a53ee859e450d84e81547099f5f36.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ce67e512-a15b-4482-8194-b917096f4eeb@app.fastmail.com>
References: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com> <12f29978-c8ce-4bee-a447-dcd086eb936d@app.fastmail.com> <1ja5dk2y5l.fsf@starbuckisacylon.baylibre.com> <f8de4a2a-776f-4c10-b75e-e845bcc38dde@app.fastmail.com> <1j4j3r32ld.fsf@starbuckisacylon.baylibre.com> <306b0b30-5a32-4c7c-86b4-57d50e2307e8@app.fastmail.com> <1jy1131kxz.fsf@starbuckisacylon.baylibre.com> <c06317c6-b2b2-4b6d-96e4-0c2cfc6846de@app.fastmail.com> <1jplmf1jqa.fsf@starbuckisacylon.baylibre.com> <ce67e512-a15b-4482-8194-b917096f4eeb@app.fastmail.com>
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 02 Dec 2024 18:53:30 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_185333_400273_BC9F5622 
X-CRM114-Status: GOOD (  33.59  )
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

Happy Thanksgiving!

Quoting Arnd Bergmann (2024-11-28 07:34:46)
> On Thu, Nov 28, 2024, at 16:06, Jerome Brunet wrote:
> > On Thu 28 Nov 2024 at 15:51, "Arnd Bergmann" <arnd@arndb.de> wrote:
> >> On Thu, Nov 28, 2024, at 15:39, Jerome Brunet wrote:
> >>> On Thu 28 Nov 2024 at 15:11, "Arnd Bergmann" <arnd@arndb.de> wrote:
> >>> Eventually that will happen for the rest of the reset implemented
> >>> under drivers/clk/meson.
> >>>
> >>> It allows to make some code common between the platform reset
> >>> drivers and the aux ones. It also ease maintainance for both
> >>> Stephen and Philipp.
> >>
> >> I don't understand how this helps: the entire point of using
> >> an auxiliary device is to separate the lifetime rules of
> >> the different bits, but by doing the creation of the device
> >> in the same file as the implementation, you are not taking
> >> advantage of that at all, but instead get the complexity of
> >> a link-time dependency in addition to a lot of extra code
> >> for dealing with the additional device.
> >
> > My initial rework had the creation in clock (note: that is why I
> > initially used 'imply', and forgot to update when the creation moved to
> > reset).
> >
> > I was asked to move the creation in reset:
> > https://lore.kernel.org/r/217a785212d7c1a5b504c6040b3636e6.sboyd@kernel=
.org
> >
> > We are deviating a bit from the initial regression reported by Mark.
> > Is Ok with you to proceed with that fix and then continue this discussi=
on
> > ?
>=20
> I really don't want to see those stray 'select' statements
> in there, as that leave very little incentive for anyone to
> fix it properly.
>=20
> It sounds like Stephen gave you bad advice for how it should
> be structured, so my best suggestion would be to move the
> the problem (and the reset driver) back into his subsystem
> and leave only a simple 'select RESET_CONTROLLER'.
>=20
> From the message you cited, I think Stephen had the right
> intentions ("so that the clk and reset drivers are decoupled"),
> but the end result did not actually do what he intended
> even if you did what he asked for.
>=20
> Stephen, can you please take a look here and see if you
> have a better idea for either decoupling the two drivers
> enough to avoid the link time dependency, or to reintegrate
> the reset controller code into the clk driver and avoid
> the complexity?

I think the best approach is to add the reset auxilary device with a
function that creates the auxiliary device directly by string name and
does nothing else. Maybe we can have some helper in the auxiliary
layer that does that all for us, because it's quite a bit of boiler
plate that we need to write over and over again. Something like:

  int devm_auxiliary_device_create(struct device *parent, const char *name)

that does the whole kzalloc() + ida dance that
devm_meson_rst_aux_register() is doing today and wraps it all up so that
the device is removed when the parent driver unbinds. Then this clk
driver can register the reset device with a single call and not need to
do anything besides select AUXILIARY_BUS. The regmap can be acquired
from the parent device in the auxiliary driver probe with
dev_get_regmap(adev->parent).

