Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBCEC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 21:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JgraXe/pONHc5HPtprX9iG27Cj8CjsvRq3WlT8031sg=; b=bcVDLL83AFXFeUc1Iply2jwcmp
	8QPBwsEUCm2N+JTl0rWB+HeosVBuCiK/fu0zLw9VEEuqYUWoRQ+40EobVcGTLBe+JpJc7ow3FMgIy
	m0OlL9hQcj1q2+vk32fbZrJX+N8l+5n+UbAwbyNZ/biqIF07bJ7JScCKYurADzPVAIbkes33a40qp
	WnpebEt++V/1vDIBPClpa36hW6W56uea+ygXXzVOUe+MVJpy2Vas+bD/qGU3PDkhfUtgJjTyEDisn
	UHwq5WenomL53OrtNFSFwwxcI8oTrxpekWbeM89fk4TmtSZfcDyAyvNNjIRr+k/qvo/X/bI7EcVM6
	BlUTbDzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGfW-0000000FrHB-2cZs;
	Fri, 27 Jun 2025 21:31:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGX8-0000000FqFi-3OaA;
	Fri, 27 Jun 2025 21:22:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 539295C6428;
	Fri, 27 Jun 2025 21:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0189C4CEE3;
	Fri, 27 Jun 2025 21:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751059373;
	bh=dKyxY/bPjE3fZt8bSWNegDuc+jZKxTxZmy1Wiiwm/TE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jvrNs1FSoHgcTi1oM2A35k2hTcOFuUXZERNsEOILi3zQ/qDyZ+BRxqyPoBLRXq0hh
	 Bb3sqzGHEDPkbS7LYG7VZLtnmwZqMPR+zTBfk3mMvKAzpfI6YtJeSuThUSVUhOm/2u
	 5vEvnhCRSivsdt9/bJkKCAYWWJwVXmhUV7rs/eGXHaTg0j73SVPGMICz19cXE7GXi3
	 moGAgD1P7Gi3uKP5wzsgXV9YVp87G1b0eo/x25VrroxeadQ3YHPTjwF75S26kp84pG
	 2zh0KgZzNW2okXRc5jG4H/x/KNINz0vtuOjdCluV/CVrMYoJdULalOowMNh79pkety
	 6oI1zRv8I2CMg==
Date: Fri, 27 Jun 2025 16:22:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Max Shevchenko <wctrl@proton.me>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-watchdog@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>, linux-serial@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/11] dt-bindings: timer: mediatek: add MT6572
Message-ID: <175105937161.165965.1627946015902524006.robh@kernel.org>
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
 <20250626-mt6572-v2-3-f7f842196986@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626-mt6572-v2-3-f7f842196986@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_142254_884827_7D35B9A0 
X-CRM114-Status: UNSURE (   9.94  )
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


On Thu, 26 Jun 2025 11:53:56 +0300, Max Shevchenko wrote:
> Add a compatible string for timer on the MT6572 SoC.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---
>  Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


