Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93A9CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 06:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0Po5eBoI+p6ziuP9nX8EocpWpS0/rxUwsi2jvun0Ws=; b=LUj0zzRR4lOHOAsVPgAW6mWl0S
	ONauihKuGqQsn32PCPHLUgKVxwfa1o6eQZRF0GgCYtaTqlMrxfe6zrU2zW27+F+APdPzj4SrqRduW
	IBZc4/1+KacItAhbUIckrugHbNFZYyGnIzihzchqWNbgKkNmVnLQumPNVU1ydGb1IvqWMyzH6S937
	Lgt32s2e5Dxk0XIQEBL8EVWGnjNfBN8LZLmAAL2B2C2wx0oon5iRPPyXGu+yX98MbDAfdFTi9R0ED
	QZh37TvykSeC0cH/ACAsr77xXP5H5Gg28ymywKiRZunkfhxbpoLhFeLYmEi4JVnG4uglad8aG8LIn
	y0rrE1zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDGxC-0000000DDF9-01r4;
	Mon, 27 Oct 2025 06:43:42 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDGx8-0000000DDEi-1Sqt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 06:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=N0Po5eBoI+p6ziuP9nX8EocpWpS0/rxUwsi2jvun0Ws=;
	b=J8HYMHYKnxAF8/KS1yT8gIJlapMKsJQzlzIlACEEd7stvhhdjyCSnsddwto0eR
	nHV2qPY8YVH9F9WvmCd7I2/dWkWWZXwsr1vsIuih3hqXyekwfEnb8sQ/HoNd0k7P
	pATGgKZvPnBREkQnOk0P08WC26vJpzT+R7/w0afLX2Nd0=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3n1aKFP9oQve+AA--.28929S3;
	Mon, 27 Oct 2025 14:43:24 +0800 (CST)
Date: Mon, 27 Oct 2025 14:43:22 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/11] ARM: dts: imx6: trivial change to clean up some
 DTB warnings.
Message-ID: <aP8UiqYFJVm81bGf@dragon>
References: <20251016-imx6_dts_cleanup-v3-0-baf2814f8a15@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-imx6_dts_cleanup-v3-0-baf2814f8a15@nxp.com>
X-CM-TRANSID: Ms8vCgD3n1aKFP9oQve+AA--.28929S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryDWw4kXw1xCry8Xw4UXFb_yoW3GFg_W3
	W3C3W7Aw47Cw42kw4aqrnF9FyDKF1Utr4UXrWrWr4Yq3W3AFnxWa4rta4DWFy7Cr4fXw1q
	gr1Uuw17XryxCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb3l1DUUUUU==
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIQ1Cp2j-FI19oAAA3a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_234338_804455_3D510096 
X-CRM114-Status: UNSURE (   7.70  )
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

On Thu, Oct 16, 2025 at 12:00:04PM -0400, Frank Li wrote:
> Frank Li (11):
>       ARM: dts: imx6: rename stmpgpio to gpio
>       ARM: dts: imx6: rename touch-thermal0 to touch-0-thermal
>       ARM: dts: imx6: rename m95m02 to eeprom
>       ARM: dts: imx6qdl-ts4900: rename ngpio to ngpios
>       ARM: dts: imx6: remove gpio suffix for regulator
>       ARM: dts: imx6: change voltage-divider's io-channel-cells to 1
>       ARM: dts: imx6: remove pinctrl-name if pinctrl-0 doesn't exist
>       ARM: dts: imx6-tbs2910: rename ir_recv to ir-receiver
>       ARM: dts: imx6q-utilite-pro: add missing required property for pci
>       ARM: dts: imx6ull-phytec-tauri: remove extra space before jedec,spi-nor
>       ARM: dts: imx6qdl-nitrogen6_max: rename i2c<n>mux to i2c

Applied all, thanks!


