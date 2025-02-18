Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F34C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 12:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTqky00lPhU7/+8sytiPJwGu7aJRpm3Cr8JwLkeqWdI=; b=r4Use2FSDLSALJ4Qbr67si08in
	xMGNunHWiU4s7f0ctZBodS7n6lYLI7sDIwXHs8zDi01EhN/7ActIl988AQI4wPam+9sm3c0SOrpRq
	Q+vVQg8CAkY9QfhlBIrTjRgfZomhecv+GuDFbhzrbogVuQN2UcNU6l1PXfjUMZW8H7DbPOpKtLSuI
	KIAsJx3hhD6xX2+DN617NNk0PbY/nhyEweyJEbr6WDAQE1XNC9AdOXjrof9yYdVckclKTGbTqv1c2
	0+jLvq//LpWORpqxso9OAcaPvPVVFNQd8IIdO4tfBMRETqINK3Fcbt17AS6SMdSLpo8Y/QUlpnuAX
	a1zqxxZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMhS-000000088lV-1RVd;
	Tue, 18 Feb 2025 12:27:42 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMH7-000000083nQ-0A0e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 12:00:30 +0000
Received: from francesco-nb (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id 2892D1F901;
	Tue, 18 Feb 2025 13:00:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1739880027;
	bh=QTqky00lPhU7/+8sytiPJwGu7aJRpm3Cr8JwLkeqWdI=; h=From:To:Subject;
	b=sD/l5cBPRWfS/lFSKRexV/kShRYmknnmIHfAD12vejA3w9eA81xHuH7/dxgtJq+nd
	 GGOo6teBN3s+wyeCepfRbhjOsBHgb02PDGSSSwpy5njsgZG7mUpwakJvnZvQGb3io2
	 +7jzjiqSrrvj35LTBK/Sec0kX2EcWQoiTO9XqeCPBWhI/ZvVuxhf1DfbqcCw9ELEnM
	 HfR3/kDmuFVTspEytIqRK9rYtaBUan5D4olpx+qoAc7LUrU1BK9i/Sji/NqTO1rrr5
	 EvooKZ5eP5+8rExMnU7NvDUFpmZ8Lmw8rYDVVTBhW0menJd+OsGwqwNBcOikZxGSkk
	 Js5NvzhvAUaqA==
Date: Tue, 18 Feb 2025 13:00:25 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, francesco.dolcini@toradex.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1 2/2] arm64: dts: freescale: imx8mm-verdin-dahlia: add
 Microphone Jack to sound card
Message-ID: <20250218120025.GB15270@francesco-nb>
References: <20250217145744.179213-1-eichest@gmail.com>
 <20250217145744.179213-3-eichest@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217145744.179213-3-eichest@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_040029_232059_93B85F51 
X-CRM114-Status: UNSURE (   9.65  )
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

On Mon, Feb 17, 2025 at 03:56:41PM +0100, Stefan Eichenberger wrote:
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
> Fixes: 6a57f224f734 ("arm64: dts: freescale: add initial support for verdin imx8m mini")
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Cc:stable@vger.kernel.org
Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>


