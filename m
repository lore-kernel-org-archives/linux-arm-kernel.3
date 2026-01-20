Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80823D2ED11
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 10:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2FhviPnC5jz5ZsBAwO6tzGpttxJxSsq9OxCi424fEk=; b=35Dw3sUZKcnsb8hNXMKvRg1gad
	y86ned89lsz+yVOK7nl9oZZVGrr1LIsULZQiqCVF4IfQx3gz9xIHlwNcixQlLduKGPtCpJ2lHkzh0
	fQiGiA6etJOQSesSnOhIsVVN7JJtn3hu6F+Z7Ryt/S86jWWlUjh37Glnofh5XdKbXQPy7XnxtsmlI
	vsjlHFlbcXwKk9hQgguOzeZ21VLhW+6DiTvI2CWxI4EbQU89nc1vNxkZ7LQcZc3sLvGHJY0XdN69C
	T/28HIBWC1QpGCvYEZWnvcCIV4feuHLfAuX9pCPngEvk/0j6J2Hv3ZzTImZjDZZonLYXLfXjEp3Jv
	8rM1MoUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9DL-00000003drZ-3Tga;
	Tue, 20 Jan 2026 10:43:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9DK-00000003drM-1ThA;
	Tue, 20 Jan 2026 10:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=O2FhviPnC5jz5ZsBAwO6tzGpttxJxSsq9OxCi424fEk=; b=pi4h7G/RQR+F19rHk0ijTGxoVj
	qPB1Nop1AyfZJQbdjdJerJslw5wLJfvX+hr37AvIZmrmbwL3vOOINovFmkElnxI8vyekel45F9bTZ
	fIj7NJsOdjek1zlav7otxy9c3V9zRPGiecgTCOjSYVEL5EpBOtJrcpE7HXFlk5s0DeKivhh6ycK3v
	CH6PKEleudQCtjsiSzAhM0jNGN84pI7jSyOP0LgJtOMrGoX/nFlYYJbEo404ZYfrBOH6/x99rjsRH
	ipvUbvz3Im4c4h9GRlZqUJPeHWnukGpL/ZdSfAu4wENI1+fbAhKVuaFZxKBu2D6v9XdkExed/h330
	CsEvoOCA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9DH-0000000Dpo3-25Ar;
	Tue, 20 Jan 2026 10:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=O2FhviPnC5jz5ZsBAwO6tzGpttxJxSsq9OxCi424fEk=; b=lxZMgDnA7WGotJ0c12IMFqkU7a
	rwtU+DoqMrphu1iorjPcGFxsr1p0/WtuZXWjU9WIWLzaIIDwgRAjmFpdOQr72wpzlEwBRKSxY1jUA
	zpKgaOK1KezXk/bc0zdRwF7YZmrCBgt3CfDv/jmR5HEsJVlsQXdkH02mqs4lak3nNBx/pU6YyXQdL
	W1t7Y+39lfIc1Tmxok2lYKPNC1R9UPgCAimMDW9NEIo2H/i1hxwJBdr+RUtsyVUVsJwuwCeaPrHVM
	9QUlDYrhBFOrjOYNZHJM4IMdbqwJz7kzu0vi+vdAwxQXChIf+0jbUeOWnPBcIZNAi5VLurg7Qy9Tg
	Oqh96xGg==;
Received: from [192.76.154.238] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vi9D4-003N5V-46; Tue, 20 Jan 2026 11:43:42 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: dmitry.baryshkov@oss.qualcomm.com, Andy Yan <andyshrk@163.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, cristian.ciocaltea@collabora.com,
 Laurent.pinchart@ideasonboard.com, mripard@kernel.org, hjc@rock-chips.com,
 robh@kernel.org, sebastian.reichel@collabora.com, tzimmermann@suse.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 2/5] drm/bridge: synopsys: dw-dp: Set pixel mode by platform data
Date: Tue, 20 Jan 2026 11:43:41 +0100
Message-ID: <4083071.q0ZmV6gNhb@phil>
In-Reply-To: <20260109080054.228671-3-andyshrk@163.com>
References: <20260109080054.228671-1-andyshrk@163.com>
 <20260109080054.228671-3-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_104355_651726_4837EB4D 
X-CRM114-Status: GOOD (  10.88  )
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

Am Freitag, 9. Januar 2026, 09:00:45 Mitteleurop=C3=A4ische Normalzeit schr=
ieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> The DW DisplayPort hardware block can be configured to work in single,
> dual,quad pixel mode on differnt platforms, so make the pixel mode set
> by plat_data to support the upcoming rk3576 variant.
>=20
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

While Dmitry helped a lot with looking at bridge drivers recently,
I think your recipient list does miss a number of other people
listed as bridge reviewers/maintainers.

$ scripts/get_maintainer.pl drivers/gpu/drm/bridge
Andrzej Hajda <andrzej.hajda@intel.com> (maintainer:DRM DRIVERS FOR BRIDGE =
CHIPS)
Neil Armstrong <neil.armstrong@linaro.org> (maintainer:DRM DRIVERS FOR BRID=
GE CHIPS)
Robert Foss <rfoss@kernel.org> (maintainer:DRM DRIVERS FOR BRIDGE CHIPS)
Laurent Pinchart <Laurent.pinchart@ideasonboard.com> (reviewer:DRM DRIVERS =
=46OR BRIDGE CHIPS)
Jonas Karlman <jonas@kwiboo.se> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS)
Jernej Skrabec <jernej.skrabec@gmail.com> (reviewer:DRM DRIVERS FOR BRIDGE =
CHIPS)

As you'll need to do a v2 for the binding, please add the missing people
to the recipients.


=46or the change itself, can you improve the commit message a bit.

I assume the Single/Dual/Quad-Pixel config is a real hardware-feature
that is set when the IP is integrated into the soc? Or this a runtime
setting and a soc can support multiple output variants?


Thanks
Heiko



