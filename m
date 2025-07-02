Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C151C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 22:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3e8ZfmzVr8jG57PEK3YQYM1MaAzpKV6K4dgRXSV1tKw=; b=CBn1o9Vos/7Ot3dDjQu87UOQTm
	K0uY8VG0l8jPyghgms078s/pnli8NiAMZHOM84ObIiruyYqqmPtvoY5xRdaYxnl1LrMQ3sJaXUSj6
	FJJ958LCpw1VCmq2cNdKdAPIYF9CoKAvjbHZJarafJ94vvKQJa7bRsh+RE4hEBg7B84211mlJ0MTU
	FT25vc1f5AGyQJVkpLovJGcCnrt5PF/7f7erYb2Ad1KVCr0n1VSgOCliFwIsx7k/vTux4RMTZvC5n
	ZHRbmRsqb42d8PuIlPgWpgjcorEsJ9VUZ9HR2/wJoFD9NP00LtqcYTJEf1L49/44xBSTI5ha3iG05
	1aYBxB0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5bZ-00000009fDP-0wm5;
	Wed, 02 Jul 2025 22:07:01 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5RI-00000009dyE-3PqZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 21:56:26 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 8B62DA0057;
	Wed,  2 Jul 2025 23:56:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=3e8ZfmzVr8jG57PEK3YQ
	YM1MaAzpKV6K4dgRXSV1tKw=; b=JgN5qKZRW6ohwswImPvNTLkJthhXf6Ucwfck
	6Hzv9+aTvM784CoQcqC1aMM+cBU6qNquxGNIswE/Ys8PSL/1ocMGup9xEoC2yss+
	skPpRdOH2eiSVIx9w/0czjhmErMt/luUpHdHrL97bC4h9yXKF/gaYwWgDEKCRR1j
	5fiuKain4ROChqGHEirDYj5dU7az0ZVJ+u/6miTU/FC87/PdlFR3NFk+uINhI5Gy
	DqkEFc3d3HU6wfeit5WhBuv/+CsyOsWeHdBJBYop9yPpBQsoimWrj/xSgoonZVGN
	0UCH4/4ehmqMolDI4RYZ1EiB8N7lxjCcBSljqneNVzV1ub+JwwtbKdipbRYr//Ss
	EHGpcm2Yc8BSVTKribB+p9/UYwk7vGi3LyPQ+55MkvADL28VD9fpPIjTl2TbXZXS
	J/y92lMn4zrvgfzEzVBSa7BPsUMvjzembyaesCm6JqIhH3FUs3TRdXCiVZ/98PE7
	50/ohY0LNRfMYJq618ervFxHfLwCg+m8gkY0vLhtr5bh8rDpG/CVmFS9j6SjO7xq
	jokhffH5ArKTvAvHQG6LHn2ZsKi+vD2ceSmeIUfWr3gT2xoVIS0ImTmSa1M1D1zy
	dCUqeY72S0teCB5QIB/OisfU/I6B3JxR8gCSrYPf2o7T/Yusm+fCm5atZ7x1f18Z
	yU7HBac=
Message-ID: <2f628251-5b67-47e0-8038-6c1aeee1ef91@prolan.hu>
Date: Wed, 2 Jul 2025 23:56:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: DT: imx6-sr-som: Replace license text comment with
 SPDX identifier
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	<devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250702-sr-som-dts-lic-v1-1-2e8584e6c837@prolan.hu>
 <aGWqIzNvSVw4olz5@shell.armlinux.org.uk>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <aGWqIzNvSVw4olz5@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.253.1]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155D6C7266
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_145625_006869_373694EC 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

On 2025. 07. 02. 23:52, Russell King (Oracle) wrote:
> On Wed, Jul 02, 2025 at 11:41:54PM +0200, Bence Csókás wrote:
>> Replace verbatim license text with a `SPDX-License-Identifier`.
>>
>> The comment heades mis-attributes this license to be "X11", but the
>> license text does not include the last line "Except as contained in this
>> notice, the name of the X Consortium shall not be used in advertising or
>> otherwise to promote the sale, use or other dealings in this Software
>> without prior written authorization from the X Consortium.". Therefore,
>> this license is actually equivalent to the SPDX "MIT" license (confirmed
>> by text diffing).
>>
>> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
> 
> As Florian has already mentioned, the preferred format for the summary
> for arch/arm is "ARM: ... " and by extension for arch/arm/boot/dts,
> it's "ARM: dts: ...", not "arm: DT: ..."

Ohh, I misread it, I thought it was just about `imx6: board:` -> 
`imx6-board:`... Ok, I will re-format it for v2.

Bence


