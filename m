Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA405E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 20:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0+/PGMsAGTp7qDKS9c/V9/FOWRQfeCYJohOHqi55Do=; b=u4r4czlWzJSYC+iivrAQ4NHC37
	JBS3BTLWTWP20Q9iCNSgjF3J6tNynAoiWgF0ZhCI635UTX1ji70vO0MrLCqXwzexXWCA85BlJ0P1O
	MjA47xlUP14xAAXVbUNgyyb1YIpXj8bXUkKtWJeH/+t2XH+ok2N/YnKr8HrcPJ1pHdOYLiXeGDKa6
	s+VPeKRWbCmJvZ9PiQiuHoAkLmGwqCF624FFvQ0wOwi9+f/eUxiLhBx6fDv7kcrkEHYPFK9wk+B7X
	6OLehN4FqfYnvuVlB8juVVmoSW7SovtL/w19tgs+V7Z8rOxgGrV4CfO8rDdW6oJgypRKr+lUVgJcN
	O1vXTmvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnxa-00000009kbR-3F5a;
	Tue, 14 Jan 2025 20:56:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnnY-00000009ihh-1CbQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 20:46:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E465C5C59B4;
	Tue, 14 Jan 2025 20:45:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14417C4CEDD;
	Tue, 14 Jan 2025 20:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736887563;
	bh=cbrnKzQADWAdnh86AY10bxSbKYy1bTDuo3KND/+ugYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uPPcCibxhGoiDbBIqGpiKdx23HdCyo+Q5vtBiOY0Y/H+mHRV4GYVKQouU8F5BOp2S
	 jocbaJJ2eqXKimxNjukIhVwTud6iJvtViNocLQPW6pN1y40guHPqqqPgCUJe9jxJ8o
	 S+2kkVvYp87mqixeWvT7PMz9uSnaUf2+DQXoKAllI55Usx1lUfZ3m9nqQjzZ9OSCYh
	 PDlshz7jQMhph4C/iq7VlpVh9lloSUggwSsjkT4UWD/IqGFpdbfz40FUP2W3gqGB8f
	 JgtF0+AtdM0wljo6oMWNB1TM/wvW/L40HsP59TrFW6sjoIEh3qpy0QhfzVHdlfPKl6
	 x6pKTFpQpaZJA==
Date: Tue, 14 Jan 2025 14:46:01 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: arm: fsl: add i.MX95 15x15 EVK board
Message-ID: <173688756096.1689612.6453110742993386825.robh@kernel.org>
References: <20250113-imx95_15x15-v1-0-8c20cbaab9ed@nxp.com>
 <20250113-imx95_15x15-v1-1-8c20cbaab9ed@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-imx95_15x15-v1-1-8c20cbaab9ed@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_124604_380988_ADD19657 
X-CRM114-Status: UNSURE (   7.96  )
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


On Mon, 13 Jan 2025 13:01:59 -0500, Frank Li wrote:
> Add DT compatible string for NXP i.MX95 15x15 EVK board.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


