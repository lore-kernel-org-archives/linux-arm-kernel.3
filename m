Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646A9E6896E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 10:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0oImfNfVmZoteRNxCIZNWQOK53yZgiZtROA1arGm3w=; b=rGt396DHJNar7+i0xdtTfJeRA6
	9ExM8YIr17cxb2lX8SbdL5uLfKnfr9hE4iWfz26ed/y6kLMTgJw7QkeOnl5phJEH9K+lmbidpNQW8
	LqF7aLw50ZZTj6fF7O/sy6oc2AGJw3xIXdGoN+o8Za95IRELUsRE2yND3fpqdpBlOoDmTuLYmLbtk
	rGEynEPtkSXXJryCMivG19Va84gDZOOnT5RBfgJHjr0p65V0jbmvI0MML6B/V6vId8VrRKBzxdEI5
	wim3vQlVHeUjvISUgI84yoJ2mL4ZX0pxnK0mwpwd9sM5IX9dWpLLqIBFUwd4WFUjC/x+HdLXLHMLi
	gG26gceA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6SA8-00000003Bzk-36MJ;
	Thu, 31 Oct 2024 10:12:20 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6S8U-00000003Bq1-2sJu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 10:10:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1730369434; x=1730974234; i=wahrenst@gmx.net;
	bh=z0oImfNfVmZoteRNxCIZNWQOK53yZgiZtROA1arGm3w=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=CzSwJbhbUJVO20CApIMrpcKE+PAzhIB0VMvp00EMi9no73XVyfqh8tyjiSr09cEY
	 1OZ1+LNz6hBUHC/PH6HIH2RJg6SRQR3IjACJif51wW9PwXZQcfSfqRrqy656qRU+R
	 cIC49AYpC/Z5dOy/Mr5vxI5JlsJ+k4DI0ttgR+dCI3Ofkvq5p3LKuhm/oMdzpw8AK
	 1Cw0C9jVFHrmxQtYEboteN2ANCVS2UynZTRXzdHpzjqdy6CXhn8N5co9wu5DWnKxw
	 v1esURQMjBomI+tXpSzeK3iruAB8olqF5QBXw3UkP4eJdCa6XLRK/FD42xKT8QbVh
	 o2tHv4j+EHHgR2wHyg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2f5T-1t8vdm3cMx-00H934; Thu, 31
 Oct 2024 11:10:33 +0100
Message-ID: <806770fc-3830-4e89-a3ee-487b662685ed@gmx.net>
Date: Thu, 31 Oct 2024 11:10:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] ARM: dts: mxs: Add descriptions for imx287 based
 btt3-[012] devices
To: Lukasz Majewski <lukma@denx.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241022133040.686562-1-lukma@denx.de>
 <20241022133040.686562-4-lukma@denx.de> <20241031094236.17ed927d@wsk>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20241031094236.17ed927d@wsk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:/JF7aP6oveKYqWVpv51ETs6jF1SqwpNJgJey5jBS3GprKpxoAGB
 QZzUMikSxTkmXRw3seBIAnG+JtwvRUxDJ9JjnZ4c+j5U8UlvLCiLsYMrxKm/bIWKh7lu5e3
 kIl/+pvWqbJA8X/LRvoP7YduRU56bKSGIjoS63y+ZaPCRnBcQgxrQdbpCGyszzqdHqf7J4g
 RdYYL187aU2HHUTr9jYQA==
UI-OutboundReport: notjunk:1;M01:P0:vb4YxoBPEBI=;zNksRCNWuHDaCAZKbxrTCxStcmi
 BbuU6kfayn4Och4nccHxZGRwdJtwpIYC5dSXcXAveTIxMiVi2IzcUXKHbk0KL+UIHVXZTHOIk
 OhUBbl6/AsP9ze0M8FubZYcGdYYeQGc+6BFibzdDkRcf9HJ0G3K1d6cPDd4U0HPSUeGMTNJXz
 53E4YAUCGp5TzuMPCiogEhso1uxG9gfIFSB0gN9oKokLYT2j6Fq1WbGUZ1a5X4FEBdEbkHPmt
 peeE+aa/Kk95EqE4lryFtmqL8nB81C/D2VPJc3OTwKEKlck6m4d+ZIvjdBVSusKugd1V4Hm4Z
 4sweQpyC7Nu4/tihjXCNJX5vQCxij8c2rh4s9DjGzATulSbjoSDWf+iOQc81AcHcNb/1LuDz8
 SCnPAxv319VvsMRjGCoa45JeHAx9G2uVe8/usLeylpSDdN1FBNzMjEweGqxzj8jJQbQJfp/7O
 05dNCuimZK63H6wFjUdY75zzdzLifcXVMeWtjAp6ypNp7TuSYhZe4xGGpY62X7qe1ezefKk9k
 GmTAAjY5SiAob1SSsPP8+39NmNCCHTQF0DN7UlpNamil5AJyOrDTWcog0Qms82jEpTuoH487Y
 cNq7tFue/qGFfp3Z7idDaXOwq9mRilSbUnDI4av1i3hmE6wIPlujTuzuAaxMbsM2ulXRa26k9
 Z/fA/OJQ2pnp5Dk/WT261jVTAVpdaRYsYB9Clsw4BdIJ3/zTu0c+isa0Ck6Tf4LCaqP6uT9Dy
 iar2qAwprClDvv4Jv4YIefVx/j363WBZporn4GuwoFZ/YwEV4W3i9PRP/IkLs5n48QsGyrW3E
 /tb1m6VshS4C9dniZAwPeoYw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_031039_055551_5B4D1FB2 
X-CRM114-Status: GOOD (  16.84  )
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

Am 31.10.24 um 09:42 schrieb Lukasz Majewski:
> Dear Community,
>
>> The btt3 device' HW revisions from 0 to 2 use imx287 SoC and are to
>> some extend similar to already upstreamed XEA devices, hence are
>> using common imx28-lwe.dtsi file.
>>
>> New, imx28-btt3.dtsi has been added to embrace common DTS
>> properties for different HW revisions for this device.
>>
>> As a result - changes introduced in imx28-btt3-[012].dts are
>> minimal.
>>
>> Signed-off-by: Lukasz Majewski <lukma@denx.de>
>>
>> ---
>> Changes for v2:
>> - Rename dts file from btt3-[012] to imx28-btt3-[012] to match current
>>    linux kernel naming convention
>> - Remove 'wlf,wm8974' from compatible for codec@1a
>>
>> Changes for v3:
>> - Keep alphabethical order for Makefile entries
>>
>> Changes for v4:
>> - Change compatible for btt3 board (to 'lwn,imx28-btt3')
>>
>> Changes for v5:
>> - Combine patch, which adds btt3-[012] with one adding board entry to
>>    fsl.yaml
>>
>> Changes for v6:
>> - Make the patch series for adding entry in fsl.yaml and btt3
>>
>> Changes for v7:
>> - Use "panel" property as suggested by the community
>> - Use panel-timing to specify the display parameters
>> - Update subject line with correct tags
>>
>> Changes for v8:
>> - Use GPIO_ACTIVE_HIGH instead of '0'
>> - Add the comment regarding mac address specification
>> - Remove superfluous comment
>> - Change wifi-en-pin node name
>>
>> Changes for v9:
>> - Remove not used 'pm-ignore-notify'
>> - Add display names for 'panel-dpi' compatible to avoid Schema
>> warnings
>>
>> Changes for v10:
>> - Drop new line with panel-timing definitions
>> - Add new lines with 'sound' node
>> - Change 'codec' to 'audio-codec'
>> - Change order of properties for saif1 node
> Are there any more comments regarding this patch?
Sorry, i wasn't aware that you are waiting for reviews after Rob's request.

