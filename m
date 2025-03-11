Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42CDC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 01:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2j5IpfsHdKFIq/wwefRt4BQxdOS5Lzz8+3jguMQeEI=; b=4eKMrBOJT9vFcCA+s2UEI7A7YO
	sOVcA2T9ZldWFhocVIz4zvQIZA5PmOR6CvU597ISzC7em/to/Uc2i3W+sbfQP9HqyZHOPzYHo89mK
	UWvlCFtW45qZoifcQKI3dE3Ky4CCnNC4WLSb4ng+zJaGpTF0HlnMrH4kk41f7JqoKKsqgng2gQwq9
	aywBWwlTS4msJHPlUErK+O3+dAEoHOALDk++t8mvDnQ427bEUdF/lka8FCbNPwzvCER09A+QQ+fZv
	XyLbaXtHlG6USSghbH8fk7Ew7waZCSIICwV0sU7DQwQr8MjHjAICoC2ZcOta1E5yCLROhphNLfay1
	BFw2BDxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trop0-00000004NV8-2C6q;
	Tue, 11 Mar 2025 01:54:18 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tronM-00000004NIs-0xSy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 01:52:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Y2j5IpfsHdKFIq/wwefRt4BQxdOS5Lzz8+3jguMQeEI=;
	b=bb/WEbWaAcQBK5+/SWIhhJjQGY7QSw5WAcBBHbKVmjct4jdi2d60S4OI1j8Neg
	i4e7C7VVShbb16g7RpTN8y86Mfc5t0NkrYHEYeh/47CUvXLQgkax895lamkfoh7h
	kNQ7Ab3+rLlUtu3JY+H6kxNnS0Rnu5rdchdZBJPlZ6IO4=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAnJdRFl89nbBawAA--.715S3;
	Tue, 11 Mar 2025 09:52:07 +0800 (CST)
Date: Tue, 11 Mar 2025 09:52:05 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/9] ARM: dts: TQMa6/6UL/7: DT cleanup
Message-ID: <Z8+XRalDiwot8Xsl@dragon>
References: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Mc8vCgAnJdRFl89nbBawAA--.715S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcb18DUUUU
X-Originating-IP: [117.81.240.4]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERsNZWfPU+q+ZQAAso
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_185236_563729_381477C4 
X-CRM114-Status: UNSURE (   7.23  )
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

On Wed, Feb 19, 2025 at 09:17:35AM +0100, Alexander Stein wrote:
> Alexander Stein (4):
>   ARM: dts: imx6qdl-tqma6: Order DT properties
>   ARM: dts: imx6ul-tqma6ul: Order DT properties
>   ARM: dts: imx6ul-tqma6ul: Add vcc-supply for spi-nor
>   ARM: dts: imx7-tqma7: Add vcc-supply for spi-nor
> 
> Markus Niebel (5):
>   ARM: dts: imx6qdl-tqma6: limit PMIC SW4 to 3.3V
>   ARM: dts: imx6qdl-tqma6: use sw4_reg as 3.3V supply
>   ARM: dts: imx6qdl-tqma6: Add partitions subnode to spi-nor
>   ARM: dts: tqma6ul: Add partitions subnode to spi-nor
>   ARM: dts: tqma7: Add partitions subnode to spi-nor

Applied all, thanks!


