Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F28C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Jun 2025 21:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/mQ7BoLcVrO59Xnl3ZQlHndr969rCpRyg45FKaGvoI=; b=wEHqesSE2AQK5ZaeVkmQ9V8Zw7
	0IUnzHyrfHXr2yDBaDf2Op4iRnQv7vCVl7M000Mx425L3zIv9W32gpyxSuCuaJcrMed1mmyBzbWJB
	a/bwTa94YoQwVOOZaUBU6wNMkJQwk/dUOThPJENfIFYLPIyma2id8FPr2xzXvJHdeSzQBShFTIbgy
	WINnXbZ5vhCQlfStYNDjrO7ZRgjVZA8cjVNQgIJnV9PmBayXjzZT65bnBidrtrTC3DONsjuA+56ma
	Q668fjWYB6+SZRQWr9Jv8swGbZHabbYlLovjmYQVFtYHKN6hjQZkpJlfUpL5/FYp73d6KeeKvVRN4
	uqhw+5OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uONvo-000000032F0-28M3;
	Sun, 08 Jun 2025 21:51:56 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uONWF-00000002zqE-35FP;
	Sun, 08 Jun 2025 21:25:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=E/mQ7BoLcVrO59Xnl3ZQlHndr969rCpRyg45FKaGvoI=; b=TKVshFrl5DXthqifrs05BGdJyK
	m8KjuamhBugZEL/wfcv5dN1DjtwKrWBClnWVuqVwuPgQd1VAe48o6HiestzuDpnHgwFmkwUJG7mKM
	yWD6DPX6+v2jJXY25PcJGwPiROdNZ3cbFLznRaparNONitVTfLHH1/MwmKmBaayYjDlw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uONVw-00F6gT-IO; Sun, 08 Jun 2025 23:25:12 +0200
Date: Sun, 8 Jun 2025 23:25:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Frank Wunderlich <linux@fw-web.de>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Jia-Wei Chang <jia-wei.chang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 07/13] arm64: dts: mediatek: mt7988: add switch node
Message-ID: <1fdfba6b-1bf6-4865-be21-2b4d716fbfc0@lunn.ch>
References: <20250608211452.72920-1-linux@fw-web.de>
 <20250608211452.72920-8-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608211452.72920-8-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_142531_768603_80F37C03 
X-CRM114-Status: UNSURE (   6.88  )
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

> +			mdio {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				mediatek,pio = <&pio>;
> +
> +				gsw_phy0: ethernet-phy@0 {
> +					compatible = "ethernet-phy-ieee802.3-c22";
> +					reg = <0>;
> +					interrupts = <0>;
> +					phy-mode = "internal";

More phys with a phy-mode?

	Andrew

