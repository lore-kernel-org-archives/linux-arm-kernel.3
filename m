Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12269C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 19:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWfc16v2Kp7yl49dZ5M6cBc3DWnXTfID48UhHrQpilE=; b=pbekwTpBRlxHxKIMGzSdshWEah
	c1SgcqokwK+9lQzR4EldCxRwP1RkSnY21QdgNzcPasHOO2l3hVLydgJBxJ3H1ZTXFYO9RHLSyulFX
	WyKgXgFRoLE51EU8kKr9/zREJAI7pZQxsl03ZnwvW6BdrKSP22W6S8lVpZIa2wkgqMBbz5CzUF2qo
	2CozmR2Y6BUcGZqDRQx40YyJCx56lLe0/x1wTvQpahFLouyGXtufiEZxWEJn5eGp8DKxpbQ9QglPo
	I/DJbFZU9VIe1OpQXVx3qxeoQ+1TWKnMfbjenlJqFMck/TAu+sFYFQLm/N38mUp9ZAcXGFgSqRqTN
	DjHawWNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX31w-00000009OFh-3EgD;
	Wed, 02 Jul 2025 19:22:04 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2xR-00000009NsJ-1QYf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 19:17:27 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 32A88A0BD6;
	Wed,  2 Jul 2025 21:17:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=yWfc16v2Kp7yl49dZ5M6
	cBc3DWnXTfID48UhHrQpilE=; b=YPlt3q2M/PaU8NqlxFkjbS8VTYjImD4zO8qy
	NMJKNVmrHTgCB6qmJFhVt3/QqZSjglzykfM3UXzW0B5dAbCfcfYYqbzGaD+EE+dY
	q3dyPolOkq2ElXixers/YTs6zSEqECyhi1J1zM6vKdmGEskVCPvSPQZ0f2pYSS80
	d/pol2CDZtBmojmASSmhrbcGbKLf07hflQI/3UzwlDHl8QZzbah0+YsagFpF9KtH
	Bi8/KM8oY4QIZm8qRuZaQGUTp/r47KTXv/Uje8pZUwrAVTpnqpu6uiZWMBZrdQJ/
	RKyyePlsfihf1stb091oMi5KGTwbjr7oFYzKOILtNOPBObMEIsIaZsYMr7rzkZHA
	9x5LgbMb3rAg68+46eKl2FXGcNsUzOX/2NiSm7UyihbRQBEXOOq6MuxI8HMLpPoH
	ijdFbn55HpsXGY5dyonw2+aLRcGzvc21WQ75sRqx7XYcvjziCD+HELmo6uLRVT7F
	RspxKGQkTIOBIShB8xjmKViKFeO2phtPgf9W7YuLw3wJ0fUe2Hpj9ln5E9jQ6sla
	Cpy4vxrDdE/J/CXOWbLRgROFNVau4CInPQjXc3UYiCWi0np4Q+wOkUMnjW4Y50FD
	EL0b3m7fxfQMUYwcia30qTm1pKOSvLSwMMo74npRI2K5KMOs2qR5V3Srp9WA7T3I
	MGoHlw8=
Message-ID: <ae71768f-303e-445d-971f-e5feaab39e22@prolan.hu>
Date: Wed, 2 Jul 2025 21:17:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: DT: imx6: hummingboard: Replace license text comment
 with SPDX identifier
To: Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Rabeeh Khoury <rabeeh@solid-run.com>
References: <20250702-hb-dts-lic-v1-1-bf15c0a74577@prolan.hu>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20250702-hb-dts-lic-v1-1-bf15c0a74577@prolan.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.253.6]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155D6C7260
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_121725_845704_03BA66EE 
X-CRM114-Status: GOOD (  14.49  )
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

On 2025. 07. 02. 9:26, Bence Csókás wrote:
> Replace verbatim license text with a `SPDX-License-Identifier`
> 
> The comment heades mis-attributes this license to be "X11", but the
> license text does not include the last line "Except as contained in this
> notice, the name of the X Consortium shall not be used in advertising or
> otherwise to promote the sale, use or other dealings in this Software
> without prior written authorization from the X Consortium.". Therefore,
> this license is actually equivalent to the SPDX "MIT" license (confirmed
> by text diffing).
> 
> On top, half of the files have the fragment "either version 2 of the
> License" for some reason, and not follow up with "or any later version".
> So the resulting SPDX license is still "GPL-2.0-only".
> 
> Cc: Rabeeh Khoury <rabeeh@solid-run.com>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
> ---
>   .../nxp/imx/imx6dl-hummingboard2-emmc-som-v15.dts  | 39 +---------------------
>   .../dts/nxp/imx/imx6dl-hummingboard2-som-v15.dts   | 39 +---------------------
>   arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2.dts | 38 +--------------------
>   arch/arm/boot/dts/nxp/imx/imx6dl-solidsense.dts    | 38 +--------------------
>   .../nxp/imx/imx6q-hummingboard2-emmc-som-v15.dts   | 39 +---------------------
>   .../dts/nxp/imx/imx6q-hummingboard2-som-v15.dts    | 39 +---------------------
>   arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2.dts  | 38 +--------------------
>   arch/arm/boot/dts/nxp/imx/imx6q-solidsense.dts     | 38 +--------------------
>   .../dts/nxp/imx/imx6qdl-hummingboard2-emmc.dtsi    | 39 +---------------------
>   .../boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi    | 38 +--------------------
>   10 files changed, 10 insertions(+), 375 deletions(-)

Several (7) files have been left out. I will resend it tomorrow; it has 
only been 12 hours and I don't want to spam the lists too much. In the 
meantime, please tell me if there's anything else that I should 
incorporate in the v2.

New diffstat:

  .../nxp/imx/imx6dl-hummingboard-emmc-som-v15.dts   | 38 
+--------------------
  .../dts/nxp/imx/imx6dl-hummingboard-som-v15.dts    | 38 
+--------------------
  arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard.dts  | 38 
+--------------------
  .../nxp/imx/imx6dl-hummingboard2-emmc-som-v15.dts  | 39 
+---------------------
  .../dts/nxp/imx/imx6dl-hummingboard2-som-v15.dts   | 39 
+---------------------
  arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2.dts | 38 
+--------------------
  arch/arm/boot/dts/nxp/imx/imx6dl-solidsense.dts    | 38 
+--------------------
  .../nxp/imx/imx6q-hummingboard-emmc-som-v15.dts    | 38 
+--------------------
  .../dts/nxp/imx/imx6q-hummingboard-som-v15.dts     | 38 
+--------------------
  arch/arm/boot/dts/nxp/imx/imx6q-hummingboard.dts   | 38 
+--------------------
  .../nxp/imx/imx6q-hummingboard2-emmc-som-v15.dts   | 39 
+---------------------
  .../dts/nxp/imx/imx6q-hummingboard2-som-v15.dts    | 39 
+---------------------
  arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2.dts  | 38 
+--------------------
  arch/arm/boot/dts/nxp/imx/imx6q-solidsense.dts     | 38 
+--------------------
  .../arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi | 38 
+--------------------
  .../dts/nxp/imx/imx6qdl-hummingboard2-emmc.dtsi    | 39 
+---------------------
  .../boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi    | 38 
+--------------------
  17 files changed, 17 insertions(+), 634 deletions(-)

Bence


