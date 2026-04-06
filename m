Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC688F46C4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 15:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3eX4xTWQUNx8ehAA/zPH9KQT2kpNQ6DRRx51zlCxFtE=; b=RPlBa7vjNBvjatKHM6fgHoEQFI
	ixi0pB8OExwHHRei9+rDtxYb+WnlkX6tvp/m3BhCrj6sogHQEYoB4EXWcFBR9nu8c6DbR6g2e7MQt
	mporrjElZpx+mn4RXjKQC57FUy56zkIBfptB+UAV9s5aPLc9+8G/TbO1PK/QZOBL7Gxou3JbZx1A/
	IGM0Xl8eeTkpTLHjivCCNJVE4ErZh5ukMCOoxViovIocT5MU2E2ygJ2ol7sH/oR+TesRGsu5Ey5mL
	hEkD2JaPH/U/N6z1njIGyiIm/2w0IerHFRT2QbUYXGsEMWNa9VU/fK7UHXRleQHSHr20w2zXJocAL
	ax6r+B0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9lv8-00000005Gy5-2l05;
	Mon, 06 Apr 2026 15:31:22 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9lv6-00000005GxK-1Ho7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 15:31:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A07710E8FA;
	Mon,  6 Apr 2026 17:31:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775489474; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=3eX4xTWQUNx8ehAA/zPH9KQT2kpNQ6DRRx51zlCxFtE=;
	b=WZXoVWB7iUr5C8X2s+vyKlRW4lCaC7D4tqv8FyFgEsAvYKOxxMVqr11u5H6ML7paZ96/DR
	iUh4pOoZDL6d/3WL011/NtftDvUWIp4VrC8DP101V6lSGyl5jw1uxMoyO3pLjMYTX/UV7k
	bLBZaYxq69ZZuVpmTTrF5I5Ck6Qq0JCqobkDZIgXxs+4gRfadKCOLQin7lv1t9WUCjE/OP
	sbNHCUY+9lUJuPiA+U8pbx2hk8LIIDMoV7I2Gy9o5IkKN31mM/WKQ2nDS8EcFZHf9H/yxq
	pGHcxsWq3zlDOAnClr38iqPw1Ssb2B8ACs4k/FHYCLD7dvbwQqAd55f07DK8uw==
Message-ID: <4c915d11-930d-4a97-a5ee-46d72f4e8ce7@nabladev.com>
Date: Mon, 6 Apr 2026 16:49:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: imx8mn-vhip4-evalboard-v1: Correct
 interrupt flags
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Fedor Ross <fedor.ross@ifm.com>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Viorel Suman <viorel.suman@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260406063810.25531-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260406063810.25531-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_083120_555986_5A8403AD 
X-CRM114-Status: UNSURE (   8.27  )
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

On 4/6/26 8:38 AM, Krzysztof Kozlowski wrote:
> GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
> These are simple defines so they could be used in DTS but they will not
> have the same meaning:
> 1. GPIO_ACTIVE_HIGH = 0 => IRQ_TYPE_NONE
> 2. GPIO_ACTIVE_LOW  = 1 => IRQ_TYPE_EDGE_RISING
> 
> Correct the interrupt flags, assuming the author of the code wanted the
> same logical behavior behind the name "ACTIVE_xxx", this is:
> ACTIVE_LOW  => IRQ_TYPE_LEVEL_LOW
> 
> Fixes: 5eb7405db99b ("arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1 and v2")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Marek Vasut <marex@nabladev.com>

