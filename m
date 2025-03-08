Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB49AC28B25
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 16:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2BsNafZeYvp9wbkGN2qGL99O0ortwb9hsZ0gqUcIdA=; b=fmie442Z28O0fZpWZd3XwDUaTd
	4v12ybEb7qwsztrG6RhAfcaZK4B5wAaKv/N7dVfA0M9cHPjykVxHyqtxZbiqkMGg75tI/CksiCt+6
	XFXND2Q1Epp7lFYEYJfsGtlQvVIknP/rqZ5JabgrtZh5C+/Auy0w4ZyGYdWXCypJxGVilt22ub87N
	ihm8M+fjI9z1BmRpXEKlqoYCHlhaIshTBmMueo5rTvP83Uw30LCrZHaHaT+PmMMYlDkxQzzYeXAfe
	jX/HFUj/e9Ia9R789ypKOmCcVJtlK/UXRa74UStz+2SbBxZaU81Gi2nPPZUe76TbpMYwSaxmKt2jS
	Es3kNYJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqxQg-0000000Gtpt-0eQi;
	Sat, 08 Mar 2025 16:53:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqxP3-0000000GtZw-00PM;
	Sat, 08 Mar 2025 16:51:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=H2BsNafZeYvp9wbkGN2qGL99O0ortwb9hsZ0gqUcIdA=; b=EZ1vdrVVdILyYK9dTDvtM7OoD3
	+qArpJvcSeElp9yPV81y5wQCiFYrtzFh4jIwIPPbd6kNm0oYAfywwQHxioFHDr4yRgXKaR5ALGwjX
	dWHgcLVL3kaRYIDyjT+zmCjLyOsukR/DtVn2w+3Tti8XIb/qFTCG+LMSftEPjWJYXp9HhkEjt5pg0
	qUFZEsG7r3zj3E6PLaJI9HmBpPVt32OM4Q0yw7keWSjLVCfudBHVtOmS+Mqv3N8asn/rA5B/exSz8
	YARA9KImzZKKEtHtbCxfmSdeLgkPIC1dWkkTg+UNRzk6dG4iFZMBGCpgywcb0QvmYolvJnOFsTSlR
	97cq09TQ==;
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqxOw-000463-O9; Sat, 08 Mar 2025 17:51:50 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andy Yan <andyshrk@163.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH] phy: phy-rockchip-samsung-hdptx: Add support for RK3576
Date: Sat, 08 Mar 2025 17:51:50 +0100
Message-ID: <5069079.31r3eYUQgx@phil>
In-Reply-To: <20250306-rk3576-hdptx-phy-v1-1-288cc4b0611a@collabora.com>
References: <20250306-rk3576-hdptx-phy-v1-1-288cc4b0611a@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_085157_036127_AA712413 
X-CRM114-Status: UNSURE (   8.67  )
X-CRM114-Notice: Please train this message.
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

Am Donnerstag, 6. M=C3=A4rz 2025, 20:29:23 MEZ schrieb Nicolas Frattaroli:
> Despite the compatible already being listed in the bindings, the PHY
> driver never gained explicit support for it. This is especially a
> problem because the explicitly listed PHY addresses need to be specified
> for each SoC.
>=20
> To solve this, add the compatible, and a PHY config, with the address
> gleaned from rk3576.dtsi.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



