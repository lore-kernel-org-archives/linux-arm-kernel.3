Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC14CD3F09D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 16:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32wh0oC163HoKPAe2I/d29sWz9X++LYcq01yqbXdWRk=; b=otxS+ZmVnJi/ZgSg41zwwXf4T7
	LP5xu9gWMK2xA1cs3F/kbDD2mgXuuOpmxiDqX5EWLm2dWBHKFhQDV5fJpbVHacXkXE0C7vZ4Q+CvN
	gE0eQjxyFA61jxZW2pT4wJsNQ2lEqhhUZtzEQzEqsaAEKMzupESSlGtaYaJgktanVubQPwQLadW3l
	mppoLGdQlvLk27ymmC57EfOfxSUuVfeqyyEqeEsY638TYvoNYsHEJh3HwE5WzHVWsgU93PvoZiurt
	HIC4ktGpB+xh6Ax32ACo75gcb7eiQWmO9EHZEdgH2XjWuPjcV+0y+Kw3wcdvQXED5Tn4sFWSeqfwZ
	aZR9C4Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVF8-00000000NA4-3xt5;
	Thu, 29 Jan 2026 16:51:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVF6-00000000N9X-0i8N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 16:51:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 60F2343D01;
	Thu, 29 Jan 2026 16:51:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AFE4C4CEF7;
	Thu, 29 Jan 2026 16:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769705499;
	bh=YmG0tgmvN9wkowhGDe7r72zqEn4bWMNuc4djbes+i7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jy4Ve4L/V7YNRtTvddViMvmxnlxWUTQKwWlNePNOeOrXavOoH7mf49OSyoqQ3ijMF
	 d/33ZVs4f9pQdu+jNkHi/S+EkUF/vz5gNERyOpDO85sxJ7vfjRAYkyerehsq0EjGQn
	 FkZDdq/YJN7pzbXcsJFLBY1zlee9qe4RSa9scIabFDOX7Z4vU2NcsG/rRLwfVfbARf
	 0B3iuRRyhj7VSjkB/9hKwJSbYH+5R3/tBqCcyS+OyFXqGyM9OgnPZEtcpUHIBxli6W
	 gjNttqiQUS1PvNR+MYYRpI5bp/9PkHFraoZmJlovHyUY0N8b3FOJerc3B3ozR90hFS
	 cgJfiLsvNrxAg==
Date: Thu, 29 Jan 2026 10:51:38 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Matthias Brugger <mbrugger@suse.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	NXP S32 Linux Team <s32@nxp.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Chester Lin <chester62515@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: net: nxp,s32-dwmac: Declare
 per-queue interrupts
Message-ID: <176970549762.1267513.768026318632683991.robh@kernel.org>
References: <20260128-dwmac_multi_irq-v4-0-82fa34fcf2f2@oss.nxp.com>
 <20260128-dwmac_multi_irq-v4-2-82fa34fcf2f2@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-dwmac_multi_irq-v4-2-82fa34fcf2f2@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_085140_227335_EEC9835F 
X-CRM114-Status: UNSURE (   8.80  )
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


On Wed, 28 Jan 2026 09:49:53 +0100, Jan Petrous (OSS) wrote:
> The DWMAC IP on NXP S32G/R SoCs has connected queue-based IRQ lines,
> set them to allow using Multi-IRQ mode.
> 
> Reviewed-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
>  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 44 +++++++++++++++++++---
>  1 file changed, 39 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


