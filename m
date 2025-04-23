Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD08C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 11:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YfVwzaklYqB2yPGJrUhReU1MAXFmWBiktB9H9OnlWHA=; b=YEzkNM97f8QxTk/LE9Uzxu+BC3
	wtL5IuKhKjvOPXA+slppdW6TuBbUnNitpqkDOr8RW5Di5IVRKNC9CgSVu5ZtomuANYgwl7KbCyax9
	lvuy3qfEYIE+bvZu7BIQ+75tcweGFyPZC6Pt/tx5pTpQt1CzhyLk5VQkGFUx6QnaPJEm2xD8ibhD4
	/rFheYmPW5u8/0YRKi/YmsRcvYDdYqqRZUKjCWFNQvlG9k5QUkLkzFQp7XAugfFkfRMxJ11H/XquS
	05BTnfVsSdd/+4sXxbW8TX1zo4/I+ihx78/S92piW+/yLTaexjQ3dkPVmS2rE02QNeBfWp3yXirJC
	IrUOvF3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Y2g-0000000AHEe-2IPR;
	Wed, 23 Apr 2025 11:13:26 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7XJf-0000000A9oB-3T9v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 10:26:57 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 6EFAF1F96C;
	Wed, 23 Apr 2025 12:26:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1745404014;
	bh=YfVwzaklYqB2yPGJrUhReU1MAXFmWBiktB9H9OnlWHA=; h=From:To:Subject;
	b=jjgZ+LnTi8D+QhEDcCoLzSUblRuMauYhItZqnADRVM14O2rzj11ls30N4onzc9Akp
	 lOTOQ1i/3h8HqOsk2LiCiFju1aGmHdnVJl8VDP5bVbHyjU0mhFk9LNKszMNexjjJZZ
	 rdz0mPsCmMFURLeaVXI9ptj5SaKX/fSXdkmQc/PE31R4OLs9D2CVAWC+eVZgstYWyH
	 iLAP37E2POs5SACE1q8eCs67zEzY6MC66t+QYA4RDFMSS+3AGYMXvHLQCeLoedgXGL
	 CkYeXMmE9YAjF07qOwhaABWRXgMhbG7GohCYNTo8qr8I4Y2aSdMF1GyOJ+Ud3ZdivO
	 6h033Efpnke3A==
Date: Wed, 23 Apr 2025 12:26:51 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Wojciech Dubowik <Wojciech.Dubowik@mt.com>,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Philippe Schenker <philippe.schenker@impulsing.ch>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx8mm-verdin: Link reg_usdhc2_vqmmc to
 usdhc2
Message-ID: <20250423102651.GC4811@francesco-nb>
References: <20250422124619.713235-1-Wojciech.Dubowik@mt.com>
 <522decdf-faa0-433b-8b92-760f8fd04388@kontron.de>
 <20250423070807.GB4811@francesco-nb>
 <17ec22a0-b68b-4ac5-b2bc-986837639a37@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17ec22a0-b68b-4ac5-b2bc-986837639a37@kontron.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_032656_026425_C16120A8 
X-CRM114-Status: GOOD (  15.31  )
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

On Wed, Apr 23, 2025 at 10:00:22AM +0200, Frieder Schrempf wrote:
> Am 23.04.25 um 09:08 schrieb Francesco Dolcini:
> > On Wed, Apr 23, 2025 at 08:50:54AM +0200, Frieder Schrempf wrote:
> >> Am 22.04.25 um 14:46 schrieb Wojciech Dubowik:
> >>>
> >>> Define vqmmc regulator-gpio for usdhc2 with vin-supply
> >>> coming from LDO5.
> >>>
> >>> Without this definition LDO5 will be powered down, disabling
> >>> SD card after bootup. This has been introduced in commit
> >>> f5aab0438ef1 ("regulator: pca9450: Fix enable register for LDO5").
> >>>
> >>> Fixes: f5aab0438ef1 ("regulator: pca9450: Fix enable register for LDO5")
> >>>
> >>> Cc: stable@vger.kernel.org
> >>> Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>

...

> > With this solution (that I proposed), the sdcard driver just use the
> > GPIO to select the right voltage and that's it, simple, no un-needed i2c
> > communication with the PMIC, and the DT clearly describe the way the HW
> > is designed.
> 
> Yes, but your solution relies on the fact that the LDO5 registers
> actually have the correct values for 1v8 and 3v3 setup. The bootloader
> might have changed these values. I would prefer it if we could have a
> solution that puts the LDO5 in a defined state, that is independent from
> any external conditions.

I do not think this is a real concern, the PMIC is programmed during
manufacturing, if the PMIC programming is not correct we have way more
issues ...

Francesco



