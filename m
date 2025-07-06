Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A1AC83F05
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 10:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9oWZzpuBiMoMhIqwMikeRHFqBVSF2gRgoQP9QiFP2Kc=; b=NvHVuatrL9xvhOVLumS0qtqW7V
	M/DJZKzEow2LHIH71jE++OMpEpZ2LPVtnPNWJTgwMwNYJOWeYjmHWnhGfaJpSTajP1vyNZnUv2syI
	Mpxm8NyPmVcODfsKKLoBHwJMW1koSxU0QYvT4mJ7c3ckpJnMshbJrO0N0MqTIPcr//ADN2ut/t0ro
	n9LXWoIBD6fjIkwziFDARJvEgfLeO5N0olZKEwDXf4nPMUsh0c2wFt04aHzdHz0MTmu2d/fqqm6D/
	iWgcPIY8QS9k9RAe8ybclpShxUXfwvHHcQYrgWubOnjFaSSP611e04ULOw4yk3QQXIbRvlS+E72xp
	U63aQ67g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYMu7-000000009DO-2Tp1;
	Sun, 06 Jul 2025 10:47:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYMrp-00000000949-2H2R;
	Sun, 06 Jul 2025 10:45:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B8B9960007;
	Sun,  6 Jul 2025 10:45:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1983CC4CEED;
	Sun,  6 Jul 2025 10:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751798703;
	bh=relSNinZmZOhsw3SUrIKIcecYWDMki2gp5tmi3W3ukw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZD6sbyevNQWtttBPqjhEmI+oJWV/FQ7TsYfcJppRl85pe0PAb7wpjQkzoBBol/Zvl
	 3msv5fbaGw+TraDwcmPtAhuDsv/lL++0tL2w8laWmOwCYQHAxm9RQ1QEqK581SECz7
	 Vh+1rGdqqbtO/f/WPMc7vfZHzXjVeEXP1JACBt7HGNrxQJow15n/63pj9w4QbxPkyI
	 Np06V1hjKl7MPqukKPMIczLAv5NcCu8ZCUHt/1ChaEGo/fQN008wV5tJsz807jaeQG
	 xN46KtMLN0WBFd70DLbE72QW0bYk/uuOArm6U7LzrDrbOagPT37HemtrIrUKiv5VL+
	 3V1G5ZnZT4gRQ==
Date: Sun, 6 Jul 2025 11:44:55 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 0/6] iio: Add support for MT6363/6373 Auxiliary ADC
Message-ID: <20250706114455.26748e20@jic23-huawei>
In-Reply-To: <ab0a407412c705e409d9d26591543713a092c13f.camel@gmail.com>
References: <20250703141146.171431-1-angelogioacchino.delregno@collabora.com>
	<ab0a407412c705e409d9d26591543713a092c13f.camel@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 04 Jul 2025 13:39:56 +0100
Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:

> On Thu, 2025-07-03 at 16:11 +0200, AngeloGioacchino Del Regno wrote:
> > Changes in v2:
> > =C2=A0- Added error checks to all regmap r/w operations
> > =C2=A0- Moved adc_vref addition to different commit
> > =C2=A0- Various other fixes
> >=20
> > This series adds support for the Auxiliary ADC IP found on the new
> > MediaTek MT6363 and MT6373 PMICs, found on board designs featuring
> > the MT8196 Chromebook SoC or the MT6991 Dimensity 9400 Smartphone SoC.
> >=20
> > AngeloGioacchino Del Regno (6):
> > =C2=A0 dt-bindings: iio: adc: mt6359: Add MT6363 PMIC AuxADC
> > =C2=A0 dt-bindings: iio: adc: mt6359: Add MT6373 PMIC AuxADC
> > =C2=A0 iio: adc: mt6359: Add ready register index and mask to channel d=
ata
> > =C2=A0 iio: adc: mt6359: Move reference voltage to platform data
> > =C2=A0 iio: adc: mt6359: Add support for MediaTek MT6363 PMIC AUXADC
> > =C2=A0 iio: adc: mt6359: Add support for MediaTek MT6373 PMIC AUXADC
> >=20
> > =C2=A0.../iio/adc/mediatek,mt6359-auxadc.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0drivers/iio/adc/mt6359-auxadc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 440 +++++++++++++++---
> > =C2=A0.../iio/adc/mediatek,mt6363-auxadc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 24 +
> > =C2=A0.../iio/adc/mediatek,mt6373-auxadc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 19 +
> > =C2=A04 files changed, 416 insertions(+), 69 deletions(-)
> > =C2=A0create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6363-au=
xadc.h
> > =C2=A0create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6373-au=
xadc.h =20
>=20
>=20
> LGTM,
>=20
> Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>
>=20
Applied to the togreg branch of iio.git.  Initially pushed out as testing
for 0-day to take a first look and see if we missed anything.
Jonathan


