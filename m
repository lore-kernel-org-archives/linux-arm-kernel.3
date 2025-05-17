Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC53C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 May 2025 18:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=clQokNJtmi74kyyjM0dDcY90JFkHQrZucHRG0JnAxzI=; b=JGj+G1nLljemExKqoEMQQHbqji
	fjIvlX7DmuuLMplU2q8onqOPhEk/qEMjR5ypM+K+oNfR6bZgjsXZqHTDOljv1TNN0zt2j7uWxffez
	1gA2nk/2s9KFkWzMHkICEmNmLnAG1QEKiVyHgk/UzrCQ96Cqo5wJaiozAYB0Czn+5A5omg+kd24Ur
	FoM41YTKxLfmetGK+ZO75K2W6sRE+15VNg2+XSTr+oWLrTkP2MXNJAA0EFSdVJon37PpOkxX5u8YS
	TMkctGjhE1H+CmSvXLixcjx9AhEjQ+L8UdzPD2NFnMS1IkEtKIZdbtC7btScZ9gfrL1L7FblDqMk+
	RtsI1Y8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGLzp-0000000664a-2mJP;
	Sat, 17 May 2025 18:10:53 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGLxo-000000065t0-0jUH;
	Sat, 17 May 2025 18:08:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=clQokNJtmi74kyyjM0dDcY90JFkHQrZucHRG0JnAxzI=; b=ydTmVKUtw8kYkYaMbX+uCYBZ6T
	SvkkdROW4nKHAKcCUJZqacEIl8v+7eQECZnb6Spy5ii850evHw0GCBedGooeMmivLb0/EhMvxG7k/
	1jdfyGv5SOnD3g7pJq7hy0M74NfOQO0INnn/tCTNGq2iGQC4s5qeOHCdGxSLcdNJg9dgg7lxcafCj
	NcW/AAx9hSX/8xvq4H5xkhBxsb7xzMqvZrMN1eZwmhnZQ63kpOK6YeQpa2nD9XcpoNn9FCiVWZVol
	lura3vySsznWjJtg+Y4FiGAtZ6CpRQgefeX3wM5wh26MVXxMPgCYOtQbglDNRh/s6vCoq7xzRvIyo
	Rmk14AzA==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uGLxO-0003Jn-Bd; Sat, 17 May 2025 20:08:22 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Hsun Lai <i@chainsx.cn>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: sfr@canb.auug.org.au, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/2] Add support for Firefly Station-M3/ROC-RK3588S-PC
Date: Sat, 17 May 2025 20:08:21 +0200
Message-ID: <2030161.CrzyxZ31qj@diego>
In-Reply-To: <174748776864.930436.6066844378633879191.robh@kernel.org>
References: <20250516012402.580468-1-i@chainsx.cn>
 <174748776864.930436.6066844378633879191.robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250517_110848_231907_6CBEDFF7 
X-CRM114-Status: GOOD (  25.41  )
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

Am Samstag, 17. Mai 2025, 15:18:25 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Rob Herring (Arm):
>=20
> On Fri, 16 May 2025 09:24:00 +0800, Hsun Lai wrote:
> > This series add support for Firefly Station-M3/ROC-RK3588S-PC.
> >=20
> > Info of device can be found at:
> > https://wiki.t-firefly.com/en/Station-M3/index.html
> >=20
> > Changes in v3:
> > - Update the name of leds
> > - Add more cpu nodes
> > - Update mdio compatible
> > - Fix the order in the node
> > - Add the default serial port(uart2)
> >=20
> > Changes in v2:
> > - Fix rgmii delays
> >=20
> > Changes in v1:
> > - Add support for Firefly ROC-RK3588S-PC
> >=20
> > Hsun Lai (2):
> >   dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
> >   arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC
> >=20
> >  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
> >  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
> >  .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 926 ++++++++++++++++++
> >  3 files changed, 932 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
> >=20
> > --
> > 2.34.1
> >=20
> >=20
> >=20
>=20
>=20
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>=20
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>=20
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>=20
>   pip3 install dtschema --upgrade
>=20
>=20
> This patch series was applied (using b4) to base:
>  Base: attempting to guess base-commit...
>  Base: remotes/arm-soc/rockchip/dt64-31-ge463625af7f9 (exact match)
>=20
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>=20
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/rockchi=
p/' for 20250516012402.580468-1-i@chainsx.cn:
>=20
> arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: /edp@fdec0000: failed to=
 match any schema with compatible: ['rockchip,rk3588-edp']

hmm, the binding for rockchip,rk3588-edp is in linux-next though [0]



[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?id=3Df855146263b14abadd8d5bd0e280e54fbab3bd18



