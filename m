Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F184CC98318
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 04:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=boCS0SjFdnwWnbkE5+zTwiuOZv4ydq9+oFzVHWADI/0=; b=bv5Wxrvb9FpnNYtPCqGQMFd+nT
	L5+ZcePnC+kquOu076h4ZSxnMMG9E0Y7K1FDi5nZEA3vMMupBteSc/ynxW6HsxrDejVwNy7SX/BgB
	Bk0KCoOTLXUtImUpDzhWXEEaT0FMXOJLSPMj9lhtNzSUVNLv3g3Tl1QuG6mShxlHyRHoSqP4JHaeI
	pM1GXliVRddQaROCsX6wj1Q71nMP3WLlPf7avGdwfe42f7ow9vezIfKjUwvFBqC7m/FAHs3vN9U8Q
	q2pJjKmcMz3442Qme5UBjbep5VEEH0x1kj/60cuZX9DjreNYl2SUjnTtxfRIqUb66btt6pmL+RUEB
	IrCaGwSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAK23-0000000Ex50-3aqN;
	Sat, 26 Sep 2026 04:29:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAK22-0000000Ex4f-49ne;
	Sat, 26 Sep 2026 04:29:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AEDC43F9A;
	Sat, 26 Sep 2026 04:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB011F000FF;
	Sat, 26 Sep 2026 04:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790396942;
	bh=boCS0SjFdnwWnbkE5+zTwiuOZv4ydq9+oFzVHWADI/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TKhnyb6h2ZXJuRPB7K6KSjYmrAU0t8F8802JIMaGkYXTN1UnVX95iG270wGedFOFB
	 OjD6OxumDMzEvCVgTvyZ26ktX2/yqIwilYPSa+gJdFsTRSNX5qefzMlMSCnDsx4Vrr
	 +uAhHNZWotyyYVSqsUYxMAIwzgmT58tKMTOIckzCBnOXX67mC61AMhNGAz3EYFtuh8
	 HUWHcMfdFv/MK7sxsB3NmrKeLBbrR2rhwGXD/dfjb6hQmTLr3z0gRdUleI6HYDsorL
	 ypNAdQuwwpqGRNMTC8FgiHLUoqQtzyZXcq6IKLegWdzWoNET0/1BbYubCck+P3poZS
	 YSpwL+UzM0iUg==
Date: Sat, 26 Sep 2026 06:28:42 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v15 16/16] phy: rockchip: usbdp: Register DP aux bridge
Message-ID: <ti26a3uyhfftlkhojhv56gxi3wzfeo7wj6a6rbm5eyqwgrxyxm@snn2psfln6d2>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-16-80e2c11d1ce8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-16-80e2c11d1ce8@collabora.com>
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

On Tue, Sep 15, 2026 at 03:50:03PM +0200, Sebastian Reichel wrote:
> Add support to use USB-C connectors with the DP altmode helper code on
> devicetree based platforms. To get this working there must be a DRM
> bridge chain from the DisplayPort controller to the USB-C connector.
> E.g. on Rockchip RK3576:
> 
> root@rk3576 # cat /sys/kernel/debug/dri/0/encoder-0/bridges
> bridge[0]: dw_dp_bridge_funcs
>         refcount: 7
>         type: [10] DP
>         OF: /soc/dp@27e40000:rockchip,rk3576-dp
>         ops: [0x47] detect edid hpd
> bridge[1]: drm_aux_bridge_funcs
>         refcount: 4
>         type: [0] Unknown
>         OF: /soc/phy@2b010000:rockchip,rk3576-usbdp-phy
>         ops: [0x0]
> bridge[2]: drm_aux_hpd_bridge_funcs
>         refcount: 5
>         type: [10] DP
>         OF: /soc/i2c@2ac50000/typec-portc@22/connector:usb-c-connector
>         ops: [0x4] hpd
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

