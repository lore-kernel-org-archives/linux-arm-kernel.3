Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7365D6ACE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 15:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDCROtvREvEUgVkyUwH97MgpoFXszQiym+Q4kYqHrqw=; b=LYruHlBM6tbhBHy9VEO+F5NPaI
	Yo6ysCBuKN48XXRj8ESkR7+DABSW3fCG3jp7aNLmDG4KHCzyMgfO//msYpMWhBk69i5XAaa4lORrt
	Lvug4cVM9n1IJgPbpy+o69yR6EC47BAe+k6FaaPck9vQLb745jVOYMY7/tZGLc+7Pg5xdayKI1ORN
	OJ6yO/6kxwFGBYajtYpBct1lfz9QYYmyqjsE2V7ziMrC7RiL9bONH6hz6eSlAydT71oNG0Plsn4bk
	LPxDRnHqa2GWH7Z4lyWCXs191ES6PXwYyQ9TAb0geoNn0VrUIWggel/erv1JuaUTvr3+T/xRvQfeu
	IG400H/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJcj-0000000DS5r-02QD;
	Wed, 27 Nov 2024 15:06:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJbi-0000000DRqh-2Y20;
	Wed, 27 Nov 2024 15:05:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C5CAD5C3A6D;
	Wed, 27 Nov 2024 15:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25E8C4CED3;
	Wed, 27 Nov 2024 15:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732719933;
	bh=sB5WsF2yTtwAJZFMBi4Ub30MJ2hXC4QT4NG4uzLcRRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ept6l6slC82V06hpuS5FuclQ4x/1Oo7ci31otvDJKT8wxxgrFr+TrYAC6SwVz7cfw
	 BTpUnHj15/vdehiZspar722ryFF4mXbbuCt7B7iYEEG/ONglHHnya1lhfZh66c9paQ
	 d80g1Tf4C3vjhBpdlBJIgs/4/BWbZUCbJffNNwUxCIA1G2//4kcw2fJpGwFsO8I+ht
	 RLKa4KxposzT9J6o+xR6nR2RHUbjYfCairL/JawkR7ruhhycSGgfGwBRZrKSX8iRXh
	 SU3PiZat6A0VKGvQ5bjVIBLXvZGisz2uChmgk89ABMHwSY4FO2uLkSOADd1cmOjvao
	 yZdAXShismNyA==
Date: Wed, 27 Nov 2024 09:05:31 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: rfoss@kernel.org, neil.armstrong@linaro.org, quentin.schulz@cherry.de,
	maarten.lankhorst@linux.intel.com, krzk+dt@kernel.org,
	andy.yan@rock-chips.com, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	mripard@kernel.org, tzimmermann@suse.de,
	Laurent.pinchart@ideasonboard.com,
	linux-rockchip@lists.infradead.org, conor+dt@kernel.org,
	jernej.skrabec@gmail.com, Heiko Stuebner <heiko.stuebner@cherry.de>,
	andrzej.hajda@intel.com, jonas@kwiboo.se,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] dt-bindings: display: rockchip: Add schema for
 RK3588 DW DSI2 controller
Message-ID: <173271993052.3509811.7014863879823500729.robh@kernel.org>
References: <20241126201213.522753-1-heiko@sntech.de>
 <20241126201213.522753-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126201213.522753-3-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_070534_711494_80418B62 
X-CRM114-Status: GOOD (  10.32  )
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


On Tue, 26 Nov 2024 21:12:12 +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> The Display Serial Interface 2 (DSI-2) is part of a group of communication
> protocols defined by the MIPI Alliance. The RK3588 implements this
> specification in its two MIPI DSI-2 Host Controllers that are based on a
> new Synopsis IP.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>  .../rockchip/rockchip,rk3588-mipi-dsi2.yaml   | 119 ++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


