Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB55C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 20:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nC1pt0OHsgKYpZibz4D3aP8DAn0vUsf1V79tARY7X9c=; b=BbB5XVtaCP6NqMVJo9rjdHTF3K
	SZE3Q1ig9HKrQnh7yBTmHsHaa2R89Og9RbBOgYDfRyrRWfoiLUM8UBCijzX53pyBwk7QcMNNN58p+
	zc4Rrd/TbIrQ3nJdEFGvCJAjxt31dFU/AULm+J5NK8SQwWFmuep3tsXogd3dktt1I5s5nAdDRzk5K
	8b9mbkvh5pO5/ffxqtDVHKHV9a2XbhX4YvnVG+dYAXj0kf9oyDf6FnKNviak8QQRTs3euQgyouiET
	H2oEo/thw/8rajAFWMxOfDnoED4bC75zKBTaZSaEykGc4mNBxjzOcBJ9fmU+FoHnRcQRuCFfmQVH2
	iVtipeJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7h3f-0000000C0yA-0WVP;
	Wed, 23 Apr 2025 20:51:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7h1e-0000000C0hU-47fS;
	Wed, 23 Apr 2025 20:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745441336;
	bh=5RGhKAeaBreTh9VWG4EzD+6h2QPBnL+J7yh0wfrjIk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dkoOvwuDSavrmBG4/mjqPJmqID78hvqezOcjLGZfV+fI2+XSq2hg+ZOO3graW23Cc
	 jmuhsAjPqiFrIMFMjWa6048+3NJg/A3SlQlP5VvFqnvuIeBmXHH+tRcPKh8H7cQNBu
	 Yv0c1Pqo8kzR5gtk5HnPiEBW65EDtcPH6RpgEshfkKo62D2wgMXbSQiXLrrYgG46n8
	 Tk9903y7h+3OnSMUvKiWM6ALi8jFD/kUe8Cv6F0uJkVC/YBYb5IV/xYWRiIq4aYxsN
	 foqHrbq1lfwbfCJUpTdtNomL6WhByRulyCm/MbHp+3LRk1+ASMaVKDafQszTK9Qor+
	 2nZ+9115szOYw==
Received: from notapiano (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EF7A217E0649;
	Wed, 23 Apr 2025 22:48:53 +0200 (CEST)
Date: Wed, 23 Apr 2025 16:48:51 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-genio-common: Force ssusb2
 dual role mode to host
Message-ID: <2da6560b-8444-48ae-bb01-397756cecbc0@notapiano>
References: <20250331-mtk-genio-510-700-fix-bt-detection-v1-1-34ea2cf137f3@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250331-mtk-genio-510-700-fix-bt-detection-v1-1-34ea2cf137f3@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_134859_183584_0EC7AFF4 
X-CRM114-Status: GOOD (  27.58  )
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

On Mon, Mar 31, 2025 at 11:25:52AM +0200, Louis-Alexis Eyraud wrote:
> On the Mediatek Genio 510-EVK and 700-EVK boards, ssusb2 controller is
> one but has two ports: one is routed to the M.2 slot, the other is on
> the RPi header who does support full OTG.
> Since Mediatek Genio 700-EVK USB support was added, dual role mode
> property is set to otg for ssusb2. This config prevents the M.2
> Wifi/Bluetooth module, present on those boards and exposing Bluetooth
> as an USB device to be properly detected at startup, so configure for
> the ssusb2 dr_mode property as host instead.
> 
> Fixes: 1afaeca17238 ("arm64: dts: mediatek: mt8390-genio-700: Add USB, TypeC Controller, MUX")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
> I've tested this patch on Mediatek Genio 510-EVK board with a kernel
> based on linux-next (tag: next-20250331).
> ---
>  arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> index 60139e6dffd8e0e326690d922f3360d829ed026b..3a9d429f0f14b501ae41551dfe7272f242345138 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> @@ -1199,7 +1199,13 @@ xhci_ss_ep: endpoint {
>  };
>  
>  &ssusb2 {
> -	dr_mode = "otg";
> +	/*
> +	 * the ssusb2 controller is one but we got two ports : one is routed
> +	 * to the M.2 slot, the other is on the RPi header who does support
> +	 * full OTG but we keep it disabled otherwise the BT on the M.2 slot
> +	 * USB line goes obviously dead if switching to gadget mode.
> +	 */
> +	dr_mode = "host";

Hi,

while I agree with this change, now that this controller is fixed to host mode,
the connector child node here which is supposed to probe with driver
usb-conn-gpio, which would monitor the ID and VBUS lines and change the USB role
as needed, will fail to probe with:

  platform 112a1000.usb:connector: deferred probe pending: usb-conn-gpio: failed to get role switch

as indeed there no longer is a role switch registered.

For that reason, I believe as part of this commit you should also disable the
connector. Since role switching is no longer supported by this controller,
there's no sense in even trying to probe this driver.

Thanks,
Nícolas

