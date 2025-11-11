Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E499CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 07:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jSCFmAGYJ/6nn3X8y2BV2I473qQwTQBsOPiyb3X/GTY=; b=ECha9UeRVLGOAietaFLFnZ9VMW
	Q5LhTtQONXBcRNgrB5kvMUHBvRnxa4FCkMf/DIJjC4Gi9Ox17GcdAjyzJiNn56YQYnS+DwWwSq/9W
	4Mf/IJWRp1F21ZroXS1eUm9EGq9hPht7XW8djuoGF/FUswK0ir308SMGmjybh82ZtmSXamCcYAOvV
	TK5kbTQxriZkbtz7EkhMsANmMt0MUaNNnzlM425JlyPeNpQLkM4PL91FJnl13iki0LiFuuXDjhMvg
	eYrM5o6C+CYytmozjHxXBF3RpCsUMz8TSqfkxnuxiaPyps18oiwwwcca21e+ELwwGczHL7eJaf1y0
	yui79ILg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiwN-00000006hhl-3r8u;
	Tue, 11 Nov 2025 07:37:23 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiwK-00000006hgR-0dDq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 07:37:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=jSCFmAGYJ/6nn3X8y2BV2I473qQwTQBsOPiyb3X/GTY=;
	b=PWqLNck9KGbRwkR/sES7ueZrnA5LZNT3OVPkUI2EVxEc86cKHKBRnIx0UPASlk
	9MW/rnmblg29iXEi5+dXOGvlkhWhYNW2H1SiGaWvEKBcWbQGD2zCHdJXOhInI5r8
	3LGLOWVtKwJIxovzNMFo6iSjfjrenzjP8NeQPbQYeJ9z8=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAn_s2h5xJpBSnNAQ--.5214S3;
	Tue, 11 Nov 2025 15:37:07 +0800 (CST)
Date: Tue, 11 Nov 2025 15:37:05 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, frank.li@nxp.com, s.hauer@pengutronix.de,
	festevam@gmail.com, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/7] arm64: dts: imx8dxl-evk: Add vpcie3v3aux
 regulator for PCIe M.2 connector
Message-ID: <aRLnoXX54oG6erhW@dragon>
References: <20251024073152.902735-1-hongxing.zhu@nxp.com>
 <20251024073152.902735-2-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251024073152.902735-2-hongxing.zhu@nxp.com>
X-CM-TRANSID: Ms8vCgAn_s2h5xJpBSnNAQ--.5214S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw1DXw47Cr1ftrWUJF47Arb_yoWkKrgEya
	s7Ka45tFZ5Ar92qas8Ga1kX342939rKrWfXr18Xr4kGF9rZayvkrykGa4rWr13CrWIkrZx
	CrsrJ3ZxXr9xCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU2jg7UUUUU==
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiOAMBZmkS56Mm3gAA3b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_233721_243075_10F94205 
X-CRM114-Status: GOOD (  14.90  )
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

On Fri, Oct 24, 2025 at 03:31:46PM +0800, Richard Zhu wrote:
> Refer to PCI Express M.2 Specification r5.1 sec3.1.1 Power Sources and
> Grounds.
> 
> PCI Express M.2 Socket 1 utilizes a 3.3 V power source. The voltage
> source, 3.3 V, is expected to be available during the system’s
> stand-by/suspend state to support wake event processing on the
> communications card.
> 
> Add vpcie3v3aux regulator to let this 3.3 V power source always on for
> PCIe M.2 Key E connector on i.MX8DXL EVK board.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8dxl-evk.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
> index 25a77cac6f0b5..7704dba9e37c0 100644
> --- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
> @@ -649,6 +649,7 @@ &pcie0 {
>  	pinctrl-names = "default";
>  	reset-gpio = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
>  	vpcie-supply = <&reg_pcieb>;
> +	vpcie3v3aux-supply = <&reg_pcieb>;

Is it a documented binding?

Shawn

>  	status = "okay";
>  };
>  
> -- 
> 2.37.1
> 


