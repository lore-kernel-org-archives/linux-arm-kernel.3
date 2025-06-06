Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D0DC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 02:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uj8eNG6ZWJJnOf8kIvXaOHpBdEMbjXnhim4os9nFsT0=; b=GkLI8kk6CFE70j/Wx9LEbc7JeJ
	8FerF92d/PK8bdwircnVT0w0+cB3sccmZABGmhceXMyhh62jKDd14nG3UuI+rskRWiX3/7Bvp2pU6
	a5DtEHrq8IC1lwxaJad/6OsRKZCJeRBrErsme3H6rfqJSb/X1N4+1FstNax3kb0zoLh0hYmcecPQK
	T9oa4mj8ZaV261pDjw61+4TBwIAYvKx87QUfbKHg40hf+JKE1R2AtvTZthpu49OyaN3WppPtU0uS0
	zWQeR2WCxJ345vogeX/DNN6nHICVbJxhOUyKaT5eiM+JI41tBaG+C7/juAm0h6oM6HpHdCa2PE4Gb
	7rF1g3OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNMZO-0000000GxCk-2qTp;
	Fri, 06 Jun 2025 02:12:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNMLY-0000000GvyJ-3uOR;
	Fri, 06 Jun 2025 01:58:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 29DBCA4EB1A;
	Fri,  6 Jun 2025 01:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92EAEC4CEE7;
	Fri,  6 Jun 2025 01:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749175095;
	bh=fvsp6DDJ+BH8dacb9TxLXhMPsKVSddPeCO2+15MLg9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kRe0gSRCrelrgyp/mZuwyHPtd576I4agx8Rx9Sd0KQbMsGAKpIbHks6XBQ1DlQUO7
	 mFDVWzsAM5sonZ8lokEYrcc3fTwOzmbDVSqzNzxDz68Q97jkqPt6lLXE0B4yYY9/r1
	 Qob2pqjedfVLUtLPoYxR7m8pDMxAGrKdZ/vmfPnPAqKrsTwb5ndTxPoFZTqhn82VVY
	 qiLzXxY+edKgEryT3IMtE2G7o1wVt3HmdCRWh4aUhFy9lDHeeLnt4dvYN9rRrbnXjD
	 vhiEpUPtcT86Kbu4OipTEfk8WJQaaJmn/V2+Dy+NzsfcJgPiNMjgI+xlhYtSyAQfgm
	 R33dD9bNRu0Cw==
Date: Thu, 5 Jun 2025 20:58:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Vinod Koul <vkoul@kernel.org>,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: mfd: convert lpc1850-creg-clk.txt
 pc1850-dmamux.txt phy-lpc18xx-usb-otg.txt to yaml format
Message-ID: <174917509146.3764775.13664776739323351967.robh@kernel.org>
References: <20250602143612.943516-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602143612.943516-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_185817_041299_47B6748F 
X-CRM114-Status: UNSURE (   9.23  )
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


On Mon, 02 Jun 2025 10:36:10 -0400, Frank Li wrote:
> Combine lpc1850-creg-clk.txt pc1850-dmamux.txt and phy-lpc18xx-usb-otg.txt
> to one mfd yaml file.
> 
> Additional changes:
> - remove label in example.
> - remove dmamux consumer in example.
> - remove clock consumer in example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/clock/lpc1850-creg-clk.txt       |  52 ------
>  .../bindings/dma/lpc1850-dmamux.txt           |  54 -------
>  .../bindings/mfd/nxp,lpc1850-creg.yaml        | 148 ++++++++++++++++++
>  .../bindings/phy/phy-lpc18xx-usb-otg.txt      |  26 ---
>  4 files changed, 148 insertions(+), 132 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/lpc1850-creg-clk.txt
>  delete mode 100644 Documentation/devicetree/bindings/dma/lpc1850-dmamux.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,lpc1850-creg.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/phy-lpc18xx-usb-otg.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


