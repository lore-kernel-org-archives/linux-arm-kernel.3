Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF350CFA446
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 22:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OyW98MyVGluZyeY1kwgWwup1uQtdsCROzoZ+Bj7trA4=; b=tQzJ8skCFWBi0/Ody/75ZH+R90
	cZgxVjsQ4F/13SDn+29Ghs3puIKwckboMqK3dy80J4dVygW8hhU1nQuk35LZZIqHvr1t1Jjw9wAM0
	W6WhSNWPLL693cQYOGi4S28NfJXl4Hk2TPs7KAFcovGKMwIShonByzzuH9eM9VkOmgWGL1Jka5mMp
	3w0HxmCu0T5WmHbjTiAC9Ac7qjFHozwC3dPfFGwGJakP7aEoz+15r65BthSeSDcBmKMXdd2bJ/Cpv
	9lFFvkV7251PDvbIxP0XOI2q9LBJl+9nYMS/0xiQgT3CDZhL8ALrVyZlGyhX51GQ4cZfsxgb9D0uj
	fzZh9q8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMD45-00000007WTy-0Na3;
	Thu, 20 Nov 2025 22:23:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMD3k-00000007WAe-2V3e;
	Thu, 20 Nov 2025 22:23:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=OyW98MyVGluZyeY1kwgWwup1uQtdsCROzoZ+Bj7trA4=; b=OBm2keIBPeVxXl+78MDMqh3qqc
	wNc1Ueesv/PDgbLlCqouIVleCKjusPwyFQ8/yj77Ku6fK02e6xZQOm06yBeCD+W2+X/1rHnEygAhl
	/rt0b79HeoXK7/8K7BZG9TiP25tYxrnaGdH7ry8RdQyiOiGAjHMcYKfros3O1PBg72arfQgxeVYPZ
	VPp7xjEhbA3l1rxKsL7wc3bwZ4jw6rvUJea8DbwrnT9df4I0SCCqkdpmAhih3d5a4yMT/dmXuDaQX
	P0B0UmvEg8cdac1QlC7/7UqcdVRYRP51d8bTTc3TREsCshxJkJOfYH2aiWdKJr4oAtBAaQSFHb24l
	BLkzUNew==;
Received: from [213.192.12.196] (helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vMD3X-0007Je-V9; Thu, 20 Nov 2025 23:23:12 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	andy.yan@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	cn.liweihao@gmail.com
Subject: Re: (subset) [PATCH v2 0/9] General RK3368 HDMI support and 2 outputs for RK3368-Lion
Date: Thu, 20 Nov 2025 23:23:00 +0100
Message-ID: <176367711171.9778.9000322898026906278.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251021074254.87065-1-heiko@sntech.de>
References: <20251021074254.87065-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_142324_660309_D0C1B54A 
X-CRM114-Status: GOOD (  13.29  )
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


On Tue, 21 Oct 2025 09:42:45 +0200, Heiko Stuebner wrote:
> This series adds the necessary bits for HDMI output on RK3368 and enables
> this on RK3368-Lion. At the same time, use the recently added DSI support
> to enable the generic Video-Demo-adapter as an overlay on Lion as well.
> 
> 
> The reason I'm shaving this Yak is that the recently added DSI support
> created DTC warnings about a single endpoint with an address.
> 
> [...]

Applied, thanks!

[4/9] arm64: dts: rockchip: Add power-domain to RK3368 DSI controller
      commit: 8319be65e860a2881e5213ed95e03992037bf5c1
[5/9] arm64: dts: rockchip: Add power-domain to RK3368 VOP controller
      commit: f54b09d46f72e4548e14476ba771231b0ec2b0af

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

