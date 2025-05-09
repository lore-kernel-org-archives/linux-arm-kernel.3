Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E64C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 21:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NnvhEy7eKpv6yWsDNTdTDOS3gwfxi78lgDlzZL6Ozw=; b=CTzHIf/6UkxvCy+wj9PeuOIagb
	H3VYWpU6XzyuZlajoxtEWDjsCk3LIarqGGyZ+RQJphBiHjnF1cqhrdIowBmbtuT4dz6vq6JNUtwHV
	RxpKz6g/1KdGTOhMt4TKHH0D0uqe0L8LtS/d6/0ExZG6DUACtIOSN2Bq4IupH/hyAn6cMtLSRd35p
	gIyzqi/8/hzqDOBvnSUYjeT832ZNh5x5rI1dNfSdtT67GHCMFM6wkw9nr85EhOfwr47bAZhMR22jq
	Rp55J2cf1+7ylzj7kEIGQHCw9xxgDZUx1Abb9qdxt5rXlbnCAEVTkhQgPRrzmqRTChkH1LV3q5BGc
	Mge+Kwsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDVUs-00000004zJ4-1XE1;
	Fri, 09 May 2025 21:43:10 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDVSq-00000004zAm-0YPs;
	Fri, 09 May 2025 21:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=4NnvhEy7eKpv6yWsDNTdTDOS3gwfxi78lgDlzZL6Ozw=; b=Rzyaa8sQrkA51gLAga5MF6OA6C
	QOyGED9EqCuzTyEvYER4V7TSxNtPA5sBxfNFJhytT6GuGwLJ/cS9/TCsXxMZ9hC/KkZl1+MSuy1RD
	FNgeAraozsudfuwXEz6m7bVKnBXN2GsBW1tBQ77FseLXglNfzqCcKPe6pnP4zuQiL/uYulYW2sR1E
	N4d72gCl8sUhivv2Grw2NiQFAaYc1AxJ/aJuEpOfZqKi0AENAygPpbzTX0Mxe3Ik0kHo5RAVog1iz
	Z8syAbwzL9LnDxSkWl6/C6UKZ2gz4wA8LxZIkfdrlHhrkXJQ8DeSvPXoO7QzsyG9RrVnpQpNk8qxQ
	8OhbNE3g==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uDVSj-0006A9-LB; Fri, 09 May 2025 23:40:57 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v3 0/2] rockchip: Enable Ethernet controller on Radxa E20C
Date: Fri, 09 May 2025 23:40:56 +0200
Message-ID: <2728051.BddDVKsqQX@diego>
In-Reply-To: <20250509202402.260038-1-jonas@kwiboo.se>
References: <20250509202402.260038-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_144104_168532_97CF0081 
X-CRM114-Status: GOOD (  19.14  )
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

Am Freitag, 9. Mai 2025, 22:23:56 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Jonas Karlman:
> The Rockchip RK3528 has two Ethernet controllers, one 100/10 MAC to be
> used with the integrated PHY and a second 1000/100/10 MAC to be used
> with an external Ethernet PHY.
>=20
> This series add device tree nodes for the Ethernet controllers found in
> RK3528 and enable the LAN interface on Radxa E20C.
>=20
> This include a gmac0 node for the 100/10 MAC and its related integrated
> PHY node that only have recived limited testing. I have no board that
> expose an Ethernet port for the gmac0 and the integrated PHY. However,
> the PHY can be identified on addr 0x2 as 0044.1400 and in vendor kernel
> this relate to the Rockchip RK630 PHY. A proper PHY driver will be
> needed to support any real use of gmac0.
>=20
> Changes in v3:
> - Rebase on top of latest mmind/for-next
>=20
> Changes in v2:
> - Split from the "Add GMAC support for RK3528" driver series [1]

split from ... was that series merged already?

The linked lore-thread only talks about the series needing to be reposted.


Heiko

> - Add ethernet-phy@2 for the integrated PHY
> - Rebase on top of the "Support I2C controllers in RK3528" series [2]
>=20
> [1] https://lore.kernel.org/r/20250309232622.1498084-1-jonas@kwiboo.se
> [2] https://lore.kernel.org/r/20250309070603.35254-1-ziyao@disroot.org
>=20
> Jonas Karlman (2):
>   arm64: dts: rockchip: Add GMAC nodes for RK3528
>   arm64: dts: rockchip: Enable Ethernet controller on Radxa E20C
>=20
>  .../boot/dts/rockchip/rk3528-radxa-e20c.dts   |  30 +++++
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 105 ++++++++++++++++++
>  2 files changed, 135 insertions(+)
>=20
>=20





