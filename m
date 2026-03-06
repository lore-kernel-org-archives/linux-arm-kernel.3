Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A9FF01832
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 12:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcHErwP1yQbqfY818V8ltH+BIoWk+d2SfQ9YEfMKEl0=; b=qEh+SQQIw5l1nZtXEgCcODdt26
	WMV4QuVaHnMBeY4myqLM4GeAoojnEJjciLJqXjtljiLzSiGWPuzUC+K5T0fyA4/I0hHuYVi1fhEq3
	YD0f4RiaYQtBU5LDCTdeK47ZuxUF0vXAfvA1yShrlxIKlyuYX/uOlj5FsML/A2v7aT1Egz8jSIUbp
	TMJPRnKudVMRf/XtN+bxpoJ3pTTbU58gPvBfXvtAXmoOcyHwmmziePyi9SlhVIM7qFgGMSn2V5bn4
	J4vcKqBeomB0vXHIOcrgxWR1F5nhOl5DZbrAmJs7aT4YBV6ZZzT43w1TC2hUbQ9ZJytViu85b6Ie8
	DLRdQYTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUAF-00000003dSB-2gTF;
	Fri, 06 Mar 2026 12:20:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUAE-00000003dRy-2tya
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 12:20:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C0DAA60018;
	Fri,  6 Mar 2026 12:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F6DC4CEF7;
	Fri,  6 Mar 2026 12:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772799617;
	bh=eQ1zNeqiAjFDxjrPGD92P1W0AAqfR5sLEOVZ3IlTQ/U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GAP2vNuRnWQrrUKmXvGx/Q3s/kVH5aUX/amIVtquc+a/GfCKdDqwBNGZFqX2yEMlF
	 DZ3gMoGAFW9FUYj9xNam0sBjZmfErZqOmEVbRYSR5UuoNVUEzc4v/ceB7ZYrxw9Bgs
	 vprXV8JWHoQvAgRPdwbmifR35yAbtLIP+hf4dUarrrYWPzGn0P1zP7f6jVdAAsa9li
	 Bec7kyhIYHhu0UXSPuG5t+jDHytCgbnVOECDqy4+pFmGRet0MFKwTrYCZFkjdAwDwl
	 ebCwNx77r77MJF365ibQIOyqrGLAqDTKeAmfyFY7RiyGahGX9HEFlUVkV0SyaeW9A1
	 VSOH7yzZLOENg==
From: Lee Jones <lee@kernel.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 claudiu.beznea@tuxon.dev, lee@kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: Dharma Balasubiramani <dharma.b@microchip.com>
In-Reply-To: <20260223101920.284697-2-manikandan.m@microchip.com>
References: <20260223101920.284697-2-manikandan.m@microchip.com>
Subject: Re: (subset) [PATCH v3 1/4] mfd: atmel-hlcdc: fetch LVDS PLL clock
 for LVDS display
Message-Id: <177279961448.979425.2188993103584319.b4-ty@kernel.org>
Date: Fri, 06 Mar 2026 12:20:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
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

On Mon, 23 Feb 2026 15:49:17 +0530, Manikandan Muralidharan wrote:
> The XLCDC IP supports parallel RGB, MIPI DSI and LVDS Display.
> The LCD Generic clock (sys_clk) is used for Parallel RGB and MIPI
> displays, while the LVDS PLL clock (lvds_pll_clk) is used for LVDS
> displays.Since both the clocks cannot co-exist together in the DT
> for a given display, this patch tries sys_clk first (RGB/MIPI),
> fallback to lvds_pll_clk (LVDS).
> 
> [...]

Applied, thanks!

[1/4] mfd: atmel-hlcdc: fetch LVDS PLL clock for LVDS display
      commit: bd7b76604b3b218d0b5a32bcfaaed9eb4cc0ddb2

--
Lee Jones [李琼斯]


