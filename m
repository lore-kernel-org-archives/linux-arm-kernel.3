Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6F1D2C13D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 15:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fVgp9CPZt439xG55lBgpubSaDCwfPc5/ey52Ytm8Y8=; b=F1b11h74V1DlknMfXnAkc8WI1g
	xb7BAX38mhlJ+cYDiwRSMz4Tai9h96MF2/8sn0T0vzGvuLXRRHw8TJFF0eE1feLNDvBcV/zh3D/ME
	YGQeWkGq0JpW79T6H2NXrUCYm2xSBQxV+4OKc6BXyerq0cdmHa4QzqP+AISUJansNc0ZljLxUnTpt
	/NQeTRx/Q0q5a21ckV4sFX6YIg1rcFZdfbdSKS9aELu/L6pDlX21A2VvQ9xTB1uVQ70EcGt4mdJ5C
	c0h54T/l4Q7NA1oX5FQHq3/CaQNU8MRBju+idRCWWC/Py5cRqu6xlvn2sD+CZraAGvG4UkA8oGF+O
	9y3mCiug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8LgY-0000000HSSo-24VF;
	Tue, 05 Nov 2024 15:41:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Len-0000000HS4v-480t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 15:39:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A6E97A434FB;
	Tue,  5 Nov 2024 15:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E6A0C4CECF;
	Tue,  5 Nov 2024 15:39:48 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 8CBC25F8BA;
	Tue,  5 Nov 2024 23:39:45 +0800 (CST)
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
Message-Id: <173082118554.1463380.5508930595133568023.b4-ty@csie.org>
Date: Tue, 05 Nov 2024 23:39:45 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_073950_146335_BB4086EE 
X-CRM114-Status: UNSURE (   7.18  )
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
      commit: bd4215c71992d89ab84339aab56bd8574134708f

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


