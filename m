Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28983C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 15:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gb3X2QZicAkyIFOALe7CLGJU2OeCBNRujpouAlLhFxA=; b=z9Kp55zWinScTU7HxZuc5kgAC2
	PvzrhSo/muumQkJSLNJAcB96CUfgLK6NSvXLk4zKeJN7H5mUB2bO80IdwgFU2ryZaEdKyLDqFpEr1
	7AfrKt7LhELq97UQqx/5CKD07BZ6URmAWjOZKnxxRV6P3IJIjvDZxsQq1Qn13LWo0Qa6QLu/x9QJc
	gQavmFmP/Zh8NQhyGMTIX9e3fvUCE1A/EZg8U/ElGnEI2Wz7QonkTLSHsNGXAy1fdneby3VfqyS+E
	qk4f1G8aDH2//Lsvd6F5eufDuUdg/oH2A0T26LpHIpFVzEQBoNTt1YEB3IU0vDsyecMAmpv0RZ8rX
	odJtfgpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJsi-0000000CRC3-0ln3;
	Tue, 06 May 2025 15:06:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCH4Q-0000000BqZD-3gWF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 12:06:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D9E7615F2;
	Tue,  6 May 2025 12:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE53EC4CEED;
	Tue,  6 May 2025 12:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746533206;
	bh=kKU+uCIszAf0TanYBW6FtHHTFA9JElr5vNNK/+12RjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eN50fn5ZeJQl72u4TLKSNAfG/8dzMfS7MFq6JTHLB4suCW7dN+2XDelJd80g8X1uM
	 69U/18mlGG3t2v7soTPcHSp58UhvW3UR7GoyuhXF6VDCR7Rqirynz7PVl0F2QS20B6
	 W/skUjXH5DgJZIkHHz4HuV6AgGYMpqluonLz5B3Ub/D9QQmepho5lmW27iFSDAHqKe
	 I/oGxHgyKeJJirQpS+3IOqwk3Z6h9nJAeefA7RyPTzJMOXXWHp8xYa4LjVCDCxWAE0
	 ohj/qh9eVZh0QNM796NjT2ccD4Dmf0af8Z+poTvk/UWTgACbBwyiVTWTqVljGPMWrT
	 aMOcuJj3JzAJQ==
Date: Tue, 6 May 2025 07:06:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	Chen-Yu Tsai <wens@csie.org>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Liontron name
Message-ID: <174653320333.607552.11987630283053407011.robh@kernel.org>
References: <20250505164729.18175-1-andre.przywara@arm.com>
 <20250505164729.18175-2-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505164729.18175-2-andre.przywara@arm.com>
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


On Mon, 05 May 2025 17:47:27 +0100, Andre Przywara wrote:
> Liontron is a company based in Shenzen, China, making industrial
> development boards and embedded computers, mostly using Rockchip and
> Allwinner SoCs.
> 
> Add their name to the list of vendors.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


