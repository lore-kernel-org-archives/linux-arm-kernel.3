Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2965C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 13:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVXvIU3tMqnXvAuG8B2fQwTyj72jAq4B5Ooo9BdS9+s=; b=TP57mITbt9FZk4lHzKjxC95P4H
	DxvKHJt/ljj543UKeFYaZzJmu5hXZYTO4fm/DG4utAO6LLrJxQmUHR0F7lWJAdV26PtFtVea8OWQx
	+7PgSJQ2SVF/K7+PYuGoOfW8UcGXm8EwzRDjIoOU/T5CpICfc8BE5ScWeeXN1OXOLxjSo+LydEK8X
	951sYOnj7BlfAl0Ipg3K40RwYvaT6Hyw2w9hUPbC0zlI3w6XLBLQLitC/iDOqCFiBv0j8GF/oTdC0
	WN4MVfot9Wi0bdV2INI/44Qggr0uv3sIw+V2fUaFcLMLma5KeAuRa+UZlYRyFm8lEVTdYr6v8j4RQ
	j7KdHnFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZ8p-00000004yjU-0Ip5;
	Wed, 23 Jul 2025 13:04:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueYbW-00000004uh0-2pfR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 12:29:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 67C2641760;
	Wed, 23 Jul 2025 12:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C641C4CEF5;
	Wed, 23 Jul 2025 12:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753273790;
	bh=aVCHEe3ksbayGIHAF13OBQWF1Xw4AI3aSQvoUg81aKU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hPii49I9qGK1H5XnCmYVy5yuSZLK9QxA8qdmNfWNZesCq1/JsNJ4bvuju+590V2Vt
	 v8/iNj177ACcxzp6yOJodxko5NcbtxjsC3VC6m1xxKw/u7y1rDv767nnh9DciT8nNf
	 lPYM8ADqGD67rAVWuxYbdBvyGcxcTH4RgMuSkZ/BjoN7RWSIyjotI10Za64Lck8uP/
	 vxx3F1V3VkCCNxckqZ4HlXfenKMaKeg4hWlmAmqZXZex8lkSY/p9gVx1s2XIRt8kgb
	 uHKj/igqUpdTYrILBcR/EBwsNaU1lKdEoOfSRk3M7Fa3VyRQgGG81Kq1k4gMe9vsqm
	 HqGrLF27QJjZQ==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
In-Reply-To: <20250523213252.582366-1-Frank.Li@nxp.com>
References: <20250523213252.582366-1-Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] dt-bindings: dma: fsl-mxs-dma: allow
 interrupt-names for fsl,imx23-dma-apbx
Message-Id: <175327378618.189941.16358340664801683783.b4-ty@kernel.org>
Date: Wed, 23 Jul 2025 17:59:46 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_052950_737219_0A5808FE 
X-CRM114-Status: UNSURE (   6.82  )
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


On Fri, 23 May 2025 17:32:52 -0400, Frank Li wrote:
> Allow interrupt-names for fsl,imx23-dma-apbx and keep the same restriction
> for others.
> 
> 

Applied, thanks!

[1/1] dt-bindings: dma: fsl-mxs-dma: allow interrupt-names for fsl,imx23-dma-apbx
      commit: e3a9ccd21897a59d02cf2b7a95297086249306d6

Best regards,
-- 
~Vinod



