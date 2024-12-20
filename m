Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6A7E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 18:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Crj7MJsVD73X4/0swdBO06M26mppskMIovca+opNPNQ=; b=2RFDDfditmltkxZopq0ilw1Syu
	pODRmApmcUTgjxlPQwwu4mZgajr9tiR72LDWONMYV0viYqZJTw1NxIM7i01z2icVB25ys5mj5VKUj
	msQ4wm8At6yeVjkysXkxLdi6HqjlCdmJnUXYM4E+BMJYxqDR1vCRn9MwoNUoryW79j6gXXKHVH7oO
	P9EyWezXU/2pqVlJoF/w4vXo/2vHgZYAZXCPl4cHPgz7LqNYOt9UnIDUe11bNsk9qQ7GbGUHzChRG
	U3YkCIRUzj5zbniBOlRk3weJFUZsaCSAVlRzwBOh6UcqDoEtSoj+2KV1lCLSWGmr2GEKRMXmRXScu
	l5Pl2dXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOi0z-00000005qOn-2zMX;
	Fri, 20 Dec 2024 18:46:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhxr-00000005q2Z-41C2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 18:43:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5F55FA425C5;
	Fri, 20 Dec 2024 18:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F85C4CED7;
	Fri, 20 Dec 2024 18:43:06 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id A1CFC5FB49;
	Sat, 21 Dec 2024 02:43:03 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Cody Eksal <masterr3c0rd@epochal.quest>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241218-a100-syscon-v2-0-dae60b9ce192@epochal.quest>
References: <20241218-a100-syscon-v2-0-dae60b9ce192@epochal.quest>
Subject: Re: [PATCH v2 0/2] sunxi: Add A100 syscon nodes
Message-Id: <173472018359.189342.4338686387095816178.b4-ty@csie.org>
Date: Sat, 21 Dec 2024 02:43:03 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_104308_068620_6490C0B5 
X-CRM114-Status: GOOD (  12.43  )
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

On Wed, 18 Dec 2024 09:01:17 -0400, Cody Eksal wrote:
> https://msgid.link/20241202-a100-syscon-v1-0-86c6524f24d7@epochal.quest.
> Only changes here are fixing missing newlines between child nodes and
> rebasing on 6.13-rc3.
> 
> ***
> 
> Here are some very small patches to add syscon nodes to the A100's
> device tree. These had not been added yet, as they hadn't been needed up
> to this point. However, Parthiban and I have been working on patch
> series in parallel that require either the syscon or the SRAM nodes it
> is responsible for; specifically my patches add support for the A100's
> ethernet controller, while Parthiban has been working hard on bringing
> up the Display Engine.
> 
> [...]

Applied to dt-for-6.14 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/2] dt-bindings: sram: sunxi-sram: Add A100 compatible
      commit: 168b2b355f886db4230f10d24bc109b0b34c4708
[2/2] arm64: dts: allwinner: a100: Add syscon nodes
      commit: 53c54d9b9379e2a3eaec015556a51e47957a8d92

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


