Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DE8D74941
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 22:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxRcUstQ34n8VYrTeRh3oRvMLgU8jjCoNl40Nr+uPSc=; b=knYUUkgGAVJGkuo6SpXJ9r+T09
	Pg/wdjeiqktBxJximujVJTDoztd+OUfdLO8rqNPjWilXwbUmncg15J7XQDYay3Rh0NGjNbH7oVbUU
	Y00ptb6o7Qk0RciIvwlbheVgoU0PmS+XdjL8yPLHLlsPiQ/TzKDkFgtoumTJJbhzUuaGoteshqDq+
	bjRhu+HqHe3CkAHCnfuwsfz+ZFN/z4Di/gtMIIV3kC4lfJkeITDp94twKqOxn+XshZNslpXI42MRi
	dnt0wZTya0MQtqqVwLVLUlkmf7uSEm0Bf2DNbfPr9U2nHJbhbR8mUW4Hmt/foMQUMxwIr9y6i7GIA
	7G1tO7+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5uGb-0000000G0L0-2yI4;
	Tue, 29 Oct 2024 22:00:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5uEw-0000000G04x-0Ffq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 21:59:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EDA21A42FB6;
	Tue, 29 Oct 2024 21:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4230C4CECD;
	Tue, 29 Oct 2024 21:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730239139;
	bh=UbpQzkUTWm45exTpBQeEuDpUh3FZIWDnpsfqppEizFY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fKvwbwPDX1QEZAkInxmLMERwCC9dXfCjlxRKFKad97pu5hmalG/XidGR6iXzoIonN
	 1dnlJ+TvmYvcumjcmunMSE1nxbVVFyEAdXZilfpnVBYcT9feDz9dCRQ0JcS2Zyulz8
	 WY2yxYtS3Tz4f+EpHAErjsP/y1LR/daXhP+jqZ48PlTUhwgR6bP3pb0IsiYHV27y0y
	 7UXHQH3pl4p3+qU8eVhQdbSQN1+cU6ScSZpbnXjPaE9J0zSBjDeMXLF+dZscPMphnt
	 ZlH3tuTLB5qhRH1W8FfyXv97pl08Y36R8woemgaQYSKFfypi2pbN8H101Kwq5G/aYd
	 AE/hnF+IFwtbg==
Date: Tue, 29 Oct 2024 14:58:57 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lothar Rubusch <l.rubusch@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, a.fatoum@pengutronix.de,
 conor+dt@kernel.org, dinguyen@kernel.org, marex@denx.de,
 s.trumtrar@pengutronix.de, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/23] dt-bindings: net: snps,dwmac: add support for
 Arria10
Message-ID: <20241029145857.29a4f360@kernel.org>
In-Reply-To: <20241029202349.69442-13-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
	<20241029202349.69442-13-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_145902_196537_E1A3F0F2 
X-CRM114-Status: UNSURE (   9.04  )
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

On Tue, 29 Oct 2024 20:23:38 +0000 Lothar Rubusch wrote:
> The hard processor system (HPS) on the Intel/Altera Arria10 provides
> three Ethernet Media Access Controller (EMAC) peripherals. Each EMAC
> can be used to transmit and receive data at 10/100/1000 Mbps over
> ethernet connections in compliance with the IEEE 802.3 specification.
> The EMACs on the Arria10 are instances of the Synopsis DesignWare
> Universal 10/100/1000 Ethernet MAC, version 3.72a.
> 
> Support the Synopsis DesignWare version 3.72a, which is used in Intel's
> Arria10 SoC, since it was missing.

Please split out patches 11 and 12 as a separate series.

