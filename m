Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7F2C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 01:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wx/0Lwqhs5PptWHeBLje0477BulQ30lJtsRbdVOo5J0=; b=LvU3rD9lbasIMh8XsjDex80gMZ
	wxngCxDA97B5p4xG39xcXXtWXjYCiEDayixisq4NzIZawItdPONCHvyjZy9YFTSElUCaO06y2tlB5
	PoBDJb/SVIF5wiceOHlbrGyVkBJg3kYFqRSBcaHXBgHfnMoQhcISEuOGklWrHR6A/VPhfgMbA0aXD
	CL3BFDEdyDdh5w34couENgAn4UWx3z9HuaNdHbgiQyCx/h4sls82IGoEZP8b7K38M1CVEp3DwhJ3e
	GMLbKsHcHHy2BjUdmh7ixdSjYeubEz3xtvaMisBjB9TSqypLaxiPEL326EgwOgaeK3wt9GnIbKZjp
	kX6LLGhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDZEW-00000005H0p-1wSe;
	Sat, 10 May 2025 01:42:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDZCW-00000005Gu2-07D7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 01:40:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D845640BD2;
	Sat, 10 May 2025 01:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98FACC4CEE4;
	Sat, 10 May 2025 01:40:26 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 3E2FD5FBBD;
	Sat, 10 May 2025 09:40:24 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: Cody Eksal <masterr3c0rd@epochal.quest>, 
 Philippe Simons <simons.philippe@gmail.com>, devicetree@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250505202416.23753-1-andre.przywara@arm.com>
References: <20250505202416.23753-1-andre.przywara@arm.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: set maximum MMC frequency
Message-Id: <174684122423.2444084.8734875070442213156.b4-ty@csie.org>
Date: Sat, 10 May 2025 09:40:24 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_184028_092857_BFC7A52C 
X-CRM114-Status: UNSURE (   7.49  )
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

On Mon, 05 May 2025 21:24:16 +0100, Andre Przywara wrote:
> The manual for the Allwinner A133 SoC mentions that the maximum
> supported MMC frequency is 150 MHz, for all of the MMC devices.
> 
> Describe that in the DT entry, to help drivers setting the right
> interface frequency.
> 
> 
> [...]

Applied to sunxi/dt-for-6.16 in sunxi/linux.git, thanks!

[1/1] arm64: dts: allwinner: a100: set maximum MMC frequency
      https://git.kernel.org/sunxi/linux/c/d8f10550448b

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


