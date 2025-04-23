Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74504C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 10:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xPfywdOkuj394mc3umyqwbKkDiIsCkuQlStktpti4E=; b=rkkVALjZOYXJBQSby3dK3ApmKz
	c+aSv/E4RPTNhBak1S0KOGTQgYt5PWOBkuV9OGCLzEZTx+7hHNtV/z5u42Q4xavtPy03XkMgKUiwN
	zf7Wh9ysm/PUJoVtzDvOoICgUZh3ch+H6iPQIoHml4fNDgW7VZS3PRtfyw/1fgGjwE53P6IkIHahg
	+TTaaEkwaVzn3D1WjdkqnaYPS5ddM7C8etF5xtSztTvP7kDgWWqgN/2DBrx0dBzu3dZHMvRPwmMyu
	cqQJ7LRCViSH9l1AaR5XICkjYbHBxi1yjVR48DJZhc8q2Fr4QWtlSOYP2OmELRZA3BhCTkn5ZgGau
	O7xlxTNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7XdD-0000000ADmI-20qI;
	Wed, 23 Apr 2025 10:47:07 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7X4T-0000000A7VX-1Uqc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 10:11:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=8xPfywdOkuj394mc3umyqwbKkDiIsCkuQlStktpti4E=;
	b=VmjmFA6Ce7I6PrfdruXOITMs/muo7+n0WI4zSAYU3OqKEvrLA0WkRFto+Ox/vg
	ygoNn+w2v9CiuRaQirdV3GPe17+zCNSfKgeu1JGQUlsWefqXrxftynpc2jx3U+J+
	mC/Ub2rvLu+nmuespAa7Juu4yXzpnurHuqHAfruvtH4tA=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCXWdmivAhojG7BAw--.25526S3;
	Wed, 23 Apr 2025 18:10:44 +0800 (CST)
Date: Wed, 23 Apr 2025 18:10:42 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] arm64: dts: freescale: imx8m[mp]-verdin: Add
 EEPROM compatible fallback
Message-ID: <aAi8ooTCm/BSB3Qf@dragon>
References: <20250408202939.6887-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408202939.6887-1-francesco@dolcini.it>
X-CM-TRANSID: Mc8vCgCXWdmivAhojG7BAw--.25526S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUI38nUUUUU
X-Originating-IP: [114.216.210.34]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNQR02WgIvKSpjAAA3B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_031113_705246_75BFB4D3 
X-CRM114-Status: UNSURE (   6.52  )
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

On Tue, Apr 08, 2025 at 10:29:37PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> According to the AT24 EEPROM bindings the compatible string should
> contain first the actual manufacturer, and second the corresponding
> atmel model.
> 
> Add the atmel compatible fallback accordingly.
> 
> Francesco Dolcini (2):
>   arm64: dts: freescale: imx8mp-verdin: Add EEPROM compatible fallback
>   arm64: dts: freescale: imx8mm-verdin: Add EEPROM compatible fallback

Applied both, thanks!


