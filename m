Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8873BCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6loKHnERR6UQJlGUtEQ3+3fogYBwTr8txF5Ji+qXuY=; b=E9GMCEkTccITNojBgOEQ9BtT2S
	I7vrlgTqWFkbPjefCwH+9Blk77OQNtpnT4r9bSzzbjQ7IAbU6ePJpwTRIBCq+f7LyiLNP+NuRgHIi
	m3ymUZrWzfU97AfpVdw882PH2AjbZweN3ryXoSmQVqMBdYs5fbs5p+XqGnuRpe8idQUfSE5NIexwh
	FQxXjjFJ9Rvj+GH86gOL9tx263G20uPeLFGDGDBPlfDNMpg1n1veR++m0UEIyvsCp0sx7WNrcAieL
	LpYFlMjcO5gS7D+qF+xVcOkHjYvBBbBYF1iECKn7yr1jmSj4MeAadFO+TNaT9DSdUPzyBsMZKrO1Q
	AmYU3S7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsER-00000004sh3-3eNv;
	Tue, 09 Sep 2025 06:53:35 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvlSH-0000000308I-23v0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 23:39:26 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cLNhP5g1xz9stK;
	Tue,  9 Sep 2025 01:39:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757374757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S6loKHnERR6UQJlGUtEQ3+3fogYBwTr8txF5Ji+qXuY=;
	b=VXVBtK6mXUfaVqVUbAwXZk4vf3gBlosdFyQkADIFM7YPJD0BuXmyZtLP/gWnX49fLxLWmS
	TvYWCqgevy3ANpxrGU1FuxPOfB02fv2PcckuuSfUtHsLqy9xmmdMFbY2v1e2Y98GOYUcGk
	FbBB/kiOVrj+Jre+jYhGFch8aPLgcRrNCtjGRIsS8zWOzLYfw+RXT/fR+Z2rPBB3LZgcCC
	S5QjAAzduh1mysaLLq6zphP+oa8kVMEVSASePJ+YwGA6tHUG2Qso8V+KUEMHf4/fQ1VLE1
	N6sG0fUjP+5898B4FVmylOx1Jm6DnKBsCiFnCRkwZyEz8ZUrVap7cZC/z8lbOA==
Message-ID: <afe58aa6-0c3e-4508-8133-8e7621a0484a@mailbox.org>
Date: Tue, 9 Sep 2025 01:39:13 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v1] dts: arm64: freescale: move imx9*-clock.h
 imx9*-power.h into dt-bindings
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
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
 <51daddc4-1b86-4688-98cb-ef0f041d4126@mailbox.org>
 <8920d24b-e796-4b02-b43b-8a5deed3e8fb@kernel.org>
 <be2fc937-b7a6-49a7-b57d-6e3f16f4ccc3@mailbox.org>
 <20250904093442.GA13411@nxa18884-linux.ap.freescale.net>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250904093442.GA13411@nxa18884-linux.ap.freescale.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 6pky7gdj4zuqu4e5ou56mtyfkp7ssjjh
X-MBO-RS-ID: fbc66ab64366b5ef5dd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_163925_676631_337987B4 
X-CRM114-Status: GOOD (  13.74  )
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

On 9/4/25 11:34 AM, Peng Fan wrote:

Hi,

sorry for my late reply.

>> Instead of playing this "I found this code somewhere, so I can do
>>> whatever the same" answer the first implied question - why these are
>>> bindings? Provide arguments what do they bind.
>>
>> I am not sure how to answer this, but what I can write is, that if I scramble
>> these IDs in either the DT or the firmware (which provides the SCMI clock
>> service), then the system cannot work. I am not sure if this is the answer
>> you are looking for.
> 
> Marek,
>    Some U-Boot code indeed directly use the IDs to configure the clock without
>    relying on any drivers. Since the SCMI IDs could not be moved to dt-bindings,

Why can they not be moved to DT bindings ?

They are part of the ABI.

This is the part I do not understand, the SCMI IDs are no different than 
any other clock IDs used in DT, is that not so ?

>    the possible method to do in U-Boot is to duplicate a copy of the file,

No.

