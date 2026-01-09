Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CA2D26D71
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 17:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOr3q0OjhbXmht4kZH2jV8y0qoy3u91qW9dCU5uU4kI=; b=FXgaHi/WfNZFy2GdmIxs3oEPRi
	C2u/hyDWtDtr8Dg1t/TKCjg1+JaFpd+/hnkT4rRp97Ah/gsk6sPz75r7E/peCVmXJmrAdyGGWYzvx
	wvPKf5BWSWH6gmD49mjIfXojNKuOlH3r9ygENUKAcnnbwZmhjkPHY+kxnSC/YF467E8uDYju3wMRj
	DRTlr/YqsxC/eIwO+2FL3ikxzB2g2yla45dYQ0O20k4StwN4KzG4XAw5cCX593ymArtZ4AFPPjtaR
	GqR4yTSIBe+lIK8IBjnoH4VDIconC3ZZm99X6vHwb1vP8+2xKIasib6KhRwjFKqSKt8xnE2eptQPS
	k4k1zoXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGJR-00000002pTq-2Okx;
	Fri, 09 Jan 2026 17:30:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGJO-00000002pTC-42Wd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 17:30:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 820C2436D6;
	Fri,  9 Jan 2026 17:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC687C4CEF1;
	Fri,  9 Jan 2026 17:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767979810;
	bh=Ys0ykWpj2zSXnuf7Ny882XK65ZCgh6xm2YsQvWZ6hZQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=do5YWsqBZ2EZdt3cFZg3WkZZaE87Djq0r2iDU51E3s5vYlk5ck91aTQEDcQVL9f6D
	 3wt/YiQcTAzDJ+tUAke9hiGvk6zT9VIBv+wdBv65367C+NlEcwUgYG794kTxCRCNcd
	 M90flYXLmsouaBYqJc4T3cQumX2vw7zLbDDpso0fmp0mU0MY7MPWRMMMFt6xNtQtkM
	 B3QjnbgfalZClKpPsxVk9bDk0Mx23G5H6FO/KfhbBmj8Kj/5mVIvzsoEZPKIVcvW1U
	 eTEnZU4ZYsgkG0bo1vfNF0EmbpgLjXVJeXEjpMKJfjYDFRAQVRRSAHAi44TCHeN1Wc
	 jpqKI0CtZGSWA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20251231215754.2222308-2-vz@mleia.com>
References: <20251231215754.2222308-2-vz@mleia.com>
Subject: Re: (subset) [PATCH 1/5] dt-bindings: mfd: nxp: Add NXP LPC32xx
 System Control Block
Message-Id: <176797980840.1887694.12154424112821478405.b4-ty@kernel.org>
Date: Fri, 09 Jan 2026 17:30:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_093011_020436_2AD7F77D 
X-CRM114-Status: UNSURE (   6.22  )
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

On Wed, 31 Dec 2025 23:57:50 +0200, Vladimir Zapolskiy wrote:
> NXP LPC32xx SoC series contains a System Control Block, which serves for
> a multitude of purposes including clock and power management, DMA muxing,
> storing SoC unique ID etc.
> 
> 

Applied, thanks!

[1/5] dt-bindings: mfd: nxp: Add NXP LPC32xx System Control Block
      commit: 7cbde1b4ae7aeb1789f4691f94469316f7ca12ca

--
Lee Jones [李琼斯]


