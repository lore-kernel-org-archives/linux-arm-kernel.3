Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D12CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uyXE9z92I4PX0TtZ5pXguce6WvvMl3Q/lq0kSB/sMdk=; b=WutV+Glb4eRcGEYdPxAyR1kjKj
	QivCnVgFH4luT98ya9CPLQCluR8o516XOF60HSz7h3TS9AkECRcjAxXrY0XWPIhvz58fko0KI3Scm
	WFOQPo1kxxXzxpd2tnjkJvV4uNC6+hs+7E84rIoA3gJOISTkw5CKeV77Tipb0ktYu2SCgGJzOI2hZ
	Cs7P2uC0+pkqK5LeKSXgodx0SqSjYBk04ZtAfAFA1e17XVlsFRhnCxYWCR5XqjnBQR1/lV0qeOP8T
	2r/gWyqXS/DD2l1dKl/m7cDidrmJrZe/YI0dTEG5Qtu0VxZa2ggF8TEQ6EZiJE1R1CaSXCVD7ZelV
	TrPRW5Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPqp-00000002I6U-33Dl;
	Fri, 22 Aug 2025 11:22:31 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upI6J-00000001LG1-1xCu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 03:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=uyXE9z92I4PX0TtZ5pXguce6WvvMl3Q/lq0kSB/sMdk=;
	b=YrNZTWg9J/AdumbnX/n6jAWEoVVEOVi7g/6rUn2Xf1pW9g49cvJznInVK8iBmw
	sjH8CgMYKRaMXypEuUiVmBdawzQm941OU/0L/SGcXzxGF0CZGuTqNFNbkVejp399
	xkyDVb/6yNU4KNajjjN4ILJesEudsFCElSFDTFYRP9ueQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAnlttq3qdoPKAkAw--.15496S3;
	Fri, 22 Aug 2025 11:05:16 +0800 (CST)
Date: Fri, 22 Aug 2025 11:05:14 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frieder Schrempf <frieder@fris.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andrej Picej <andrej.picej@norik.com>,
	Annette Kobou <annette.kobou@kontron.de>,
	Eberhard Stoll <eberhard.stoll@kontron.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Liu Ying <victor.liu@nxp.com>,
	Oualid Derouiche <oualid.derouiche@kontron.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Teresa Remmet <t.remmet@phytec.de>,
	Tim Harvey <tharvey@gateworks.com>
Subject: Re: [PATCH v2 00/12] Misc fixups and changes for Kontron i.MX8M and
 i.MX93 DTs
Message-ID: <aKfeaiYasvynXGbn@dragon>
References: <20250721100701.115548-1-frieder@fris.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721100701.115548-1-frieder@fris.de>
X-CM-TRANSID: Ms8vCgAnlttq3qdoPKAkAw--.15496S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7trW5ZF47KFW7Wr45KF47twb_yoW8JFWxpF
	W8G39rKFWktr4rua4UX3ZrKFW5A343GFn8A3s8J39ag3sxCa43XF15K398WFWUCr47XF4k
	tFy7J3s7K3s5ZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UdgA7UUUUU=
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIQzWPGin3mzS8gAA3a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_200559_869901_D8BF4BF0 
X-CRM114-Status: GOOD (  10.31  )
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

On Mon, Jul 21, 2025 at 12:05:34PM +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> This is a collection of changes for several Kontron ARM64
> board devicetrees. Some are related to hardware changes,
> some are bugfixes and some are improvements.
> 
> Changes for v2:
> * fix touchscreen node name
> * add touchscreen labels
> * fix commit message for RTC interrupt patch
> 
> Annette Kobou (3):
>   arm64: dts: imx8mm-kontron: Add overlay for LTE extension board
>   arm64: dts: imx8mp-kontron: Fix CAN_ADDR0 and CAN_ADDR1 GPIOs
>   arm64: dts: imx93-kontron: Fix GPIO for panel regulator
> 
> Eberhard Stoll (1):
>   arm64: dts: imx8mm-kontron: Use GPIO for RS485 transceiver control
> 
> Frieder Schrempf (7):
>   arm64: dts: imx8mm-kontron: Remove unused regulator
>   arm64: dts: imx8mm-kontron: Sort reg nodes alphabetically
>   arm64: dts: imx8mm-kontron: Name USB regulators according to OSM
>     scheme
>   arm64: dts: imx8mp-kontron: Fix GPIO labels for latest BL board
>   arm64: dts: imx8mp-kontron: Fix USB hub reset
>   arm64: dts: imx93-kontron: Add RTC interrupt signal
>   arm64: dts: imx93-kontron: Fix USB port assignment
> 
> Oualid Derouiche (1):
>   arm64: dts: imx8mm-kontron: Add Sitronix touch controller in DL
>     devicetree

Applied all, thanks!


