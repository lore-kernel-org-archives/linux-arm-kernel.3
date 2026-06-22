Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36734CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 13:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1/4BohhGo2EUrrvlpDhy0cqXEeTRxTzPlRg0AoQPr4=; b=iJbXYfmIGq2BS/CrgGYLkxu8hS
	9DpEHOMW6X7dTwulRtqTf1toN13206K1v67T/JyTmuWTk2MOuXx6Se/UBHAYEJH3SOKN213hBqjAH
	mN4kMf8AbLpaXA0+FdRJSt5kDsr871N1DYPbsW++X2VaTLPcqnegNWuOvVtmtLtwH8RmVzruByTep
	Na6i+CRTR8ddwfx19FNeUWQNwzd+zIkhqz66J6hp2kO2U20GaB5I+fKI4XVKbWtbJGRzbmyIU/G+X
	tRJ8uLvQP6+TK9sJPIRl6GUFHPuyoJDLdDv03axrr+VcdWqIwfxWwaJeErGvmtGRIbjJCUZ5Ot+bZ
	puTgzvow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbeeY-0000000518V-0l0b;
	Mon, 22 Jun 2026 13:25:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbeeU-00000005188-24ZZ;
	Mon, 22 Jun 2026 13:25:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D29FD601F0;
	Mon, 22 Jun 2026 13:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8BB1F000E9;
	Mon, 22 Jun 2026 13:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782134725;
	bh=t1/4BohhGo2EUrrvlpDhy0cqXEeTRxTzPlRg0AoQPr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IZP4GKUdpXZ+B97QpIjc0FrjAYvpNtY1aUIlYxeckr2egsgSmZSHCnOfOXlBnjTLR
	 fpH9nKQblmVzdoytoSbVCqKxLV+cL8Q/wzIViiWMjo58VBhDD2fXztw8EJ9i/pqdbu
	 BHpBW3C9wxTGlqLlaIUHbOlQdNnrfF+ea7eb1i0ThrjY18vkwAb2PnHm/PpPgE3ftM
	 GR2/5RpG9LVytCklSbxeGe/tOdbnsaU6Je/kw6xnnoB4A29fGuf33CIqKemCcXz2Ed
	 /90h+rBYCu8V2XZAUScJF2kLzErXsLJ8FdIUIZa/xXZRkXlx+9OqGorlBsVKOKtVN2
	 DdkJPUfVoewCQ==
Date: Mon, 22 Jun 2026 15:25:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, kernel@collabora.com, 
	Andy Yan <andyshrk@163.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: display: vop2: Add missing reset
 properties
Message-ID: <20260622-magic-unbreakable-agouti-85cad0@quoll>
References: <20260617-dw-hdmi-qp-yuv-v1-0-a665cfd06d7d@collabora.com>
 <20260617-dw-hdmi-qp-yuv-v1-1-a665cfd06d7d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260617-dw-hdmi-qp-yuv-v1-1-a665cfd06d7d@collabora.com>
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

On Wed, Jun 17, 2026 at 09:51:54PM +0300, Cristian Ciocaltea wrote:
> Document the VOP2 resets corresponding to the AXI, AHB and DCLK_VP0..2
> clocks, which are common to all supported SoCs, plus DCLK_VP3 which is
> provided only on RK3588.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  .../bindings/display/rockchip/rockchip-vop2.yaml   | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


