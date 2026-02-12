Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6545EE3699
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 15:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ek7OISNeQ+OcU+2gcXbX00XP+56retPqfH6Ygv5ZL0M=; b=cJakBZpygUAalqqmeh6optk6gz
	vsvaDyRffTNFjAEDjC4ZJ58XZN6pZguVcMrubHQyO5WnIAqnGsKdeFjVi6/I7Ij/tkGNlbfZGGEo1
	7xWCPdcf1g//8VF/JAXSB2GBaqDwhzcpICWwhKuIPIgjqWBieiQUVz+iKuljusIrFDX+nxJ3atc9A
	CSZP8l2IW9wKBgX8dNMS3kQqe/M91hk0G8tXp9Z2VSh9/P7MGnzoxn07Fc+Zi1Kx28kb2ZFYX6p7L
	K+FmDalvYIxFTyqBLPDSMfNKmBPnfv9yZ0N4B8VtFUxYATwfNWdZleqZ7Fv5WqAnAh7l5DiUrT5iU
	FaXeTjrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqYc2-00000002GSB-2naE;
	Thu, 12 Feb 2026 15:28:14 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqYbz-00000002GRM-2XdS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 15:28:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 305834E40CE3;
	Thu, 12 Feb 2026 15:28:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 05323606CD;
	Thu, 12 Feb 2026 15:28:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5200511971B11;
	Thu, 12 Feb 2026 16:28:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770910088; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ek7OISNeQ+OcU+2gcXbX00XP+56retPqfH6Ygv5ZL0M=;
	b=PjV4fCcN2ZEOm4pvvdXsZyDrZs8FlK52ow42015KdXgtJVVmPq6MYI472D6gkxR4fo8szG
	Pav91Ud2lOZsEWKWJ4BMB6qwltYb7ruGGFWKbgvxOARtrbO9/Of82Z7eDjQswhjvK6/M+r
	m3gMjDIgG7WyE0ZoAY0pASab7kF4yf2CqLzay45CyOnF2Cqva40AHkX/drwTKN8CuMCs8P
	x04do6G2t9l/Zc6zLaIq78oLJ8qH6E3sWoK0M0bD+nfOiSaDi57Stcca86j6cQ9wB5d5/8
	Wxv3rJ0zcw9ky8cpYbkgJPRB4lCmEEzh5yXsO8Kuufkb1dQ0OpL5ZAsUxisctw==
From: "Kory Maincent (TI)" <kory.maincent@bootlin.com>
Date: Thu, 12 Feb 2026 16:26:17 +0100
Subject: [PATCH 3/5] ARM: omap2plus_defconfig: Enable ITE IT66121 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-feature_bbge-v1-3-29014a212f35@bootlin.com>
References: <20260212-feature_bbge-v1-0-29014a212f35@bootlin.com>
In-Reply-To: <20260212-feature_bbge-v1-0-29014a212f35@bootlin.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 "Kory Maincent (TI)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14-dev-d4707
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_072811_784821_AD2D8DE9 
X-CRM114-Status: UNSURE (   8.33  )
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

Enable the ITE IT66121 HDMI bridge driver to support HDMI output on
the BeagleBone Green with the Seeed Studio HDMI cape.

Signed-off-by: Kory Maincent (TI) <kory.maincent@bootlin.com>
---
 arch/arm/configs/omap2plus_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 4e53c331cd841..cdf69ac2e5126 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -486,6 +486,7 @@ CONFIG_VIDEO_OMAP3=m
 CONFIG_VIDEO_MT9P031=m
 CONFIG_VIDEO_TVP5150=m
 CONFIG_DRM=m
+CONFIG_DRM_ITE_IT66121=m
 CONFIG_DRM_OMAP=m
 CONFIG_OMAP5_DSS_HDMI=y
 CONFIG_OMAP2_DSS_SDI=y

-- 
2.43.0


