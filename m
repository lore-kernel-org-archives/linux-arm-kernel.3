Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D591CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 01:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WyeQ6QBy2eGOwkZy/NqCFgqeNu/xjPsmyRPEkeSKXF8=; b=VclJgQ6u9v1eO3EdEw1I+uRIVH
	xDbw0MlfGVYzq7itVT/x4pKb4NdpnQPZYVYim7lU5/2YoqJ4N3d8uYCL31ZzgJJvUjIlijE9IMLGf
	UuZB0y1kHKi12Vw5bgmsBmDfRJHtZecFmsu1vVdxPEg9mkEy4hUaFE3J+9XAbDAt0PsS9kwjpmOLx
	e7ZADm0p9oxkvD151PLKfXiYB74he0ETp8D8WWAzMx0jWZWbP6eFmIVF35goeM/VEqr7qWUmUEbnX
	7fiNfezd//Vki+zsq0B1VkXq79NKnpBWyRc9gXO4/uVErAZbuhCueBcPpkEemgpYElL2ErgnGuYLz
	jIqE3wRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwVqv-000000005La-0vbt;
	Thu, 11 Sep 2025 01:11:57 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwVqs-000000005Jf-11HI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 01:11:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=WyeQ6QBy2eGOwkZy/NqCFgqeNu/xjPsmyRPEkeSKXF8=;
	b=ZbOCPlcrNDLFDc99xib7U/kQUKxH1R61OILTx+WpSi/uPxA5Xlc1Z31kdoYLYw
	6GJhsHwq+4hI1BFRwXkrzJJSQk4rSmX4Ar3yzh4bXpb6E1jL4IY8adqqmzqitcOY
	aXtgr93NPDVJmBZ7X5gPgE19X9yObNm/pjyVp27qZLfHQ=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3P9_IIcJoC+dNBA--.47602S3;
	Thu, 11 Sep 2025 09:11:38 +0800 (CST)
Date: Thu, 11 Sep 2025 09:11:36 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 00/10] arm64: dts: freescale/nxp/imx: Minor GIC
 interrupt-map cleanups
Message-ID: <aMIhyCimN1Jkho25@dragon>
References: <20250822-b4-dts-interrupt-address-cells-imx-v1-0-f1b479da9340@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-b4-dts-interrupt-address-cells-imx-v1-0-f1b479da9340@linaro.org>
X-CM-TRANSID: Mc8vCgD3P9_IIcJoC+dNBA--.47602S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFy7XF4xWFW5ZFy3JFW8JFb_yoWxZrb_Ww
	1j93WxWa15GrsFk3yYy3Z7uryYyw1jyryUJw40grs7Zr4SqFy3Cr9aqry8Cr1UZF4YkFnr
	Cw17J3Z8J3sY9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU6wZ7UUUUU==
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQbFZWjCG7IOxAAAsm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_181154_606656_F6F9CE26 
X-CRM114-Status: UNSURE (   5.91  )
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

On Fri, Aug 22, 2025 at 03:31:09PM +0200, Krzysztof Kozlowski wrote:
> Krzysztof Kozlowski (10):
>       arm64: dts: fsl-ls1012a: Add default GIC address cells
>       arm64: dts: fsl-ls1043a: Add default GIC address cells
>       arm64: dts: fsl-ls1046a: Add default GIC address cells
>       arm64: dts: imx8dxl: Add default GIC address cells
>       arm64: dts: imx8mm: Add default GIC address cells
>       arm64: dts: imx8mp: Add default GIC address cells
>       arm64: dts: imx8mq: Add default GIC address cells
>       arm64: dts: imx8qm: Add default GIC address cells
>       arm64: dts: imx8qxp: Add default GIC address cells
>       arm64: dts: imx8: Use GIC_SPI for interrupt-map for readability

Applied all, thanks!


