Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1CFCCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 17:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebfnwj7tMpis+tR7jktZ8bbJq6Qt0Nfjii5Z7X6heM8=; b=NKbr7qpaKRJ+H029yMB1nbS9cL
	KXtWBDamkj4v7cVBn+3A+fWsJ3aQHrRjZbiYGTlB/BTgMNki/wn09bcR1y4LOSgLZ7s4iEo5CVsfA
	uBahbIH2sqQm8shgNl3+JvLKM/YmDvElnYxYcV5aZL38dPjhj5JfxeQUNYcVTZsARgkRVqGgCTCBW
	rKoaXnmlfZtLjaUe4ZAFxJqpW/DmGnyKMvD+MUgEbPa3YdzzB8c+h9Q8I3iBu4K4NVQzM3RDJ7sdy
	yoj989F7PoNAHBtt1bbEhdCTydN0BIOSycQDlXagqAhPwh/06d0zTAF2pO8c/JBK2oNiA+E2shdsm
	Mdk4YpDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFc6C-00000008hlH-1iXs;
	Sun, 02 Nov 2025 17:42:41 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFc69-00000008hks-2J9d
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Nov 2025 17:42:38 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d029P19yRz9sxG;
	Sun,  2 Nov 2025 18:42:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762105353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ebfnwj7tMpis+tR7jktZ8bbJq6Qt0Nfjii5Z7X6heM8=;
	b=VP9PRTxKRANrUVATpLf4VpHENaXsPDbREzODzM8r+WFvGQ/++XvFMtw1qGHV1h4Fo1h4X3
	gHHeLPJ/jPdlwUlGKqEHK2dYKhnla7T79zRVnSJXaQmA4SX+bs2tO/8fzM57LLD2pPKhlm
	6fV254HOzBLCUrKXWx+uCcOLffONq80p+E5lp9R0asgGAPQnpqfppepsesVxCq76SN8KqS
	F86GqtTjt+N0bdPjUTLOHmFph/dNbTnjmQyJ5gslpeBuNUb2qdlANqP6qI8l1Wc/31bNMp
	NfXHS6y9WXwQFuuVxsAxcoH5NpZL6L6nAbpNXI1GCNEDQK1uwa8tCrehg0kZQg==
Message-ID: <636f24ff-e775-468e-a13b-b86542098c74@mailbox.org>
Date: Sun, 2 Nov 2025 18:42:26 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v1] dts: arm64: freescale: move imx9*-clock.h
 imx9*-power.h into dt-bindings
To: Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 E Shattow <e@freeshell.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250831200516.522179-1-e@freeshell.de>
 <20250901032203.GA393@nxa18884-linux.ap.freescale.net>
 <3a165d77-3e36-4c0d-a193-aa9b27e0d523@mailbox.org>
 <05f7d69a-9c05-4b47-ab04-594c37e975eb@kernel.org>
 <51daddc4-1b86-4688-98cb-ef0f041d4126@mailbox.org>
 <8920d24b-e796-4b02-b43b-8a5deed3e8fb@kernel.org>
 <be2fc937-b7a6-49a7-b57d-6e3f16f4ccc3@mailbox.org>
 <20250904093442.GA13411@nxa18884-linux.ap.freescale.net>
 <afe58aa6-0c3e-4508-8133-8e7621a0484a@mailbox.org>
 <PAXPR04MB845970863A16718967270D1A880EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <PAXPR04MB845970863A16718967270D1A880EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: siz7namta7ztp8gt3hs83jgy4x3gfjit
X-MBO-RS-ID: 6783862ee9dc7f685d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_094237_742540_56A0AEC2 
X-CRM114-Status: GOOD (  11.77  )
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

On 9/10/25 9:07 AM, Peng Fan wrote:

Hello Peng,

>>> Marek,
>>>     Some U-Boot code indeed directly use the IDs to configure the clock
>> without
>>>     relying on any drivers. Since the SCMI IDs could not be moved to
>>> dt-bindings,
>>
>> Why can they not be moved to DT bindings ?
> 
> DT maintainers suggested to keep the files under
> arch/arm64/boot/dts/freescale/
> 
> https://lore.kernel.org/all/75ab9162-ed02-479d-92a1-7cfabff6b32e@linaro.org/

I think the larger question really is -- are the SCMI clock IDs part of 
DT ABI or not ? The SCMI clock IDs are part of firmware ABI, for sure. 
Does that imply they are part of DT ABI too ?

Or, is there by any chance a plan to allow e.g. resolution of SCMI clock 
IDs by their shortnames, and allow SCMI clock IDs to change across 
different firmware versions, even on the same platform ?

-- 
Best regards,
Marek Vasut

