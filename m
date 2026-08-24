Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970CBC5DF9B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 13:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DOrFZmbGa9pv6Ty9w9HeOjKrDU232cvU4GqO1tK+lD4=; b=QQuyxdsOVi9/F5G+hx2CI+c6lE
	6TUDJ9LrNVtTBiTpmJmUWUnLjQPXULp4GQl59hlEJ9kBbAWsSu0vJ0sh77r5tBjAECc3o735tW+Cr
	ol3t+bL/mm7fyrQ9uhnmZ4Ks3/XDYz0U7VdVQjubCq90gVxpY3WTwH98y94OtxjDTeHfwV0vV/rcb
	fdEGJbPBHLWbZpWgX+I6Hi3Ex3UiHlPqBXeftHBmWrJUXYctyjVs6wIKMa40HiB770e57WhrLGyXX
	qLn8gH6b/0aqkXB1TJFNvyHeYs9PHaG+vQneYYL5yLFjrvQ37hEWyZT6iXok83T8NTYWWNHtQz+1A
	ZHEvwxKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUWg-0000000GgDk-21va;
	Mon, 24 Aug 2026 13:15:46 +0000
Received: from smtp2-g21.free.fr ([212.27.42.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUWZ-0000000GgBY-1qd3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 13:15:43 +0000
Received: from L30177.local (unknown [46.193.67.97])
	(Authenticated sender: vjardin@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 1AADF2003C3;
	Mon, 24 Aug 2026 15:15:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1787577333;
	bh=xu6YOcOWUBosY162fqI8wR2m/f4r2kHKyQ4LgFRs438=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tE4EsFIyKBG0hbwT2YlOyTcRsEht1e52R4KqWyfTanay+mfqAwtAkoG1w1cFurfZt
	 SkfaeudBWXGjB+X7+h+60FuCj/T8LrPiPMLS4KAwanudCZE7zsTm+F5LHD4LUZmRXF
	 8+ILdE3Xgf8lis1SoejHi23/R3aXAwFve2c8WXX0IEknqv3X1GKhTxZQbRHX8j8qaj
	 z8ZQ4QVPmV815FF5Cgi0JRxLH7rJoI3nuWvsDD0vlcWQwQgckip9KTQuv826hjRINh
	 u0fFBGgouNOHIuLfOlMnTuJpTfhtiYbEx3Rly44yQKf0kAf63ZCY3TwUsjM5gH7wDS
	 yTu6KM+L5RDdQ==
Date: Mon, 24 Aug 2026 15:15:18 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Josua Mayer <josua@solid-run.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: lx2160a: fix incorrect pinmux
Message-ID: <aoxD5mwdBCU5Gnfg@L30177.local>
References: <20260824-for-upstream-lx2160a-pinmux-fix-v1-1-33a3c8d5ea8a@free.fr>
 <3d4fe161-895e-4820-a99d-8cd5fd6d9ad2@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d4fe161-895e-4820-a99d-8cd5fd6d9ad2@solid-run.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_061539_922292_D6AB7BE9 
X-CRM114-Status: UNSURE (   6.61  )
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

Hi Josua,

> Reviewed-by: Josua Mayer <josua@solid-run.com>

Sorry, I did miss your review while doing a v2 based on the Bot's comments.
Please, can you resubmit your reviewed by on this serie:
  https://lore.kernel.org/all/20260824-for-upstream-lx2160a-pinmux-fix-v2-0-0a525d5f4cd5@free.fr/
?

thank you,
  Vincent

