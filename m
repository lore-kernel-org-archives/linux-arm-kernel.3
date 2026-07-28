Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1571C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SS1cRxp3/KB3KUKGAVE1kSpfoXM4gnIaChKSHHucERo=; b=3wLPnol4b7iujI4Y0a+4nI68ZG
	h0UqEQzH/kGIvgGO8sjowaWR/6IY1io5QfB+9NjQ5+71Dt2SqNfAXBY1XaJSdXtE+/BKgED5Lch5l
	kJpz8JZEHgV+imWg5n0ZsQgPPg2m/vSUQOmUXz1LVL+xgfViEr9/+/U8NkO4EUvJkg4bX/pDHb1i1
	EWk2JMJNFWJ0j0WcbGdUeZvpnBhieRfldoomk2B+5XNwnZwGgbjItIfa8kv/ICz33XOfGO4Z7ii5y
	UCfaKMkLA/zHsG5Sn8GOPnXT1D0qqgPDdlPuJBu1jny+42JG51Kkmsq2PYFTXst+YWskvPHVlTApJ
	fl0KB0eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojBp-00000005YnL-40ZA;
	Tue, 28 Jul 2026 14:53:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojBo-00000005Ymm-3Ok7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 14:53:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B24C600FC;
	Tue, 28 Jul 2026 14:53:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A0D51F000E9;
	Tue, 28 Jul 2026 14:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785250430;
	bh=SS1cRxp3/KB3KUKGAVE1kSpfoXM4gnIaChKSHHucERo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=miPWVnWcsOI+OuNBKOe4LlBOuDXxFG2B4Hki5HzLByaM13R4ARO1zLIFtw2aqS3UP
	 pfhxuZ4DP56m0cQTQ5PuRz9S4kJs9AKETtLOID0js076IbSzWsZYHeVAO99JjB1vI2
	 brtIOJUk2w4aswMWyBG7g4+eoaktAKGlnGhzIbCzofLfyAmYsFJWmNfqgcRZQRvfHD
	 30qNO7JnIHWrGNlGeuvfc+++BNzbwoZGgY9vLBmXHyVi7zhovPFoN7cEZbcsaoc5eW
	 RCbxtkgU0J/jkfAiYPl+E9GhNQDWOm3qDm7AX4+4bfFXCHEhO2MJVYIH3bsBFAU4xx
	 ZUTCkwGqkcqdg==
Date: Tue, 28 Jul 2026 09:53:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Janne Grunau <j@jannau.net>, Frank Li <Frank.Li@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	devicetree@vger.kernel.org, asahi@lists.linux.dev,
	dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: dma: apple,admac: Add M3 generation
 ADMACs
Message-ID: <178525042882.2159707.3534959855317111869.robh@kernel.org>
References: <20260725-t603x-admac-v1-0-6a4dec023f02@chaosmail.tech>
 <20260725-t603x-admac-v1-1-6a4dec023f02@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725-t603x-admac-v1-1-6a4dec023f02@chaosmail.tech>
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


On Sat, 25 Jul 2026 14:25:56 +0200, Sasha Finkelstein wrote:
> The admacs seen in M3-generation SoCs (t603x, t8122) need additional
> configuration writes and so are getting a new compatible chain.
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  Documentation/devicetree/bindings/dma/apple,admac.yaml | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


