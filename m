Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3472EC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 14:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0wwSQ7magdf69MQzxX0UxsZcBdvo361JwzdOgl/flg=; b=obJD5atKG1GqVOx34quoi/OCm8
	RY2ppJ+EOufQx7wxbbm1sx9Ls2wQuk7k4ujQGEPXBkBorTvUId5Izw4UQmIestuPNPotYUf42e9p1
	t/87WTid8W7B63PDU7jeW1/4ev0nXF1q7bSEUH6jPNdY4bc7bkMBHA18QLu0mSYxdAnUKce5vgMZr
	QFtmEINhPFqCX4gsBYksJ2OssRqCSOVHaftykgjl9uSCmjN4fcLtAMjCR007K2OGGfKOnse3kVXAV
	rueb1+IipKko7S8LhFjcrcw12wwiUAWIN5QrY9uxIh/8G+bNJMQvHgMdpIcdoxh04GxdM5OYxsanR
	8orB0+fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpq3D-00000008PBK-3fbh;
	Wed, 05 Mar 2025 14:48:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpokd-00000008BUW-1Pbe;
	Wed, 05 Mar 2025 13:25:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741181129;
	bh=xpWMmO1wQXH2vk0FpYl6JJDiWe8u0L3QtbU61Zx+7qE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZcYinbhivIFekiC7RNjjkEI8thGBwmjW+zc2kLFxN6YMEU1ucrnVu1BGpMyUOgXgJ
	 euhq6gKs88DuQDaNCxEsAz4WPTMP2H3uXZ10R/CEQ6/vGiSfNl2VRJHES+NtB5nUsx
	 UbM1nAkXgeBpRRVgzRX2ToDHjYHRPsJjPoGg9/QVvR+ukmWDWhZVUZOSdhK0jtpifE
	 M5/MIO6lKVPMZ7otXK4rs1AYbdJmEk4f9WFfHLBYk65iayY41EM/Dq7urue6dcbn47
	 SUKCJWHko2WzHJdrKB38iwEmj2sx0s+9/FnwO563K3BVtXHW2aQ0ukYOq7CaLhprMH
	 ikuPVAnQ45vsQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6F0CE17E0880;
	Wed,  5 Mar 2025 14:25:28 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: kernel@collabora.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Julien Massot <julien.massot@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com
In-Reply-To: <20250304-radxa-panel-overlay-v2-0-3ee6797d3f86@collabora.com>
References: <20250304-radxa-panel-overlay-v2-0-3ee6797d3f86@collabora.com>
Subject: Re: [PATCH v2 0/2] mt8395-radxa-nio-12l: Add overlay for Radxa 8HD
 panel
Message-Id: <174118112837.81899.67489907591418089.b4-ty@collabora.com>
Date: Wed, 05 Mar 2025 14:25:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_052531_531443_A89BDFC7 
X-CRM114-Status: UNSURE (   9.33  )
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

On Tue, 04 Mar 2025 15:01:54 +0100, Julien Massot wrote:
> small series to enable a DSI panel on Radxa NIO 12L.
> 
> The first patch adds missing dts nodes to expose some
> feature of the DSI0 port.
> 
> The second patch adds the Radxa 8 HD panel as an overlay.
> 
> [...]

Applied to v6.14-next/dts64, thanks!

[1/2] arm64: dts: mediatek: mt8395-nio-12l: Prepare MIPI DSI port
      commit: d4642e25bede20135d84e0ffdc234b72aaa1b6ba
[2/2] arm64: dts: mediatek: mt8395-radxa-nio-12l: Add Radxa 8 HD panel
      commit: 052cb5d105721a1bb517d278a005b0a100d27a62

Cheers,
Angelo



