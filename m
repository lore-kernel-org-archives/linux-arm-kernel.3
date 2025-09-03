Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCD0CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 03:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VabSWEHZKq/Uo/eI7fVeM6GFJkY3NwC9Mx0za1md01Y=; b=bsU0VTruqfTLSaujQp/PgA0tEV
	EMd7i0c81aqIT8mpOg0QXy4YMG6dkrvjDJFH8winyRkVDqnllIdSQpSU1HyjDQrAs4S3ZpjUpH7e8
	z8Jtqf+4NduAi6gi/ZXoXdC+nWcx6E95QT5H6fI62qib/kkyXXL+7kg7jFPO4APe/de2zea4f7DUN
	kQoHGsFUP6MMLeYDibKTeMD2ljbDPPcshyq/ii4mcl/Iungo6GWuQwHcBnsxlPJvuYno6yktU0p83
	QqUswZYgf0Zg9EtAh4A97HxFLT/T/pJZuryaRsM0rKQk2JuSeYXuBwLWVO9rH3X2W33XlUqCwZraQ
	6ndFpX9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uteP1-00000003e1d-2XO6;
	Wed, 03 Sep 2025 03:43:19 +0000
Received: from mail-m49219.qiye.163.com ([45.254.49.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uteMF-00000003d1d-3qZR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 03:40:29 +0000
Received: from albert-OptiPlex-7080.. (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 21811dac9;
	Wed, 3 Sep 2025 11:40:18 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: krzk@kernel.org
Cc: adrian.hunter@intel.com,
	arnd@arndb.de,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gordon.ge@bst.ai,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	yangzh0906@thundersoft.com
Subject: Re: [PATCH v3 6/8] arm64: dts: bst: add support for Black Sesame Technologies C1200 CDCU1.0 board
Date: Wed,  3 Sep 2025 11:40:16 +0800
Message-ID: <20250903034018.3422601-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ce1285be-5a3f-4d4b-bca1-e31f56573597@kernel.org>
References: <ce1285be-5a3f-4d4b-bca1-e31f56573597@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a990da93a8209cckunm8503e29c32ceb9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGk9DVkkaSB8ZGB1KH0tKS1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=h823sxDypYoSJgayVX0U9DHevrcw9a5zlIxxSNfQqEPzSwlsPjultw7uxMH6+9fM9xemCwZCD4RkEjzkJZw3R5M7Xf7rp+rwgFU6NgZ1kpAyHO99ptWQ02xoHV2DcLmdyXdYCCfSMgFWNFTIQfW7FfCpEnHB4vP8rwupiHIbp98=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=VabSWEHZKq/Uo/eI7fVeM6GFJkY3NwC9Mx0za1md01Y=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_204028_367322_0FDFABF8 
X-CRM114-Status: GOOD (  18.71  )
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

On Tue, Aug 12, 2025 at 06:16:08PM +0200, Krzysztof Kozlowski wrote:
> On 12/08/2025 14:31, Albert Yang wrote:

Thank you for the detailed review and your patience. Apologies for not addressing these properly in v1/v2.
I have fixed the issues in my local tree and will send v4. Below are my point-by-point replies.


> > +&uart0 {
> > +   status = "okay";
> > +};
> > +
> > +&mmc0 {
>
> This is none of the two approved ordering styles from DTS coding style.
> What sort of coding style are you using?
>
Thank you for pointing this out. I did not follow the DTS coding style correctly earlier. I have re-read the DTS coding style and the relevant dt-bindings documentation:
https://docs.kernel.org/devicetree/bindings/dts-coding-style.html


> > +           cpu@0 {
> > +                   compatible = "arm,cortex-a78";
> > +                   device_type = "cpu";
> > +                   enable-method = "psci";
> > +                   next-level-cache = <&l2_cache>;
> > +                   reg = <0>;
>
> 0x0
>
> And why reg is the last? Please follow DTS coding style.
>
> I already asked for this at v1. How did you resolve that comment?
>
> Then I asked about this at v2:
>
> "Nothing improved. I asked to follow DTS coding style in ordering."
>
> So can you please respond to comments? You keep sending the same - third
> time - and this is waste of our time.
>
I referenced the ARM CPU node binding: Documentation/devicetree/bindings/arm/cpus.yaml
Updated as follows
		cpu@0 {
			device_type = "cpu";
			compatible = "arm,cortex-a78";
			reg = <0x0>;
			enable-method = "psci";
			next-level-cache = <&l2_cache>;
		};


> > +           mmc0: mmc@22200000 {
> > +                   compatible = "bst,c1200-dwcmshc-sdhci";
> > +                   reg = <0x0 0x22200000 0x0 0x1000>,
> > +                         <0x0 0x23006000 0x0 0x1000>;
> > +                   interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
> > +                   clocks = <&clk_mmc>;
> > +                   clock-names = "core";
> > +                   max-frequency = <200000000>;
> > +                   bus-width = <8>;
> > +                   non-removable;
>
> Hm, this is odd to see in SoC. Are you saying that your SoC (!) has MMC
> memory embedded?
>
> > +                   dma-coherent;
> > +                   status = "disabled";
>
> If so, why is it disabled?

Good catch. The device is not SoC-embedded; it is a board-level eMMC. Changes:
- Removed non-removable from the SoC dtsi
- Kept the controller disabled in the SoC dtsi
- Enabled the controller and set non-removable in the board DTS (&mmc0)
Updates:
in bstc1200.dtsi:
		mmc0: mmc@22200000 {
			compatible = "bst,c1200-dwcmshc-sdhci";
			reg = <0x0 0x22200000 0x0 0x1000>,
			      <0x0 0x23006000 0x0 0x1000>;
			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
			clocks = <&clk_mmc>;
			clock-names = "core";
			max-frequency = <200000000>;
			status = "disabled";
		};
in board bstc1200-cdcu1.0-adas_4c2g.dts:
&mmc0 {
	bus-width = <8>;
	memory-region = <&mmc0_reserved>;
	non-removable;
	status = "okay";
};


> > +           gic: interrupt-controller@32800000 {
> > +                   compatible = "arm,gic-v3";
> > +                   #interrupt-cells = <3>;
> > +                   #address-cells = <2>;
> > +                   #size-cells = <2>;
> > +                   interrupt-controller;
> > +                   ranges;
> > +                   reg = <0x0 0x32800000 0x0 0x10000>,
> > +                         <0x0 0x32880000 0x0 0x100000>;
>
> Random order...

Refs: arm,gic‑v3 binding
https://raw.githubusercontent.com/torvalds/linux/master/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
Updated as follows:
		gic: interrupt-controller@32800000 {
			compatible = "arm,gic-v3";
			#interrupt-cells = <3>;
			#address-cells = <2>;
			#size-cells = <2>;
			ranges;
			interrupt-controller;
			reg = <0x0 0x32800000 0x0 0x10000>,
			      <0x0 0x32880000 0x0 0x100000>;
			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
		};
  
Thanks again for the review. If you have no objections to the current modifications,
I’ll post v4 accordingly.

Best regards,
Albert

