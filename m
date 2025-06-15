Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11692C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 10:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yjEYyViJRSEj7gukJzhLaZCQ3u2E2O6CsjLJYxe6OF0=; b=eRkaxo6MMsX3kGGJwDKNLKYR3y
	NeYtEL/TVIEgJ0EJUbrcRHPoMUVsRXbUnZsFtY8/w3lRH09w95lXrVMenwAvl5MRAZVlrek786u7I
	5GejKmlC2hEgBUo53x5DNS18KKRoBvdPhJzrRFUV3GqdrN7diYbuC8HUeSzkd2odNFQ0LuX0tei1i
	K0YOObrS8paRx5AlPX3meuOD7GgSO0TONfmYKZWtWD12Rt9tdiRHvk6obgofqbjaePwhsoB+YqZkk
	aEACr1otVxcELFpF/b5Xu4pW6PXWLx7iYC65rpuapVb3a5BhiBj/vXaRSrKLUm9xUBB34LHKDzNji
	Wg9pRy9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQkM6-00000002Q3p-1lAI;
	Sun, 15 Jun 2025 10:12:50 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQkJs-00000002Q16-1uHF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Jun 2025 10:10:34 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 2068C1F8C9;
	Sun, 15 Jun 2025 12:10:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1749982225;
	bh=yjEYyViJRSEj7gukJzhLaZCQ3u2E2O6CsjLJYxe6OF0=; h=From:To:Subject;
	b=dNHhuG3WxeG6pI0ITcz6MLyZScfDasujY8HDnZ5HauVkxkHyjh5UVqoLj0vlbbbuJ
	 w+v0rfmRDLVSngtTJE7MsYorPv4mmkjFE5jMoAMgsEJCp5V2bv/EtErNJ0vJfIfNJi
	 P729hpsYnZftR+plkHMmKN/Eko8NbDFs8GnebT3X7jpbYw4ea6iZDiT0o+hLKwqsYU
	 K5dtpDfTX+KV6zVJ0qn07iSvAbv0bM1FddRYsk9WwjwKAWWJRBC5r1vsCydBTxZGro
	 n/BRGJxkDQG+Upi6ZA7Gzn3HRH1xW9PygfmIPSeaKO19MWk2qC66jTB8eZBtziFLfP
	 fAySC2tmR1/eg==
Date: Sun, 15 Jun 2025 12:10:19 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@nxp.com>
Cc: =?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>
Subject: Re: [PATCH] arm64: dts: freescale: imx8mp-toradex-smarc: add fan
 cooling levels
Message-ID: <20250615101019.GA7480@francesco-nb>
References: <20250613-tdx-smarc-imx8mp-fan-cooling-level-v1-1-59aae8fee2db@toradex.com>
 <aEyaNEFl3gD6snOP@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aEyaNEFl3gD6snOP@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_031033_550000_2F69E4CD 
X-CRM114-Status: UNSURE (   9.47  )
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

On Fri, Jun 13, 2025 at 05:37:56PM -0400, Frank Li wrote:
> On Fri, Jun 13, 2025 at 01:35:04PM -0300, João Paulo Gonçalves wrote:
> > From: João Paulo Gonçalves <joao.goncalves@toradex.com>
> >
> > The fan controller on this board cannot work in automatic mode, and
> > requires software control, the reason is that it has no temperature
> > sensor connected.
> 
> why not use built-in temperature sensor

This comment is about the amc6821 temperature sensor input, it's about
the way the HW is designed and it's specific of the amc6821 fan
controller.

Francesco


