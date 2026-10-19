Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F75CCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=peY+aObVcRc3+z92SmndUBTWbLH2yBpJPFW/B8sgqIg=; b=tS2VtMFRRm9xVkUH1y83OFzCe5
	gSOgEUw5I0GzFyakJsj6UxfZDa1shc24dDa3JXC379d9hCkcUg6nFDOqOdusDOCjgJJeefE0GPUwO
	nkYV8k9YsypX5xKsPB5oQJ9dX4cX5pvTAoSXcmDrDG5D35wAYSFG6/OHJf0yGsbgSOlf16j+jIoo0
	RXOcfK5QJzAZVoynGEgOjrrHmOAuHlLckjs3oi3Vw7RWLdlqPLZRn/VLwOc77v2LNo5xiF1pIifYw
	gA7cjmkjM69EBDjxbqe12gICtd+X1AOR3L8gj65Kq9NV1h7Giq04H50/F9IpUXUvfkJG+Vcc/jVlf
	/oWRtd8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIng1-00000007YPd-3XpW;
	Mon, 19 Oct 2026 13:45:21 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInfz-00000007YP0-24qo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 13:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=peY+aObVcRc3+z92SmndUBTWbLH2yBpJPFW/B8sgqIg=; t=1792417519; x=1793627119; 
	b=R/s7O/5aVrmsJYpECQjBL6sykiSKrvqMzx0ZqmBn9DwXlUwfC3CZHrXiB68bdVUaGmQTIV8fzZ6
	sk7RDxl9Zt49Oids6r0pTjudH920vwrwPPN+je4BdcWsQ4ptxKcgChhFoUKB0zOWLkrqv0tj0Rjo1
	ZmvZxy2/wGi3KfKafsip7R2V8QrbJmpuQtZarrfZ9QH5jhPCbsy02OA2VnuuI0f8dOfZh1uXF9dL2
	wgjum3YNOuKxEBWy0Wa5aLyPSFqhEgV5C2+GEjVZN0VURsGmejH5ixU1vOI7K0usZsYbJEHIjODq/
	K2Ncz2ZGD4TxyFSRVXdKgvHMIeAXbxY1ePLA==;
Date: Mon, 19 Oct 2026 15:45:03 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Andrew Goodbody <andrew.goodbody@linaro.org>
Cc: Ettore Chimenti <ettore.chimenti@linaro.org>, Paul Walmsley
 <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Christopher Obbard <chris.obbard@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Rouven Czerwinski
 <rouven.czerwinski@linaro.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 06/10] ARM: dts: omap: dm816x: Update USB node
Message-ID: <20261019154503.2111a89c@kemnade.info>
In-Reply-To: <8a8313f1-d525-45d3-9044-b5f7a00b256d@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
	<20261016-patch-ektor5-dm8168-dts-v1-6-b4ce30217028@linaro.org>
	<20261017083957.7c2696f5@kemnade.info>
	<8a8313f1-d525-45d3-9044-b5f7a00b256d@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_064519_537976_A952DC29 
X-CRM114-Status: GOOD (  21.07  )
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

On Mon, 19 Oct 2026 10:36:37 +0100
Andrew Goodbody <andrew.goodbody@linaro.org> wrote:

> On 17/10/2026 07:39, Andreas Kemnade wrote:
> > On Fri, 16 Oct 2026 16:41:21 +0200
> > Ettore Chimenti <ettore.chimenti@linaro.org> wrote:
> >   
> >> From: Andrew Goodbody <andrew.goodbody@linaro.org>
> >>
> >> USB node was not working correctly with DMA enabled as the supporting
> >> code had been updated without updating this SoC's device tree. Bring the
> >> device tree more up to date so that it works with DMA enabled.
> >>
> >> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> >> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
> >> ---
> >>   arch/arm/boot/dts/ti/omap/dm816x.dtsi | 41 +++++++++++++++++++++--------------
> >>   1 file changed, 25 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> >> index 7f3ef3a00ab8..5be9efc60785 100644
> >> --- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> >> +++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> >> @@ -574,18 +574,27 @@ uart3: serial@48024000 {
> >>   		};
> >>   
> >>   		/* NOTE: USB needs a transceiver driver for phys to work */
> >> -		usb: usb_otg_hs@47401000 {
> >> -			compatible = "ti,am33xx-usb";
> >> -			reg = <0x47401000 0x400000>;
> >> -			ranges;
> >> +		usb: target-module@47400000 {
> >> +			compatible = "ti,sysc-omap4", "ti,sysc";
> >> +			ti,hwmods = "usb_otg_hs";  
> > 
> > Why do we still need this? It is depcrecated.
> > 
> > Regards,
> > Andreas  
> 
> Without that line we get the following on boot and USB does not work
> 
> [    0.110148] omap_hwmod: usb_otg_hs: no dt node

It is somewhat odd to use both ti-sysc and hwmod. It looks like a
half conversion.

For an example how usb_otg_hs was converted to ti-sysc for omap3, look at
42a79edd4a3dc1bb8e89fd2849f9e8e1e1c13977...v6.1-rc1

It has no hwmod stuff left.

Regards,
Andreas


