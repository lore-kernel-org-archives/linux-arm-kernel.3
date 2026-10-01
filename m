Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF4BCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yS9qbaAkLlPU9Fc9KuYA84WC0RRI4KwBqAJVX7ftcuQ=; b=5Bk4onkN/++JnSzS7aY4tkYSqm
	J781/zS7sLM3Ba5Fq9aMOWxG0XQTf8WPKDKcLiUxG1qqQpKjVlU/6IT7Wz9OStnaqW80uVybC2wS4
	J3PdWlRr7ygccKM+/3R57STymriQRod1vYMb2YJEKIcnRTd7L6pUt+z2/v2ENWWQ6mHPNnsn97nAR
	bVBWZhl9SbP7/3aPFz7qJqT5RQYdFlzFLPEBjyMdebGFgeJDu6hqHgFXo7sTk2Mw20V2K2ZL8gDeb
	a9U2Av274hy8sR/UD7DqcWEVUps2yHnZn7CzjBsy9Cnfwb1damkzFz+RbQI145aimI61S/Aa7UU9b
	TlnCdfVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCAA-00000008AMJ-2PkE;
	Thu, 01 Oct 2026 08:29:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCA9-00000008AM1-2oTu;
	Thu, 01 Oct 2026 08:29:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A4EA06022B;
	Thu,  1 Oct 2026 08:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC5BA1F000FF;
	Thu,  1 Oct 2026 08:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843348;
	bh=yS9qbaAkLlPU9Fc9KuYA84WC0RRI4KwBqAJVX7ftcuQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=R4tHI92JvKEw/vHIct1JvsK2mQ54ppWRhnTscr6hbAmLUHyF+NWc298/5Ex/4Ilp9
	 B1wMpNd06/ARRd7DMcAP7LxxNppYh6hpfeirvmxEctAUOBkyIkYLi2qgXWYkMOs2cE
	 GFl8zgvc4d9nBOg8wNp5nUTaOLU6lCl0mtm2h7FWgcbHvd5RxYaNSvBXHYJZoAGIie
	 T0CtcFb5kXdwn73f2b72kP/hpBr/LVj+JiT1Z1W5tjG4WLh/Xau8n//UMJHpRJLQi0
	 gkWkvXseL3PK7a4nN1eyKVBYF9Jxs/QEkWBIQxKcvTBZchecE6ewL1wAB+TidYfcMl
	 fiUyg0AP8VNEw==
Message-ID: <8f9d3c610b98db28ca77b2b57175845a@kernel.org>
Date: Thu, 01 Oct 2026 08:29:05 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH 2/2] drm/bridge: lontium-lt8713sx: Drop redundant bridge
 funcs assignment
In-Reply-To: <20261001-bridge-alloc-conv-v1-2-f0a1fe040a86@collabora.com>
References: <20261001-bridge-alloc-conv-v1-2-f0a1fe040a86@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Andy Yan" <andy.yan@rock-chips.com>, "David
 Airlie" <airlied@gmail.com>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Sandy
 Huang" <hjc@rock-chips.com>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Thu, 1 Oct 2026 11:25:12 +0300, Cristian Ciocaltea wrote:
> The driver already allocates its private data via
> devm_drm_bridge_alloc(), which initializes the bridge funcs pointer.
> Remove the leftover manual assignment in the probe function.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

