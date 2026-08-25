Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40EBC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 05:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftjlZDo0T0Z4fcmLNLTufmVcV/26FzcK6vmTiuMBmsM=; b=mG/10gme/6tln8W0755sk3MJ5o
	bXmBx8l88Ao/JYigYfE+UuxQ2kTXykFpu6luP9j955IrEwjog45DLf420UoxIo8MXKQYx/unHW2Rj
	Xo3sso9moTwHCIKPwW7H4XDsp/Dk1plJk8yD3JRDt29iVWVp4SgD/YWX1T7ONoKOhJaHRjvlZvjVA
	TJ0TCtvwkyGHSx1skdRwvk3N87gyqVLJwwo2uxM9XgVGm4x9dDUHuLfPhKRqwUgd0W5hzXiD1atTe
	SvB2lGqY7boj93tPu6+xy8LXJPGDLxNYOmT33sMPAYtj4s4Lf7+tchjhdMZXC6YVCYy849YZULZAH
	KHbDHuIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz6Aa-00000001vie-1wDp;
	Wed, 26 Aug 2026 05:27:28 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz6AY-00000001vi1-0z2M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 05:27:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C4DA11CDA2;
	Wed, 26 Aug 2026 07:27:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787722040;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ftjlZDo0T0Z4fcmLNLTufmVcV/26FzcK6vmTiuMBmsM=;
	b=efMitylbiltwT0Qkba2AmQMx5xcY5osyQYUlv6tiJvyDt8wV3CjzMd3etIYIEguXnMvjVE
	nbVJH1Z63lIavQFYsQl/Lf8rnkVpAwA4MZoo4VqxjAOaK+Am2uLQltpS5Oz4WRAV4NCs5V
	IU7/g7W/fTsKlcxyvebq/zHj1ETUoo3oq8rbVBQ+6rVFTUHWY2Sm4gOdXzV16yGFAfzyq+
	96GzjICceKhJcCgHTj0P/7JVWVCPiXRPDSTA+GldnlojZ8UcMenGwaxVmVa/l+zakVFewe
	UW2vYBFKfS55BU1kwdeSjCPFDY6ShFHwrvDGLvSza/CWNgoZkhm5pQhZcnNPfQ==
Message-ID: <d20ef29a-c27b-484f-98ba-77c85ec2b587@nabladev.com>
Date: Tue, 25 Aug 2026 19:56:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] arm64: dts: st: Add support for DH electronics
 STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC
To: linux-arm-kernel@lists.infradead.org,
 Alexandre TORGUE <alexandre.torgue@st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260711210131.236025-1-marex@nabladev.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260711210131.236025-1-marex@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_222726_655542_AAC89C7D 
X-CRM114-Status: UNSURE (   6.94  )
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

Hello Alexandre,

On 7/11/26 10:59 PM, Marek Vasut wrote:
> This stm32mp25xx-dhcos-bb board is a stack of DHCOS SoM based on
> STM32MP25xx SoC (1200MHz / crypto capabilities) populated on SoM
> Breakout Board, the stm32mp255c-dhcos-dhsbc is the SoM populated
> on DHSBC carrier board. The stm32mp23xx-dhcos-bb is a stack with
> STM32MP23xx SoC.
> 
> The SoM contains the following peripherals:
> - STPMIC (power delivery)
> - 4GiB LPDDR4 memory
> - eMMC and SDIO WiFi module
Have you had a chance to look at this series ?

