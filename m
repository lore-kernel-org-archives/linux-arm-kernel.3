Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49666FEC11D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 22:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3gld30CC/yUh8wAsj33dTrf4cqP87g/8NsYlEhB37I=; b=O3H2cUD9uzH5Vz7lQiKcPPmSbK
	66t3fQMDnI2ojxDx8qifaN/e/WuU43F0a+r4ROBfF5Uju2isjHZ32Cu8yBvJLYAmfFjL8l/MkJd1/
	3DZRGW8eWVkxNHKe+XKCAAkgFOTYRFaTI4LZRbWg6XuGOKXxiZAqUpHevj5eLb0vc6JGOCdlkBc9I
	Ld/iImJ2c/ERDaQrbIgrjpxOaKsae18Ij3lbkHG0c9AMppubgzzkanXWACbeaNNzJnHzw+Na8+xr2
	XxQ/cUnrhEJL5VoepRejirPymgaQsCwH98ceqeXyWzItvJSACjMkBzCKjUE30lPixslfSEvt/WkaZ
	P3RZHr8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5AEH-00000002JOX-2pxY;
	Tue, 24 Mar 2026 22:28:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5AEE-00000002JO2-1YfH;
	Tue, 24 Mar 2026 22:28:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=V3gld30CC/yUh8wAsj33dTrf4cqP87g/8NsYlEhB37I=; b=EvgsFLXu69P0N9Jf299wrsywDx
	PK4xGnPpKiCThvwYdqEjq+sp2g5tZxgGCU+b54CIpjprafspupOR9czL0pQhwQ6/Kq2qUd1xON3hN
	WZwGHSdcTbgSrxe/J74zhUOY7eDKpswDDtQtkcgtdeE2TvrcrN/db5gjh9pr+tr9y5vgBF5oL97MH
	N+NZO8wpf7TWHrLqWkuzYkMFIp02XYFqj/Fl8imG8IdxD7285qg5dMcmSZXPAW8eBWgfSoe++bClI
	pWDf8t/UpIt17ZAdnDuxdL8vRm4NYuEoo1YjMILVfGoE+ovbKabHUhqjvAgbqdiauyjjzfVEybRyT
	X+/jf6Yg==;
From: Heiko Stuebner <heiko@sntech.de>
To: MidG971 <midgy971@gmail.com>, Jonas Karlman <jonas@kwiboo.xyz>
Cc: linux-rockchip@lists.infradead.org, shawn.lin@rock-chips.com,
 jonas@kwiboo.se, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v5] arm64: dts: rockchip: rock-3b: Model PI6C20100 as
 gated-fixed-clock
Date: Tue, 24 Mar 2026 23:27:47 +0100
Message-ID: <10821700.nUPlyArG6x@phil>
In-Reply-To: <533f27c9-e970-449b-a431-4ba41a566aaf@kwiboo.xyz>
References: <20260320094441.128263-1-midgy971@gmail.com>
 <177437177535.786081.7519498810130807269.b4-ty@sntech.de>
 <533f27c9-e970-449b-a431-4ba41a566aaf@kwiboo.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_152802_490948_EB677324 
X-CRM114-Status: GOOD (  15.31  )
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

Hi Jonas,

Am Dienstag, 24. M=C3=A4rz 2026, 18:15:38 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Jonas Karlman:
> Hi Heiko,
>=20
> On 3/24/2026 6:04 PM, Heiko Stuebner wrote:
> >=20
> > On Fri, 20 Mar 2026 10:44:41 +0100, MidG971 wrote:
> >> The Radxa ROCK 3B uses a PI6C20100 PCIe reference clock buffer to
> >> provide a 100MHz reference clock to the PCIe 3.0 PHY and controllers.
> >> This chip is currently modeled only as a fixed regulator
> >> (vcc3v3_pi6c_03), with no clock output representation.
> >>
> >> The PI6C20100 is a clock generator, not a power supply. Model it
> >> properly as a gated-fixed-clock, following the pattern established
> >> for the Rock 5 ITX and other boards with similar PCIe clock buffer
> >> chips.
> >>
> >> [...]
> >=20
> > Applied, thanks!
>=20
> My comments from v3 [1] was not addressed in v4 och v5. E.g.
> regulator-always-on/boot-on not being removed and redundant comments.
>=20
> [1] https://lore.kernel.org/all/fec0f25d-733a-4b6c-aef1-2ac51bd15798@kwib=
oo.se/

thank you so much for noticing. Looks like that AI thing is
working "well" ;-) .

I've droped the patch and recreated the for-next branch now.

@Midgy, please honor feedback in future revisions.

Thanks
Heiko



