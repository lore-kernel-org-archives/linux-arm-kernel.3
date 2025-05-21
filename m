Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCBAC54756
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 01:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPcPrXu1kEXwxro07GGPXwoSMTAeYjAQO2QFJZ7Oja4=; b=hOGsS4OQFEz+jVBSyO87k7jpSj
	HNJ7W19xKhYpuH1pUomgsGlP97dKIWrn4vJj5SIV+be1vAleUoHG7zUPYfO68/496X77+Q6cJiRx6
	ep+2jI44XR/qfh9LIVCj24lWPkfx+GJNgb0Y2fXPbxCw67Pr53IoTtkz0j3LRf5gU5Icbr+PlKg64
	uQtTsFkePb91YGwUBVo3Su9yleXB2x4Q6vpDE5f58L0QuQPHsNCwShWrQGk20+UEvDPZh3EBx856F
	0epVVSq1gxxutM1CgxOiATQiX4o+oUHm992mB1ZiQTigdfaaXWKMsD+SOkVs6fWgB+rZstV/qr4+7
	Zy3NxQcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHY0m-0000000ETcd-1w6T;
	Wed, 21 May 2025 01:12:48 +0000
Received: from mail-m155116.qiye.163.com ([101.71.155.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHXyb-0000000ETUk-2mYV;
	Wed, 21 May 2025 01:10:35 +0000
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 15cf8fc2d;
	Wed, 21 May 2025 09:10:14 +0800 (GMT+08:00)
Message-ID: <3d163ae4-227f-4df0-ac1f-35fbe9e463fb@rock-chips.com>
Date: Wed, 21 May 2025 09:09:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: phy: Convert phy-rockchip-typec.txt to
 yaml
To: Rob Herring <robh@kernel.org>, Chaoyi Chen <kernel@airkyi.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Frank Wang <frank.wang@rock-chips.com>,
 Zhang Yubing <yubing.zhang@rock-chips.com>, Dragan Simic
 <dsimic@manjaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Diederik de Haas <didi.debian@cknow.org>, Johan Jonker <jbx6244@gmail.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250519024820.194-1-kernel@airkyi.com>
 <20250519024820.194-3-kernel@airkyi.com>
 <20250520193257.GA1221161-robh@kernel.org>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20250520193257.GA1221161-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0xPQlZIQ04ZGEgYQkoeSx5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a96f0641bb303abkunm8da83e95a0a8a4
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mhw6HAw*QjE1FBkcNUshIgop
	C1FPCwJVSlVKTE9MTENCQ0lKT0pCVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
	WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBSkJJTjcG
DKIM-Signature: a=rsa-sha256;
	b=Ic2JDMgdqJ0cwLmw9YwQwzBgO6UA6P4emxlyEVfa7Gescg4Yn8Od6zYM7hyTFZfTrQzxXbv9GFf4kXxxPgC8dh8cQR6aZa3YQEJnNPZ56o/hubCEdLRdSaiU12vsBiXS8nHAWmfoy2zqF5p5YnkprSRovspHUzFgrCxE0MIITpI=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=tPcPrXu1kEXwxro07GGPXwoSMTAeYjAQO2QFJZ7Oja4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_181034_176075_A267E3D4 
X-CRM114-Status: UNSURE (   8.68  )
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

On 2025/5/21 3:32, Rob Herring wrote:

> On Mon, May 19, 2025 at 10:48:20AM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> Convert phy-rockchip-typec.txt to yaml.
> Thanks, but I already converted this one and it is queued up in
> linux-next. There's still a few more rockchip ones to do:

Oh, I missed it. Thank you!


>
> ['mps,mp8859']
> ['realtek,rt5651']
> ['rockchip,rk3368-mailbox']
> ['rockchip,rk3399-cdn-dp']
> ['rockchip,rk3399-gru-sound']
> ['sitronix,st1624', 'sitronix,st1633']
> ['ti,tsc2007']
>
> I see you already posted cdn-dp. Thanks!
>
> Rob
>
>

