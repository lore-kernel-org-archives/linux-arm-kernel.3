Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D339E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 12:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVP6lv0BGm7ObhUv1WGBJ81iAq+cnfwWqMbnE3d8Ihw=; b=k1pyJeKzHXiGudaJOy0MVDE7Uj
	6ho7olJnBFeFpEaYUrSFOTRERFLQOKJz/pJQ7Tri/9oBw9sfUcJ89eP8J5CEce6Az4mz0xsGvPtwB
	rQBAAzA4q1/0nTfWi/WaPR9bhIfxWh9/8HsAKXipziX0eAjvSX5j6Pa2I63HiQHvTP6FOvDH+yl55
	gvAWgVp9fe6GFroSibW2lWzFcUVvh1PfTofkbs+GZougyTfBZPm9XWb3A4oF/cVmNbe4VsF2uXWG5
	m36RKdIxustHoAEMJwwqvTZqJ/Cdn8puelFzrhxXhRcKOXoVITtoJAe3h8N4Rnr948LJPg65btJR0
	HGYYt2LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8T2-00000004j8k-3izP;
	Tue, 07 Jan 2025 12:13:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8KK-00000004gXb-3mpR;
	Tue, 07 Jan 2025 12:04:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736251490;
	bh=tQFTVQklOFJuS0fnyGbP+5Y5K99avOFLQwUn/VZ/qmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qMqWO5jgf/B8kNJP7HOObfAsnWQXwBl9msxJiVk6IJYdDwv6KtOjIPi4GZuS1lueo
	 9g0tjA+/9PItLTU6T8+/YRhm2Azput50yR11gGBBx292LaP2piShJ8XI+QidL2cRYe
	 XINgqnge7Rt96Jqnnp3XKF4zK82eXFeLkI8+IE9g6LRaQ0bhHMA5KVa3xbpSh8jbbZ
	 SH4U54hhfBdyMkxVTlKNKZGvoXZh1VewWV/WFFl8H07b8LUE636Itot7Iex3zbQl7V
	 pewff/vMkoxHElvAa71VzUMmD23llvcqT1KxZIKwa3QqFfKyG9Xwqs6pw0t5c5Cwjb
	 W+LZNEPHT8AyA==
Received: from notapiano (unknown [IPv6:2804:14c:1a9:53ee::1000])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9CD1117E1567;
	Tue,  7 Jan 2025 13:04:47 +0100 (CET)
Date: Tue, 7 Jan 2025 09:04:45 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Bjorn Helgaas <helgaas@kernel.org>
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
Message-ID: <042ee88b-61b4-436b-8d34-a5cfd5fd953e@notapiano>
References: <a58d5fa4-0d00-4ca1-941b-3ad69e65de80@notapiano>
 <20250106205607.GA132098@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250106205607.GA132098@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_040453_083706_6EA48EE9 
X-CRM114-Status: GOOD (  23.13  )
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

On Mon, Jan 06, 2025 at 02:56:07PM -0600, Bjorn Helgaas wrote:
> [+cc Mani]
> 
> On Mon, Jan 06, 2025 at 04:10:32PM -0300, Nícolas F. R. A. Prado wrote:
> > On Fri, Jan 03, 2025 at 03:14:46PM -0600, Bjorn Helgaas wrote:
> > > On Wed, Jun 29, 2022 at 11:59:51AM -0400, Nícolas F. R. A. Prado wrote:
> > > > Enable MT8192's PCIe controller and add support for the MT7921e WiFi
> > > > card that is present on that bus for the Asurada platform.
> > > 
> > > > +&pcie {
> > > > +	pinctrl-names = "default";
> > > > +	pinctrl-0 = <&pcie_pins>;
> > > > +
> > > > +	pcie0: pcie@0,0 {
> > > > +		device_type = "pci";
> > > > +		reg = <0x0000 0 0 0 0>;
> > > > +		num-lanes = <1>;
> > > > +		bus-range = <0x1 0x1>;
> > > 
> > > Hi Nícolas, what's the purpose of this bus-range?  IIUC this describes
> > > a Root Port, where we can read and configure the secondary/subordinate
> > > bus numbers from the RP config space, so it seems like we don't need
> > > to describe them here.
> > 
> > Hi Bjorn,
> > 
> > that was carried over from the downstream sources. I just tried
> > removing it and indeed I don't see any difference in the PCI log
> > messages, or the bus number, and the wifi works just fine. I can
> > send a follow up patch removing it.
> 
> There might be a DTC check issue if we remove the bus-range:
> https://lore.kernel.org/r/20250105101612.t6c4pw5uxhb5rdde@thinkpad

Ah yes, indeed there is:

arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi:643.18-647.5: Warning (pci_device_bus_num): /soc/pcie@11230000/pcie@0,0/wifi@0,0: PCI bus number 1 out of range, expected (0 - 0)

Thanks,
Nícolas

> 
> We might need to figure out how to resolve that first.
> 
> Bjorn

