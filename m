Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7B5CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 02:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSFMz1YsRrecVdcFsDR2zMYv9+JcraECHD1VyUZRDF8=; b=cGtjNm5nikZQgE93JWabmsqAoY
	UeZD6E2sq+ctiWyvkd9W9xhn6P2ECb6gv/HpOc3H+8DSLlr4ljz3Yjo9fU2yruvX9q8wiD5CZ1Tch
	ZrybF+OfF5GSFO2W2E4KsSTiC/yADorDU3YxbueX3uEpu9i8ZstK6yqvGr7E+Da7cZ5jTpVCUSDTR
	pqLoM3ogTV+TQ5SnElvw6YULuOjUYFVqAGNLti5b0XsLf+zf68a5Kimm+LbxB14U+CORk1WDSaG0J
	TVf45feePs+o1g/XNvn8P2Tq8rILzAiEoBhTntpTQnCAvROVcbjCSBgKURZLc1NWbLJsf8HufW3oy
	z4cbww5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvo6R-00000003i39-23dX;
	Tue, 09 Sep 2025 02:29:03 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhSP-00000001rmp-06cp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 19:23:18 +0000
Received: from francesco-nb (xdsl-188-155-97-38.adslplus.ch [188.155.97.38])
	by mail11.truemail.it (Postfix) with ESMTPA id 75263233E8;
	Mon,  8 Sep 2025 21:23:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1757359395;
	bh=TSFMz1YsRrecVdcFsDR2zMYv9+JcraECHD1VyUZRDF8=; h=From:To:Subject;
	b=j1Fm6HelbfVbg7SK5RjhBl2NR05zf+V/t89C6ar3l+BQ8F5E8tu1hNAvi0IYcD1Bz
	 TgbeG1pXuw/t87/CbnuPMQVu7aB5GEds2LxUQSndzxJl1Uz2bcN6RPqcUPOflKimkB
	 TucXL8JW0H8XyDEA6hO2DMUWEmAZrka1dNsZpN+fLqb+eLVF2qTzgvBGfPTXFnpuy7
	 tf3sgMHRAMw/sbNsJ1V8Rrn/3zg+acU1bTkWT38hZIpvutVk9b26aFb7Uy/otU9sBG
	 iBEIgOUy54m2YOaw48kaj+KHoAUUZu1WjUtO7WCZ8sHDK7s+b322K1Gf/OtNWT+cI0
	 0mh4JvxlZfE0Q==
Date: Mon, 8 Sep 2025 21:23:13 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, afd@ti.com,
	u-kumar1@ti.com, hnagalla@ti.com, jm@ti.com, d-gole@ti.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Robert Nelson <robertcnelson@gmail.com>,
	Jo_o Paulo Gon_alves <joao.goncalves@toradex.com>,
	Parth Pancholi <parth.pancholi@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Logan Bristol <logan.bristol@utexas.edu>,
	Josua Mayer <josua@solid-run.com>, John Ma <jma@phytec.com>,
	Nathan Morrisson <nmorrisson@phytec.com>,
	Garrett Giordano <ggiordano@phytec.com>,
	Matt McKee <mmckee@phytec.com>, Wadim Egorov <w.egorov@phytec.de>,
	Andrejs Cainikovs <andrejs.cainikovs@toradex.com>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Diogo Ivo <diogo.ivo@siemens.com>,
	Li Hua Qian <huaqian.li@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Baocheng Su <baocheng.su@siemens.com>,
	Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
Subject: Re: [PATCH v4 13/34] arm64: dts: ti: k3: Rename rproc reserved-mem
 nodes to 'memory@addr'
Message-ID: <20250908192313.GC4217@francesco-nb>
References: <20250908142826.1828676-1-b-padhi@ti.com>
 <20250908142826.1828676-14-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908142826.1828676-14-b-padhi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_122317_216028_649F2535 
X-CRM114-Status: UNSURE (   8.64  )
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

On Mon, Sep 08, 2025 at 07:58:05PM +0530, Beleswar Padhi wrote:
> Currently, the reserved memory carveouts used by remote processors are
> named like 'rproc-name-<dma>-memory-region@addr'. While it is
> descriptive, the node label already serves that purpose. Rename reserved
> memory nodes to generic 'memory@addr' to align with the device tree
> specifications. This is done for all TI K3 based boards.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>


