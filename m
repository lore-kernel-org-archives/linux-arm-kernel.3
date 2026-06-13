Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00C7CD98D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 18:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bW2ZyNL9PiJBJq/IMQkuWCqxi4Vg0c2aSHkAUwoZk6M=; b=nkwsC0egN2hY7MlvfK2WXs5HDE
	ZNKOgAs9sC2jsozvu9HvWhxYN7vdAdOjpAW7f6u1433g0v3co4C73bu8VPSTtQqyX3Tc8RdKK0qyj
	Hx/UUrRoBWLdw0VG2BUyWQRPQ8pGdFX7pKrcYFL9PRg3PdmphcZTFZcQ7uhlOYKhVEMh0fA1Whm3F
	wqy2pnY6Fa090WdvsXPdwK8IePvroFZDo4xn9hKyA0mAOZLwLRCgzyUdWVXNhodynhh0jxvYfaXmt
	qdh/aKKIpMsjFtPv4toyO4iFeguzGgcd5VIYBFU7HZr11GfVt1CowDnEhrQbLDfdy730ozwWWR+GL
	Tx8H6KZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYT1M-0000000CTb5-248V;
	Sat, 13 Jun 2026 18:23:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYT1L-0000000CTax-2uCs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 18:23:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2296B4047F;
	Sat, 13 Jun 2026 18:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617DC1F000E9;
	Sat, 13 Jun 2026 18:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781375031;
	bh=bW2ZyNL9PiJBJq/IMQkuWCqxi4Vg0c2aSHkAUwoZk6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=No1Ztip04mrjRw05vEGbGPvtUmEvkfRBo5kfLRBSnzDsATn8fI3HuMuMXdkr7IBxL
	 U/j1GNs2mA+/8aRN9VBSYVUDpphiGvaOtc8YU87Zr300snMOrYtWc24nRjrLP0NweU
	 X6spneq9II0WyxlKl7je+qLjEp8ef6xAvlwaIkilbKuWo1oXfq1l8jMeYI0w6DOVmj
	 bQ775jZr+KSfKvsRKuVsdlvxI2sapb77Vj654UFyE9KYh/IjCm9nCNNoYYvPQEL8BJ
	 0MHKiaJZUAwB+2vz5Vrcr5ciDEVX00L9OyRQ2h+orYgi81RBrVJu2yUiz8AtaqHMPz
	 dcwVc0Ofnix0w==
Date: Sat, 13 Jun 2026 20:23:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] arm: dts: st: align node patterns with
 established convention
Message-ID: <20260613-wondrous-shapeless-pelican-6b927d@quoll>
References: <20260613-st-mmc-v4-0-b3c385617c16@gmail.com>
 <20260613-st-mmc-v4-1-b3c385617c16@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260613-st-mmc-v4-1-b3c385617c16@gmail.com>
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

On Sat, Jun 13, 2026 at 09:39:39AM +0000, Charan Pedumuru wrote:
> Update ST MMC DTS node patterns to match established convention.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  arch/arm/boot/dts/st/stih407-family.dtsi | 4 ++--

Thanks, but please fix all the files of stih in one commit, not file by
file. git grep gives more instances of it.

>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/stih407-family.dtsi b/arch/arm/boot/dts/st/stih407-family.dtsi
> index 3e6a0542e3ae..08acba209c56 100644
> --- a/arch/arm/boot/dts/st/stih407-family.dtsi

Best regards,
Krzysztof


