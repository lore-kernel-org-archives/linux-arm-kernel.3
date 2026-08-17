Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8998AC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 16:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itpN6ATWZzDI6Gf6iahFT31A2k/lQeZZFl4EfK17TNQ=; b=xhxmOzxTJ9Ul7kc1s3xxZS7RwK
	r0r9LVBN0q2n15fMOoBDkXMNDpoKmLVIcj4RbqOWkcjRa55DlC3nwUTD/noIAg9H+dKQhlx0O6YNg
	OzmLjchnj8j+qUTWfWLK1XoqYzmLWiAPPpAC8Z+EMXBXbV6HLr+kLzsLI/VreFDgRv5L1cd66/+vM
	2W4SXm7TElpruFAJ3h53kyqV5xrvG6PGsnFaf1N+psN4PgqenPWLzQK7nJSZ6gSgWU+CCD38D+hnN
	yQlv+7Y/Qofk9o5T5wtle/mV0r8Hk3cwX+hyvM9M7B822cfd1WJsvOjNlPY6kBBRaJo9geGFvVMxh
	Rhg2hvFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww09E-00000006Vud-3iZ2;
	Mon, 17 Aug 2026 16:25:17 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww09C-00000006Vu5-1xpl;
	Mon, 17 Aug 2026 16:25:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=itpN6ATWZzDI6Gf6iahFT31A2k/lQeZZFl4EfK17TNQ=; b=AYFPdpefVLE763eFsrJfYx22tO
	4KsmLt40V3mczAZnJV//laYr/5Djz88BSJNiThqm01+FoW5aaVex2wIvTfYao+UgMlWsIsWMeMOTy
	CC0wKFXxE/l/i8nSi4l862JXjOnc0F/edk8ShneewT8MdwNnoqvLJ+xrCNBogA3MTt8VYCNe+yePg
	O9jLvtg+6cfb17mJ3slNFscQzK+MEHXTj2LHX1JTrhtCTpYsmEmXEoj/qHIs0UhPpyIZ+5ur0jFSM
	gcmHfwvd1C8YeNIAw/dwl55BNk6qq/sSq6x/7ZUCVCQGQyN9sf6R/yAvdxQv1ZEtxlm7NW3stGjRx
	/s24wrcg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Cunhao Lu <1579567540@qq.com>, Marc Kleine-Budde <mkl@pengutronix.de>
Cc: kernel@pengutronix.de, Vincent Mailhol <mailhol@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-can@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v6 0/4] can: rockchip: add RK3588 CAN support
Date: Mon, 17 Aug 2026 18:25:02 +0200
Message-ID: <6011470.tIAgqjz4sF@diego>
In-Reply-To: <20260817-guillemot-of-premium-saturation-6b893d-mkl@pengutronix.de>
References: <tencent_7BAA0052C402BFFD26291A64198084E39107@qq.com>
 <20260817-guillemot-of-premium-saturation-6b893d-mkl@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_092514_677350_2F266D7C 
X-CRM114-Status: GOOD (  15.15  )
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

Am Montag, 17. August 2026, 18:23:03 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Marc Kleine-Budde:
> On 30.07.2026 22:34:01, Cunhao Lu wrote:
> > Add support for the RK3588 CAN controller.
> >
> > RK3588 integrates three CAN-FD controllers that are closely related to
> > the existing Rockchip CAN-FD IP already supported in the kernel. The
> > RK3588 variant is not fully compatible with RK3568v2 because the RX
> > FIFO count register field has a different layout.
> >
> > This series therefore:
> >
> > - extends the existing Rockchip CAN-FD binding with the
> >   rockchip,rk3588-canfd compatible
> > - adds a dedicated RK3588 match entry and devtype in the driver
>=20
> I'll take the first 2 patches.
>=20
> > - describes the three CAN controller nodes in rk3588-base.dtsi
> > - enables CAN on the RK3588 Tiger Haikou board
>=20
> The DT changes should probably go via the rockchip tree.

yep :-) .

I'll pick those up after the merge-window.


Heiko



