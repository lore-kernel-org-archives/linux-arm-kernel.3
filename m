Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835B2D1680B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 10:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fg0Su0U7ueZ5hvH3MyS/LvS/ABsOYo4Kv+IEpgX8MEA=; b=sAtqzuJhsBJt2FfwYqHitfarVX
	AIQBU0G7gC8f1Me7y56CZKWwfjRWjsSpFaHDhU5Sq0T9PL6KLZ1VNTemZhJV9VJNpGDQrqly1Ouys
	+63McvvOS33uXIgj/qsoenU0vltDlwQOzMRSwZVR7HD2wis35JqOCXy3Mlty38J+AmIo8ONJzZ7DK
	+TETw5OpsoD6ixrkX4HfGekAM1cmbhbOX5LZP69Annh8GuMpFiOVfDhzEmS0yhc0LV5AdcDAzfwZZ
	3CL3Eb5AsRtTTpTFzxipwiv2klF3nr1WwUcZIREf7j8+jnQbgrepQjKRoyST7XAVhdiDotCk40/xK
	mMRMoo0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAAP-00000002AbV-12SB;
	Fri, 09 Jan 2026 10:56:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAAM-00000002Aap-2XFG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 10:56:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 955A960163;
	Fri,  9 Jan 2026 10:55:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ABD4C4CEF1;
	Fri,  9 Jan 2026 10:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767956155;
	bh=jSsdAsuMK4AyU9vZfxLT0k9quVeP0qbf7NiuoqNtX/E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WwVfFtBgVNDhNZr8A5KrkACFPzarvIAA+JDvRqzoT7iSBrRGqviv3pIkQhgk/fdIX
	 W9MtuvtFkMCHnJMK9Vp4jYONhtYnD8JfH2W09VqdZGkpf7I84O9mNPATTCPU3fJKPe
	 ZsODbcr/BpuX4zm212qvWr0iIxbOKKf+ht0X/eZnzLgCNshI8L7k9ABpr2tjh/kBHw
	 rQ2ekYmJeQm4K/TWPXDDvMW5t8IqKTcwGIc+P4Pd901JjrGMFdEsrSwZsQKj68o1fc
	 DvGnM5gtXEV2Fz2AvGVVEwiZhZQ/Cco/qBvjXvWQKAX/0C4dtaTF65KMfSnm3xguro
	 IfEZfSQdNLDoQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, nicolas.ferre@microchip.com, 
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
 dharma.b@microchip.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251218040521.463937-1-manikandan.m@microchip.com>
References: <20251218040521.463937-1-manikandan.m@microchip.com>
Subject: Re: (subset) [PATCH v2 1/3] dt-bindings: mfd: atmel,hlcdc: Add
 sama7d65 compatible string
Message-Id: <176795615103.1641584.16279123145525426075.b4-ty@kernel.org>
Date: Fri, 09 Jan 2026 10:55:51 +0000
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

On Thu, 18 Dec 2025 09:35:19 +0530, Manikandan Muralidharan wrote:
> Add LCD compatible string for sama7d65.
> 
> 

Applied, thanks!

[1/3] dt-bindings: mfd: atmel,hlcdc: Add sama7d65 compatible string
      commit: 9efacd6c2fdde4fe1919034ef1b0ed666458c275
[2/3] mfd: atmel-hlcdc: Add compatible for sama7d65 XLCD controller
      commit: b323fbb6f6237fe030ac9391319b32353a4b0e68

--
Lee Jones [李琼斯]


