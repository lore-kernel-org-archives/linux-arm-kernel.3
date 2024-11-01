Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14132E6B242
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 10:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/jeTvbrAuhoLK4d33DI8+BzUn2SEMto7euH+TT/645M=; b=kPJonWqiL3qE+bCfWMEj6EdwiV
	ahRt0N+11rmBM9sEx8UJ3KCd/ZmtMN5F8OBbWe0KuuN8V4OH9nuwIxKVzI/jkUlChRtzEJwhYQVth
	8svlXpjK7q4snCNkjbX3vT5vULd3vhcbDo1ppESsuXic9yFtJ+7n1q34iS7nUjpK79f4bpX8hUD0s
	5BX45e0hxp3xAmfnfcNlfjhYZae5sGfLNGycpX3aHobr7CRF58UKjwCedEbshAk+hJD1nJcx34MF5
	5tvkYEJZR8XASotWoMaiVPtjxCbLvhMm+1gLPSbEBPB4+GL8deFTsNboUuOmMirCSdtGSRbzroprC
	Z01iupjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ojg-00000006XgP-0sBH;
	Fri, 01 Nov 2024 10:18:32 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oa3-00000006VkP-04f0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 10:08:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=/jeTvbrAuhoLK4d33DI8+BzUn2SEMto7euH+TT/645M=;
	b=bIaQQQXxWzhuVJceZQ4+XJQM/VRQVYlKCMVZV9A7Yuf1HaKlyHKhoCkuCj5Kst
	niPBM3jCNyEw4aY1dV9dgEV12vomRW0rJIvB6Zh49Xj+dl1hemUu3WBMNiIZiEwX
	5LQnG6ZrYMGZVRCKakhpT022ijMwbfT/80YTXlJjanua8=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAXqg5_qCRnRkpkAQ--.13732S3;
	Fri, 01 Nov 2024 18:08:01 +0800 (CST)
Date: Fri, 1 Nov 2024 18:07:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: frieder.schrempf@kontron.de, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp-kontron-dl: change touchscreen
 power-supply to AVDD28-supply
Message-ID: <ZySofxHCDFMySPS3@dragon>
References: <20241023152637.1301847-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023152637.1301847-1-Frank.Li@nxp.com>
X-CM-TRANSID: Mc8vCgAXqg5_qCRnRkpkAQ--.13732S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4ApeUUUUU
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwCKZWckj-1HagAAs4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_030835_807114_ADF4497C 
X-CRM114-Status: UNSURE (   7.49  )
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

On Wed, Oct 23, 2024 at 11:26:36AM -0400, Frank Li wrote:
> Update the touchscreen power-supply from 'power-supply' to 'AVDD28-supply' and
> 'VDDIO-supply' as per the binding documentation in goodix.yaml.
> 
> Fix below warning:
> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: touchscreen@5d:
>     'power-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/input/touchscreen/goodix.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


