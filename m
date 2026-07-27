Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA557C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRTJfd9zZkQyG3G1nivM7uEr/3WXRcqlU6N5OA/wf/s=; b=DObKa0IGmxackBDOVjadzul8Je
	9dZUX/w3U5j1P1CrjpnkgTj6Lc2Y98bEvk5+7ZTNUXfLzb/P6RQYL3Dv3UCt+9j5erz+A073tTRA2
	avhWPyNYWDSKtH/jy8C9AbWcJJ9zgSTfvRjJSVW9+BnNttYMoeiBd6tg1KHkucUMExpyk9NzoQ+cl
	ZCINIDFWj0aJOU9pUucP7+hwSAGamvBG/w3FbCIB2Hz7nERIotfW3IEOS85GmpQl/3MAOcSiQVGbC
	1ioEbXw1r7eh/vniA9GyVldBTeimpANbgf+rnebwDnTkM1FM/c53KRMm5w4a8eGwYsxXXOJm4AX6Y
	AbvNhEtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRlH-00000003okq-2lAv;
	Mon, 27 Jul 2026 20:17:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRlF-00000003okf-3Lle
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:17:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8BB9943A70;
	Mon, 27 Jul 2026 20:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 716ED1F000E9;
	Mon, 27 Jul 2026 20:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785183437;
	bh=HRTJfd9zZkQyG3G1nivM7uEr/3WXRcqlU6N5OA/wf/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QA3vodlOd74UrFO0SXkn1wkDyme+d2yn1KGHFgZgFNrpeWhdXv/zaDadmtWsvhl9R
	 Kld2SWNWghIFXbQRPjPRbOrq+vXQYHXgbMfY9Itero/OFg0LQjybGUIwtw5m6/U6+q
	 RoL+9Dr+iCBnSK1e5CPmPJk8lxJ+0fhzR0FQnmJ6IaREo8aNa30sgZoWmNQHqhu7WD
	 aLLGN79JFBrk8ErzQoeAZhk/TV9aYmuSX7KLh+elL+qbxN8gqI7VQEMn3PmBbNxvQD
	 Wt57GetEKRXtYzsiOaey/zgYfrCvm4X0Slzz2YBsQ/4m5MumY3zx0ohPuo/BC6CbSF
	 fehLsUpVON8MA==
Date: Mon, 27 Jul 2026 22:17:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, =?utf-8?B?U8O4cmVu?= Andersen <san@skov.dk>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 2/5] dt-bindings: arm: fsl: add base compatible for
 Skov i.MX8MP revC
Message-ID: <20260727-onyx-copperhead-from-venus-8824ca@quoll>
References: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-0-ca8a0446166a@pengutronix.de>
 <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-2-ca8a0446166a@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-2-ca8a0446166a@pengutronix.de>
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

On Mon, Jul 27, 2026 at 07:31:05PM +0200, Steffen Trumtrar wrote:
> Add a generic compatible for revC-based Skov boards.

We do not take generic compatibles.

Best regards,
Krzysztof


