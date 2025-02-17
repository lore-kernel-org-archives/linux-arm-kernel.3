Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53950C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 15:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/J0M76EHLwXF8izY2or6AGdmLcAi2R2p1SP1NPe54No=; b=T+csPC8R3cQJPawPp1XOwudfx+
	QKlNNLKMFdd7LQ5+hWs3fdf+xKtT90EoidlgCAf7SZ6pbJhBWb27XhykK8bMwO/xFU7Dj++Td6kV4
	1QpTRl4SGpSydA3PDja8+ERIQx9i6fSoCAWq8YXaUCW4uek328nW36WWAQGrb0ZAwu/wCDG9bsdD9
	gKNlUb8v0OF11bAjm9W1yYEqg8WbcTl1LucMGXK5dhH0zd4rr9Dma+Y6WbSPeQfLiXRmLhb85/7Ei
	IHmeM3Ii/T9+ED4sBL9CKg8fkA/3Go3fWeYhDM1Qg4cf4PLZqhtocwgSQUy7TznHjIiMfpvLLFoMc
	k+PX+XxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2jI-00000004zOa-1qC6;
	Mon, 17 Feb 2025 15:08:16 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2ZI-00000004xbj-3uGC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 14:57:59 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 9F86D1F956;
	Mon, 17 Feb 2025 15:57:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1739804271;
	bh=/J0M76EHLwXF8izY2or6AGdmLcAi2R2p1SP1NPe54No=; h=From:To:Subject;
	b=ihS6qqtzYLa/4UrM8vEANaKhv1K7W1vu7YaxW8dYNBgTwm2rKEoIclP+vhsPulaic
	 kRnr2LMnwa2np2SKRJ9s+YxpxV2uexOEOv2XZr7KNXYPwH8S0auBu6tK8bbvKo4TtH
	 AFLHOixqW3ZR7DDS8fNw0IbqJoHUkEZEalN9U7P+jCCrSrJ1dht4ol0S0LeYlwkY9r
	 lg3Ug4pPzMvuDMcmkkHHlTxIkBx60RRWJIXirXPiIF06ypLffwE6Zx8l7powv5rVTu
	 wtVwouWalc1KBJWXJygaaIgcoX/U+sec1UjJktIzd5wERFd7NGfXsFYUm2GihJI5wH
	 zsN9rwUu82//Q==
Date: Mon, 17 Feb 2025 15:57:46 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, jai.luthra@linux.dev,
	francesco.dolcini@toradex.com, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62-verdin-dahlia: add Microphone
 Jack to sound card
Message-ID: <20250217145746.GA55060@francesco-nb>
References: <20250217144643.178222-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217144643.178222-1-eichest@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_065758_009598_9D7B7D6C 
X-CRM114-Status: UNSURE (   9.32  )
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

On Mon, Feb 17, 2025 at 03:46:04PM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> The simple-audio-card's microphone widget currently connects to the
> headphone jack. Routing the microphone input to the microphone jack
> allows for independent operation of the microphone and headphones.
> 
> This resolves the following boot-time kernel log message, which
> indicated a conflict when the microphone and headphone functions were
> not separated:
>   debugfs: File 'Headphone Jack' in directory 'dapm' already present!
> 
> Fixes: f5bf894c865b ("arm64: dts: ti: verdin-am62: dahlia: add sound card")
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Cc:stable@vger.kernel.org
Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Francesco

