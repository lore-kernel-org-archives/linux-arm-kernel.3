Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C8CCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 08:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TA048/r0Me1GXrKVGIUon2gAJMRu+ZNYAkK6UX0cWiQ=; b=qT8WO0pFcU8bycHOo+7LyEShbg
	yjRIZjPtPJoy6MofZO9dZ4588UCHD5M+DHfBNDXtK3jnDojW6pkAP2+mX6E4D7cWbeSoQM6A+3yec
	KEdqkCC30gpbfGYH+fVvm3Ae0CMNFPLbV8GaA0D7nBA+3F3J76TvV4DA2UatGyj83rLBUuRusT4T5
	Y8d6tQtYAgkgTHw+cf34QMwSHc0kdFSEv/SrCX5AkEYu82lzgcP4XDT0+c4h6aGpGfBPMMPROqMuB
	fE+9WEo/GNYppHZZ/24WffaaqLy+yfp2MzavuDPTJNT00rlCm6O7IRRD+IOIr8rk7f/csCNHkTQYf
	G0v3NECA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMHP-0000000Cn3I-1oF7;
	Mon, 11 May 2026 08:46:23 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMHM-0000000Cn2P-1GUh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 08:46:22 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 879791FA0B;
	Mon, 11 May 2026 10:46:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1778489173;
	bh=TA048/r0Me1GXrKVGIUon2gAJMRu+ZNYAkK6UX0cWiQ=; h=From:To:Subject;
	b=S1PGxoAP3piLZ7dZMj8FXJl+rf4h1YA5JiCz3IsNc+7p62bpLZfRAH1k9+zRQyRro
	 MV5UM6lVg64H0CdA1nDiEPGYOw91wCbfrdVC23X/vER4iQdQnU3bfHg7sE7eGEfOyU
	 Lr4NSSFTVLKdkGSQxaLsJZ5RyZZEqqm4cDSZEZfp/5Q0hGK0kMyrKplbQm68e5ZzMI
	 djsZ4tVUa30rcat3IHv0F1+YpyargJt1c47hKYjGMYNJy2zLtX8AlV6nqGmnr0plL0
	 A0NloMnEj4mYJVyeV5MDotmyTzYrvwG6FANxIwA10wUxddgBHGY20kQCEM1mGimmGt
	 CG8LfwEk15WzA==
Date: Mon, 11 May 2026 10:46:11 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Antoine Gouby <antoine.gouby@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Antoine Gouby <antoine.gouby@toradex.com>
Subject: Re: [PATCH] arm64: dts: freescale: imx95-toradex-smarc: replace
 deprecated gpio property
Message-ID: <20260511084611.GB29876@francesco-nb>
References: <20260508-replace-gpio-property-v1-1-ec67cc64e576@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-replace-gpio-property-v1-1-ec67cc64e576@toradex.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_014621_239138_718D4BE5 
X-CRM114-Status: UNSURE (   5.76  )
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

On Fri, May 08, 2026 at 01:26:36PM +0200, Antoine Gouby wrote:
> From: Antoine Gouby <antoine.gouby@toradex.com>
> 
> Replace deprecated "gpio" property with "gpios" in
> regulator-vmmc-usdhc2 fixed regulator node.
> 
> Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>


