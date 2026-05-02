Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8FECD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 May 2026 10:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Subject:Message-ID:From:Content-Transfer-Encoding:Content-Type:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BbnEszm/PmeV98ZXBrarbNHFdx3a5ydIzCvCJ4oa3xg=; b=JgHLEbMKEiP3WHj9gSCzorjI/9
	IHjYbwdBHUC872iOq1o3cTaKw4H3h/yeECDG5fKTGm+7r4OwDpXMh7rEnvxMg+gcMSE2ydNvkJkUp
	/LstkG7S/2GSDjadDClqu/pY+Y+IFW84Fhc+LW5Faqx5FzVtYVfYlsVMMXfpB2wJ/1cjW+8Tksqd8
	jNCXZWVNN4YyCA5Dp0TbtYaZSzrh8IB4hETSf8fH3dHqBxtCevQQxDY6/U96A/WIgp/RKdcO8JEQg
	cdmQgCjrx3dVI3cPFetIFwQy0Y0o3x/aAB4xko+CP65ShzbNqR/W3VOYVVdzJN0BAOGh9gVT2czoK
	+BCJQODw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ7Ui-00000008nal-0fSs;
	Sat, 02 May 2026 10:22:44 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ7Uf-00000008nZ3-04cj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 May 2026 10:22:43 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777717349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BbnEszm/PmeV98ZXBrarbNHFdx3a5ydIzCvCJ4oa3xg=;
	b=DZ+RtjeOqUIRi7xLXEr2nmh+M7SqhdoverehoZWlI9YrMO0UF9jumTDJB1ZzEZP+54X9QG
	ivwkbLBRErJisC9xJDm478D8cYtLjO82TLc4HmMGf3piEglx4uF3FV64j1Or6aF+8754V5
	pRaASGAWwj5Prm01IHLeg7nqanlmIUI=
Date: Sat, 02 May 2026 10:22:25 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Frank Wunderlich" <frank.wunderlich@linux.dev>
Message-ID: <7a4d6015e991aaf80b9ffcaaf8fa76799d56649a@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v2 0/4] some BPI-R4Pro dts updates
To: "Frank Wunderlich" <linux@fw-web.de>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, "Daniel Golle" <daniel@makrotopia.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, "Andrew
 LaMarche" <andrewjlamarche@gmail.com>,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260412092333.6371-1-linux@fw-web.de>
References: <20260412092333.6371-1-linux@fw-web.de>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_032241_636698_759DFDFD 
X-CRM114-Status: GOOD (  10.00  )
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

Hi

just a gentle ping

do i need to change anything? i wonder why i do not see this series in de=
vicetree patchwork...

Am 12. April 2026 um 11:23 schrieb "Frank Wunderlich" <linux@fw-web.de ma=
ilto:linux@fw-web.de?to=3D%22Frank%20Wunderlich%22%20%3Clinux%40fw-web.de=
%3E >:
>=20
>=20From: Frank Wunderlich <frank-w@public-files.de>
>=20
>=20There are some parts of BPI-R4Pro DTS that need to be changed. Curren=
tly
> there should be not much users of the mainline-dts and we noticed some
> things while openwrt integration.
>=20
>=20v2:
> - added mgmt port renaming as this patch is still outstanding to keep
>  all in one series
>  https://patchwork.kernel.org/project/linux-mediatek/patch/202603032020=
06.37515-1-linux@fw-web.de/
> - dropped default-state in gpio-leds patch as suggested by daniel
>=20
>=20Frank Wunderlich (4):
>  arm64: dts: mediatek: mt7988a-bpi-r4pro: rename mgmt port to lan5
>  arm64: dts: mediatek: mt7988a-bpi-r4pro: drop duplicate fan properties
>  arm64: dts: mediatek: mt7988a-bpi-r4pro: update gpio-leds
>  arm64: dts: mediatek: mt7988a-bpi-r4pro: rework pcie gpio-hog handling
>=20
>=20 arch/arm64/boot/dts/mediatek/Makefile | 8 ++++++++
>  .../mt7988a-bananapi-bpi-r4-pro-cn13.dtso | 20 +++++++++++++++++++
>  .../mt7988a-bananapi-bpi-r4-pro-cn14.dtso | 20 +++++++++++++++++++
>  .../mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi | 15 +++-----------
>  4 files changed, 51 insertions(+), 12 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r=
4-pro-cn13.dtso
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r=
4-pro-cn14.dtso
>=20
>=20--=20
>=202.43.0
>=20

regards=20Frank

