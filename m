Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18680C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 15:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNKKXxK3P24jwoIEtT+P8L73dlGuPGKm5hmRD8zmlCs=; b=l7VkAZDZPDsP798xY6Q/7g5X0Q
	ORYe3bmkb+KAPcq6tPdhLbofXV2LJ5vHCJfICr7kFeaf1y8rOl3j7awj8LgejFSZ3FfBmiaCG1n4W
	1iHryUnTzljP94zZM3bmjuuwmJeKtc/a9U6OmW4DlL/C86FDIorXfPK6n9VQj/Pwo9pS59Fybu3Lv
	f/v/7duV1GgWoBYytc9Vtvb8RX5oKrUdrzMya0j5n0hWtj3y1uCUWjHj0nDA8VgMiQtaj6hmejTcm
	R3Rwa5qW4gfFbRdsW98/37vS0VbHPmHjYxjolVTY9/iwM3MiF5tez4WBkj989JkfQ/BBo/tNUL6I+
	Z3O6ZNaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDgS-0000000EFAi-491W;
	Wed, 13 Aug 2025 15:46:36 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umD8c-0000000E8jM-0OrS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 15:11:40 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 63AD7A061F;
	Wed, 13 Aug 2025 17:11:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=rNKKXxK3P24jwoIEtT+P
	8L73dlGuPGKm5hmRD8zmlCs=; b=GhwELWec6dChTfssS6ZlxRQM/JsDcZG2MQAz
	3LqA3VnhCkgYaxF8VI3uZLy5zBLXdZY2WbIn5ehRc76dVH3QaB30Kf1sxnJz4JB/
	0OjOkod2zRuBAF66hEQj0CPrvisnCdS3XBEh1wRCbRThtUIVR/EIgCW1sZdHNXNQ
	VICPbcwIkTaE4ePoxvlB/VroUPyvhj7AmPeAfgNOTSpnks4hRRv1kqG0TklOVb1O
	yXODS6Keq1L5q1yGcnuTVexr/tLU2Q1y7ou00av8G0L5ul4qdxvLJH2WOgOoINih
	44yEDbIhiKIgI9eUWDSZsxl8pvpbyHEGDiLQ6NxVsKVrVh8ewSr5zO5WinMltcLv
	P2ubxLeumsokN6iVjwc5SlaCUkFPr3YGrxR0imLKDn4dZ8VT+GRudc/5QRTCLj7H
	/GCCy6F3wmxDP03pDiQoiZV84H8/R4uUMQtUyQOt1FaFxzdpLINUqOAhPf4vSxKd
	Z2g8dOO0G8efXcmgYzjiSVvIVMP4dd/4AyRxNwNknauaoOa45aW9cypveDMnlcvy
	scKFVA1gXA729gBxFddEA4oMX8PbkYUynn9/lDC6jE4OvWPdrXDUA/V8wjULe0Yc
	/MekLncNFC7niwoeJGWg2RAJ1cQRnvt9PuU9s52PQzKvJZ9frLT3msiysDRQVXpO
	vECn6GQ=
Message-ID: <58709258-9154-4ec1-b64c-5be161b061e8@prolan.hu>
Date: Wed, 13 Aug 2025 17:11:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: imx6-aristainetos2: Replace license text
 comment with SPDX identifier
To: Heiko Schocher <hs@denx.de>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	"Pengutronix Kernel Team" <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Erika Unter" <e.unter@denx.de>
References: <20250709-abb-dts-lic-v2-1-adc5e4781f65@prolan.hu>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20250709-abb-dts-lic-v2-1-adc5e4781f65@prolan.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: sinope.intranet.prolan.hu (10.254.0.237) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E617765
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_081138_661773_10C34071 
X-CRM114-Status: UNSURE (   7.85  )
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

Hi Heiko,

On 2025. 07. 09. 9:28, Bence Csókás wrote:
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
> Cc: Heiko Schocher <hs@denx.de>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>

Do you agree with this change?

Bence


