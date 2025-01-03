Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7F5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 16:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vAIsOpyJqFScR1GaN+xQvUeegAu3JvhgIGeQSy35CLo=; b=3djV+n31eGrOqlIp46CdXBzj2l
	8YxAaJt5zdbJRNJnRt+/ws0wT9FvNfMTQSmkVcAFxTp3Aa8ngN1HkfF/4SDwSqIIVUdkIvofVPTg8
	RJ+8X+NPDrgWqtor8tkATe6xaL+25kSXn8Pr1IKhYVT0V6p//wm0oztGYGzG7XZJFBO0XmVPKbpCt
	TfQ05cdca3J4FupoCHXJGTDarnSuVN+WozONaXOfpnJNWvYC47aqnaivUuFaY5yU4vOwTx85C/80P
	Uvb0ndVAN/BLuKVWKRQraCRvPUTUe7iqYR+7U0hTGLtcUTxP9+6caceJvYbHNMf1wJLUZAyD2Qtzt
	uyBi7YFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTkz0-0000000DVK7-0Xud;
	Fri, 03 Jan 2025 16:57:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTkxm-0000000DV6o-1iKB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 16:55:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 481DAA40FB5;
	Fri,  3 Jan 2025 16:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A21A3C4CED6;
	Fri,  3 Jan 2025 16:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735923352;
	bh=UATO23qcVHHPiRn6kDJDY1d+aEUGAULwRtnzqvBFyqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rPEHieJGdOEaNX3/Kp2mxHAlEEktfnj+x+ZdjGzUex7p4YLkQ8xbNklRG8FapebDT
	 m9Fo3FfoXXE7hcWKwedvwVLxRh3jrHSO2jdPalbLsXnrJKBWDVwQAACQF1YIMWJGmw
	 k7UcOatr9Nj9OAxJLm9+EK1QPYQ0X8PDPj3QvGxVi5yO5ZZTqscr9xmUwVaescqHqc
	 6LEIwV/Nzo9DjyAHtNad/w4Flvtp2FOzdJFzVwLbf7gE+KnFGVEsAk2tA6qiyratCc
	 ax4Di4ycV3nrsNgNnpS/7RBAX9NS9jWvooEBTO9aWve7B9a/Wver/FjhbzSR9zueuW
	 8bhIOkDVA3G9g==
Date: Fri, 3 Jan 2025 10:55:50 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: edumazet@google.com, peppe.cavallaro@st.com, andrew+netdev@lunn.ch,
	joabreu@synopsys.com, netdev@vger.kernel.org, schung@nuvoton.com,
	linux-stm32@st-md-mailman.stormreply.com, kuba@kernel.org,
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
	mcoquelin.stm32@gmail.com, linux-arm-kernel@lists.infradead.org,
	richardcochran@gmail.com, ychuang3@nuvoton.com, krzk+dt@kernel.org,
	pabeni@redhat.com, linux-kernel@vger.kernel.org, yclu4@nuvoton.com,
	conor+dt@kernel.org, alexandre.torgue@foss.st.com,
	davem@davemloft.net
Subject: Re: [PATCH net-next v6 1/3] dt-bindings: net: nuvoton: Add schema
 for Nuvoton MA35 family GMAC
Message-ID: <173592330334.2414402.4730979254460270593.robh@kernel.org>
References: <20250103063241.2306312-1-a0987203069@gmail.com>
 <20250103063241.2306312-2-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103063241.2306312-2-a0987203069@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_085554_512657_D4F9034C 
X-CRM114-Status: GOOD (  10.38  )
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


On Fri, 03 Jan 2025 14:32:39 +0800, Joey Lu wrote:
> Create initial schema for Nuvoton MA35 family Gigabit MAC.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 ++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  2 files changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>




