Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE54D5B16C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 15:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lyIG3kyPOrhYuNzKWsPZ/3Be5W0Th8kfyhTyc9cCkhU=; b=as4EXLB33PsDWq2E6C4N2lWbI7
	2QDY3CrK8Z/byqLa+gB8XgIUiR8y8m/HdOZOi2NeivoxMoYVKG7Nl7VWXOZxlIH0c5VV7MCf8zbVf
	MFtZ1XTt5CKS5R2uvfOUH3tKiVwXFXUm1MuNo7YcgAemVD5dAZMkdSt2g/fIeLpRtEGyIu3UMg85E
	yisNAT4qttdm6Teh90N3qpbYs4ce5Am5WpK3WYILe+9Sq/JgmWfF5RzUOg4tRfbNNEPXWfzF8SY3T
	VmkPOk9aKWpcvvo7ZIsFU0GiLUME6f1P9ayLOcV1rcn+jF27cltkSVTmSRyPh+yO1C3fdwbixXqfs
	8m2Gqi5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAm8-00000003vJw-3Px7;
	Mon, 15 Dec 2025 15:46:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAm7-00000003vIi-2Wje
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 15:46:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A2E2F60158;
	Mon, 15 Dec 2025 15:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2B4C116B1;
	Mon, 15 Dec 2025 15:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765813574;
	bh=RBcP/eSO2QNmdalyQxiVfyGHG3izklUqdyBs1bazKGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nDPtDi6y6AReGXrwzZJU/MPynvSNnFn5P2VOXFwC3Q9DsyOxbJ4JcLQ73AC6qQgiM
	 RP2AdeMar9cJeS2YDWlNJMkECGX6sdIX2XPNRXldvL3HcOISkbsc5GGD87quvhyUKa
	 +MIaCU9wQumdmwhmraFETLzSMIyOQmJHoCV9ILIT0FyQCnm0GVdpNDCRIxvaIsMuYx
	 EZJqvmAEzQvWYzkTPf3Hff2OvEPkNTQ/CuFuC3AUAII53L3G16SPofInDiAwlOxNrq
	 6xL/7RrJda1tfFINlnHJJwHBkK7wTqOSq1SY9DmtxHXXxJpkY1sqNCol7w4LbM84hw
	 W7+yEkobgRV1A==
Date: Mon, 15 Dec 2025 15:46:07 +0000
From: Lee Jones <lee@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, dharma.b@microchip.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: Re: [PATCH 2/2] drm: atmel-hlcdc: add LCD controller layer
 definition for sama7d65
Message-ID: <20251215154607.GE9275@google.com>
References: <20251215090639.346288-1-manikandan.m@microchip.com>
 <20251215090639.346288-2-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251215090639.346288-2-manikandan.m@microchip.com>
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

On Mon, 15 Dec 2025, Manikandan Muralidharan wrote:

> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add the LCD controller layer definition and atmel_hlcdc_of_match
> entry for sama7d65.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 81 ++++++++++++++++++++

>  drivers/mfd/atmel-hlcdc.c                    |  1 +

Please separate this into its own patch.

>  2 files changed, 82 insertions(+)

-- 
Lee Jones [李琼斯]

