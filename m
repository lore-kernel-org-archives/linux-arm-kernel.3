Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7213CC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 04:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzXacRK9YyFVZryxioMdSBKnpxohJunnJcdvONlrj6s=; b=pirNDKvGXzKwO7PPChNqyzkHlF
	j82kDlbGXnNgOs5+zy95qr2Rrfflsdqf+eKW1w+v5z+sYVF+xJlCFUL4lSl/bJjL4xH4AmzBckIRQ
	uMaGdUwyIvhNj0WXCvEYZx59niJKf5+KRD28pjx3wc4PcStnEYIUiLJsQOivDyS9kRl11pGf7j9+F
	KQRvfszgYTLICekqvY71JwycEeK1k+GcW3SeoQVl7klZS5fmg5v5qBwnSmFeAgwCRvkEQpz1qDLLS
	hKPOrKnx0ZJYgm206BTc6ADvkcjCksrG/zsAZNdUOXdL65KFloKRfUm2EFfRe+e5Rvs5hWwn9aMpO
	xusPClXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS6iD-0000000ByyA-3O8L;
	Thu, 19 Jun 2025 04:17:17 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS6WM-0000000BxcV-1wuG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 04:05:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=SzXacRK9YyFVZryxioMdSBKnpxohJunnJcdvONlrj6s=;
	b=DD9uyEy90xjxZI9nMIRPXAkeq9hWWuDmp7fJSn8SaodTOeG9gRBe6H8p4pR/2u
	Ht/s+uJ4KBVe25WCd4+Oste0xNIeqKsJqnGztSCOHrfUMouYfuviEWP9l6PK8/w+
	lCBDJpkm182xoD/NARtXY5o3QgdM8l60x1iECvsQSKxK4=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgA3rw5SjFNo5nn2AA--.35256S3;
	Thu, 19 Jun 2025 12:04:36 +0800 (CST)
Date: Thu, 19 Jun 2025 12:04:34 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v7 8/8] arm64: dts: freescale: Add the BOE av123z7m-n17
 variant of the Moduline Display
Message-ID: <aFOMUq5JcovQEW5V@dragon>
References: <20250520-initial_display-v7-0-a8f0195420aa@gocontroll.com>
 <20250520-initial_display-v7-8-a8f0195420aa@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-initial_display-v7-8-a8f0195420aa@gocontroll.com>
X-CM-TRANSID: M88vCgA3rw5SjFNo5nn2AA--.35256S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7sqXDUUUU
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAR1xZWhTVBnN5wAAsU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_210502_818351_4CA4DBE7 
X-CRM114-Status: UNSURE (   6.35  )
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

On Tue, May 20, 2025 at 08:34:57AM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> Add the BOE av123z7m-n17 variant of the Moduline Display, this variant
> comes with a 12.3" 1920x720 display.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

Applied, thanks!


