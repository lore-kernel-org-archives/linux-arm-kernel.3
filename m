Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78281C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 08:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4iuFv9NTEdWlywEFlXwkd3bL0Y09KiRC4OxelSCqZ9o=; b=RXSvQiv9VDqfCWAhigPnEVGMHH
	yD6MS2/4HFCWoc8FjXDMSbv6ap4B+pfYu+l+wNUB894e4nX51lDRZNYx36pl5sVzb4ZWEi/ZW03s1
	CzcSMj98mkdtJKhXkErMDSNeAL8H80sNLTzoyPOK0ay8CAy+vE7m4u8zsp+YDV/nw+N4Wc1aYg7JJ
	ofFLwJL76yTfVM5CS3EjIJai7G5JjX6zl96R6MTNeuMWVfAkfpFekh7OM8El6PlGxDrZjzIYy0C2I
	CE/faamKTqajt/fFuCinP0v3f6yDCbSjYcVSmFwxsSl+GJgCZtjeqp5fzIvBnc2n5Fjq7eO3I3ycr
	hqy6GDJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsH58-00000007mX6-2j0h;
	Wed, 12 Mar 2025 08:04:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGnx-00000007jz6-1fLS;
	Wed, 12 Mar 2025 07:47:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=4iuFv9NTEdWlywEFlXwkd3bL0Y09KiRC4OxelSCqZ9o=; b=IVTsrl6dBifOv06yiv0vyYfOX0
	R3kd/64HVhP9boypV2Wd80GVzOdP+IdKWse+rDLX90SfXRK6h34Byt/L25sruXGE/XNwq/rRUB4Rg
	iSrOfh44wjAGey8w9r0dU+WMp1PV9Dm9RC3gQoiDSyQRPFB3hv70XW6TvoKZ8nT4wG1RP/tYoN0n3
	BYRTbZoLPJQ2Hn715GwlXsH1QUdEzVSnMCe/QtpJYztH8n5OmszS03h9WyxpBzoskZLuFt8/j3VLz
	z4t/7E3FnzzoPU7pirQhdiNpjhrEXsM6jeglcwQcZnEF9I+FPuzFsHnbTzQSbZQT3a4x5iqMvFyiW
	1dC/IXEA==;
Received: from ip-185-104-138-79.ptr.icomera.net ([185.104.138.79] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tsGna-0005zY-MH; Wed, 12 Mar 2025 08:46:42 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Andy Yan <andyshrk@163.com>,
	Damon Ding <damon.ding@rock-chips.com>,
	Jing Luo <jing@jing.rocks>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Yao Zi <ziyao@disroot.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix PWM pinctrl names
Date: Wed, 12 Mar 2025 08:46:03 +0100
Message-ID: <174176555635.249409.12410081245956028439.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310140916.14384-2-ziyao@disroot.org>
References: <20250310140916.14384-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_004705_430697_30DE6227 
X-CRM114-Status: GOOD (  10.79  )
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


On Mon, 10 Mar 2025 14:09:17 +0000, Yao Zi wrote:
> These Rockchip boards assign "active" as the pinctrl name for PWM
> controllers, which has never been supported in mainline Rockchip PWM
> driver. It seems the name used by downstream kernel is accidentally
> brought into maineline. Let's fix them.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix PWM pinctrl names
      commit: 96d8d325324639f03fcca12e4ea92265ebb24837

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

