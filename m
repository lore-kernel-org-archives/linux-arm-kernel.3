Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D789AC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 22:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I0CtHNSOSbuoexEEEcWD4gT5ffnds4+OlCy1GFoKORc=; b=OphOpZ7iZ5ZLQVK43RyFb4wOfQ
	N0fgoZNi3Mhpimz/Z+8IuEJ3+t1JkViL8z817MWRcYSzlO0SPWR3F9F/Cywgq2VOmt758TBSNfv0B
	LV+KLkF3OhnsfLIQWNGta/0uy4e67zBSHmMfRspy9W/BT0fGGC4Pmaq0PRYFI9+nP6mD3id/2na6u
	SqIyb6opzmj03D6e+4TdiRKJRJQcFKjOB2Bnbb53TJPqlPCpVYUNRfzwZxFYcZ16eAYUHNJi/6Twi
	P1NueJLfwecHHzOcEI1Ztp5tcuZ/78qVfG3NQ6ueJ77N8rCSJSKIgKmqQ+04YRbXc1bysGS2m0TuL
	N2C09E5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvWB-0000000D0E3-2psi;
	Thu, 26 Jun 2025 22:56:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUtZb-0000000CmUA-3l0l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:51:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 989E6A51C6F;
	Thu, 26 Jun 2025 20:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F489C4CEEB;
	Thu, 26 Jun 2025 20:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750971114;
	bh=eqA2MDwSknSbDQOIuB7k3A6WzHxYtW+T7/XzARm/jTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iSSvfBC9EKp0AR7MOxASWcrhwGo9pKP9Pnr3l2lVOeuCtZjmDRYUZrQHeHaONa7jp
	 OOUlJcNZsGEbP8pGw+yf6zDpTfkJ6Auf8A9QFGWcMf3CHuaMeS5ztYyM+pTAktUyAE
	 M1LMa6FiyUf52MTiCe9v0ERuG2NZ+2DgEeZQXafzhElTreAYA3u4Vuue0hOJoghCJX
	 qmOlxT9LF1cnDIZIhUX5sDLFWo/k/XJxu2UNzpToyNuV0aUOVzGOVKMfH0J9kgxFae
	 OlRr+FRGwDBTkLCej3TNrKmJ6I3KqLZd6blXgOBEs+7im8472P/25eX7OyVtMpcrmt
	 264o5/fPPix2w==
Date: Thu, 26 Jun 2025 22:51:49 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>, 
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Animesh Agarwal <animeshagarwal28@gmail.com>, 
	"moderated list:ARM/LPC32XX SOC SUPPORT" <linux-arm-kernel@lists.infradead.org>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: i2c: nxp,pnx-i2c: allow clocks property
Message-ID: <ggailkhwrjvsy6tbh7xvv6epl6ompiwwwomkn2vkp52l77tb6i@xga6nyejlbqc>
References: <20250624200444.2514331-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624200444.2514331-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_135156_005636_3375C479 
X-CRM114-Status: UNSURE (   7.04  )
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

Hi Frank,

On Tue, Jun 24, 2025 at 04:04:43PM -0400, Frank Li wrote:
> Allow clocks property to fix below CHECK_DTB warnings:
>   arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: i2c@300 (nxp,pnx-i2c): Unevaluated properties are not allowed ('clocks' was unexpected)
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

merged to i2c/i2c-host.

Thanks,
Andi

