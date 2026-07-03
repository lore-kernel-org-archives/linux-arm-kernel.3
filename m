Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD83C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 11:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2xPR8IWnso8IjH2nLJy+b/+q8P+tzYbQPS2oGyK6YQ=; b=Dw/LTlpc/kJkw2XuO9uQVrvuKL
	WjhCLUUs21VONIuIe1W3/IGRVCb+kb5RXxEZxGuNmgTAhi3YdzJAkI3e/70xYndqvfcgS52PgIGTS
	4OTu+ddniedxfasIfuoSrU/Fusts/YPLaQIXICkPSBFtYhaXfisgOD/RAqnAwuOAxp/VvvLygpCza
	gBYpF29nQQHu5uwaHkus1MGKJnCHiNA4ZbCdKk5LqEpQ6s8O+vkaEUlHcVmULvUVf94TFVwTqXa9w
	YdTSWiTUH/S50EqL+C5jhXlIpqiSjNES+ccaO4L9LRdPmTcafME4v3Uge1M1EINCg8GRWgQ0MqVCn
	LatAJc3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfc6j-00000006oIq-2ANi;
	Fri, 03 Jul 2026 11:30:57 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfc6f-00000006oHD-2zNp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 11:30:55 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1783078247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B2xPR8IWnso8IjH2nLJy+b/+q8P+tzYbQPS2oGyK6YQ=;
	b=H3twqUy7J3ycAYI72Pj49oybYNsTsjsBOOlLwuvbxFw4FnlcMFxNfpJ5xNtR9DO/92spSb
	XgNHUVMXKZv3rbCVI/kYOIzSoESyyB9Os8BFjTQ/m8ssWR5yU6tnOA1JfnZSq8EEL3atJj
	VMZWmLXgdR9GxeZxGEb+VyqnbP1FurCbBHdLkBodNmkjwrgzUTexzOuT7Vxn5pFHoeJm52
	C2KM2YHexwugJ1CC6dfzF3l4CiDD5SsuTktTUkBDbPerX5xAb5xcv8lJOdDa6RkO/eKP20
	COBOn7XBYkUbmCX6TYF8Thom4CBLVPs1C0pf0gyFCQPUzGJosXPwCECRs5Wwnw==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 13:30:44 +0200
Message-Id: <DJOWHH5K7P76.3JPJVO47K1SZE@cknow-tech.com>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH 00/12] arm64: dts: rockchip: Add NanoPi M6 board
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: <joachim.eastwood@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
References: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
In-Reply-To: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_043054_355936_93B57467 
X-CRM114-Status: GOOD (  20.83  )
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

On Fri Jul 3, 2026 at 12:07 AM CEST, Joachim Eastwood via B4 Relay wrote:
> This patch series add support for the NanoPi M6. This board is very
> similar to the NanoPi R6C and R6S boards which are already supported.
>
> Main differences:
> * M.2 M-key slot with PCIe (Also present on R6C)
> * M.2 E-key slot with PCIe and USB (from hub)
> * 1 additional USB 2.0 port from an on-board USB hub
> * RT5616 audio CODEC

This seems to be the M6 (2405 aka 'V1')?
Because there is now also a M6V2 (2603), which uses an ES8389 CODEC:
https://www.friendlyelec.com/index.php?route=3Dproduct/product&path=3D69&pr=
oduct_id=3D319

Is it useful to already take the 2 M6 variants into account with this patch=
 set?

https://wiki.friendlyelec.com/wiki/index.php/NanoPi_M6#Schematic.2C_PCB_CAD=
_File
https://wiki.friendlyelec.com/wiki/index.php/NanoPi_M6V2#Schematic.2C_PCB_C=
AD_File

Cheers,
  Diederik

> Patch 2 and 3 moves a bit code around. Please let me know if those two
> should be squashed together.
> Next few patches adds some missing bits the common nanopi dtsi file.
> While the final patch adds support for NanoPi M6.
>
> All changes have been verified using the schematics for M6, R6C and R6S.
> Only M6 have been boot and runtime tested. Tester for R6x are welcome.
>
> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> ---
> Joachim Eastwood (12):
>       dt-bindings: arm: rockchip: add FriendlyElec NanoPi M6
>       arm64: dts: rockchip: refactor rk3588s-nanopi* to support M6
>       arm64: dts: rockchip: move NanoPi R6 code into common dtsi
>       arm64: dts: rockchip: rk3588s-nanopi: add missing sdmmc cd pinctrl
>       arm64: dts: rockchip: rk3588s-nanopi: remove pull up on rtc int pin
>       arm64: dts: rockchip: rk3588s-nanopi: add missing pcie rst pinctrl
>       arm64: dts: rockchip: rk3588s-nanopi: pcie2x1l2: add clkreq
>       arm64: dts: rockchip: rk3588s-nanopi: remove always-on from vdd_npu=
_s0 reg
>       arm64: dts: rockchip: rk3588s-nanopi: remove useless vcc_3v3_pcie20
>       arm64: dts: rockchip: rk3588s-nanopi: add gmac1 add phy-supply
>       arm64: dts: rockchip: rk3588s-nanopi: remove bogus vcc5v0_usb regul=
ator
>       arm64: dts: rockchip: add support for NanoPi M6 board
>
>  .../devicetree/bindings/arm/rockchip.yaml          |   3 +-
>  arch/arm64/boot/dts/rockchip/Makefile              |   1 +
>  arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dts | 200 ++++++
>  .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 792 ---------------=
-----
>  .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts |   1 +
>  .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dts |   1 +
>  arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi   | 800 +++++++++++++++=
++++++
>  7 files changed, 1005 insertions(+), 793 deletions(-)
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260701-nanopi-m6-ffeef7252fd7
>
> Best regards,
> -- =20
> Joachim Eastwood <joachim.eastwood@gmail.com>
>
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


