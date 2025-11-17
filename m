Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C36CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 21:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQoqXyszkPiSBiq+rU2orebDLuZROYRw4j6EhNzg7rM=; b=uxa3AEo5nPfKyMVB2S+S1l+4pL
	E3QIVaLz1tu69bVNrL8BzuWnO+UaSrMseT3v4w6HUnVWkJVfrExBq9FFY4YcyB15VeBciu6hkAu7z
	1eGKD1cnnGos2AQnbZIYMOr7dIbnNSMQRxME7qU+kCfKGQEunRJWUr7IPaUCW3SL143zldm+GE9vN
	0FD4Ktyy2gZl6q3Px6E1XgLEkXYg1IlalbTx/LA6ysUACP6Mrxj7wdUfdvbXFYIpfgsQdtm2XhlP8
	iuBPAKcvthfrZRya8RyqsuV2eZQJJ7qs6Fg7ftr69p7zX3fGb5WIs1hjL+zUCDGeBT3eHd5BHhu1j
	EXd7iwqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7G5-0000000Gv6P-3xnk;
	Mon, 17 Nov 2025 21:59:37 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7G3-0000000Gv5o-0nyc;
	Mon, 17 Nov 2025 21:59:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=jQoqXyszkPiSBiq+rU2orebDLuZROYRw4j6EhNzg7rM=; b=JOPgBi/GEewTXo2hRxi6cycLfR
	zTKaPBBvqlGCHGgFcKD+s3r5y7pPj9gEEmOjeeRIi3KMEPXHr9tWJkPFkEtJ8BJf8KkhbimYGeyQs
	m/KvIMXiJWBB3OxFW6OGYmhAFZe28YdcN8DcRvWmnvoio8OnpZY4kgUWcQbRT2rNNrIbOF3jWeqkG
	hr/4G7EpeGcvgMB65Hqx9QG/A4aTnLF59gLF0odGPgBQxYbAxQy3uHXjGtrPoHINZ6fUN9d7PgjCA
	hWjf7rKn4Y+0mxtweIMTIEL7QxW1dDVrNGVfxwaymqaMxV1X2nWenOx2cinwpV6nZMNOws9PCMixE
	2bhR+AQQ==;
Received: from [31.12.4.86] (helo=phil.schlosswilhelminenberg.local)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vL7Fb-00018K-3L; Mon, 17 Nov 2025 22:59:07 +0100
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
Date: Mon, 17 Nov 2025 22:59:04 +0100
Message-ID: <176341673264.751370.3773925290539740879.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251021074254.87065-1-heiko@sntech.de>
References: <20251021074254.87065-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_135935_253066_56CDF9FF 
X-CRM114-Status: GOOD (  13.01  )
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

[3/9] soc: rockchip: grf: Add select correct PWM implementation on RK3368
      commit: 048213a38e7ac1591f725e370c152cc80dd84105

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

