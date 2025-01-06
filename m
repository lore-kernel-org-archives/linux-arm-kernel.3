Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C71E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 19:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JvdayO8q2Bw5T67YVRvdCWaCNGN+LTom/pMarTnJUR4=; b=FJyCeRgh+1MqSEwUm3ved2nF0n
	w1c9cE1471Bi9bzRxJ12WdHn7emjtu5QC04zFbXZLoyGwyP7jgqLc4k09lK+9iJFL0zbXHMnSPTEw
	Asws91VYDV0kJWLuIRc5CxOY4or62wlp1ssrqSpqUAgYkM/MWpGszWUFtLwo0BTI4hINCM6XIm9Se
	xJU1RZOgT2MtRcqZY8bLqyDl543QUBrBEXZR0f9AjDH2DesOv3Q9J7/J++jjFYrlrwlN1e5GbZjLv
	nucyrNAIKhhdi0sYFSn68AWRi1IjFAp0ikSZj5wTjLpDWg5gj8oClW5UPDg0A8S3VHFC2b0jfihD+
	ueg80PzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUsW3-00000002OcW-0i6S;
	Mon, 06 Jan 2025 19:11:55 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUsUp-00000002OG9-2WGW;
	Mon, 06 Jan 2025 19:10:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736190637;
	bh=WzcDAuGLKvkvy9b11Mfq8Pz2IlzT9+yewUe37tBQURw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k6kyKbkzVWAmpOi0nGnfGoY8Fmq2ZxNtXl6lIWh6eZNArJnBOUJLiXpaGSxBNwel7
	 phgTVXN2bIBCJ5nZkPUXZPITMyvmrYpdHj74wyCJU9aZeEwTq/tcthI1tY9N5DAxO8
	 CWvIMTSgoIy+vxbd0QOeIgLNX6Es+j1qfh4+C6rh6UnNVsPZwZVdHKwNwWdz3ia619
	 0xWqvL16DA+8mmEoSHf1g8vNMdt9Kt7YPmcN9XPk8u8g2e2mP6o+uWKo8vP4eZosK9
	 aXRJgPSZoQF9wpADmqVIibZjRHCZlqid4rrExzGjf6GFnXLMdysAkqbgO1RkV9jb9O
	 K6drKuYQL4/ww==
Received: from notapiano (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8F2B317E15D2;
	Mon,  6 Jan 2025 20:10:34 +0100 (CET)
Date: Mon, 6 Jan 2025 16:10:32 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 14/19] arm64: dts: mediatek: asurada: Enable PCIe and
 add WiFi
Message-ID: <a58d5fa4-0d00-4ca1-941b-3ad69e65de80@notapiano>
References: <20220629155956.1138955-15-nfraprado@collabora.com>
 <20250103211446.GA4063@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250103211446.GA4063@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_111039_789742_8B6C9A84 
X-CRM114-Status: GOOD (  16.17  )
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

On Fri, Jan 03, 2025 at 03:14:46PM -0600, Bjorn Helgaas wrote:
> On Wed, Jun 29, 2022 at 11:59:51AM -0400, Nícolas F. R. A. Prado wrote:
> > Enable MT8192's PCIe controller and add support for the MT7921e WiFi
> > card that is present on that bus for the Asurada platform.
> 
> > +&pcie {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pcie_pins>;
> > +
> > +	pcie0: pcie@0,0 {
> > +		device_type = "pci";
> > +		reg = <0x0000 0 0 0 0>;
> > +		num-lanes = <1>;
> > +		bus-range = <0x1 0x1>;
> 
> Hi Nícolas, what's the purpose of this bus-range?  IIUC this describes
> a Root Port, where we can read and configure the secondary/subordinate
> bus numbers from the RP config space, so it seems like we don't need
> to describe them here.

Hi Bjorn,

that was carried over from the downstream sources. I just tried removing it and
indeed I don't see any difference in the PCI log messages, or the bus number,
and the wifi works just fine. I can send a follow up patch removing it.

Thanks,
Nícolas

