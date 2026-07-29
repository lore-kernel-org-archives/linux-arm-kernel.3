Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A2BC54FD4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 21:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHhbJARSK6mEzCn/mcOo5vWm6XFoiEhnC7/xR7e5iB8=; b=dDQB57iaN/OpTjENqXwbe5xmpo
	557FNFDF83PmeYxyWoQLJtoco1lHc20XU+Y0oKfDeAsIStUElIQifuE0BIxqGsOe6c/saGtOP+6uY
	X1gO4WOKtGl0db06S9VEv6bx0DeD1lQYqqbYy97NjqHei5vVxKGg1mYZurUDTCHcESVnqsR0eLWuM
	BpdLXUJJfEuA+cADgetmL5MQqXCoPu9hKjWT3W0QzLLEIErWOlllaFbczZaamEmFPNTFgK1jOdZ2g
	0T3KaJ3fZ+VgFzLr5fiNbGc971GkwyyP/VelZakNtm0CZiSCmf1bMJttogpJYK5PdHat8MArud+kf
	0Cxmv/7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpBba-00000008zOQ-0eXO;
	Wed, 29 Jul 2026 21:14:22 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpBbW-00000008zNp-3tHr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 21:14:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 40BB611B6DF;
	Wed, 29 Jul 2026 23:14:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1785359652;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=zHhbJARSK6mEzCn/mcOo5vWm6XFoiEhnC7/xR7e5iB8=;
	b=A+SMMBH2JeItBOGqz9r2jIuoMerwtgLeu++yPrfHK7M+2zx71PpffBe5dBc3RyjnN3CGyD
	GGGTU42ZFbino6oGBR85i26ANbu42euOmthXIHqGolTHgEu9k504PxvXOBPsBGVBduMaT1
	fFcgtaBdH4pebDuyJBPPgpd60fa4jSnk8xweWLFLeCCvGbnc2Q/wYhx/HbiMf5Eofp4V9c
	q8EqUjBKES6uTQcFOBaHo5YoeRaUNph9oWUqCW5ahvgxX0WYRxpKvbuATlENvQx2ivrKXg
	ycgHQf4xzt2Xx5WzTc3CijPdyUx7OdURjUmo7eRjhrVcsJouVkiBqiW5vLjFPw==
Message-ID: <03143ba3-e589-42b4-9221-59d9258e7d21@nabladev.com>
Date: Wed, 29 Jul 2026 23:14:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] arm64: dts: imx8mp: Add DT label to SPBA5 bus
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260727195244.78199-1-marex@nabladev.com>
 <178526691528.3668106.10748099183405791163.b4-ty@b4>
 <amoclu5c3bQH2zzF@lizhi-Precision-Tower-5810>
 <59bbc6ec-e01d-4656-a0a8-bc81c3cfbbe2@nabladev.com>
 <amojcXE2di_lwB2v@SMW015318>
 <114bc96c-459b-471c-8852-36309cca10b6@nabladev.com>
 <ampkUinVz4s2sMEl@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <ampkUinVz4s2sMEl@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_141419_346024_56EC2B42 
X-CRM114-Status: GOOD (  11.15  )
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

On 7/29/26 10:36 PM, Frank Li wrote:
> On Wed, Jul 29, 2026 at 06:49:03PM +0200, Marek Vasut wrote:
>> On 7/29/26 5:59 PM, Frank Li wrote:
>>> On Wed, Jul 29, 2026 at 05:50:21PM +0200, Marek Vasut wrote:
>>>> On 7/29/26 5:30 PM, Frank Li wrote:
>>>>> On Tue, Jul 28, 2026 at 04:56:42PM -0400, Frank.Li@oss.nxp.com wrote:
>>>>>> From: Frank Li <Frank.Li@nxp.com>
>>>>>>
>>>>>>
>>>>>> On Mon, 27 Jul 2026 21:52:16 +0200, Marek Vasut wrote:
>>>>>>> Add DT label to SPBA5 bus for usage in board DTs.
>>>>>>> No functional change.
>>>>>>
>>>>>> Applied, thanks!
>>>>>>
>>>>>> [1/7] arm64: dts: imx8mp: Add DT label to SPBA5 bus
>>>>>>          commit: 697f6889aa50996de067a8d170323535570052ad
>>>>>> [2/7] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>>>>>          commit: 3eacea24d258ff5169d84a419b07cb5828e91718
>>>>>> [3/7] arm64: dts: imx8mm: imx8mp: Add legacy board DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>>>>>          commit: 81a2094bb922290e4b52a1467037f8d2ac07ad87
>>>>>> [4/7] arm64: dts: imx8mm: imx8mp: Add HDMI DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>>>>>          commit: cfdee13eba802665ecd8751fefa754a759f414c4
>>>>>> [5/7] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>>>>>          commit: b26192de5d0f4635d73ad2aea43e3e83a9ef5f77
>>>>>> [6/7] arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>>>>>          commit: dca8d10e97bd121494106f54f4577291a9bb0f13
>>>>>> [7/7] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>>>>>          commit: 8ea2fa3fdc65f2750718aebdcf912cccde5913b8
>>>>>
>>>>> Sorry, I have to drop these because met build error
>>>>>
>>>>> Failed to apply 'arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtbo': FDT_ERR_NOTFOUND
>>>>>
>>>>> Failed to apply 'arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtbo': FDT_ERR_NOTFOUND
>>>>> make[3]: *** [scripts/Makefile.dtbs:94: arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtb] Error 1
>>>>> make[3]: *** Waiting for unfinished jobs....
>>>>> make[3]: *** [scripts/Makefile.dtbs:94: arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtb] Error 1
>>>>> make[2]: *** [scripts/Makefile.build:549: arch/arm64/boot/dts/freescale] Error 2
>>>>> make[1]: *** [/home/lizhi/source/linux-imx/Makefile:1629: dtbs] Error 2
>>>> How can I reproduce this build error ?
>>>
>>> Apply patch base on git@gitolite.kernel.org:pub/scm/linux/kernel/git/frank.li/linux imx/dt64 branch
>>>
>>> make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8 dtbs
>> It seems to work fine:
>>
>> $ git remote get-url frank
>> https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
>>
>> $ git reset --hard frank/imx/dt64
>> HEAD is now at eba4724641990 arm64: dts: imx95: Add dma, intr, aer and pme
>> interrupts for PCIe
>>
>> # https://patchwork.kernel.org/project/linux-arm-kernel/patch/20260727195244.78199-1-marex@nabladev.com/
>>    -> series
>> $ git am v6-1-7-arm64-dts-imx8mp-Add-DT-label-to-SPBA5-bus.patch
>> Applying: arm64: dts: imx8mp: Add DT label to SPBA5 bus
>> Applying: arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M
>> Mini and Plus eDM SBC
>> Applying: arm64: dts: imx8mm: imx8mp: Add legacy board DTOs for Data Modul
>> i.MX8M Mini and Plus eDM SBC
>> Applying: arm64: dts: imx8mm: imx8mp: Add HDMI DTOs for Data Modul i.MX8M
>> Mini and Plus eDM SBC
>> Applying: arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini
>> and Plus eDM SBC
>> Applying: arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for Data Modul i.MX8M
>> Mini and Plus eDM SBC
>> Applying: arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul
>> i.MX8M Mini and Plus eDM SBC
>>
>> $ git clean -fqdx
>> $ export CROSS_COMPILE=aarch64-linux-gnu-
>> $ make defconfig
>> $ make -j8 dtbs 2>&1 | tee /tmp/dt.log
> 
> Missed
> 
> DTC_FLAGS_imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01 := -@
> 
> did you set global env variable add -@ to export all symbal?
Sure, I always have DTC_FLAGS = " -@" set . Do you want that in Makefile 
for those various DTOs ?

