Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD92DC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 21:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXTMnzfh1Sz3hhx367KsT4GDmPMjmsVtNc/eIed16Iw=; b=eAr2LE1SQVaBzZPsR1EQvqpvD7
	13PF+AIg8APiBpNJNoV32vvHPpqEng9kyOjUSJjp6VjGqPgCwbzpIiJcMzVz0XeHp78n5mkm/NiV+
	d/NakHPT02WG6y7mXKS/46x/N1E+nl4qIdTVc/0PuFXZJNxhG1WRjDg8Op99a5Ly5TxXgjopj8PZN
	+6iw040iYrQTYhv74IOS5K626V66l6QrJSkH4ExipAfvXc5UEYz7cch1pgSP6qMcjK/1WSG+qCfMA
	5oPMkgMLNyI4ipZozGJXzLL8/cBXOFv2k6CpLzjes6K1M0+5P8eRss8MDNTFuYYlL9yPRsaftJmp6
	I3m7SLsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2a4-00000001ZiW-2r1g;
	Tue, 25 Feb 2025 21:35:08 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn22H-00000001SP9-1mMc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 21:00:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CD745611F9;
	Tue, 25 Feb 2025 21:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D16C4CEE7;
	Tue, 25 Feb 2025 21:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740517211;
	bh=xcMZiURjHPd6etPkRW7uGuDOzfEqUxABtdIaFktNg8w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QCubtC0+a8eKWjoVlcQepvZs+LOemMR94Q6HBUEpGbQbr5Tnbp81mZpI7yTCOzBQQ
	 zloysKPoixgyOMjt7i0PGhedFAIjsghJMjyKx/kDewsmeN7v+34kpTKMXCL0uTIXkp
	 Y99Oxb8X1xhx60eZ4QGHm7QW1X4TZJkzoNaESDJgkiIbbTbEfi0ohObxcMWnloWw0A
	 ohhNohwtLI1uIHAznRARbwQMMNKNlWMXAxWDWgbM4ReUb9TSu8FZ7PxUBKJ7C1juM4
	 eWrS6sj0u7l964xHjiU8oWDuCwskSesdCCGSpEYlieD3cWWa/ZiIWJkyMtnf44jHKG
	 PWOiXW5tr6mJg==
Message-ID: <6fe399c7-9c88-4e5a-b1a6-1bc62482655d@kernel.org>
Date: Tue, 25 Feb 2025 22:00:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/6] Add spi-hid, transport for HID over SPI bus
To: Jarrett Schultz <jaschultzms@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Shawn Guo
 <shawnguo@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: Dmitry Antipov <dmanti@microsoft.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jarrett Schultz <jaschultz@microsoft.com>
References: <20220707165902.3184-1-jaschultzMS@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20220707165902.3184-1-jaschultzMS@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 7.07.2022 6:58 PM, Jarrett Schultz wrote:
> From: Jarrett Schultz <jaschultz@microsoft.com>
> 
> Surface Duo devices use a touch digitizer that communicates to the main
> SoC via SPI and presents itself as a HID device. This patch's goal is to
> add the spi-hid transport driver to drivers/hid. The driver follows the
> publically available HID Over SPI Protocol Specification version 1.0.
> 
> The specification is available at
> https://www.microsoft.com/en-us/download/details.aspx?id=103325.

Hi, I know this is a bit of an old thread..

The spec mentions some oddities around dual or quad SPI - do you
perhaps have some version of this patchset that implements those?

Konrad

