Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB587D72361
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QoUg3Uk7+e8l5mq7yG+QFMWRIs9FeJl/CwglzOQSrcA=; b=3VLdP1TNpCPzZnniZNELPgl+lc
	BLakf0zThqzBtDTu9KPGPID2rQzYOeD0UCho4QJHfeqNI+pfYXjNtcJXtFD6wLDngLT6baruGmaIL
	TmbBF3fG+gKliwLr4ggceK5/CCyNZ4fGEpy7+pbWX0khhNUy/1R5uTyP4s/hEVB7sV/UuwnBndaBd
	66LP0oEUQa2sCvv4UC/slvhC+3tKW5AKMwt2tBuBgCmOevDXikTrw+eSFAGKn/tK5xaxyDrZITVO+
	bFcwERbxiCTDmiJ3Wf3v7vGIcOGSVUVOpY4/LuSZVF/+IJeZqtn36FYeKql31z5bBDtj2ugAVzFrv
	boTmHVEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDL1-00000008Xz9-3Odx;
	Fri, 23 Jan 2026 09:20:19 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDKy-00000008Xy7-0dRX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 09:20:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 95A661A2AED;
	Fri, 23 Jan 2026 09:20:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69FA46070A;
	Fri, 23 Jan 2026 09:20:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D07C119A8792;
	Fri, 23 Jan 2026 10:20:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769160009; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=QoUg3Uk7+e8l5mq7yG+QFMWRIs9FeJl/CwglzOQSrcA=;
	b=ouCeHIuYjsbzgDHldVpAkuh/B5AtCWHh58OIV/MdbRM+XeewIili9URv6x4IBIDo6adSjk
	5F5HKuSEJZDSvQ7rjF9z2bgNUYp/a+TJxDR7euP2NxpA9zLHH7Fiave4pisKcrDRgx8wyd
	6GTMTDnkUVqVyq2XpofKxjsGfE75V0YDJ9tFadQwT4Euf0e+w7amNzUOuIvkrgDcHXzEDM
	4I/7CZz2QztBW2vXrPVnks3KiDKtPIr0snQ5oh/k2Ocqn8UVaGeXgXGPOpPl3cUmjIKA4o
	zcgC4p2JlEcTpIYeWOKP3i4fSQa/Nz/qOmU7+S8ehBJNueZhnHGWB2WOdHOuQQ==
Message-ID: <dc6e60ec-f460-4713-b1cc-97ceb2d344f5@bootlin.com>
Date: Fri, 23 Jan 2026 10:20:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: a7k: add COM Express boards
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Rob Herring <robh@kernel.org>, Elad Nachman <enachman@marvell.com>,
 andrew@lunn.ch
Cc: conor+dt@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 chris.packham@alliedtelesis.co.nz, pali@kernel.org,
 devicetree@vger.kernel.org, mrkiko.rs@gmail.com,
 sebastian.hesselbarth@gmail.com, linux-arm-kernel@lists.infradead.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20260122165923.2316510-1-enachman@marvell.com>
 <176910484185.3007016.14688980539020105749.robh@kernel.org>
 <87a4y4lmn4.fsf@BLaptop.bootlin.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <87a4y4lmn4.fsf@BLaptop.bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_012016_327632_600657ED 
X-CRM114-Status: GOOD (  18.15  )
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

Hi,

On 23/01/2026 10:10, Gregory CLEMENT wrote:
> Hello,
> 
>> On Thu, 22 Jan 2026 18:59:20 +0200, Elad Nachman wrote:
>>> From: Elad Nachman <enachman@marvell.com>
>>>
>>> Add support for Armada 7020 Express Type 7 CPU module board by Marvell.
>>> Add device tree bindings for this board.
>>> Define this COM Express CPU module as dtsi and provide a dtsi file for
>>> the carrier board (Marvell DB-98CX85x0 COM Express type 7 carrier board).
>>> Add the Falcon DB to the MAINTAINERS list
>>>
>>> Since memory is soldered on CPU module, memory node is on CPU module
>>> dtsi file.
>>>
>>> This Carrier board only utilizes the PCIe link, hence no special device
>>> or driver support is provided by this dtsi file.
>>> Devise a dts file for the combined com express carrier and CPU module.
>>>
>>> The Aramda 7020 CPU COM Express board offers the following features:
>>>
>>> 1.  Armada 7020 CPU, with dual ARM A72 cores
>>> 2.  DDR4 memory, 8GB, on board soldered
>>> 3.  1Gbit Out of Band Ethernet via RGMII to PHY and RJ45 connector,
>>>     all are present on A7K CPU module (none on the carrier)
>>> 4.  Optional 10G KR Ethernet going via the COM Express type 7 connector
>>> 5.  On-board 8 Gbit, 8-bit bus width NAND flash
>>> 6.  On-board 512 Mbit SPI flash
>>> 7.  PCIe Root Complex, 4 lanes PCIe gen3 connectivity, going via the
>>>     COM Express type 7 connector
>>> 8.  m.2 SATA connector
>>> 9.  Micro-SD card connector
>>> 10. USB 2.0 via COM Express type 7 connector
>>> 11. Two i2c interfaces - one to the CPU module, and one to the
>>>     carrier board via the COM Express type 7 connector
>>> 12. UART (mini USB connector by virtue of FT2232D UART to USB
>>>     converter, connected to the Armada 7020 UART0)
>>>

 [...]

>> My bot found new DTB warnings on the .dts files added or changed in this
>> series.
>>
>> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
>> are fixed by another series. Ultimately, it is up to the platform
>> maintainer whether these warnings are acceptable or not. No need to reply
>> unless the platform maintainer has comments.
>>
>> If you already ran DT checks and didn't see these error(s), then
>> make sure dt-schema is up to date:
>>
>>   pip3 install dtschema --upgrade
>>
>>
>> This patch series was applied (using b4) to base:
>>  Base: attempting to guess base-commit...
>>  Base: tags/next-20260121 (exact match)
>>  Base: tags/next-20260121 (use --merge-base to override)
>>
>> If this is not the correct base, please add 'base-commit' tag
>> (or use b4 which does this automatically)
>>
>>
>> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/marvell/' for 20260122165923.2316510-1-enachman@marvell.com:
>>
>> arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: ethernet@0 (marvell,armada-7k-pp22): ethernet-port@0:phy-mode:0: '10gbase-kr' is not one of ['gmii', 'sgmii', 'rgmii-id', '1000base-x', '2500base-x', '5gbase-r', 'rxaui', '10gbase-r']
>> 	from schema $id:
>> http://devicetree.org/schemas/net/marvell,pp2.yaml
> 
> Does this mean we should add 10gbase-kr to the phy-mode enum list in
> Documentation/devicetree/bindings/net/marvell?

No, 10gbase-kr is legacy, one should use "10gbase-r" instead, cf commit

e0f909bc3a24 ("net: switch to using PHY_INTERFACE_MODE_10GBASER rather than 10GKR")

That should probably be documented in the bindings at some point :)

Maxime

