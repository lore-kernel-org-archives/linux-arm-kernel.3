Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32B4CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 09:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGJ/LOFXo1K2Oq9DbtsxkgAibxiWQj1MuXH6r6QM4Lc=; b=LVvmW6qfo3EZioOqmskvWqgfrZ
	DTbkgT6tTWBQ0h5HisDX1/dlt5QlMckCf+St78ur6MzdKcR9kzUuo1QZQ4LPGfj7uxiGxVQ85JvOK
	09ze748peOVOcNKPQro96rWJ/9x0+AK4YdewyVqW/Qsn2M64dtd74u2cPOkCDLuMbJGOlXaYAfsqI
	yZR1RyfYvsZ4kBnMJgcRvFZwQkyhxgI4JkFnpHoDlaMv/XVuksAstFHzetpbZr/8ljImOTcumTYoD
	Sp7CIsuDdmXrjri9V6zfT5bZeEQxTVaKbolvaLziInF2Tv8Lm8LLHTguYwWsg881KHoKWqFHeQXoK
	HCsuBl8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmE3-0000000Cas6-3oU2;
	Mon, 20 Oct 2025 09:30:47 +0000
Received: from mail.simonwunderlich.de ([23.88.38.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmE1-0000000Caqk-04of;
	Mon, 20 Oct 2025 09:30:46 +0000
Received: from ripper.localnet (p200300c59748F6e00000000000000c00.dip0.t-ipconnect.de [IPv6:2003:c5:9748:f6e0::c00])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with ESMTPSA id 2476BFA130;
	Mon, 20 Oct 2025 11:30:38 +0200 (CEST)
From: Sven Eckelmann <se@simonwunderlich.de>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH mt76 v3] wifi: mt76: Fix DTS power-limits on little endian systems
Date: Mon, 20 Oct 2025 11:30:37 +0200
Message-ID: <2453774.NG923GbCHz@ripper>
In-Reply-To: <20251020-fix-power-limits-v3-1-019d2e49239a@simonwunderlich.de>
References: <20251020-fix-power-limits-v3-1-019d2e49239a@simonwunderlich.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart880480923.0ifERbkFSE";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_023045_217463_1A220604 
X-CRM114-Status: GOOD (  15.26  )
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

--nextPart880480923.0ifERbkFSE
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <se@simonwunderlich.de>
Date: Mon, 20 Oct 2025 11:30:37 +0200
Message-ID: <2453774.NG923GbCHz@ripper>
MIME-Version: 1.0

On Monday, 20 October 2025 11:20:53 CEST Sven Eckelmann (Plasma Cloud) wrote:
> The power-limits for ru and mcs and stored in the devicetree as bytewise
> array (often with sizes which are not a multiple of 4). These arrays have a
> prefix which defines for how many modes a line is applied. This prefix is
> also only a byte - but the code still tried to fix the endianness of this
> byte with a be32 operation. As result, loading was mostly failing or was
> sending completely unexpected values to the firmware.
> 
> Since the other rates are also stored in the devicetree as bytewise arrays,
> just drop the u32 access + be32_to_cpu conversion and directly access them
> as bytes arrays.
> 
> Cc: stable@vger.kernel.org
> Fixes: 22b980badc0f ("mt76: add functions for parsing rate power limits from DT")
> Fixes: a9627d992b5e ("mt76: extend DT rate power limits to support 11ax devices")
> Signed-off-by: Sven Eckelmann (Plasma Cloud) <se@simonwunderlich.de>
> ---
> Changes in v3:
> - add "mt76" as addition prefix after "PATCH" as requested by Zhi-Jun You
> - Link to v2: https://lore.kernel.org/r/20250926-fix-power-limits-v2-1-c2bc7881eb6d@simonwunderlich.de

Seems like the v2 was already picked up [1] and I've simply missed it.

Sorry about the noise,
	Sven

[1] https://github.com/nbd168/wireless/commit/3d63b5084c50607fff84d17d2727c3bab8190d8e

--nextPart880480923.0ifERbkFSE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCaPYBPQAKCRBND3cr0xT1
y4ebAQCwb9tDygtnPh36+fO93hSzJLDBcmb2cPfpL0IU63CHWAD/VAvazvuQmmS1
TBo61BmhKvF9W99jw9t2dIur+vxrSA0=
=hC3z
-----END PGP SIGNATURE-----

--nextPart880480923.0ifERbkFSE--




