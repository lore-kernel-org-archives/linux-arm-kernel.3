Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D8CC624D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 22:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZpOyW9JwdzvymqD7nh64dhGMgQ9gYFcIgy1C7e7EDew=; b=ofu2zT9P3YimrH
	NHoQR3Lu/mXm/OVd6BGCqALTDb2WX4LutEBQM3hp2+ojsP6tjZ6+T064XSI8sLseiVzsOybCTnrY/
	vzuj6Kmj5hSZw1ZyIL3kyaw02rsZF3i6tfuC9OTq7tyIN9s6rpkhKk7Bc0eQ16UKrtoRsNr7r24bO
	i9SH1DIiLgalHfUq4egiADCJtIBEBSYnagWyskvqBb+98uj62Yw/Y9yLBYYXLG2AhofimVS0/seTS
	D6phNRaym8+n53wyzp2HNDJqLLcDbXbJV9QXdRNeRv8PKn4RybVAi+w3PesiFBDF2/JQsVf/ZMvE6
	XSTN6bzn+aMCSWy43SqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Fzj-00000000iNZ-2zpl;
	Thu, 03 Sep 2026 22:33:19 +0000
Received: from ale.deltatee.com ([204.191.154.188])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Fzh-00000000iMo-0TnG;
	Thu, 03 Sep 2026 22:33:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:content-disposition;
	bh=ZpOyW9JwdzvymqD7nh64dhGMgQ9gYFcIgy1C7e7EDew=; b=JxhafLRBFfiDbyUgKcxbdSJ2dB
	G/LvGMoB/v6HYzBXhKjf6dKeFB5H+10bD37VRifeQ+IQOe1OOrI2sYFlDm8ol7jTn2tPJyT1qAxf9
	2g7eLzUtwiPDksHmpo5egNV1iJ3GeKdR33UH5IPfi+V20GQ7DZaS3mAIHe/lR6+R4bjLPOgNyBVWN
	eGhbVPL7oZXNhllf05l+l2reLpOpV8o9PVpH/MPGKrrj6j+/coMHh8vSbqi4cjoNrEDN7dijdO5DI
	lrpCi+m+/WHQRtrKOEnzkBkCWiYJ31KSiouFHjsJYXPZro5rxKb/hxeJNcmS4Qw5US97USWLcyIWE
	y9y2zAvg==;
Received: from [104.157.31.28] (helo=[192.168.1.251])
	by ale.deltatee.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1x2FzL-00000001iUZ-2jmV;
	Thu, 03 Sep 2026 16:32:56 -0600
Message-ID: <1fb463b3-437c-43fa-95df-29c2c7d2496d@deltatee.com>
Date: Thu, 3 Sep 2026 16:30:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Frank.Li@oss.nxp.com, Jacky Huang <ychuang3@nuvoton.com>,
 Shan-Chun Hung <schung@nuvoton.com>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Binbin Zhou <zhoubinbin@loongson.cn>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 =?UTF-8?Q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Viresh Kumar <vireshk@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Kelvin Cao <kelvin.cao@microchip.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-trace-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev,
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
References: <20260903-dma-chan_dev-rename-v2-0-0db305b6c716@nxp.com>
 <20260903-dma-chan_dev-rename-v2-1-0db305b6c716@nxp.com>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <20260903-dma-chan_dev-rename-v2-1-0db305b6c716@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 104.157.31.28
X-SA-Exim-Rcpt-To: Frank.Li@oss.nxp.com, ychuang3@nuvoton.com, schung@nuvoton.com, vkoul@kernel.org, Frank.Li@kernel.org, paul@crapouillou.net, Eugeniy.Paltsev@synopsys.com, andriy.shevchenko@linux.intel.com, zhoubinbin@loongson.cn, patrice.chotard@foss.st.com, amelie.delaunay@foss.st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, thierry.reding@kernel.org, jonathanh@nvidia.com, ludovic.desroches@microchip.com, vireshk@kernel.org, keguang.zhang@gmail.com, afaerber@suse.de, mani@kernel.org, daniel@zonque.org, haojian.zhuang@gmail.com, robert.jarzmik@free.fr, wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, kelvin.cao@microchip.com, ldewangan@nvidia.com, vigneshr@ti.com, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-trace-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev, imx@lists.linux.dev, Frank.Li@nxp.com
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH v2 1/3] dmaengine: vchan: add vchan_chan_name() to get
 channel device name
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_153317_219051_02262566 
X-CRM114-Status: UNSURE (   7.90  )
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



On 2026-09-03 2:53 p.m., Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Introduce vchan_chan_name() to obtain the DMA channel device name.
> 
> Use a dedicated helper instead of directly accessing dma_chan::dev
> so callers remain unaffected by an upcoming rename of the struct member.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Makes sense to me:

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

