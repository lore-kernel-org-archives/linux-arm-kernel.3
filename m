Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B62EE9413E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 10:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UaMW4Isg1Ih7YV7hIfUjjn3+wCoccITuuZCbWsJ6/mc=; b=olTc8K8vHPejVw2f/Slsm1YP9R
	/IMujeXSYFpco0U2QnmKf1SPBwGMXzK3kkGaT4pLwW3+Z11qwCv7RqzxWT+3HqhIIGAOyOAUA6ls5
	PUT1UzKIOKIRENMy/XvtSRHgGYzIdE5ReD6RTq/JQGAZPLpf/oDG+/b1NeMIkLMJK7goJLCsaeKlk
	3YvOgcOiEXVSHFMcASujiQbERY0yo5fxeov9oW3uKTDPIjXdWHPc0y0gKwQMkWJWOE68GCCdjGWsY
	GIjtWpYJO/gnjC5WP7mLlMQIaXsNeT3qyxwNEQTEb0LFDKcVs8BnqjGcJRt/PmbfqeSApx0t8rgxG
	sARJugIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaWv7-00000004iG0-2Fko;
	Tue, 30 Dec 2025 10:25:41 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaWv3-00000004iF1-0PaE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 10:25:39 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id EBFEF22D01;
	Tue, 30 Dec 2025 11:25:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1767090326;
	bh=UaMW4Isg1Ih7YV7hIfUjjn3+wCoccITuuZCbWsJ6/mc=;
	h=Received:Received:From:To:Subject;
	b=WenOvTcH9vJw+rKtYP66MBnWLyrRhFtNlv64tAQWNg1q4Xeaopj37HiNM6B1OlsFk
	 AC8/FqBJs2O+zjGP7z6BAv+MdOr4tF1JwLGp8RaCNhF7omeBa9wb/r99uPOZt0rT2f
	 Fq0uhfCswEluexqkia76aOpiGPgEJ3g4kiSRzB7c+Bnh91FOJp1nplKSIm4WSjvv8m
	 EScwc2/7cnNK5ethxADtvCu2pTO0Itn4JCKwdkfxkuwsyR5oIlch3i6HabkQWQzA5b
	 ay22oD3Q3oOx1JIKMJyUSj8477v7e7HhgyhDrnjmRfTR18GLYYeq0gf81BM/BAqrds
	 6aftgHTauCEIg==
Received: from livingston (unknown [192.168.42.11])
	by gaggiata.pivistrello.it (Postfix) with ESMTP id 8A6227F9E6;
	Tue, 30 Dec 2025 11:25:25 +0100 (CET)
Received: from pivi by livingston with local (Exim 4.98.2)
	(envelope-from <francesco@dolcini.it>)
	id 1vaWur-000000001Ej-1eKT;
	Tue, 30 Dec 2025 11:25:25 +0100
Date: Tue, 30 Dec 2025 11:25:25 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, max.oss.09@gmail.com
Subject: Re: [PATCH v1 0/3] arm64: dts: imx8x-colibri: add additional
 functionality
Message-ID: <aVOolTfi5s9jqG2v@livingston.pivistrello.it>
References: <20251031125003.275033-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031125003.275033-1-max.oss.09@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_022538_194122_D1DB5CDB 
X-CRM114-Status: UNSURE (   7.74  )
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

Hello Shawn,

On Fri, Oct 31, 2025 at 01:49:40PM +0100, max.oss.09@gmail.com wrote:
> Provide a pwm-backlight.
> Provide the 32kHz Wi-Fi clock used during low-power operation.
> Configure CMA from the device tree.

This series was not applied, any concern? Anything to change?

Thanks,
Francesco



