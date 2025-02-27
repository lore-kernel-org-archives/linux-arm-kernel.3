Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00E0C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 13:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Fr71GDo1am/Op8h/SXIAkrUghbPA9DQZOi1Gai4x2w=; b=3+JSVNAhLDMV/5oAKnAovL1FEv
	dFGMae9vmFOannyjYMgJmaNfDhB8AZz1utd6K0n37QNQeqw13vDTLaKtlJM+cn8pVWcQAF0Dp7558
	Itw+b0tiG52tnaZ/MmEVoM7d6xdLN4zexnYxHAafcb42UOC2dX5I05n7JDR8Zaz+iPmC7GfTkzcOE
	R6qqlxgaiPk3IDomEJJ28GfgrFQiLbY0y3zzaTd8vfnFzBgpwcjUclZD3Lc7qnLxKQDOMbcWf1wMf
	ob99aPvrR/Kc67UL2rxDTTbEEGU0WZ7FsbotDxqBa6Roz29DCT2Fc01XgywWYMr1CL2oq4iNcD8Wt
	yVw0356g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndtE-00000007WZ5-0Oj5;
	Thu, 27 Feb 2025 13:25:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tndj4-00000007Txh-4BGZ;
	Thu, 27 Feb 2025 13:14:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9Fr71GDo1am/Op8h/SXIAkrUghbPA9DQZOi1Gai4x2w=; b=qkUHwjoTumYUWrOUJU6/Ndn4Gg
	vOGDCdAV907lnL4DY1bEQMqAp0UD6zJxgpDIivYN4kQxXSWb2JZBJMxWVX9zZVoloCVhhzw8z4NKu
	M2y1MyVlKesoG1OxsbC4yRXw4cosagKDLZW/MPKWg88l5KrL1ndPVF3IJZ7GHbf/KXuWmfcNupF1P
	Zhe5i5XgVrvbgHPRA27iEVe+yIaSd9e20bD0xuW2UyoBemodrlqK1ZHzqZWpPZK6oyncDbeMdkmZs
	qRBd6AXvqLLVBCMXPS1TBFJMiaeKfrsXTnPEBpGu/Vybtra6744cc7mGre89HQ6apFUdzFzMNbtuN
	OnCr8wyw==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tndit-00011o-GV; Thu, 27 Feb 2025 14:14:43 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: power: rockchip: Add support for RK3562 SoC
Date: Thu, 27 Feb 2025 14:14:42 +0100
Message-ID: <2045951.zToM8qfIzz@diego>
In-Reply-To: <20250227105957.2341107-2-kever.yang@rock-chips.com>
References: <20250227105957.2341107-1-kever.yang@rock-chips.com>
 <20250227105957.2341107-2-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_051455_065008_1F7D22B4 
X-CRM114-Status: UNSURE (   8.92  )
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

Am Donnerstag, 27. Februar 2025, 11:59:56 MEZ schrieb Kever Yang:
> From: Finley Xiao <finley.xiao@rock-chips.com>
> 
> According to a description from TRM, add all the power domains.
> 
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>


checked the defined power-domains against the TRM and they match

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



