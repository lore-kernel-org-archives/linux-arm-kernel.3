Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3629E6ADE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 16:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TMR950o+cKsHwEMLQCs+O87d46npTA9aiOspNd7mLX0=; b=nT/haOvsPRN/yjYuITyNltJSxC
	atrjmb9uvV3S6Ry6qKkhEvrEGNvnrGnx8HzPkgXi3sjLRUOUULkVhbbZqSdVC7ViM5zV1kb2ZzWtM
	MBhogOixBo/6oSDF1BQmi9qc12RyWJP4IqaZfo8LAlyYO7yaCDhwDP90CasPTdpCJAZZbSgZ4U+6/
	SP6qaV/GgCsmT1GNn+outIeGdyY1LudP8GHhqh8NA6yoxO9ZmLv4jkxACcP31EIUkW9NkINynNvrZ
	EVr8suLifF2N/0X4MWMMzsc7OH0VZKnrvwkrGTCvo5nofsLIa0w5B2+3T0ycb4aekNwioAEDAVHst
	yZ0K+Maw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEsqQ-00000004aKp-2AnM;
	Sat, 23 Nov 2024 16:18:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEspU-00000004aFU-0TDy;
	Sat, 23 Nov 2024 16:17:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 04D4AA404A4;
	Sat, 23 Nov 2024 16:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4BBC4CECD;
	Sat, 23 Nov 2024 16:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732378670;
	bh=r7VawsBWko4JGKpwGiwsn4hr5Gg4jKmMEXWLC4Zu6jo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cWRrf8Rz9VUSKtqdMeH5xQslmt3yr8WCrh/jUNlPQdAbDvLReCrQihlUtfMaW5Q/j
	 mTCfSAepcwct5RLq9f2JqO7rmLDxqHOOxV24Wl8/5e3lWaIxb4Itl63lrFzSQ/4Kyn
	 TB3dY4Hi/daPK6kwmAKgljw+MnRTyl9Cl8gpGlpvpo/3Fxhl4r3dr1L/+zDher1IDV
	 WHdRMQRWSGlubx0u4lvCJ/27a2bDDzb9jVYRMRxHdE7BMtAn4ZFQhQl3YTx8Ya88JZ
	 cpIsfDXnoJ1Kt2W9c+eCVQKo2ifTj907w124rZVEa35Qkge5La5CFaRpYZXdyzOPQr
	 X099PezSbMmww==
Date: Sat, 23 Nov 2024 17:17:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wojciech Macek <wmacek@chromium.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Rafal Milecki <rafal@milecki.pl>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: mediatek: Add MT8186 Starmie
 Chromebooks
Message-ID: <cxuf6dwyp5cyzcq3h4bgydg5fffc24bwfz3umifqnxqyyvuhc5@pbe3v5andnrr>
References: <20241122104938.1437925-1-wmacek@chromium.org>
 <20241122104938.1437925-2-wmacek@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122104938.1437925-2-wmacek@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_081752_212476_F9AFDD0F 
X-CRM114-Status: UNSURE (   8.49  )
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

On Fri, Nov 22, 2024 at 10:49:37AM +0000, Wojciech Macek wrote:
> Add an entry for the MT8186 based Starmie Chromebooks, also known as the
> ASUS Chromebook Enterprise CM30 Detachable (CM3001). The device is
> a tablet style chromebook.
> 
> Signed-off-by: Wojciech Macek <wmacek@chromium.org>

This was absolutely never tested. You obiovusly miss some items or enum,
but main point is that it neither looks like existing code nor it was
tested BY YOU prior to sending.

Best regards,
Krzysztof


