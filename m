Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7CFCA1005
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 12:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/PBTt0C5Gx6hiojLqBDZVPUdijjHh91VEfxrRkHdGhE=; b=AqXyaeXW2PXVaDsHB61ARJbrNM
	qiQo09xpsZQJ6K6rgNBJNUdpe306eB7nnK0ajQI4EFhX8SamCjnyhAqJOttLCAqFa8hQf0ZgIjh//
	JrSg4NSlAYEv7/gNJuRIY84JsvrL6O3a2Yuxw+4nrIVhkGfvycTH48wlunIvzW1aGgwjt9PE1A4MF
	AkTIO5UfNaWi+Bc7+PoYJi0dkQ0d/WTtlQRLUIkkOtUbNn0Rxtb+j75FzGGEZsYoaq22kjwObeS2d
	TLaVts3xWrD+iHJ76KC7/c9Sm++aHyKJBi0CdqjCImn74UIHEDakj8EGTUzBfKlH3s/Tj5lGUD96k
	mwYuKOvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3gu-0000000CUsj-2lzR;
	Mon, 01 Sep 2025 12:31:20 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1oV-0000000BuhY-0hPS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 10:31:04 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cFlWz3Mvtz9tcx;
	Mon,  1 Sep 2025 12:30:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756722655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/PBTt0C5Gx6hiojLqBDZVPUdijjHh91VEfxrRkHdGhE=;
	b=WShtJv3jYxoIoUZHOpT3TftdlXPwi64e9k7p204qwWCaYpF7hboaRyxSstTH0Gt/N1Wpq/
	AoXnPqp1Lly292ZxMP7aGqW/zeL6imj4B7QiInDdfBoskVZSh8bpYFN0hDKN4eWhvgjcKY
	4WHXCiPUsv4OKBlTBfj1xtg6yV+pjSq4T9/qGGAugi6EPn/1FQKtZE4KqxttGo8TowB79M
	AlF4Cg22WQMF9qVUC/eUVEdmmpCpbaiZPE5xj71kZhd7u2YHYLS2a4abYhy7qj8mvDnpxH
	I2fELANa8yO7AHfvIqzEiPH/L/pCqeMDNiVOc1G17geiy79NhB9OBdXl6uABEA==
Message-ID: <51daddc4-1b86-4688-98cb-ef0f041d4126@mailbox.org>
Date: Mon, 1 Sep 2025 12:30:51 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v1] dts: arm64: freescale: move imx9*-clock.h
 imx9*-power.h into dt-bindings
To: Krzysztof Kozlowski <krzk@kernel.org>, Peng Fan <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 E Shattow <e@freeshell.de>
References: <20250831200516.522179-1-e@freeshell.de>
 <20250901032203.GA393@nxa18884-linux.ap.freescale.net>
 <3a165d77-3e36-4c0d-a193-aa9b27e0d523@mailbox.org>
 <05f7d69a-9c05-4b47-ab04-594c37e975eb@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <05f7d69a-9c05-4b47-ab04-594c37e975eb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: fd3b27795d06f701f7c
X-MBO-RS-META: 95xap3q14g4r4zuc3ine3z3bbq36zd5w
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_033103_399319_01F2386B 
X-CRM114-Status: GOOD (  12.09  )
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

On 9/1/25 5:33 AM, Krzysztof Kozlowski wrote:
> On 01/09/2025 04:22, Marek Vasut wrote:
>> On 9/1/25 5:22 AM, Peng Fan wrote:
>>> On Sun, Aug 31, 2025 at 01:04:45PM -0700, E Shattow wrote:
>>>> Move imx9*-{clock,power}.h headers into
>>>> include/dt-bindings/{clock,power}/ and fix up the DTs
>>>
>>> No. The files should be under arch/arm64/boot/dts/freescale/
>> Why ? Linux already has include/dt-bindings/clock/ and
>> include/dt-bindings/power directories for exactly those headers , why
>> did iMX9 suddenly start conflating them into arch/arm64/boot/dts/freescale ?
> 
> 
> Because maybe these are not bindings?

Please compare arch/arm64/boot/dts/freescale/imx95-clock.h and 
include/dt-bindings/clock/imx8mp-clock.h and clarify to me, why the 
imx95-clock.h is not bindings and the imx8mp-clock.h is bindings.

Both files list clock IDs for the clock nodes, one clock one is SCMI 
clock (iMX95), the other clock node is CCM clock (iMX8MP), and they are 
both (SCMI and CCM) clock nodes in DT. Both header files may have to be 
included in drivers, the iMX8MP headers already are, the iMX95 headers 
currently are included only in U-Boot drivers.

I really don't see the difference here, sorry.

> Regardless whether you agree or
> not, the commit should clearly explain the reason behind.
Which commit ?

