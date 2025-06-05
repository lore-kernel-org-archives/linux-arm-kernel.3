Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBF6C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 22:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8lVMdDNWIa0lymqUQrX07OKAzHsZPVjkk8T9xoa1cw=; b=vvkg3o+opmngrA4Nahl7jjlnib
	VxI7RLl6lgBLaeDRj7UZAVuuv0N2oL0m9rVDJWjalH6et8hJbnK/Sn4rmL5vD07iN7xDAAhVP9AXT
	c/i1zvKGyv21/uZzibTNV4u2RMjGGUAX9DZ+Kv7QVTWR5jB9a6lSHpi72C5HMTZV4ndzRRLL1jUFx
	2ZpyWBDl87SiUBQYNMuJkGfo4s8P+gGvp7GaLAgKBMtGYZSIbjvJQDi//sSKXuFtj2+W+7Shyv3W+
	ZJMAI78Zpy08LQg3xN8Z+m5Pqc04VPATrzrYirxt/OsH4olbkrCefUMAKiLdF5v7Pz9E3uByjJ6Yy
	ucXToo2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNIrv-0000000Gj31-1mf7;
	Thu, 05 Jun 2025 22:15:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNIpk-0000000GirG-0vxB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 22:13:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 798CCA4FCE8;
	Thu,  5 Jun 2025 22:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E845EC4CEE7;
	Thu,  5 Jun 2025 22:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749161591;
	bh=BLfA4ZAVbtNmh+Wd7A/4kqT3/Wp/5XmJ0077S+Wl6Uw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JBWIQJ9QhBXQmamEEFJUAvjxOnHvxneQRcEYEpoBNI1H553B5myDsXEI4gWfpaNia
	 /HecHxWS+MrSqUXmngyI4NHxzDJxDzuJkpJrEGlXp0kUtmImsD44mBjhdArwuQZDzS
	 tp4CxQWsylneH02xA7bhDNe6imKa5AkSbl+waWJaHHqEZ1nLfjMUaEtg/xVRXSq5Q7
	 L0CUU/4LvfROVZlmQaK44sjOHikKhd7dVOcKe03ZW4lz6ETWFVkWpJlyfEkei5GW3K
	 E+YOtGwX/Wy/hrzo+aW89OBT9SAW+xQyG+HrVNWJZsMAYHuvFmh7L/cGxh/hZzic/p
	 Xsm1ojDqrfAyQ==
Date: Thu, 5 Jun 2025 17:13:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: conor+dt@kernel.org, geert+renesas@glider.be,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	mturquette@baylibre.com, lpieralisi@kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
	magnus.damm@gmail.com, john.madieu.xa@bp.renesas.com,
	linux-pci@vger.kernel.org, kw@linux.com, bhelgaas@google.com,
	krzk+dt@kernel.org, devicetree@vger.kernel.org,
	manivannan.sadhasivam@linaro.org, sboyd@kernel.org
Subject: Re: [PATCH v2 3/8] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add
 documentation for the PCIe IP on Renesas RZ/G3S
Message-ID: <174916158571.3344975.11147858201870776077.robh@kernel.org>
References: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
 <20250530111917.1495023-4-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530111917.1495023-4-claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_151312_325938_135EB46F 
X-CRM114-Status: GOOD (  18.21  )
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


On Fri, 30 May 2025 14:19:12 +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The PCIe IP available on the Renesas RZ/G3S complies with the PCI Express
> Base Specification 4.0. It is designed for root complex applications and
> features a single-lane (x1) implementation. Add documentation for it.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v2:
> - update the interrupt names by dropping "int" and "rc" string; due
>   to this the patch description was adjusted
> - added "interrupt-controller" and made it mandatory
> - s/clkl1pm/pm/g
> - dropped the legacy-interrupt-controller node; with this the gic
>   interrupt controller node was dropped as well as it is not needed
>   anymore
> - updated interrupt-map in example and added interrupt-controller
> - added clock-names as required property as the pm clock is not
>   handled though PM domains; this will allow the driver to have
>   the option to request the pm clock by its name when implementation
>   will be adjusted to used the pm clock
> - adjusted the size of dma-ranges to reflect the usage on
>   SMARC module board
> - moved "renesas,sysc" at the end of the node in example to align
>   with dts coding style
> 
>  .../pci/renesas,r9a08g045s33-pcie.yaml        | 202 ++++++++++++++++++
>  1 file changed, 202 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


