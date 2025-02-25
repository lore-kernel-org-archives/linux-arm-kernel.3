Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5629DC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 09:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fg92aa/kHtkMczIbnbIzrAAnHS0WLVBR88K7lPcFosI=; b=v5L9vLIE6BHMFr43q3wUxPaxMM
	9bl6K2a6HnwI3HS88mU7I2ubI9XhuuiPBmDWp2b6YvQqNS01o0JStiBI7up77qQGZTVoCQ92aTS0d
	fY+5EWSixpBLtJmSvJZXJ47aRrgY46PzbkP+Fi0gL3mQPuuy2mSCU0Fy5IcqBnpOE8NYM3v4KseG7
	So3/PZW35kTBXJK+C5d101FbJudEPMA6cYE9unYRT9LbcEZBV5ybRaGjeCNo0PRshPLKD8yeiDJ7L
	Qs4ByjWD3R6hqZQKmeFyAM/Ag/06VL1kBYmsgRv7qn6QuG3h++h4X0t3nCWtzjJs50levB+Ym1AYK
	DF7HkBWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrG1-0000000Gam0-3MQC;
	Tue, 25 Feb 2025 09:29:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqpo-0000000GUwY-1R2B;
	Tue, 25 Feb 2025 09:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740474154;
	bh=JZ65kyyb42EYs7pE3JmcICyKoed4JwUuRQyyeLuWluo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=I9iwetpJ/xmLEUngxZav8VV48HxmV3ZZI/mpK6muc09p+Y1KOfUmNWAcmcddE7MNk
	 UBw95YeRj19GLoZRZXQatGHCQ04Aq3YQ0QMemn3IP3ajiQY9kZLl8dzfr2TkhkkxFG
	 Uxg4WV5OlM4LZ/r/NjeSZ4mGTULvyKgZpXArZBU8aV+HeLuoiQRBql+DgMCrdt3xGU
	 iXjlZoQsFHldHP9ITwaEsKr8V4hpHS3JL+A82BzY4pp0s6wTaFWfYqUsL0E6xmUEnA
	 it69Q2aT8dVEuPrfN4SAofTtXBrvug/Qw6VcTcViEz2kgqB/1ulQcyCWls6sOye09q
	 ACrj7LQyRtz3g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 74C9417E0DD7;
	Tue, 25 Feb 2025 10:02:33 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: ChiYuan Huang <cy_huang@richtek.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, 
 Macpaul Lin <macpaul@gmail.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-usb@vger.kernel.org, Chris-qj chen <chris-qj.chen@mediatek.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 Yow-Shin Liou <yow-shin.liou@mediatek.com>, 
 Simon Sun <simon.sun@yunjingtech.com>
In-Reply-To: <20250224114934.3583191-1-macpaul.lin@mediatek.com>
References: <20250224114934.3583191-1-macpaul.lin@mediatek.com>
Subject: Re: [PATCH v6] arm64: dts: mediatek: mt8395-genio-1200-evk: add
 support for TCPC port
Message-Id: <174047415339.19243.12568175700223517936.b4-ty@collabora.com>
Date: Tue, 25 Feb 2025 10:02:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_010236_525640_61129203 
X-CRM114-Status: UNSURE (   6.54  )
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

On Mon, 24 Feb 2025 19:49:34 +0800, Macpaul Lin wrote:
> Enable USB Type-C support on MediaTek MT8395 Genio 1200 EVK by adding
> configuration for TCPC Port, USB-C connector, MUX IT5205 and related
> settings.
> 
> Configure dual role switch capability, set up PD (Power Delivery) profiles,
> and establish endpoints for SS (SuperSpeed) and HS (HighSpeed) USB.
> 
> [...]

Applied to v6.14-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8395-genio-1200-evk: add support for TCPC port
      commit: b232a43b5c60a0c994cb486792d4f4c80199052f

Cheers,
Angelo



