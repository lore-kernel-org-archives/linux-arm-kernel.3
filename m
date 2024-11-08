Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A57FD5C0C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 13:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hfB8WFd2Iow1q2LgVouBngaxpvbj40sebSg23+Nb+Bo=; b=q1eg8NnEfyw5yO6f7lkgPL9sYA
	F0tiD0mEQoMr08CFvJiYo+xVOrFTR3R/6IyomO7Or16FxGHwXtAoNRs/nCXKLDPjIuMAjZw7MDlBD
	g+UXl21eJcjlfZHfoX1JO7fXswY9knlKFrsuL2cARF15+Cw4jjIX59mwtwg2F0rCS7yuRu4QGHkye
	2bLzHe9g5jsi7W55LegoDwaGAvL4YgpaSe/9MAYtqCpeQU8Zv3nUMCg/S4mJrA+CaYD1UItI7K5JS
	OP1WXE25ndWo2BlfFBnexAfc2wIJ45672ARLDAlh9mGxmlF3EuvBSaSfUJ7HXwAisg+kD32vOq/Km
	3nOpdUMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9OlK-0000000Ad3T-4769;
	Fri, 08 Nov 2024 13:10:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9OjW-0000000AckQ-2fzH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:09:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C0709A42C0A;
	Fri,  8 Nov 2024 13:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0AF9C4CECE;
	Fri,  8 Nov 2024 13:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731071341;
	bh=vUnELNNzsGxypEBdWVHCWXekegm+rXydSjilfXwdDac=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oyZLTfKoexq9S7+XtvvWJh7a2fnBRXOtUk3lzIYjem6flORB7hPJ3o133H1it4Y1q
	 FCS/aXMiFZEVrhmXeSa7w+D6E2JcEXis/MdXk0VltrIDEbKwsH6QlnDddfQ0wsgrGL
	 MX/OtIzeUkx3X3Tf6XcnCPLvWdlUIapTaPJuZ/INm8gVJTnYb8RRSo35hmdQ8AY/Iv
	 whMurYsEOE7WkLcI3xPtW0AxCDK11B9Yb5LtxK3/AuBG2MTAKmm0dxgAgMK3XJJ117
	 1HAVs43WNyvhL4ctU+uKe4yoO22IJm03pKtdhmAFxuP3D+8t+Xny+2YCKktFPbuTou
	 LdOP+/12VnnrA==
Message-ID: <00f239ba-6cb3-4861-8352-7cffdded4050@kernel.org>
Date: Fri, 8 Nov 2024 07:08:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: socfpga_cyclone5_mcvevk: Drop unused
 #address-cells/#size-cells
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241107095952.73926-2-u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20241107095952.73926-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_050902_760452_7E525620 
X-CRM114-Status: UNSURE (   9.45  )
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



On 11/7/24 03:59, Uwe Kleine-König wrote:
> The properties #address-cells and #size-cells are only useful if there
> is a ranges property or child nodes with "reg" properties.
> 
> This fixes a W=1 warning:
> 
> 	arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dts:51.22-72.4: Warning (avoid_unnecessary_addr_size): /soc/i2c@ffc04000/stmpe811@41: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
>   arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mcvevk.dts | 2 --
>   1 file changed, 2 deletions(-)
> 

Applied, thanks!

Dinh

