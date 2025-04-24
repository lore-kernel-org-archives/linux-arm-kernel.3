Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155B7C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 17:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUr217TtSQGHna3SAnuEzp1VCUrQln+OxhKS3D8bw1I=; b=Vk4ai4/TMk4d7GEykZcKjzEeb7
	proYUvT9nxmID/aJ6GRE/8WOCHDVnE+coMlglLN6D+gp79Licygob8BdJPKaRaXqnTbKBYRz6xAdh
	qffswhGHBpalI5Y4+uNySd3IMCS+67mD4dLQyae0oPQ8bNF8x8dII8icLKRMoNoFrspkTheS7TOPQ
	lwfM5prDAAzwqK3xTQtaE/xelPcS0vltevSwKsfQ5QYo/cfxC0ttxjx9qK6lmB7rFEXLxRaxe7oWc
	uFF1dDPUoR+ghS2bLP4CyBSkNlKz1Jc0RMsoJs+vRNbELWj9wQsjz3S7ZJKFyuXHM2rbc9hHESJtM
	xphH/khg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80lt-0000000ExGs-1aKQ;
	Thu, 24 Apr 2025 17:54:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80k4-0000000Ex4E-0Shg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 17:52:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1748F6845A;
	Thu, 24 Apr 2025 17:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD70C4CEE3;
	Thu, 24 Apr 2025 17:52:05 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 2FAF35FC3D;
	Fri, 25 Apr 2025 01:52:03 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250424084737.105215-1-krzysztof.kozlowski@linaro.org>
References: <20250424084737.105215-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: allwinner: Align wifi node name with
 bindings
Message-Id: <174551712318.4050580.9611713375117981006.b4-ty@csie.org>
Date: Fri, 25 Apr 2025 01:52:03 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Thu, 24 Apr 2025 10:47:36 +0200, Krzysztof Kozlowski wrote:
> Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
> wireless-controller.yaml schema"), bindings expect 'wifi' as node name:
> 
>   sun50i-h6-orangepi-3.dtb: sdio-wifi@1: $nodename:0: 'sdio-wifi@1' does not match '^wifi(@.*)?$'
> 
> 

Applied to dt-for-6.16 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/2] arm64: dts: allwinner: Align wifi node name with bindings
      commit: b55f9ec87a54b67bd2dfbda1a90103af3f7934e0
[2/2] ARM: dts: allwinner: Align wifi node name with bindings
      commit: 0ecb35f6b065103bedf8fe21451cddeb259e4701

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


