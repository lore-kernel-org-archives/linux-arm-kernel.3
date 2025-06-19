Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEDAC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 06:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DqHNEbbR8Ze7dyYo7f0QgeK+Y4R9ODp7Tnqv7tsUimI=; b=0LsPiLTck5tgiW84BBBWeFt+0I
	MMBdodxC5XK/pWLCa9Lnpx7UFtszM/CJ0+PuPB2FOpgaxBxTBWNfiSRyv+S2VY5BKIBqf+cW54Bq5
	6jUY8CoC4jCkgZOwA6TOwGvbC9lHbMyiROd9u1bJ5Kt+KMqxU1Mne/SMldBINiwrOrGy0I9NyahaC
	ixzwDfQveGsivJ7SDv4TOyb3IoW5KQjoDzNQgD4xeIX1v5djGy05at4dZ0XV3vS+tZAcpNcczVUa5
	CmmZHMogf5vPm/O50KRyLdZBWZmw+majR6tEaYbkf/5pWkKTzsA0bpvXE4CLNj7uK3sIY3Sfsbg7c
	yPSYnpiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8c2-0000000C8sZ-0FcR;
	Thu, 19 Jun 2025 06:19:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8Cl-0000000C6Md-3zBy;
	Thu, 19 Jun 2025 05:52:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750312373;
	bh=S+P2It97TueKH/kAbwyhYnXNnN0tqQNO09MpJUtK+fQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kuzMUVdAfcV/tHeVYxKywMBdeZTdXvqN6JkF+2Z+7W0I52mstLMSE7Hz5+xwDmqtO
	 v2PFVxqDnc8wJVCegk6de7OGF8y2WwNVXIQH6sZiBVmwuAG/xYSZ4m86ZXYTshMhPE
	 uSOgkuJuDxXv90Ay6AnmiSK6ASsE/SrMwPVKZ+f/m1PX4JqXuPpGqYyqA/n3TBRBKY
	 U8NBmXgQ6fum4McfnLKB/Er6Km7G+u5Jtt53+F2clY2n8HjuUO3zjnI9PIZy5yVJiU
	 AS8MLCwH0dNT0xj3wQ+cggx/LdAIwefMq0C0zkFzJXSuKCms7HflAeBODKztyHSv+s
	 MpbNWr27zyWPA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 716E717E06BF;
	Thu, 19 Jun 2025 07:52:53 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-input@vger.kernel.org
In-Reply-To: <20250617082004.1653492-1-wenst@chromium.org>
References: <20250617082004.1653492-1-wenst@chromium.org>
Subject: Re: (subset) [PATCH v3 0/6] arm64: mediatek: mt8186-corsola:
 Consolidate and add new devices
Message-Id: <175031237337.17587.18276191221301074786.b4-ty@collabora.com>
Date: Thu, 19 Jun 2025 07:52:53 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_225256_171608_9F1C69F3 
X-CRM114-Status: UNSURE (   7.05  )
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

On Tue, 17 Jun 2025 16:19:57 +0800, Chen-Yu Tsai wrote:
> This is v3 of my "component probe for Corsola devices" series.
> 
> Changes since v2:
> - Rebased onto next-20250616
> - Collected reviewed-by tags
> - Dropped driver changes that are already in v6.16-rc1
> 
> [...]

Applied to v6.16-next/dts64, thanks!

[2/6] dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
      commit: b292005d5cafb0993f7ff2c0477d5b71cbd3e387
[3/6] dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
      commit: a883bc5dc12d52a6a8d5afbd0131be55f0684364
[4/6] arm64: dts: mediatek: mt8186-steelix: Mark second source components for probing
      commit: 5349994cfd89ca17b8a820ddb41e4572d9e52b49
[5/6] arm64: dts: mediatek: mt8186: Merge Voltorb device trees
      commit: 14e8332e5c5d3b9f8ccfa1f3e0dfe05ca136ba2a
[6/6] arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks
      commit: f7ef352d45b71e6f3cb7bb572f68eaa0981e9e5c

Cheers,
Angelo



