Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F434D4336D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 15:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EvWkYWAHb0nG4vvVh89gVylmnNarF5g7iT2CtM2jpRk=; b=OfMaQU2vHepchwjxgIVFUjT8j7
	yqdRJJq+L4Amd9nzJ5opKTj31DF0ZsyoxigkirKQxZiVko4iPDrYHjsXJ99xcBq78SI5SiPADU8mT
	5zOx+N1Tpc/VvBOCSNduJMTodvtRkVCNq7kOM2axXvTwHG0/OIzZD03UBJzbXueAuJEHT31915k4X
	doCL5Na7AOJdgpX05ls7UvFINbSiO83N62FJPDyOi9HPy8SffNRu39NNMVjx46pmHrcKztE+MSTa1
	MKZESTe1LfXr7MIO03G39jp1Ibpbu7gxHNnSmas9FfMIeKpEKrRQXI4ghpBdTxud7kO2DCXp8N5Oi
	mUgfv5kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t94Rr-00000007Rok-2NtO;
	Thu, 07 Nov 2024 15:29:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t94P8-00000007RHy-3hMH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 15:26:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5E45AA447BA;
	Thu,  7 Nov 2024 15:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4EA6C4CED0;
	Thu,  7 Nov 2024 15:26:37 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 010B55F836;
	Thu,  7 Nov 2024 23:26:34 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Andre Przywara <andre.przywara@arm.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Enric Balletbo i Serra <eballetbo@gmail.com>, 
 Alexandre TORGUE <alexandre.torgue@st.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cs=C3=B3k=C3=A1s=2C_Bence?= <csokas.bence@prolan.hu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Tony Lindgren <tony@atomide.com>, 
 Shawn Guo <shawnguo@kernel.org>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <20241104230628.3736186-1-csokas.bence@prolan.hu>
References: <20241104230628.3736186-1-csokas.bence@prolan.hu>
Subject: Re: [PATCH] ARM: dts: allwinner: Remove accidental suniv
 duplicates
Message-Id: <173099319493.2335414.3613270726802144836.b4-ty@csie.org>
Date: Thu, 07 Nov 2024 23:26:34 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_072639_022112_DB9E7446 
X-CRM114-Status: UNSURE (   6.65  )
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

On Tue, 05 Nov 2024 00:06:27 +0100, Csókás, Bence wrote:
> Allwinner suniv boards' DT files were accidentally duplicated
> in the Makefile when they were moved to the new directory
> structure. Remove these duplicates for code cleanness.
> 
> 

Applied to dt-for-6.13 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/1] ARM: dts: allwinner: Remove accidental suniv duplicates
      commit: 2ccfecbf9d48edfd866259feb464f62ace681323

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


