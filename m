Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AE8C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 13:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=enZrA9KL5KcJYg7045i7Oen8N//oPvSiJBMB0j2xFu4=; b=ISL9mbQbl5UqoCXIKPsWGB0sUw
	oSkebAaGEPuNKVSSQMpKAhij740AcXzM73ajoVv7SSPqrFGzKQ74XoaLoWwGin896p6PqO+NfIMFZ
	MUHIkV80/8zajn1kkLM1bbrkeUG/bryaRe+PIncIFiUyN2u3c2HlCvcRTVfckxELQR3uuiJb0yYOT
	QwXMNUyZvAgZ6xPvtu+XszdQ6YPL8B39/OVRDlHYqv75zzdYu/h0e7LUSur4WHBhrQCqS+xRGT33d
	aBCIZeqVj5F1GOt5VX1zmb1TIpHlA1tpSec8CASfWScph1f1Ur/LDVIwaQt2dOaoIP7IPQUUQuaRL
	apL2wJpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9NJy-00000008Rz7-0AMq;
	Wed, 23 Sep 2026 13:47:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9NJw-00000008Ryz-2QU3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 13:47:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F3D5C41931;
	Wed, 23 Sep 2026 13:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB351F00893;
	Wed, 23 Sep 2026 13:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790171255;
	bh=enZrA9KL5KcJYg7045i7Oen8N//oPvSiJBMB0j2xFu4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GnKGwI7drZrdPYc/xI20nDslDydd6Nd1J5vDs0WlY5Yq5qw1JxHcDqN7GSF0hsRJL
	 ERUrX4urED0VtRkNpHJ52589Cpmg251TUTehCE1dxbEXupIkMI1qA1vaqZ8tn/8sNr
	 z5L9ARvolKAu8wK7FlUliWXSNjR26szXoziYl7OhATkFNycrJHFBUgA43LPpyVBpgy
	 SKYpA0BC2v8VEDu4Ra2Kb5pMo7acYfNdaoRMMwnbyBG+S5eQuwpA+ha0aae3mx2mu3
	 pId1kNywFyDJMA34KdWskk1o+/47qxAC3g35dkJRsgYodfVemXNbtx2xSArrDd2vgE
	 2o2aBiTlUpEiQ==
Message-ID: <1554dd31-79ce-4803-a12c-2f806275fe25@kernel.org>
Date: Wed, 23 Sep 2026 08:47:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] Add Agilex5 SoCDK TSN Config2 board support
Content-Language: en-US
To: muhammad.nazim.amirul.nazle.asmade@altera.com,
 maxime.chevallier@bootlin.com
Cc: rmk+kernel@armlinux.org.uk, krzk+dt@kernel.org, conor+dt@kernel.org,
 robh@kernel.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260908070557.3585-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260908070557.3585-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 9/8/26 02:05, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> This series adds support for the Intel SoCFPGA Agilex5 SoCDK TSN Config2
> board variant, which enables gmac1 as a TSN Ethernet port alongside the
> standard gmac2 port.
> 
> The TSN port (gmac1) connects to its PHY through a GMII-to-RGMII converter
> implemented as FPGA soft IP. This converter provides the RGMII TX/RX clock
> delays, requiring the MAC interface selector to be configured for GMII while
> the PHY-facing interface is configured as RGMII without delay duplication.
> 
> Add altr,socfpga-stmmac-agilex5-tsn for that integration. It is not listed
> as a DT fallback of altr,socfpga-stmmac-agilex5 because that port has no such
> converter. Patch 4 adds dedicated match .data ops for the required
> interface setup.
> 
> v6:
>    - Put altr,socfpga-stmmac-agilex5-tsn in the same compatible enum as
>      altr,socfpga-stmmac-agilex5 in the net binding, per Krzysztof Kozlowski.
> 
> v5:
>    - Replace of_device_is_compatible() probe check with dedicated
>      socfpga_agilex5_tsn_gmac_ops via match .data, per Krzysztof Kozlowski
>      and Dinh Nguyen.
>    - Drop altr,socfpga-stmmac-agilex5 fallback from the TSN compatible list
>      and rewrite the net binding commit message to explain the hardware
>      difference, per Krzysztof Kozlowski.
> 
> v4:
>    - Fix wrong email address in Acked-by tag from Krzysztof Kozlowski on patch 1.
>    - Add Reviewed-by from Andrew Lunn on patch 4.
> 
> v3:
>    - Add missing Acked-by from Krzysztof Kozlowski on patch 1, inadvertently
>      dropped in v2.
> 
> v2:
>    - Replace mac-mode DT property with compatible string-based detection per
>      Andrew Lunn's feedback.
>    - Use phy-mode = "rgmii-id" to correctly reflect MAC-side delay handling.
>    - Rename compatible string to altr,socfpga-stmmac-agilex5-tsn for
>      consistency with existing altr,socfpga-stmmac-* compatibles.
>    - Fix Makefile indentation reported by Krzysztof Kozlowski.
>    - Add DT binding documentation for new net compatible string (new patch).
> 
> Nazim Amirul (4):
>    dt-bindings: arm: altera: Add Agilex5 SoCDK TSN Config2 board
>    arm64: dts: socfpga: agilex5: Add SoCDK TSN Config2 board
>    dt-bindings: net: altr,socfpga-stmmac: Add
>      altr,socfpga-stmmac-agilex5-tsn compatible
>    net: stmmac: dwmac-socfpga: Add support for Agilex5 TSN GMAC with FPGA
>      converter
> 


Applied patches 1,2.

Thanks,
Dinh


