Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C542CC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 01:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UxflQDxp8ffTiy+4epOCXEzFRoZzgxTdEZEZTliSakg=; b=febUF/mGwrhV+1uzQEkvnvanBD
	eGPZlPp/Hkh2yJ/vYv+riCK3WxL/1hhCi2zOBUiXTy9pFv906gYs/GWjZr3Ag49lslWqFpi4YNKHS
	uZf849knTwBsCInFCGrbC32pQ/czanIv5doqtiyMGhtjik3QakvRAFclufnJCg5ugEBpr2To4WubK
	UV7q4rrp6yqPy2Hj/dDaZ8Jd+NsyxIgoDbiT1UMEVpxi+BdPrsjwRDXTkpBZTtdxNtAv6PGzABvZO
	fjDrklpME/Z6nAQ4Ib9AST1V6flXh8BSWg/V7qnAAlQIPZD9zE9NKREjp+EndOSZ4086fG4ZNrmZd
	8pQh4Gqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVK5B-0000000G7hg-265A;
	Sat, 28 Jun 2025 01:10:17 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVK1o-0000000G7X0-3XQF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 01:06:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1751072807; bh=lvtlGUKgYO9Y0TkSNn7kHB2Oi9ly8/3TM3G1bnzKTDg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gexp/rjxeePfASYz5Y/nva3HsYFzNl4QtMlUqPgeoPkp5WoD/uXFGQr84KlvGY/NS
	 X1swoWZrG9UzpBiWx6CfGfuzID1QzOLo3Bon3+oXy1awluqUUjZgtf8bB32fr473zs
	 L4YvExYQ15ifjtPFRPZq4GLBIya5BhD7PWg0ZBCfutjEw/pYWHFPcS7VKek2zCFhum
	 xdn8snRHz6dfX/AMOeedRxwbvGdj03eLcuPP4/pLXinQNrvFu+t/4AQHYyhd7cAN0n
	 YRIs9nOrmhPZRtNEaQLK03CBoh0f8ZjP2oZ0XLwiE+wFrhqGUXsTomx8s0c3HGtJzq
	 KGdyCk8BJg8Ug==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 9648B3C4FE4;
	Sat, 28 Jun 2025 01:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1751072807; bh=lvtlGUKgYO9Y0TkSNn7kHB2Oi9ly8/3TM3G1bnzKTDg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gexp/rjxeePfASYz5Y/nva3HsYFzNl4QtMlUqPgeoPkp5WoD/uXFGQr84KlvGY/NS
	 X1swoWZrG9UzpBiWx6CfGfuzID1QzOLo3Bon3+oXy1awluqUUjZgtf8bB32fr473zs
	 L4YvExYQ15ifjtPFRPZq4GLBIya5BhD7PWg0ZBCfutjEw/pYWHFPcS7VKek2zCFhum
	 xdn8snRHz6dfX/AMOeedRxwbvGdj03eLcuPP4/pLXinQNrvFu+t/4AQHYyhd7cAN0n
	 YRIs9nOrmhPZRtNEaQLK03CBoh0f8ZjP2oZ0XLwiE+wFrhqGUXsTomx8s0c3HGtJzq
	 KGdyCk8BJg8Ug==
Message-ID: <e541cbf6-7db5-4716-9658-1cac4184ee78@mleia.com>
Date: Sat, 28 Jun 2025 04:06:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] dt-bindings: pwm: convert lpc32xx-pwm.txt to yaml
 format
To: Frank Li <Frank.Li@nxp.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 "open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20250625161909.2541315-1-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250625161909.2541315-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250628_010647_632564_704ED86B 
X-CRM114-Status: UNSURE (   5.57  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_010647_632564_704ED86B 
X-CRM114-Status: UNSURE (   6.37  )
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

On 6/25/25 19:19, Frank Li wrote:
> Convert pc32xx-pwm.txt to yaml format.
> 
> Additional changes:
> - add ref to pwm.yaml
> - add clocks
> - restrict #pwm-cells to 3
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir

