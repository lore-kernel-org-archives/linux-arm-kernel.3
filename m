Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369E4C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 21:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ltcr9sTAI8y1Q3GjsOuGYEFqx1r9/X47T7MbVGcFDLQ=; b=wuNTHdDSjz614O2oUrVVvCZkt/
	eGIFXgtDIHFy58IBbhQZ8anhuKHymGMbx5K9sAxg2fSLQV/hcES7nZc/gnCJJRv0ZagDujqgbJLJu
	JRz7fu7Io+x9zFd7QXYPDZAPOGUR5tRsnHK0ISZxsROdI2McvO3SDcMqYyKOqDcNYXpVnRs8SmLVU
	sGefHXrNRSXePMZl5pxVBsoi/Hy5I6gEkhyks5U0tWjo8MeIl2gbfr9TE/Wxf1VS6VnXXMsTplpSs
	WFTTDCLYo8KxljRLD5msHfF8nC4O+3iYgcywwO1G0jtURc5LwXZb4j8R7pkhvN0URSBU26Rs3jNwB
	lxZe3FAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZFm8-00000006eCR-3ynm;
	Tue, 08 Jul 2025 21:22:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEaB-00000006SaZ-1xDN;
	Tue, 08 Jul 2025 20:06:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F22B55C6417;
	Tue,  8 Jul 2025 20:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F494C4CEED;
	Tue,  8 Jul 2025 20:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752005186;
	bh=HDLqHrKZ1e4Ds5mIXoKkXDCqyY7kRwjcE9DFq6MMAn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g4N5WICrmD6zSglt9NfiMB8vGGcYz+8jPoBYBSGZZASLbORLSJDj8OJzZUlOSSyBb
	 NG1/gudwdTanb53TJTrol3rriN3nGKwhu2X0yqBlblsbVq9M4a9gbcPO0XtTWmTqub
	 GXD517dKtNBixH3zqsm/juSs6ut5tOqKIYiRCHWr/sW04jEM2RvzW2GTYU80Iytfd2
	 7KmwiMseUVP4ROtQUU8T1c8SV40Fd/Tp7QUCkfHuS19gpuVpRddMT+DV+KQzAXRGLL
	 tBg0+9fBh6yXeipd7pnPO7Yoh/IFYEfwrl1a8iSoXs2UBTgzNOjqpY1d2pp5tId4MV
	 gQugYxuETyzwQ==
Date: Tue, 8 Jul 2025 15:06:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: andy.yan@rock-chips.com, krzk+dt@kernel.org, hjc@rock-chips.com,
	linux-arm-kernel@lists.infradead.org, andyshrk@163.com,
	tzimmermann@suse.de, quic_jesszhan@quicinc.com,
	devicetree@vger.kernel.org, neil.armstrong@linaro.org,
	linux-rockchip@lists.infradead.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	nicolas.frattaroli@collabora.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org
Subject: Re: [PATCH 07/13] dt-bindings: soc: rockchip: add rk3576 mipi dcphy
 syscon
Message-ID: <175200518482.886634.10939442043560095261.robh@kernel.org>
References: <20250707164906.1445288-1-heiko@sntech.de>
 <20250707164906.1445288-8-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707164906.1445288-8-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_130627_542857_147F8C29 
X-CRM114-Status: UNSURE (   9.29  )
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


On Mon, 07 Jul 2025 18:49:00 +0200, Heiko Stuebner wrote:
> RK3576 CSI and DSI support requires the GRF for its DC-PHY.
> The "general register files" provide additional setting-bits
> outside the regular ip-block reg-space.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


