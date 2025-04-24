Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BAAC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 14:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8XYpVhm52DVam+YizY27gQ41KkS4MOi3Qkd0CbVTMIU=; b=J/iYTV6ccl7443YCRf9yN7X9kx
	g+JyIo+08sJVBiSTafXZWydYXMzxBW5JqaDZTqQZ3S+b0WA6kq7dboacDQleRqWMpOqWMKVOLo8gh
	KBmoAWWWmy8ZqLLI2AWfoEw9tQUzb501MmZoNfaeo3nCVH7wh433jBt9V4337Nx+hBcHKK7l1FNuL
	BcQQyWowNkAwo1YoWKVQCpgNO5wgd9HczuRhSg3VtScSxD16PyXLSO3eOD0xnyH8jZgsgQpFbTN2j
	JWERXF3YK4y5ZEtm6ik9rVIwPzQLYgrDsOuP+qc5+Mm9p56HY75aYiNIcUHfhNUli+JyXycd3c1CV
	PWijwRvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xYA-0000000ENSI-3Uip;
	Thu, 24 Apr 2025 14:27:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wUv-0000000EAWQ-1DIc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 13:20:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DC8F1063;
	Thu, 24 Apr 2025 06:20:07 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A2CC3F66E;
	Thu, 24 Apr 2025 06:20:09 -0700 (PDT)
Date: Thu, 24 Apr 2025 14:20:06 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E
 board
Message-ID: <20250424142006.021d6ab4@donnerap.manchester.arm.com>
In-Reply-To: <6e9c003e-2a38-43a7-8474-286bdb6306a0@lunn.ch>
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
	<20250423-01-sun55i-emac0-v1-4-46ee4c855e0a@gentoo.org>
	<aa38baed-f528-4650-9e06-e7a76c25ec89@lunn.ch>
	<20250424014120.0d66bd85@minigeek.lan>
	<20250424100514-GYA48784@gentoo>
	<6e9c003e-2a38-43a7-8474-286bdb6306a0@lunn.ch>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_062013_376575_B95668D6 
X-CRM114-Status: GOOD (  16.75  )
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

On Thu, 24 Apr 2025 14:19:59 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

Hi Andrew,

> > I'd not bother to try other combinations, and just stick to vendor's
> > settings  
> 
> Vendors get stuff wrong all the time. Just because it works does not
> mean it is correct. And RGMII delays are very frequently wrong because
> there are multiple ways to get a link which works, but don't follow
> the DT binding.

Speaking of which: do you know of a good method to verify the delay
timing? Is there *something* which is sensitive to those timings and which
can be easily checked and qualified?
I just tried iperf3 yesterday, but didn't spot any real change in the
numbers when toying with those delay values.
As mentioned in the other email, we can easily hack the values at runtime,
so if there is a way to get some "quality" value, this could even be
automated.

Thanks,
Andre

