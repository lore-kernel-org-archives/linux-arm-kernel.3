Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4F3C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 10:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7a7FiRj9irmW2vcBF4GcopZzHO/rYoKbMXIliVZxUlo=; b=m+q+K7+ptb/MSbOfTeK+dGD9wy
	Y53PIrZcO8iAB48Jm/rvSMAERXdZAsqMXsnKsLpIpOFlACEmwx5LCJ57ym3z2eqr7WjuM7/aVMsny
	MHsTnuW9hjuvHwvV4GGCW3KkCh76cXzl5qNsoVbDRJ1agJXS2MsmESsUyOern03BxpusyGEKdvTmK
	5NkLHEAeNibhGDITFgDobAeRavEBnLSF+qAHUZApfwR/FaFbJ8sa0JUYCHFGXzE0/z5po3n49pYlh
	JsqG1gI2Ugjof6avOxkblTp7zEc7NRdktipqJjS32ba1qkJ+Ax16bhBKszFI/RAb2PcQI+PgnQm90
	+f1MfJHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8b98-00000001fik-3Iss;
	Mon, 21 Sep 2026 10:21:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8b96-00000001fhP-3nxl;
	Mon, 21 Sep 2026 10:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789986071;
	bh=uw5pdRN2Q9JJj2+CbK1XOe8tJnBuwe3/GQzFs3S+ECE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=m01RtQigaCGmATt3Z2RO+l2X3jp6emasy4I7DqrplE+e2RosUCFD10dMp2AviNqgF
	 CgRL9VAzG34cRLpnhKETmKpvh7tqDrrWrklo486vc8A7FcQFsR/A2WqIvW11KZnPLR
	 QZvz89UsDAdHgnB80XALmbEbX6MZAkmC8aT2ymc+lHhK2C8NRUBS9sUL4lKZG4aiAD
	 o+f09zXHEypzLxAYdSFPm73tA8UiDgFytinUCifu7xAggNaqcCEgLHIHkOgyeEVM6L
	 QeY8HY3C5i5Q+FujPosjf7l9UxTcLI4Sb9jBfuZ04qFfrVXKLcTEbzi+Jtkw5a8n0P
	 vEtd2aLg3S1Wg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 49F6217E03B6;
	Mon, 21 Sep 2026 12:21:10 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260918175736.355305-1-l.scorcia@gmail.com>
References: <20260918175736.355305-1-l.scorcia@gmail.com>
Subject: Re: (subset) [PATCH 0/4] Add support for the mt8167 display
 pipeline
Message-Id: <178998607025.21155.9680834242820851509.b4-ty@b4>
Date: Mon, 21 Sep 2026 12:21:10 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_032113_102054_70436DB8 
X-CRM114-Status: GOOD (  10.40  )
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

On Fri, 18 Sep 2026 19:55:24 +0200, Luca Leonardo Scorcia wrote:
> This series adds support for (almost) all display blocks of mt8167.
> This SoC supports a DSI or DPI display and has HDMI output via a second
> DPI block wired to the HDMI phy.
> 
> All the hard work was already upstreamed in the past, now all that's left
> is some glue. In the first two patches we add support for the DPI output
> blocks. In the third one we describe all the possible combinations of the
> SoC display pipeline and in the last one we add the required nodes to the
> SoC dtsi.
> 
> [...]

Applied to v7.3-next/soc, thanks!

[3/4] soc: mediatek: mt8167-mmsys: add routes for all display paths
      commit: ae0968038f994d6e275f5dc94a27325ee751fe58

Cheers,
Angelo



