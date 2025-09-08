Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A5CCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 02:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vNiJoZ4QWly/KKvQRA2zpDh1zo/FXO7FdLLjYNaY9w0=; b=WAZh3tVF+4txpSdbl7tS6iYAGt
	rIZF7Kr6/L/RHnlHg+enKwfK2a8U7zTWpizfObZLsN2y7+tVyBezc+hz0huyNfu2Cs+S9oK/xxoFo
	jrmn+2DoW5Gf2xOlMfBsApHQs+mekaC+GB/n1HGJQi+2NwpxMu/J5h458Vc0Ywv/0dzdqYWQxXos0
	iBnNjsDU5I7F3VgRGe1/xAeyM587sd7zgi5ZwLDlmCUaRm7nyVIod+aS8AC0URi0XsPBPyNWjFhfL
	VhWE1Sm9EQZLo1G/VNpVBjXwzyWF2RW+gSTXNfMBfb6YAt8OISLEPr1PeWAJDm2rIC55dhSHte1kO
	mBHhi9ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvo6P-00000003i06-3A8K;
	Tue, 09 Sep 2025 02:29:01 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhQV-00000001quB-3myC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 19:21:21 +0000
Received: from francesco-nb (xdsl-188-155-97-38.adslplus.ch [188.155.97.38])
	by mail11.truemail.it (Postfix) with ESMTPA id 6037A233EF;
	Mon,  8 Sep 2025 21:21:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1757359278;
	bh=vNiJoZ4QWly/KKvQRA2zpDh1zo/FXO7FdLLjYNaY9w0=; h=From:To:Subject;
	b=AEva1hBP1OMIUEQmEmbb/BEeW/1N3lzEYFQ/yHSmH1NCRGcDJ61jbFBXYb9p8Qe8P
	 pcGpKwQB7OIC5vh5Wh2NdODeFMQUjo9y8HvNQ6XqTvnO3kDinHoD25KEwtpctoviHC
	 oO/5AgJC5Kx91lZ9EohwAOdl1OdAlgUuDOgeKUTOMMZkQvzQSTedfu0AODGaAiGBX5
	 k6H/SPoZFyFVPnpT23pA2dXYf8vIv+B3M7CqDUf0M6QVAFCu0RB8VI/cAuw7Roq4SX
	 JGFawAW+pTiQdOqII2v9cOFqMzwdnF1EgDe5YVq/zFurwvq1897567PewOk3CbmlZH
	 03xTFxkjNLyaw==
Date: Mon, 8 Sep 2025 21:21:16 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, afd@ti.com,
	u-kumar1@ti.com, hnagalla@ti.com, jm@ti.com, d-gole@ti.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Hiago De Franco <hiago.franco@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Jo_o Paulo Gon_alves <joao.goncalves@toradex.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Andrejs Cainikovs <andrejs.cainikovs@toradex.com>
Subject: Re: [PATCH v4 16/34] arm64: dts: ti: k3-am62-verdin: Add missing cfg
 for TI IPC Firmware
Message-ID: <20250908192116.GB4217@francesco-nb>
References: <20250908142826.1828676-1-b-padhi@ti.com>
 <20250908142826.1828676-17-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908142826.1828676-17-b-padhi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_122120_099448_E3A9CB69 
X-CRM114-Status: GOOD (  12.00  )
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

On Mon, Sep 08, 2025 at 07:58:08PM +0530, Beleswar Padhi wrote:
> The wkup_r5fss0_core0_memory_region is used to store the text/data
> sections of the Device Manager (DM) firmware itself and is necessary for
> platform boot. Whereas the wkup_r5fss0_core0_dma_memory_region is used
> for allocating the Virtio buffers needed for IPC with the DM core which
> could be optional. The labels were incorrectly used in the
> k3-am62-verdin.dtsi file. Correct the firmware memory region label.
> 
> Currently, only mailbox node is enabled with FIFO assignment for a
> single M4F remote core. However, there are no users of the enabled
> mailboxes. Add the missing carveouts for WKUP R5F and MCU M4F remote
> processors, and enable those by associating to the above carveout and
> mailboxes. This config aligns with other AM62 boards and can be
> refactored out later.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Verdin AM62

Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com>


