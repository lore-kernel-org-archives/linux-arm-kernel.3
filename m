Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263D8CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 07:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMQBXrU9FT0dD0+vFXxYp0huKRYdo7AaaqC5mS/KqME=; b=zQRZeqfgzWssIq5iLO0tBCOZFs
	DgX7re2DDsMLU5FCVP2lCp9Wyxh9gkPcZdhDL4JkIs7iaBe6C+QbmV82BYjApIic/FX4jjxJmD4ey
	BiBFDYdv9iDEFJ5+FygY0qziz5FeVMfKPQQ1ewQl8Fb6bo2kN9wOV0lA6NPOD4VV396g2bKM++JAS
	1pk+ftdFUGzHnLnYB+sWV96iJNtKEk2RZj5lX52hTvnGorlnGik0v04K3haRqtQLH4rpLHesKwEwN
	hBrK4VF14XbtUg4OcsqFip0BCI9pGGieDaamCltW0ZF3WnVXtotxvHX6mSlseghjp/appQM8kIAQj
	JbeI77gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhtr-0000000FzNo-41U2;
	Tue, 12 May 2026 07:51:31 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhtn-0000000FzMb-3crR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 07:51:30 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 5B3A11F92A;
	Tue, 12 May 2026 09:51:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1778572282;
	bh=UMQBXrU9FT0dD0+vFXxYp0huKRYdo7AaaqC5mS/KqME=; h=From:To:Subject;
	b=ukOLU+jnyf7tyziG+vS3l59YEiSDEnBB6kbfjmmR5Eoqhn5yE+U9LSKtp347Wv2ta
	 yMeANjw/xMVlYN5GTOyZyGlokPO5HopM7zXZJl98uAw4JyQq7IyrrzBmseeauDoUoq
	 YB5F/1sCQat7R27vo1y3SLaZs0NVfLCSNKtIUCIdpJxoczRC1OkFbMRAiQV0UlnYcO
	 iLV4reulN618GIUUifmQPvFf0wh4ZsqWkynriFRN1qoKLW0qHqLLZwDhbmcfdQoKn1
	 O4yZfIHSx2REDx6U2KaZu4otYWbBXSIhqV9BtDCbmn9fkPx29jNlNy7ju40L6bWqbH
	 uPYPsr6QDjB3A==
Date: Tue, 12 May 2026 09:51:20 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ARM: dts: imx6qdl-sabrelite: add mdio phy address 0
Message-ID: <20260512075120.GB5820@francesco-nb>
References: <20260511-b4-imx25_dts_simple_warning-v1-0-01b855a5ce25@nxp.com>
 <20260511-b4-imx25_dts_simple_warning-v1-1-01b855a5ce25@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-b4-imx25_dts_simple_warning-v1-1-01b855a5ce25@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_005128_924322_5E8955BD 
X-CRM114-Status: UNSURE (   8.23  )
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

On Mon, May 11, 2026 at 05:04:56PM -0400, Frank Li wrote:
> According to IEEE 802.3 Clause 22.2.4.5.5 PHYAD (PHY Address), A PHY that
> is connected to the station management entity via the mechanical interface
> defined in 22.6 shall always respond to transactions addressed to PHY
> Address zero <00000>.
> 
> Use address 0 is safe because only one MDIO phy under mdio bus.

I do not think this is generally safe.

Not all ethernet phy answer to the 0 broadcast address. The one that I
have personally worked with consider 0 a unicast address.

Francesco


