Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1063CC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 07:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2cpIlZWVloEX3N2xZMYGarwcqerPETDbCefslbFSUY=; b=f/Miy/N4Kaq3ZylbYQFtIPhvTo
	jMHMTA1fszt+KLoYGtFQSQta7cp/wqgpHcWfXWumZ/YEO8Y05PQWD54/9ms9onZvKi/h4KWhp0di4
	lxTlmhFQGWd+ktlppYzlKlHgkccoDKT1wVVsxvhQ1y3/v5WemL8VXfNcKoG1rYXGFHaHK8C1tip41
	9JhKAI4IBdsmD3r6+TKTw5D2GyOxHOLtAHm2PyNFzQg8cFrBLaNOCkfAIb6UJPQbW39vZyV9CnHs1
	9NxLEJeVipt4TrJ+cDZGIraZGCAyxcpxKnQ6cZrtXjCZlacJTxKJ+jZ1/sW7tsNZ0MDatMqTWIVC1
	BHOUIvJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGWzN-0000000CDiY-0oMh;
	Tue, 13 Oct 2026 07:31:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGWzL-0000000CDh5-1YYu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 07:31:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E04E543F6F;
	Tue, 13 Oct 2026 07:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA5D1F000FF;
	Tue, 13 Oct 2026 07:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791876714;
	bh=H2cpIlZWVloEX3N2xZMYGarwcqerPETDbCefslbFSUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K11zu38PP1rUCPb3sidr6HojJXbELy5g+Dkr83EHPsIqLA5J4RxSFXrVQm7XpN95h
	 ARVCrckHQxMlEdlYeeqME0etYHJdo8eeFTLyjVVXqJ8yiratV68+YFsa1CIE6BUdXd
	 A/ylDUgd1hHbk0qjob/89w9F1Foe5p5UwhNMnKP4IGUPL5v8KHNcMchfDDmnGIoJ5i
	 MSRTZXnEiWWu1kURvw8lbfcBFoKG8H86NiKxdyJwK0d4jSuRtVZNkG7Bn29KrYfHmB
	 mBcx/5jNcHUGjX3hmhEgUA5YFQyepiv4hK6Zyz1JAxSF+nkq2kBptjtZsvxJfCDap/
	 ZUxbLb+rejtBw==
Date: Tue, 13 Oct 2026 09:31:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	=?utf-8?B?U8O4cmVu?= Andersen <san@skov.dk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 2/4] dt-bindings: arm: fsl: add compatibles for Skov
 i.MX8MP boards
Message-ID: <20261013-tough-lionfish-from-lemuria-1e47ed@quoll>
References: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de>
 <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-2-0906e57486a3@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-2-0906e57486a3@pengutronix.de>
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

On Mon, Oct 12, 2026 at 08:30:31AM +0200, Steffen Trumtrar wrote:
> Add a compatible for all revC-based Skov boards with a touch panel.
> 
> Also, in preparation for adding a new device tree variant with a
> different 7" panel than the already mainline ones, also describe that DT
> compatible in the binding.

So what skov,imx8mp-skov-revc-touch is? I asked some revisions ago not
to add generic compatibles.

Best regards,
Krzysztof


