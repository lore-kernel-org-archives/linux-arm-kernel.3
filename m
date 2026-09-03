Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD67C624D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 19:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y5civeCmFlsTmh7Zmp8863J7mWtdO/2OROIoAbGbr9Y=; b=WYVbsx9SWutGXSdxhvFhE/4evf
	/AXEMW30j9VNJ4UsFaVtV/8g//s6h+aTqWoiT96rb8WRC6lkgl5dpFqT6rTWtq5puaoLqd2KG4a+Y
	PFvs8wipb3R+geb9DymJ1INJDeHFu96rkq5J+w+xaCp+OdBDzHHpxzAEklS/kjTT/xXyL8D3qgwfW
	Lh3JqHul3SNmIMxN7wzH/N7mTRklH7D+sNKlZPUAihoLoqx996UXQmUK3DnR+VDMHuBnKBa8vs/44
	1TwGSPiSzjwgTTOIL693T9CWMv1C74bg9+0BN3aQ5GnMiwzwpKzH0F2qc9vZ25v9nLjIwUIs9te4u
	6v/la/Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2DNi-00000000VJm-2NR8;
	Thu, 03 Sep 2026 19:45:54 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2DNf-00000000VJM-3gzx;
	Thu, 03 Sep 2026 19:45:53 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 534F9C0000E0;
	Thu,  3 Sep 2026 12:45:49 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 534F9C0000E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1788464749;
	bh=yt3VLOBBwuy+nvp951odgPQGWGf1+Q+4ara129mGyTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r2O6d2Sfl0xbQJ7xDtWxfdaGOG35EsSuR4aaSkZqCXq4nSi49W9mBOvh2xTh4VcKt
	 WgIIUe0GcnPicwUkDQKwA6DMFf99Ra22jBplhdL3qZPAEOyZeK60wzgyc73MEJbqT7
	 SxKhrcKKUoPH94zsC5gN/x7XEURLN7/rouNyY7zU=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 1B953A9A;
	Thu,  3 Sep 2026 12:45:49 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: bcm2835: Add 2712-d0 Stepping
Date: Thu,  3 Sep 2026 12:45:48 -0700
Message-ID: <20260903194548.2038308-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810-bcm2712-d-stepping-compatible-v4-1-73f74479539c@linutronix.de>
References: <20260810-bcm2712-d-stepping-compatible-v4-0-73f74479539c@linutronix.de> <20260810-bcm2712-d-stepping-compatible-v4-1-73f74479539c@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_124551_984347_0F48F49F 
X-CRM114-Status: GOOD (  11.27  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Mon, 10 Aug 2026 13:46:33 +0200, Gregor Herburger <gregor.herburger@linutronix.de> wrote:
> The bcm2712 SoC, found on the Raspberry Pi 5, is available in a d
> Stepping and in a c Stepping. The two steppings are not compatible.
> 
> Introduce a new SoC compatible string together with a new board
> compatible string.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

