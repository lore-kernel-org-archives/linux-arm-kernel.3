Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B8CC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 23:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXeJkBLsW8peJsoOOCTgxU6I+Zo3YfFFTg65ys9a/gU=; b=xy2eXXftKsyyQoyeAB2QiEvj3W
	1B0L740DqDDTeb9iIPNNOXXRVYMg7EkCIbKvb/7TNiD7onKhfLvUKjflxOlBWzzR4CJaTgY43J2lx
	JfREpxz3gxCKQzeDKNdoxj+I0bhxMdu7KdM6VheBGnKlrjOVGlJTmd1WTC79DQ6gW5865wdcbTTJB
	O/GP9qBiFmOaridF8i4KRzU3bJzaqHjYG5zr4XATKiA6s8BmwbWXa6o/ZqFydHFKrZqOP0RQFO+wb
	lEumXdDsnS03Wx7ajOCBGMTmkw7i5sSA+ezsOWB2FkBOonbpGTEbuBUN8/+NJ99keThXROxwcz0fq
	yHpVIhsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttEma-0000000FXVH-1aaM;
	Fri, 14 Mar 2025 23:49:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttEgr-0000000FXAu-2izi;
	Fri, 14 Mar 2025 23:43:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3ACC85C4850;
	Fri, 14 Mar 2025 23:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 854E4C4CEE3;
	Fri, 14 Mar 2025 23:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741995824;
	bh=rXwMh7DKwUBAV1pWsbA1nv/BVDEbqtMibrCXomL6GL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eYz7rUHGgBNx2eQl4bluF0GRsaCsWKdPVrd0PDjfhvaBxAqLEq9NwHY0Stjxg9aTc
	 EnpQ6rLuJY8fteJ3VhYDdR1+gP7Rjuj7U2XooR1JY8NESae/CAohGoLzqclc1pYSyo
	 K3Di6WInqaV8HVnnv0FBZaTNUjoQJHwt/5T7lnKiiOVDikwz4aAjxR/VQK7fip5bEI
	 MCN6fo0X+UnH3v21U6VCUrQXLZWA3OF7usMcjQrxfmi+sQTp/sO0H4D3sqg0O7Y3kC
	 xvzPz8+2hWoxgDZFRWw9rcmvUl+vHIe3kC5HenJrxdoC9gpKGEirdtNWua6CcXzABD
	 pLf4hcUBG14tA==
Date: Fri, 14 Mar 2025 18:43:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 3/8] dt-bindings: arm: mediatek: Add MT8186 Squirtle
 Chromebooks
Message-ID: <174199582298.2541457.8793216796013121859.robh@kernel.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
 <20250312104344.3084425-4-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312104344.3084425-4-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_164345_727940_ADE155CB 
X-CRM114-Status: UNSURE (   9.43  )
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


On Wed, 12 Mar 2025 18:43:37 +0800, Chen-Yu Tsai wrote:
> Add an entry for the MT8186 based Squirtle Chromebooks, also known as the
> Acer Chromebook Spin 311 (R724T). The device is a 2-in-1 convertible.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


