Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE757C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 22:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xk2zYtXp4iFJHcP/Qhn8mpCV+H+S+uHHYbsnZTGXr80=; b=Pb3Li/g3VLjk1DcyxBTX55QjKW
	R7Tp1o69mS9uNbuFRyNLO8eAPsgLppznBnLxE4RktD8zv2QkW2Ro5AqKuhFF5HA41t9dkCU99vWIU
	CQACxSm/FHrxzALEhQAXmFdAPPYr8hlkcQE2D21juz7Rr5jgNCvIQd1yrpae8EDMAkLITZx/IUgq1
	qk3FPf1SzFbx9ARLPcb+fgrGHZMa1BGNnb33FMThKqw8N7a+oI0Uz1yC/QDZCIRnCCEZuPHLlkOxC
	MgXZh8BvSTKK/Q2OW97D/Kq+M2ftqbk5/0OMim54zmS9CWWLxI0cc7HRQ4OboU6TEJZ8LkHbeZx/p
	K39t3BzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to8Vo-0000000Covj-0n4v;
	Fri, 28 Feb 2025 22:07:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to8QQ-0000000CnkA-39X1;
	Fri, 28 Feb 2025 22:01:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xk2zYtXp4iFJHcP/Qhn8mpCV+H+S+uHHYbsnZTGXr80=; b=zZFpBdj3jP+VFXqjYasjuI2NW3
	yzcaqeYovFrHBY6kDmatbcRNVplUkXbLF9WUQwAkRcihNOygBSiECLkWvehFJkCn+5FJ7RK2aYZok
	fMtK3LL69+vvmjGo0ksZM/XUNHEE3J9jsM7/AfiQfSdBLc9ym3mFHf0RK/IYWIdkkDCAz8VajKyoK
	+SwrW7WV4HId4aAwU06zjRBDPh2S3hghrNNAjUPciWB0wS4ZXvon/8P9zf+/YLC4lMshNFOztL8BN
	oZci4jbpa+EtTR1DpIQ/iH7gjGKtekAYxS49YsFf1ics4LLRLRNYIJ9ZkLhX0TUuXm/FdEnMEyo9D
	kkHYgLzg==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1to8QO-0003wY-8l; Fri, 28 Feb 2025 23:01:40 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: quentin.schulz@cherry.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dse@thaumatec.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v4] arm64: dts: rockchip: add usb typec host support to rk3588-jaguar
Date: Fri, 28 Feb 2025 23:01:27 +0100
Message-ID: <174078008218.501190.3886529459427107122.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250228150853.329175-1-heiko@sntech.de>
References: <20250228150853.329175-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_140142_815654_E86F20C4 
X-CRM114-Status: GOOD (  11.72  )
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


On Fri, 28 Feb 2025 16:08:53 +0100, Heiko Stuebner wrote:
> Jaguar has two type-c ports connected to fusb302 controllers that can
> work both in host and device mode and can also run in display-port
> altmode.
> 
> While these ports can work in dual-role data mode, they do not support
> powering the device itself as power-sink. This causes issues because
> the current infrastructure does not cope well with dual-role data
> without dual-role power.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: add usb typec host support to rk3588-jaguar
      commit: c55c9e91d1643493d0434f246917aea7a2653e0f

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

