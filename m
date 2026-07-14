Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCCBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 07:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZY15Na630cT23+3bnvhccBu3QQYmy/9h6UOo1ApJwE=; b=PGOTniopHj+s5J2T8NWUdJpZDH
	aPK3V9VXpAEkompx4IkKx07qZeSkDu6F5npFjZBTDZnAW7VhBjiVvZ5vpUojXBlMMQzEYDDNdclz5
	vC4moG5999FyR+5SwpncE4lGCTMA/V8XYiEnx8Jdzo//wcQuNQSeC/im5Q1ZiBanZyozQndxhT4hn
	ZPjR1/8TBw07bRBs+AzlqiQrvhDH2Hhlo37NAzQ568Akg486oO4Mfvfx86LBDoRvjpKt1efptKrxH
	2aGjwcL7HdAJ4r5kYmSJfWpeI1PnLUFIVRzddsBhMgrvTsvPCRufRKLPZT+Y1hQTOH00v/arEybFd
	0fEJzpMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjX7m-0000000B6rX-0gvF;
	Tue, 14 Jul 2026 07:00:14 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjX7T-0000000B6mv-3FJt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 07:00:12 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id A0C421F901;
	Tue, 14 Jul 2026 08:59:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784012391;
	bh=HZY15Na630cT23+3bnvhccBu3QQYmy/9h6UOo1ApJwE=; h=From:To:Subject;
	b=IdEwe8iuWZ94uJXyoXcJ++1wMCLmuD9eEWQrRYJpNLgy44Z9d0UEaAiotfqJjAVRn
	 w7YW0/qnvJsyfSG9m/t9eNjnBOdvzgWnPEZBHJkHv7nRRg7/4dfK+DEM1wocDil/zp
	 d8ciIJg7hGcp/nK452Z33mg+lOK3xm2rNMZZHK9FXGSIttyle7Grn3EbqH8qfgh339
	 QAoXXNJFbdVmZc9kKGqu/drMEIZRDXmnM/12OjDMHGlr/KSLx5apMcH5sGG1nHXGXL
	 I/WTgVAchHBL0QQlgU1ujs8Te2j3Zz2n8p4R4ERTp1T6x2oKztiecUyAQPnsQHi7vq
	 EiHe4iyzyfyeQ==
Date: Tue, 14 Jul 2026 08:59:47 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frieder Schrempf <frieder@fris.de>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v2 10/10] arm64: dts: imx93-kontron: Enable ELE firmware
 driver
Message-ID: <20260714065947.GA22086@francesco-nb>
References: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
 <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-10-b8266d93514b@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-10-b8266d93514b@kontron.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_235956_728526_085DD73D 
X-CRM114-Status: UNSURE (   7.38  )
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

Hello Frieder,

On Mon, Jul 13, 2026 at 04:53:46PM +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> Add the ELE firmware API node and pass its handle to the OCOTP
> driver. This allows us to gain read/write access to the OTP fuses.

This seems something we should have in the soc dtsi (imx93/imx91), it
does not seems board specific.

Francesco


