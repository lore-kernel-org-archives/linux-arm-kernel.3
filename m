Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3667CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 21:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1QoJKt8nuFIshcMaHm3vCQ4chefDHhKYjix6eCIb2Yw=; b=eA64gslWNJykWOhyRxKdDdvtxD
	LM7UkXraAqKvYO/iQCkPEUpC15WtDE3DcimRGorQ8TAEr/WbPhyRrrvHN8PLWusM624Z5EDtCeIcL
	edggVYSj7QimEdrumwmpqK5J3tgQLTBNLSmcoNKDzt5vMXEm4Es/W0sX05EF+qWJl7Z8acopNpvX+
	92obKByRpmdrt5qBCnMm/UJfckDX3ceaZwuZyig9u7J/q8nl1yt/4cgXkwqOGMqwBmCyvBhOqTt0U
	y/39oqKsmAnag7XfwuDLohIge/IJC/FeuhCauJcJMVJMETaNoUR5lG2qJHMrjjGiBFgJ9zhuRkrRC
	xnX6Ok9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZaz-00000003X1Y-0lbx;
	Fri, 22 Aug 2025 21:46:49 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upNfu-000000020Ib-0KwO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 09:03:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=1QoJKt8nuFIshcMaHm3vCQ4chefDHhKYjix6eCIb2Yw=;
	b=mS1w3EO91fq/WOx6YhNZhywFzujgj0p49cu+a6yFPkpOV78Bu1w63cwQbKudOY
	Be5p44mosPUVq3BmJT4V8hIxh+inyWgjmOEnCqCApKP1RG8IORVoDrdWFr5WdZnD
	JBEciVcCtD1v8cEp8J3vqWhbT5yYSpGpHKn7PhqqiX/I8=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCHi343MqhoFC4cAw--.12096S3;
	Fri, 22 Aug 2025 17:02:49 +0800 (CST)
Date: Fri, 22 Aug 2025 17:02:47 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Dahl <ada@thorsis.com>
Cc: devicetree@vger.kernel.org, Frank Li <Frank.li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] arm64: dts: imx8dxl-ss-conn: Disable USB3 nodes
Message-ID: <aKgyNy_npSiOZpf1@dragon>
References: <20250811063855.46431-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250811063855.46431-1-ada@thorsis.com>
X-CM-TRANSID: Mc8vCgCHi343MqhoFC4cAw--.12096S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF1rCrWDtF1rZF45XrW8Zwb_yoW8Jw17pF
	y8Kr4UtFyvkr1kCaykXF4SgFZIkws5Ja1UWr13GrWfKr45Cwn5Xa93Cr4Sgr4vvr4fA3y5
	tF1xJ3s2ya1j9w7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UcvtAUUUUU=
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQmxZWin7jqtdgAAsU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_020306_495907_0A7BFB9F 
X-CRM114-Status: GOOD (  11.25  )
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

On Mon, Aug 11, 2025 at 08:38:54AM +0200, Alexander Dahl wrote:
> The i.MX 8DualXLite/8SoloXLite has a different connectivity memory map
> than the generic i.MX8 has.  One conflicting resource is usb, where the
> imx8dxl has a second usb2 phy @5b110000, while the generic imx8 dtsi has
> one usb2 phy and one usb3 phy, and the usb3otg @5b110000.  When
> including both imx8dxl-ss-conn.dtsi and imx8-ss-conn.dtsi as done in
> imx8dxl.dtsi this leads to a duplicate unit-address warning.
> 
> The usb3otg node was introduced after the initial imx8dxl support with
> commit a8bd7f155126 ("arm64: dts: imx8qxp: add cadence usb3 support")
> and since then leads to warnings like this (when built with W=2):
> 
>       DTC     arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb
>     …/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi:148.24-182.4: Warning (unique_unit_address): /bus@5b000000/usb@5b110000: duplicate unit-address (also used in node /bus@5b000000/usbphy@5b110000)
>       also defined at …/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi:41.23-50.4
>       also defined at …/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts:645.8-653.3
> 
> Delete usb3 related nodes at dxl to fix above warning.
> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>

Applied, thanks!


