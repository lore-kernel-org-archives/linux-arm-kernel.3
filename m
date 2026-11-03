Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1883E606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 15:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e2D8yrRZ;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=w9d2uCJG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LAwEtERmohTe0gcgYdg8DRctC7b4UhWjXXjRQv+Gso4=; b=e2D8yrRZ71kFMR
	Z5vW3uB0PWLESy3I0kDhtb847u62ZD4v0AwcsRaDmEYGlF1UuBiirwkzJUJIa8S+iX7szyNH71q/J
	v+RCYc8i2litR/j5x7/WFSuaY6bCjx038KQxjDAyGlL/dEGB66BNbWbjxpQ3Lh47q7G9GngBqGsGZ
	YndO+X1DmeAU0/dIx71gtMbHktQYzLobVD/LtnlmsCSR/NACGLDfxG9CpJAmomiZm4z0I6xgzqWBS
	vmQ1Awg1+xXWiYKIZab+z/uIjMexBj022y73mwhMSh556n90TwUnLvdU9RHyN6xwdGxWDw0q+uIWL
	xRV1p+JdDwPSi7uXXecQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGQM-00000002xpf-0C6x;
	Tue, 03 Nov 2026 15:27:46 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGQH-00000002xng-1z4d;
	Tue, 03 Nov 2026 15:27:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=LAwEtERmohTe0gcgYdg8DRctC7b4UhWjXXjRQv+Gso4=; b=w9d2uCJGfN9U1oYi8t2na1b7jd
	0+t+dIndUkjUy/ShDMVBFHwoR6yoBYhicS6+lFpwf0SbzMQzVds/7MRk5LuTgEZvY7pAPx7Yzooey
	WVGrI7ourwQrhXbf5IIpxMIIxKzJPmIzjSfsqnuarfzLKtZGRmHxdSw5wMn5jy4TIg54WCIo+HtTy
	/+F7fNSWhx9nk/kxZ7P4L/xHn2SzBS97Mk4B8xLKUNWX+RlIuvvWiSqRJRkKSn/hhVIx7kOKT2uU0
	N3MRdik6InzA7gA1A0Czmi6xZ9VizQ+F3FW8SSVXGR/rorIJxO4GI//tqdHxaUwChij93Z8Y7JC9/
	veXBUOMg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Andy Yan <andyshrk@163.com>,
	Damon Ding <damon.ding@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dave Jones <s.dave.jones@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: (subset) [PATCH v4 0/6] Add eDP support for RK3568
Date: Tue,  3 Nov 2026 16:26:51 +0100
Message-ID: <179371960186.385442.10929129839786622618.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030064905.2248999-1-damon.ding@rock-chips.com>
References: <20261030064905.2248999-1-damon.ding@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_072741_569762_A973FD6C 
X-CRM114-Status: GOOD (  11.42  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Fri, 30 Oct 2026 14:48:59 +0800, Damon Ding wrote:
> PATCH 1 is to document the "rockchip,rk3568-edp" compatible in the
>         Rockchip Analogix DP binding.
> PATCH 2 is to add the binding for the RK3568 eDP PHY with NaNeng IP block.
> PATCH 3 is to add the RK3568 support for the Analogix DP bridge driver.
> PATCH 4 is to add the driver for the Rockchip eDP Transmitter PHY with
>         NaNeng IP block.
> PATCH 5 is to add the RK3568 support for the Rockchip Analogix DP driver.
> PATCH 6 is to add the eDP controller and eDP PHY nodes for the RK3568
>         SoCs.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: display: rockchip: analogix-dp: Add support for RK3568
      commit: 00e97ec0a614a0a2ee7792160bfa6bde0b6a8aa3
[3/6] drm/bridge: analogix_dp: Add support for RK3568
      commit: 05ebb8bf006df13e330e82d4f42cc225ca5ceb0d
[5/6] drm/rockchip: analogix_dp: Add support for RK3568
      commit: 2ebbeea89df4dae6a7d8a2a9b2d698d893beb283

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

