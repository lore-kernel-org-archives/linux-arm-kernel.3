Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE4BCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 17:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYh2rxKMx2Wm+Lvc6QK3nB5xBauzxm6BmT4G4eVxSRw=; b=W/IT4mTxGLN0267KiXzWCHapjQ
	LkkmPPIInVA/sonY8HMO11YguY43YW0tOmxT3mE3CpY+6C7i3a4wUpbF5AoJ7ng1sLJ6E86ZGBceM
	TZv9K8QHTMwwMYciXR9swTNmQKIJgWGmfpWAcUaoCK5cjwJAlsLYS6CyR+jP6HwUHMLkOgaf/SwRl
	YcpPUPmsQSU33Gg2eW3sAAdy/v5LxZjUdGsjJ0ops9NEiSf4LQskh7Vqt+UUaTA/MTVS3s1Ut1fr3
	4LGsDMdrbGpyGoNcx65oQBztWQ3LVjA2R0w95zcfZqhWCIY2m5UdNfuyBf/31qx0gc3QGxeYnWhfM
	3xWchkfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmDT-0000000GtZy-2DSl;
	Mon, 05 Oct 2026 17:11:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmDS-0000000GtYl-1PVo;
	Mon, 05 Oct 2026 17:11:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A80B414D2;
	Mon,  5 Oct 2026 17:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07521F00893;
	Mon,  5 Oct 2026 17:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220266;
	bh=HYh2rxKMx2Wm+Lvc6QK3nB5xBauzxm6BmT4G4eVxSRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ol/xJsFgT2Yczz6kItqZg4PP+pPv2843l7xlxzUkrJigmBhMGNe0PAkqpxaMgl7+R
	 e0rZEDY8t4JKy/E54WTLLVpxIxf4gtJKewD84TlTTR+qRVPimWeUVX/xY6VlaaGM+N
	 VoeT7ZwIZhH9zLh1L5Ci3GpGlrF9Ss8XT0RSi/BdGEJo/ibQkv88zFUfH65ZSv8iTS
	 zERF4e1IFNdmw6A/EQ+HbwGY8UNtKK/+eYoQZ3d2P69bBQgucMVeJeZ/socIyT2QlI
	 iwz6KVzrVYsvjLGn5FdXBV2iHoIIz6VWDqVhn52hWnz2mM6PV3DUmUWcK36ZPm5aja
	 yDGeUGGFxRwsg==
Date: Mon, 5 Oct 2026 12:11:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-rockchip@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Brian Masney <bmasney+clk@redhat.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-pm@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>, kernel@collabora.com,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/7] dt-bindings: devfreq: event: rockchip,dfi: add
 rk3576
Message-ID: <179122026463.1037372.13014542138147307791.robh@kernel.org>
References: <20260921-b4-rockchip-dfi-rk3576-support-v2-0-04f847016321@collabora.com>
 <20260921-b4-rockchip-dfi-rk3576-support-v2-3-04f847016321@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-b4-rockchip-dfi-rk3576-support-v2-3-04f847016321@collabora.com>
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


On Mon, 21 Sep 2026 23:15:05 +0200, Sebastian Reichel wrote:
> From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> The RK3576 has DFI hardware for monitoring the DDR's bandwidth much
> like other rockchip SoCs do. Unlike the RK3588 however, it only has two
> memory channels, so only two per-channel pclks for DFI.
> 
> Add a compatible for this SoC's variant, and add it to the conditionals
> at the bottom of the bindings file.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/devfreq/event/rockchip,dfi.yaml          | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


