Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C8FCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 14:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgOhBWr0VH5vsqKN3OIl1v6yHrxWu6HVlafZRGepUuY=; b=hWlY7Jt460fDlcFCYta2CPtlnk
	cVKBwcR5EHx7W/M5ohVNicxkgobalWNYgA5kIFmLFaap4wJzKIkBIuwJ8j9qMq6GqYHlYuIakTJhe
	ZKCbhvP2Y8a7rZ3+a+Watdu9BE7OQXqHgDe5/ftLoRoXMGdMKr7WcCyjTQCE5fro0bSEU2Kr3meK6
	qq8mW9ghflJaIVLVW5NX1IQ4/lAyn/zpu2zYA+zgwdLNlB0sl12LKMrgJs0dfIW7vc5xKez3lEprc
	zQqHbKNneUtWupGS8kc9d9hbf6tl/WBTtPo9BPCvHRDzZXzCrtSTeOmKED4JY2rvYz3ugT665aqWA
	YoUL4fPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uppRo-00000004rvh-2GHV;
	Sat, 23 Aug 2025 14:42:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uppLW-00000004rJQ-3RNP;
	Sat, 23 Aug 2025 14:35:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=qgOhBWr0VH5vsqKN3OIl1v6yHrxWu6HVlafZRGepUuY=; b=q0plEv6FrjIOqQEFTKYMVTWCFU
	pG9D2Y0KESLkIMyT8pGdkHgwR6I4cT+0uoSMIMpGqUzJOhvN+aVl9C04Ezv+hWciV4e5M2dhSn2nT
	O2LVNiWGjWfAlp6n+RYaFGG469Az7nawP0Li6p0m42FGrCHntxNlw1Lyy7w6phzshxFM99LCbOLaZ
	MPy+xaZZZcGOlfcDXbpw8Ffp0IRCbjARsSQs4y7fnmZz50ZF05hMEmKqmM2Q9sDiItBCacb8IDdcZ
	Xr+F6G73ZjnMNp2MmWyB69u9A5xwDQSTEmkr/uIZxzmKDDqjEeWxmQ88FMaJFjijsyQyXkPstF4Q1
	BcVPZOHA==;
Received: from i53875b90.versanet.de ([83.135.91.144] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uppLC-0000VC-06; Sat, 23 Aug 2025 16:35:34 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: dmitry.baryshkov@oss.qualcomm.com, Andy Yan <andyshrk@163.com>
Cc: hjc@rock-chips.com, mripard@kernel.org, naoki@radxa.com,
 stephen@radxa.com, cristian.ciocaltea@collabora.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 yubing.zhang@rock-chips.com, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh@kernel.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v7 04/10] MAINTAINERS: Add entry for DW DPTX Controller bridge
Date: Sat, 23 Aug 2025 16:35:32 +0200
Message-ID: <6121390.uKWtJMOXK1@diego>
In-Reply-To: <20250822063959.692098-5-andyshrk@163.com>
References: <20250822063959.692098-1-andyshrk@163.com>
 <20250822063959.692098-5-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_073554_883947_668B4141 
X-CRM114-Status: GOOD (  14.25  )
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

Am Freitag, 22. August 2025, 08:39:48 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> Add an entry for the DW DPTX Controller bridge driver.
>=20
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


> ---
>=20
> (no changes since v5)
>=20
> Changes in v5:
> - First included in this version.
>=20
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cfa28b3470ab6..0ae7d13c2b3c5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7999,6 +7999,14 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
>  F:	drivers/gpu/drm/panel/panel-synaptics-r63353.c
> =20
> +DRM DRIVER FOR SYNOPSYS DESIGNWARE DISPLAYPORT BRIDGE
> +M:	Andy Yan <andy.yan@rock-chips.com>
> +S:	Maintained
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
> +F:	drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +F:	include/drm/bridge/dw_dp.h
> +
>  DRM DRIVER FOR TI DLPC3433 MIPI DSI TO DMD BRIDGE
>  M:	Jagan Teki <jagan@amarulasolutions.com>
>  S:	Maintained
>=20





