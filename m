Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC525E77182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 18:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0ukgXMQf/CsgjBm2gur+V6NgACFYTgol5i+fAuogW4=; b=J+VS1GjZ46klzSQVRVhGR/ELno
	0m2GtvQcYjmNO8n/Mok2icpGVBXpcjqQ2S2HWK2aCOLaEN5SeK6glRYIzBojMS4bUQYsljsTOlAPy
	RCfMCINYNO0hRmZm5ZZkLXN/TCeM6aznXtyB8Xv/8I52QSXv3XQjbcQh6W7QVmnV4yLUYHeDovzTA
	D3z8GSqUguAh/w2kUg3v3iRu2tiH12YEAiAAueCHnvNAW9kl7Z4CfxPXrDeNFn+0/lkx1gV5aalvE
	TvMBhloEDemReCHlJyszSwA3SeB27mw8rqVfpDw26ER/h9x6NyrzsVE66fytoFHoQgSKW+BDFwk7Z
	9JseARfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL5Bc-0000000CQem-2E7g;
	Tue, 10 Dec 2024 18:42:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL54e-0000000CPNx-3NNq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 18:35:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AFC1EA40F5F;
	Tue, 10 Dec 2024 18:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8155BC4CEDD;
	Tue, 10 Dec 2024 18:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733855707;
	bh=9LharZa16OofMPaEDCesasz39XzH6ib3Z17ZeyyX9Ss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UFHT+fK/gUHEkpSwS1en/4ti4hxrlxaWXQUW4sl7eGOTAHGQGOhv5Im4cW3yj4jfb
	 vBke+5IAJPx/hL2i6gckdXapdTbEL1UOBTxhvrQ/AUDijx1S/zLtbCScVtBgXN6EKw
	 /Q8dV++NGuBDNvkZp4D/2jTg0hFz4BrVqLDgO2xSk65DLihOC/Z9j8aXJqsp6PIJUU
	 gSr4u4KRTXKizD6L/n2CmoabBYdECVOUUiEzfSNW7Fsz/R0uPdVZHokZ21Al+b+46c
	 r5eykfOn1xrKeJ9L1bXWQRstFAsW3LL4y8ZVYsAV7HOz6o1kihchYM5R4nIMpfzqzq
	 xIJor//EvSwVw==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND] arm64: asm: Fix typo in pgtable.h
Date: Tue, 10 Dec 2024 18:34:48 +0000
Message-Id: <173383048640.3808253.4005904648913144834.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241203093323.7831-1-zhujun2@cmss.chinamobile.com>
References: <20241203093323.7831-1-zhujun2@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_103508_903704_D25FE83B 
X-CRM114-Status: UNSURE (   6.56  )
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

On Tue, 03 Dec 2024 01:33:23 -0800, Zhu Jun wrote:
> The word 'trasferring' is wrong, so fix it.
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: asm: Fix typo in pgtable.h
      https://git.kernel.org/arm64/c/e281bd22998b

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

