Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FAEC53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 15:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTvSDJoOFtJYf3B7nrlUED5jT8s+G45mEsRbewh02LA=; b=dOv8oMu510XC0cmtePWeSemEkv
	1Tw3yZrn+xDJ/txwjEXx91TqxnADjlkvsEJrFaRcwrz8PI8S2rhuEI0mkaJge8kem2TafIuiQew3b
	5Wv4YujrZGqaH77+1nEbhf/C0N91cJSUIluWzUDdp0jp3fNSZFDQPtK4iexQrlikGZh1at5Y5/g4v
	pgdS3K48H+zs8TG5WjrFvlvNgoTdWaU1h6e1Q68cy296YXxsk8FMqScBZPfA6zQ17Klsj1/kn8x8W
	LFGkLMsExuRoXNzZnIqNHhfVg7lPY8o7GQ1jhrtAyTBKyo6ra7jPifEXePYP/uH2WVoxxl65yqRDb
	T0bmHgAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6YK-00000008Sio-3yXD;
	Wed, 29 Jul 2026 15:50:40 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6YH-00000008Sgt-2ogS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 15:50:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 94C4811B5A6;
	Wed, 29 Jul 2026 17:50:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1785340223;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=dTvSDJoOFtJYf3B7nrlUED5jT8s+G45mEsRbewh02LA=;
	b=fG5GQFr81j0+VDOkcR/TWimmki3bY3S6Bhyi/kXVV5NGtAnMoGXBRPenHZNx9phX/rzurc
	e6C7rbOdqQzfiysZ4e01n87qdoZ6/5jFz0geyRQ9KFV/Q77c1GZrAP/uA7M2uVcGRVfgcq
	Xy9MAJgYNPauGRxXtMoyVAR2zUWvG13Hb5y26ObxVG+HyId28QbQl7fRhOm7z9HTXP9fDF
	qUfB5v3UuNmZR9WmhVtZIGkNi96FtWT2wTXzw9/2X5J4iby8xa83x+v2a2ryGAuJXDsGwP
	fwqqpBH7mn6XDBjnKg45xBdBmo3acZ7HqD9TY0/fNKssvrUypj4P3Ajt9jy5RA==
Message-ID: <59bbc6ec-e01d-4656-a0a8-bc81c3cfbbe2@nabladev.com>
Date: Wed, 29 Jul 2026 17:50:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] arm64: dts: imx8mp: Add DT label to SPBA5 bus
To: Frank Li <Frank.li@oss.nxp.com>, linux-arm-kernel@lists.infradead.org
Cc: Frank Li <Frank.Li@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260727195244.78199-1-marex@nabladev.com>
 <178526691528.3668106.10748099183405791163.b4-ty@b4>
 <amoclu5c3bQH2zzF@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <amoclu5c3bQH2zzF@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_085038_067894_1C2BF357 
X-CRM114-Status: GOOD (  10.88  )
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

On 7/29/26 5:30 PM, Frank Li wrote:
> On Tue, Jul 28, 2026 at 04:56:42PM -0400, Frank.Li@oss.nxp.com wrote:
>> From: Frank Li <Frank.Li@nxp.com>
>>
>>
>> On Mon, 27 Jul 2026 21:52:16 +0200, Marek Vasut wrote:
>>> Add DT label to SPBA5 bus for usage in board DTs.
>>> No functional change.
>>
>> Applied, thanks!
>>
>> [1/7] arm64: dts: imx8mp: Add DT label to SPBA5 bus
>>        commit: 697f6889aa50996de067a8d170323535570052ad
>> [2/7] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>        commit: 3eacea24d258ff5169d84a419b07cb5828e91718
>> [3/7] arm64: dts: imx8mm: imx8mp: Add legacy board DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>        commit: 81a2094bb922290e4b52a1467037f8d2ac07ad87
>> [4/7] arm64: dts: imx8mm: imx8mp: Add HDMI DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>        commit: cfdee13eba802665ecd8751fefa754a759f414c4
>> [5/7] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>        commit: b26192de5d0f4635d73ad2aea43e3e83a9ef5f77
>> [6/7] arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>        commit: dca8d10e97bd121494106f54f4577291a9bb0f13
>> [7/7] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>        commit: 8ea2fa3fdc65f2750718aebdcf912cccde5913b8
> 
> Sorry, I have to drop these because met build error
> 
> Failed to apply 'arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtbo': FDT_ERR_NOTFOUND
> 
> Failed to apply 'arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtbo': FDT_ERR_NOTFOUND
> make[3]: *** [scripts/Makefile.dtbs:94: arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtb] Error 1
> make[3]: *** Waiting for unfinished jobs....
> make[3]: *** [scripts/Makefile.dtbs:94: arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtb] Error 1
> make[2]: *** [scripts/Makefile.build:549: arch/arm64/boot/dts/freescale] Error 2
> make[1]: *** [/home/lizhi/source/linux-imx/Makefile:1629: dtbs] Error 2
How can I reproduce this build error ?

What is the command I should run and which branch are those patches 
applied to ?

On current next 78bc8af4affb ("Add linux-next specific files for 
20260729") I get this:

next$ make W=1 CHECK_DTBS=y 
freescale/imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtbo 
freescale/imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtb 
freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtbo 
freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtb 
freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtbo 
freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtb 
freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtbo 
freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtb 
freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtbo 
freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtb
   DTC 
arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtbo
   DTC [C] arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb
   OVL [C] 
arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtb
   DTC 
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtbo
   DTC [C] arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb
   OVL [C] 
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtb
   DTC 
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtbo
   DTC 
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo
   OVL [C] 
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtb
   DTC 
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtbo
   OVL [C] 
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtb
   DTC 
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtbo
   OVL [C] 
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtb


