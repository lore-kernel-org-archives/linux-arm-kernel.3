Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E55C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 15:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tViOkyA/B0HUKG8BRi0qjbMNTIz9tdb3LL+LdxZCQMQ=; b=dhyruYMnUEGZ9c3oZYUZ3/Zix/
	cDtOxP3wRtdTbayymYPSSLWrr8vzUJRnP0vcpDdLDrJN35ShThAQP9irhEWJ0sGjkiukDb45S69/2
	DFDhwK0dkW9HWzb+GM4qiOldLlOuiFkTFROD6EFaZhNAQluB4nyIBdjUj1c8Ey1tvH86ZQKys+j6B
	NCzuro7cdefXRoVF/BRRLALcnTzUlPwf/LrkdBtgSIr/FE/fzx16clKD1ebeHyW8OgpRsKPXyOW6h
	vOliMoHAc6B3Dvw0acv5rN2sT0F0VfS0WzY9z3mB6fcsr6P+c9vu7MfLN+4LQOeDSpvlUI6AhsPg4
	wdrbchaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6gs-00000008TPX-1aeC;
	Wed, 29 Jul 2026 15:59:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6gc-00000008TJW-3Mxc;
	Wed, 29 Jul 2026 15:59:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=tViOkyA/B0HUKG8BRi0qjbMNTIz9tdb3LL+LdxZCQMQ=; b=Bfr8GTt3+HDBETbuAuSZ/Dj4ed
	hhwoJkGHWto0zNltFAYR9JloFvdB1B7KomjGs6/BhiwWC+pUoFgQ0QfxIjv+GGpp9/+qX4HCjaVkn
	6/sooYs4dsZvi1wY38x7Hqfv0egbzVv32xnRWc+YuqZF3FiHZhALiIB/0dLDpb+mt6i+Z8AVbBKW4
	mat3+DBP+GwjJU5DD8w6yflhovGcSqVb/ZawSn8ln83IvRO9rPwmCPDGuwBrib0/z1fIgvAvQr5v4
	MC3FqE17sJMToZ/UO3Az6LFMllobIcCSzvC5kuFQuycNmCh26e3g3G/y9WPP40W7XO0KjQDpN4W9I
	GZlWjCzQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: Drop data-mapping from Engicam PX30 Core
Date: Wed, 29 Jul 2026 17:59:03 +0200
Message-ID: <178534073340.533990.10934043869584032991.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727175502.2585290-1-festevam@gmail.com>
References: <20260727175502.2585290-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_085914_844324_84DB3567 
X-CRM114-Status: GOOD (  11.24  )
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


On Mon, 27 Jul 2026 14:55:02 -0300, Fabio Estevam wrote:
> The panel-simple schema only allows data-mapping overrides for panels
> whose mapping is not fixed by their compatible. Consequently, the property
> on the Ampire AM-1280800N3TZQW-T00H panel fails validation:
> 
> (ampire,am-1280800n3tzqw-t00h): False schema does not allow ['vesa-24']
> 
> The panel descriptor already selects 8 bits per color and
> MEDIA_BUS_FMT_RGB888_1X7X4_SPWG. The DRM OF helpers translate
> "vesa-24" to that exact bus format, and panel-simple falls back to the
> descriptor's format when the property is absent. Removing the property
> therefore has no functional effect.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Drop data-mapping from Engicam PX30 Core
      commit: 9f23009c60a3787c9bdb1eedf725a691537dfd5c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

