Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AC9CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 19:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrhhGZCcSVCtaHZ+vYiB25qro/W+Zh/774jR5vM078Y=; b=xrn3aYdQjqwhDr61KtHGFffF9h
	92q8jRsFSKW7aIxsA6tZq6q6oKiKirGyEjcRCQgUxcctLKhFJfdkD24QS0L01tsDyTCL3yoGsF3qC
	sRTLk0al60EKlr1z6sM2qogUSmZDYRnGXKTzvuvV8DTQQVybU3vCt2r1/+Ad4Hnm+RngtU7iqwNfs
	p2F1VybEEDAfkk5MzE24LagHo9j0yCYhslYsVLcKain+/8oy/5pX3XrVxvSazaMGfJbH35fUpcK+e
	+OiIk6vWmJ94/+JkNjmk9a5sDC50Klx5eu9HEBQH4A6OQXwjBbiOAy313dnmddgTwrBwg2mVfPZjG
	ivS+rarA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSq3-0000000EeyI-1v37;
	Mon, 27 Oct 2025 19:25:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSq2-0000000Eexw-0tEq;
	Mon, 27 Oct 2025 19:25:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E56761F84;
	Mon, 27 Oct 2025 19:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB041C4CEFD;
	Mon, 27 Oct 2025 19:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761593105;
	bh=EMFYNTxqqtbeWG7w/xTxHN65hWaPaOm53UuixA0S/bI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vFzBCiD2TaGdMk3IXuYjzLamws536+Bz7hp5DNvEo0KE381bf4hAOkl5BzMilVSs9
	 TbmuMCnTuI1Nu8la8KjABQ7QF3fXE6UfG6JWQju64rvNpMTH3zfqgWqB7cgKS2Uybt
	 ZCdMY4B7jNzlxocCvEv+YByAgfXaOQEKh/c1LAL9cJAVClnvQGSgmyIPFxWSbYqtGQ
	 8VNGtmcBXuUUK/h6u/rRyaqejErpjwuU8bUFXKABeof3vMkEe2PgpgbdQmsIhRW920
	 omf1N+UlcXgua/pw0KZ+3N4DwiviNcgyPXFDHx/hvI8+457eASfDU4bXE9lukwcSwx
	 p5wKjifUBK6/A==
Date: Mon, 27 Oct 2025 14:25:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: linux-pm@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Balsam CHIHI <bchihi@baylibre.com>, devicetree@vger.kernel.org,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Mason Chang <mason-cw.chang@mediatek.com>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 2/5] dt-bindings: thermal: mediatek: Add LVTS thermal
 controller definition for MT7987
Message-ID: <176159310054.1448869.17678673857769151951.robh@kernel.org>
References: <20251026122143.71100-1-linux@fw-web.de>
 <20251026122143.71100-3-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026122143.71100-3-linux@fw-web.de>
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


On Sun, 26 Oct 2025 13:21:31 +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add thermal controller definition for MT7987.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../devicetree/bindings/thermal/mediatek,lvts-thermal.yaml     | 1 +
>  include/dt-bindings/thermal/mediatek,lvts-thermal.h            | 3 +++
>  2 files changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


