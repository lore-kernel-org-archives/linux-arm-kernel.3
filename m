Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE501C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 08:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbBBTJC/oRU9ms8+LqiBnsiP6cXseVaQgtIeGu/s9Ic=; b=LtxHE6RCMt2yVB6KepZoY14g4L
	erwKe6RMvEQ/npgY1gMghqamJAVC+qujSb2Kitvn84Dhaqr3DDgNCN2IXb682W474OORW+ZdiDQfB
	W8qUl0XeDc7IfUn/2EdpQ8zVY3T3cIxExAMaXmw0uFwOWHRXjkNcrdxLaKNaDZnn9ZzZU7NAXhTPT
	enVBv6NjEh7UiFppB7/JmvSBeVKCtm3MA32lAs/5hiwKGocIWcvdQmhQpiBAiQIDnbNkbfB3gPw7i
	8b7bLsmOeWtWZaJqpCqRYBs+yDM0T5fcyk+yQCp9LIL+8l495Whz5JF70lSD4dzx00MUgfAqNE2R/
	fGqMytwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9K7i-00000005VPW-4BC4;
	Mon, 28 Apr 2025 08:45:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9IpS-00000005EVo-27Wr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 07:23:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D92275C5E65;
	Mon, 28 Apr 2025 07:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC7BC4CEE4;
	Mon, 28 Apr 2025 07:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745824981;
	bh=qP/8wVu9kz7JxXZ42YE7w0X2oBw+B6PGhKfko70XC1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t94DEvDU03gDddW43clwxceIcPAB2+GzF2WaZICJGfgbmDrd1Ns4viVu7ZniKI/Zv
	 dJG6PV3+RmBkV2AGzDsqvuC6UQEpvebsYRWW1JSYJgwj1/ia+GJ7Zc+znQtbp67iYa
	 4eN68nGvHpFr4MUEkGV3Q5zqBkCx1IUfYohtQoRZtHvK47qxLtGRVH0G1NuZOpTsuC
	 1yrR/OZ57JtDnLBuTPskbe45xdaN4UkaqYgYkwkBZWAYM8jaIurkvZDBx4ztRe7cWQ
	 HsDGJqKihvuGc8p+wk32Q/L9HpXztpak8KSDED4aw6D6VxPG9AipDCwWBWqqZrQrLN
	 mO6hqAQMGF+VQ==
Date: Mon, 28 Apr 2025 09:22:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Andre Przywara <andre.przywara@arm.com>, Corentin Labbe <clabbe.montjoie@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: arm: sunxi: Add A523 EMAC0 compatible
Message-ID: <20250428-prehistoric-fragrant-bear-163afa@kuoka>
References: <20250424-01-sun55i-emac0-v2-0-833f04d23e1d@gentoo.org>
 <20250424-01-sun55i-emac0-v2-2-833f04d23e1d@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250424-01-sun55i-emac0-v2-2-833f04d23e1d@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_002302_584477_DCE01288 
X-CRM114-Status: UNSURE (   8.62  )
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

On Thu, Apr 24, 2025 at 06:08:40PM GMT, Yixun Lan wrote:
> Allwinner A523 SoC variant (A527/T527) contains an "EMAC0" Ethernet
> MAC compatible to the A64 version.
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml | 1 +

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


