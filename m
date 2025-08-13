Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2BCCA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 16:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EmjzUDwTEf/ZVzLY6NpUZ7nq/gf392CNl+RtZjfZyd4=; b=OPZxpTLGpiQvv1+NuMZz3lDQ+0
	rwPRcn8qwCyIgbZ0FdGRNCOuoSB5lFf5acPuDiOxziOJlamTowy8p6FYHuaQKrjsjOEFPi3BiWeXT
	K86v0GgzUroccHCnirOZNJwJYAVW0gSVtGzwllkHAmvzy0VxYWKBtPS2ypsAmBm0Rge6ZYaBQNuf8
	2uzX1YARrmc/3qYckFd4mHeQCYxXii7PUu7512u0ZyMNxUqLxzt5x9KR1VELU2JaIbCbz8h2AMRuW
	iuVSv0OzWBGYsacnRExxPg6fExGXu5krw2+7nxn/1B8IpmALqI/kog7Ywsmc+x4g6X4Xntuy569Ud
	v14pbgSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEO3-0000000EOpW-3Gia;
	Wed, 13 Aug 2025 16:31:40 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDPw-0000000EBtS-2koK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 15:29:34 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id DBF74A09CA;
	Wed, 13 Aug 2025 17:29:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=EmjzUDwTEf/ZVzLY6NpU
	Z7nq/gf392CNl+RtZjfZyd4=; b=c1mbcx01jkNEjwmMwbywiKqeRa2FdI/RIrSg
	umyluj/3Jz/VgcmHExvEZ83/8clhYcXKnl4CNtKXLL4C6sVBzFUAIjIVFkIWmX1K
	nWxzKsfWoB2/JqsuF2IIcTMZPu//8sLeZn5YkTpFL9NA7G49np1e6iNV5ZAawslC
	aYeBn1UUll7OpxgQEapTQLW2IvXkuxUx7CcI436lWs8HpoCDSVjfI95sFiaW+Rap
	cZdezw/NX7gwsL05oWWbrOrA4eMYPVc9ZfqGn8+XcpyGsXdQGcT7bCkPEU6VzfVr
	w0toicu09s82GfT4ds9Z0yrh6gGZqg7ZE8dChtnkptX8Yad++Oov3h0tfpBRO6dl
	pdDztiYuLU/yn1hM2KPBDRir09691LBhPlb5uLBiK0a7O+5a96VbYeMcTtGqDTOc
	QGVnKDOZAXKZifJdHf9FInn4bG3oeC/EUXYmmTzS/OU+/GYRT348fgzEPKePlQ0x
	Oft+ihlf9gHnF6ddkab0qJp4lGIZtsSGCoiKo+gbzTp60ug2CtIs2AWFlfUajqkQ
	HbV/8dWEvFk14kMYJZ0wZUs/umE/Hn6BUZgkKFEt3MQxVS1dprivtz0x9x/2nOhr
	yO+W5k22H7qaRqWDAj7B2hWObNHnV2mPCF2UGFLW0mlB4RQH4SKWHYSPLpqJ2Swd
	nrQGohI=
Message-ID: <db71a9dd-72b0-47ef-a7f0-bd527262c4e9@prolan.hu>
Date: Wed, 13 Aug 2025 17:29:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: imx6-litesom: Replace license text comment
 with SPDX identifier
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Marcin Niestroj <m.niestroj@grinn-global.com>, Piotr Figlarek
	<piotr.figlarek@grinn-global.com>, Marcin Niestroj <m.niestroj@emb.dev>
References: <20250709-litesom-dts-lic-v2-1-b907084ced96@prolan.hu>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20250709-litesom-dts-lic-v2-1-b907084ced96@prolan.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: sinope.intranet.prolan.hu (10.254.0.237) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E617765
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_082932_862563_1AA84A6C 
X-CRM114-Status: GOOD (  26.03  )
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

On 2025. 07. 09. 9:31, Bence Csókás wrote:
> Replace verbatim license text with a `SPDX-License-Identifier`.
> 
> The comment header mis-attributes this license to be "X11", but the
> license text does not include the last line "Except as contained in this
> notice, the name of the X Consortium shall not be used in advertising or
> otherwise to promote the sale, use or other dealings in this Software
> without prior written authorization from the X Consortium.". Therefore,
> this license is actually equivalent to the SPDX "MIT" license (confirmed
> by text diffing).
> 
> Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>

+Cc: Piotr Figlarek

> ---
> Changes in v2:
> - Fix msg
> - Link to v1: https://lore.kernel.org/r/20250702-litesom-dts-lic-v1-1-401e4d141bf0@prolan.hu
> ---
>   arch/arm/boot/dts/nxp/imx/imx6ul-liteboard.dts | 38 +-------------------------
>   arch/arm/boot/dts/nxp/imx/imx6ul-litesom.dtsi  | 38 +-------------------------
>   2 files changed, 2 insertions(+), 74 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-liteboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-liteboard.dts
> index 5e62272acfba..7a4127670a6f 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-liteboard.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-liteboard.dts
> @@ -1,44 +1,8 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>   /*
>    * Copyright 2016 Grinn
>    *
>    * Author: Marcin Niestroj <m.niestroj@grinn-global.com>
> - *
> - * This file is dual-licensed: you can use it either under the terms
> - * of the GPL or the X11 license, at your option. Note that this dual
> - * licensing only applies to this file, and not this project as a
> - * whole.
> - *
> - *  a) This file is free software; you can redistribute it and/or
> - *     modify it under the terms of the GNU General Public License
> - *     version 2 as published by the Free Software Foundation.
> - *
> - *     This file is distributed in the hope that it will be useful,
> - *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> - *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - *     GNU General Public License for more details.
> - *
> - * Or, alternatively,
> - *
> - *  b) Permission is hereby granted, free of charge, to any person
> - *     obtaining a copy of this software and associated documentation
> - *     files (the "Software"), to deal in the Software without
> - *     restriction, including without limitation the rights to use,
> - *     copy, modify, merge, publish, distribute, sublicense, and/or
> - *     sell copies of the Software, and to permit persons to whom the
> - *     Software is furnished to do so, subject to the following
> - *     conditions:
> - *
> - *     The above copyright notice and this permission notice shall be
> - *     included in all copies or substantial portions of the Software.
> - *
> - *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> - *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> - *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> - *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> - *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> - *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> - *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> - *     OTHER DEALINGS IN THE SOFTWARE.
>    */
>   
>   /dts-v1/;
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-litesom.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-litesom.dtsi
> index 8d6893210842..c387753f833b 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-litesom.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-litesom.dtsi
> @@ -1,44 +1,8 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>   /*
>    * Copyright 2016 Grinn
>    *
>    * Author: Marcin Niestroj <m.niestroj@grinn-global.com>
> - *
> - * This file is dual-licensed: you can use it either under the terms
> - * of the GPL or the X11 license, at your option. Note that this dual
> - * licensing only applies to this file, and not this project as a
> - * whole.
> - *
> - *  a) This file is free software; you can redistribute it and/or
> - *     modify it under the terms of the GNU General Public License
> - *     version 2 as published by the Free Software Foundation.
> - *
> - *     This file is distributed in the hope that it will be useful,
> - *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> - *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - *     GNU General Public License for more details.
> - *
> - * Or, alternatively,
> - *
> - *  b) Permission is hereby granted, free of charge, to any person
> - *     obtaining a copy of this software and associated documentation
> - *     files (the "Software"), to deal in the Software without
> - *     restriction, including without limitation the rights to use,
> - *     copy, modify, merge, publish, distribute, sublicense, and/or
> - *     sell copies of the Software, and to permit persons to whom the
> - *     Software is furnished to do so, subject to the following
> - *     conditions:
> - *
> - *     The above copyright notice and this permission notice shall be
> - *     included in all copies or substantial portions of the Software.
> - *
> - *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> - *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> - *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> - *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> - *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> - *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> - *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> - *     OTHER DEALINGS IN THE SOFTWARE.
>    */
>   
>   #include "imx6ul.dtsi"
> 
> ---
> base-commit: 66701750d5565c574af42bef0b789ce0203e3071
> change-id: 20250702-litesom-dts-lic-ad9774ebde3d
> 
> Best regards,



