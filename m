Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA02E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 20:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=vJLCDsivNVD2FW2R8QXzdto5l9ZsTFQI0hYmnhuTJ28=; b=qA3Y1QwSewZKiukeKPi2fFKEzA
	XvPABR/J3dtfDnYcHKV0Kj+0b2qmi7l2dJ1MHi64lazD5zJSzMOEQqQPUvnXuwqcXTJINXue9qtXc
	An3Z7JZkEFC6/NQ2Xma8pMykYOvC2hHjrZaxoLqkDUK4U8eeA/NEOtyELwYVA4wmb9gq965PY9Oa+
	X9jsTr9ffh4DvNhMLX15+8CGUqKIT7K2EQSTeHJhfFSY3RuRDSQ5DPqIYx5hlDrd07XW1rul18nHF
	OL/iKRH7vF747fLF9o82HcZQl90I1/oN6YET/nd5kcfazS9LDp+vTFm3GcdZXQzduS4v/Mqtj3+JK
	7uik2LLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUuB8-00000002fI3-0MVQ;
	Mon, 06 Jan 2025 20:58:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUu8w-00000002emP-3nD2;
	Mon, 06 Jan 2025 20:56:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 82A985C5E43;
	Mon,  6 Jan 2025 20:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489EAC4CED6;
	Mon,  6 Jan 2025 20:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736196969;
	bh=Bp0AmOc4jyy9KcD833oCqGI0Rcpq9xAyFWoXkihM1xA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=NrWxyX9HMrCCGr6Vuia3ueWRnwtyQJsj8CMkRfV2Ji9LxVDD+yI8GnHV3d/aoAwmt
	 u/zh0T5RZ4cI2DXubYgAPPVYnwCKSil06bTNXgSV/OxMAuRGB5+zdqG0n9vDQLdEU9
	 E9S78gaqRcmBuknnW8VP3BB5Gjo0lAStbDoVqlIAwphadEVY468PDIb51fwmONRbUv
	 ufK6G/kP0HUZNRC0TaZlJR82e8dNbbpYWFSFHC45LB95U5MDUrwVo6KM17Sh+EAAel
	 p7qet0Vq04PlnXqlhrZ/a9m7qMDIKWR2U5nyIqMWRjdALNIEpxNBioU5uuOREZKoyl
	 aGQPlKQ+MnpGw==
Date: Mon, 6 Jan 2025 14:56:07 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v4 14/19] arm64: dts: mediatek: asurada: Enable PCIe and
 add WiFi
Message-ID: <20250106205607.GA132098@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a58d5fa4-0d00-4ca1-941b-3ad69e65de80@notapiano>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_125610_983661_BA89D91F 
X-CRM114-Status: GOOD (  20.13  )
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

[+cc Mani]

On Mon, Jan 06, 2025 at 04:10:32PM -0300, Nícolas F. R. A. Prado wrote:
> On Fri, Jan 03, 2025 at 03:14:46PM -0600, Bjorn Helgaas wrote:
> > On Wed, Jun 29, 2022 at 11:59:51AM -0400, Nícolas F. R. A. Prado wrote:
> > > Enable MT8192's PCIe controller and add support for the MT7921e WiFi
> > > card that is present on that bus for the Asurada platform.
> > 
> > > +&pcie {
> > > +	pinctrl-names = "default";
> > > +	pinctrl-0 = <&pcie_pins>;
> > > +
> > > +	pcie0: pcie@0,0 {
> > > +		device_type = "pci";
> > > +		reg = <0x0000 0 0 0 0>;
> > > +		num-lanes = <1>;
> > > +		bus-range = <0x1 0x1>;
> > 
> > Hi Nícolas, what's the purpose of this bus-range?  IIUC this describes
> > a Root Port, where we can read and configure the secondary/subordinate
> > bus numbers from the RP config space, so it seems like we don't need
> > to describe them here.
> 
> Hi Bjorn,
> 
> that was carried over from the downstream sources. I just tried
> removing it and indeed I don't see any difference in the PCI log
> messages, or the bus number, and the wifi works just fine. I can
> send a follow up patch removing it.

There might be a DTC check issue if we remove the bus-range:
https://lore.kernel.org/r/20250105101612.t6c4pw5uxhb5rdde@thinkpad

We might need to figure out how to resolve that first.

Bjorn

