Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BD4C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 14:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fVtAmdmgI6XZ8jo+rVbYlNMoKW2iCrPKAgX23Mg/I0=; b=YeNb7CxgkSH7/6Uo9icBzP9kbj
	gO5I4emeZOSnpHc7gaxCRM2wOEnSP9jEXdhTMv1LL9W6GkJqHfHMuiGFoUG86gdHOgLRwR5tbOAg7
	98Z33nC/vNup7oEjASZmUnKC3AuVDKmef/dYC0sjCiQ+jOdVmASLOntzUWvE8CkQWeOpUtWj350rS
	d2OuenHkoSDahf43cSY+xVxyl8R7PAEr0sTJ46pznn4hvPGSjZnhzQq1dm1jgYQoAPEr9MUnAgMZa
	Ap5LydxAryRGJ9bMSG2iZYCENkXLB1YUglGEERElVijnWiaziJBA2H8XEaqCH48MmPAiY4chNFB6F
	ezch8vjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk1vf-00000000sED-2x1Z;
	Thu, 07 Aug 2025 14:49:15 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk1t8-00000000rpx-0Y7Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 14:46:39 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 7D22AA037B;
	Thu,  7 Aug 2025 16:46:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=/fVtAmdmgI6XZ8jo+rVb
	YlNMoKW2iCrPKAgX23Mg/I0=; b=YSioIBpRF0LEzdGibex50F2nrdgvfkwj+lNa
	vh2BQVGrwLIYZVALjU1grM9TwX3coPUT23E9V0Z2jOgO7tuBzcKAMMtGzkLXBu1y
	ZYMHQmPFDsiW6Rc3ns1oHUjrlUC/YPgZgBq+eii2GlOml2LiIAMxK/i8467+R63/
	U8GQvnqXH8rAYAm+AWigzfk1DM84pEkHSHyq3zU60cAA+FDnzTiSx55J/tfbwJBo
	YmevfCRJ7LR6yXl3oz7+MK+S/kYT1FtDLS7ugzLIn8PpFOYbvlc8ZbpWhP3qDqjW
	ERIstPFv8dWBt2h74/GjZ0cfKjTZijk9NTZA8wpLkgcPfZEcLPnsdg13tq/s/sKa
	sBUwDOGAHGnmrCudUui11aDC4BpzH3VCFoXbxToCCHm8HnIJmQCqD8gZ3SC8jRhZ
	OdiXPr0KNF2gG16ge45efsFDuvyfj0S+WN8SpRA7nFd7Pbbejy9azLYr9FhxtJQL
	bzo6gyIJMKV0HNMLH6pjkyVsOhntzjnt/u7EB8Qlmag8n857GXNmp/J8d+WwWXUt
	1DkVm2bVoIIJpi3NJ+N4dtdiePq7bQXYZAZ/0XO1jPbup1MPujHMWnbt9wrIO1BM
	SZUPTKUxAZZGAxdabl5FPP+KnWSphnSkgI8wJbggqgLp9YwiJtU8aVCrwxgmK81O
	vVEK4WA=
Message-ID: <0fdab5ac-604b-46fd-bd25-cfa7afd06f98@prolan.hu>
Date: Thu, 7 Aug 2025 16:46:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: imx6-karo: Replace license text comment with
 SPDX identifier
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	=?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>
References: <20250703-karo-dts-lic-v2-1-329f4c55913e@prolan.hu>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20250703-karo-dts-lic-v2-1-329f4c55913e@prolan.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E667361
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_074638_323750_2C1E68D1 
X-CRM114-Status: UNSURE (   9.65  )
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

On 2025. 07. 03. 11:09, Bence Csókás wrote:
> Replace verbatim license text with a `SPDX-License-Identifier`
> 
> The comment header mis-attributes this license to be "X11", but the
> license text does not include the last line "Except as contained in this
> notice, the name of the X Consortium shall not be used in advertising or
> otherwise to promote the sale, use or other dealings in this Software
> without prior written authorization from the X Consortium.". Therefore,
> this license is actually equivalent to the SPDX "MIT" license (confirmed
> by text diffing).
> 
> Cc: Lothar Waßmann <LW@KARO-electronics.de>
> Acked-By: Lothar Waßmann <LW@KARO-electronics.de>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
> ---
> Changes in v2:
> - fix message tags and typos
> - collect Lothar's Ack

So, what do you think, is this patch acceptable now this way?

Bence


