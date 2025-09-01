Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197F8CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NwM8Hg+ziPzDItb0hyAmx//UQ/zjmMhZJeqKPB9wvGI=; b=OxtGDJIkH+VhAGCxRzru+EtWSl
	ajHb+HHYNM0V0A2jVEZbwgvF14fXuDvZ80/mWwdRKUtda/PVr7NvXcbZNciAwestcNx3wQy0n3yH6
	qy8AkdXy3xmU4j3boIH5JK+RH2mx2x5OWrEDcxvFpimT65gx1ovdB2obiG/bL0GVjaInVD02RjMLN
	MkMEODQFtvXo/ODOWw1angS+BD3cRE0uN8O1gVbuY56wSAf2RDujarM0GVbVy1CLM9U0trIY9Asgz
	R+bJiQfrqnuFivv9+kXWIilY2QCkqNtLDXe27cwOoxPNDAk/w1e66fDolkqoFgvJ6GoqbIcbDpcFe
	QhsGiNMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDiT-0000000EGHC-1xiR;
	Mon, 01 Sep 2025 23:13:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut814-0000000DPUQ-15ok;
	Mon, 01 Sep 2025 17:08:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AE058601E2;
	Mon,  1 Sep 2025 17:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72FEEC4CEFC;
	Mon,  1 Sep 2025 17:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756746505;
	bh=PDPOiTEuTdicTffGYLtYpS4v2Fg8U7SX/u9tZo9cYOw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FuUQboUPwa7jfW0jY8/itorT30MmAKHf7aVOgoxVfFiOHAnKMV7l+4iTrNXNtzDWI
	 0LANj8JpANoNPSwDABsViyTRwQIHO2PqkFHdrZqEWTJe58xFct3qksB4U7AD7bHtrU
	 F3Iv4DNS7Fse11nOjZfq51PXnXSvzR9vhjMgU9/bDipD/LKDIiddAjqvYGMACvkXLf
	 V1IlzSpx4kUxB/wgxEM6O9E2eWtbcAEAiHFfC7HfL+uKc8w+Wgiveji3aFXtaSWGPC
	 ooxNUo3Eep18sYX2rhoOONXgDjJYLy6q++AeAioMiH3adtnEjx/yKuZbF+FTwh7J3E
	 LOm3Wxy+YdCZw==
From: Vinod Koul <vkoul@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aswath Govindraju <a-govindraju@ti.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Maud Spierings <maudspierings@gocontroll.com>
Cc: linux-can@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250822-can_phy3-v1-0-73b3ba1690ee@gocontroll.com>
References: <20250822-can_phy3-v1-0-73b3ba1690ee@gocontroll.com>
Subject: Re: (subset) [PATCH 0/2] dt-bindings: phy: ti,tcan104x-can:
 Document TI TCAN1051
Message-Id: <175674649899.186496.9689107932921189012.b4-ty@kernel.org>
Date: Mon, 01 Sep 2025 22:38:18 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Fri, 22 Aug 2025 11:20:04 +0200, Maud Spierings wrote:
> The Moduline Display mainboard contains 2 TI TCAN1051 CAN transceivers,
> properly document these and add them to the devicetree.
> 
> Thank Peng Fan for inspiring this patch series.
> 
> 

Applied, thanks!

[1/2] dt-bindings: phy: ti,tcan104x-can: Document TI TCAN1051
      commit: 3d13e378d465e8ae0be1697005342055b07eaf11

Best regards,
-- 
~Vinod



