Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1E0EC01B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 10:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCbZ2f0Kcl+hC4CPhtXEDMfwP+rqGeU660PawdGL7lw=; b=dOrpAJ8yFKyINvK4qw8wgwk3i+
	hdEQ8ylaUiukozlCmcnjpP+vQRnNlciQd1vhRwP/5Mml4iTGL/kLlZ05D7lUbcAo31Y0UaK8JU/nG
	mvMFYNYM7tRL6XfFlkIoP5OFj2uhx8as9t58YNQYms32ousxSty9OkRjgNR8mm+QMCvw2RJMsKlBN
	RL81ACFUPJ1BBFkpD8ns0jr3w0BhOioeTAA/bcWRUjFU5Gh/z+sZaeVjCbICCeaccHKuTilEukKv+
	yMbpAYCFur6Ci0rln/1NHyekShsjMWEn/oETtDSNz55Xq6lbJ4guODqysHuHB6x1ykRBp65jdS53i
	57F5b7lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cAc-0000000GSXg-3eE0;
	Mon, 23 Mar 2026 10:06:02 +0000
Received: from mail-m15595.qiye.163.com ([101.71.155.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cAZ-0000000GSVX-1UuU;
	Mon, 23 Mar 2026 10:06:00 +0000
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 37f14d637;
	Mon, 23 Mar 2026 18:05:53 +0800 (GMT+08:00)
Message-ID: <170a22d3-f1d6-4f71-97ca-db3edf689d93@rock-chips.com>
Date: Mon, 23 Mar 2026 18:05:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] dt-bindings: display: rockchip: analogix-dp:
 Expand clock-names "hclk" for the third clock
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, nicolas.frattaroli@collabora.com,
 alchark@gmail.com, cristian.ciocaltea@collabora.com,
 sebastian.reichel@collabora.com, kever.yang@rock-chips.com,
 heiko.stuebner@cherry.de, tomeu@tomeuvizoso.net, amadeus@jmu.edu.cn,
 michael.riesch@collabora.com, didi.debian@cknow.org,
 dmitry.baryshkov@oss.qualcomm.com, luca.ceresoli@bootlin.com,
 dianders@chromium.org, m.szyprowski@samsung.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260319104031.1986946-1-damon.ding@rock-chips.com>
 <20260319104031.1986946-2-damon.ding@rock-chips.com>
 <20260320-amusing-magnetic-harrier-20cc40@quoll>
 <311d143b-cc78-465e-9be2-0a9a0a33ea0b@kernel.org>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <311d143b-cc78-465e-9be2-0a9a0a33ea0b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d1a28788303a3kunmafb06323593c9f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh5CSVZIHU0ZQxpKH0wdSkhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Fko7vEm8qr/yM2Scx5aIktLIO/rsbKX9HQLG3hxzupnw8xra/FYMjlKPI2owJHEspyFJD+ms/U9DaO5WfmxhCm2w1GQVeKDGIM+SQNwMZMvzBNT1QbEO9S3xjsmMIMpH/LWoSgi9tGb7pVcciBKkTO5ljMPe4juXCYwDkDNEcL8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=qCbZ2f0Kcl+hC4CPhtXEDMfwP+rqGeU660PawdGL7lw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_030559_572567_3B88698B 
X-CRM114-Status: GOOD (  14.00  )
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

Hi Krzysztof,

On 3/20/2026 5:41 PM, Krzysztof Kozlowski wrote:
> On 20/03/2026 10:19, Krzysztof Kozlowski wrote:
>> On Thu, Mar 19, 2026 at 06:40:23PM +0800, Damon Ding wrote:
>>> The RK3588 eDP controller needs the video datapath clock "hclk" to work
>>> well. Previously, it works without explicitly adding this clock because
>>> the 'rockchip,vo-grf = <&vo1_grf>' property implicitly enables HCLK_VO1.
>>>
>>> Fixes: f855146263b1 ("dt-bindings: display: rockchip: analogix-dp: Add support for RK3588")
>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>> ---
> 
> BTW, all your patches (this and previous set... actually, everything you
> ever sent IIRC) end up marked as spam. I don't see anything in the
> headers pointing to the issue. There is no score assigned and
> DMARC+SPF+DKIM pass.
> 
> However it seems you are using @rock-chips.com and SMTP server 163.com,
> so maybe that difference. Or maybe it is rock-chips lack of DMARC policy
> (p=none dis=none)?
> 
> Regardless of the reason, if you do not ever receive answers from
> people, it is likely that is the reason.
> 
> 

Thank you for the kind heads-up! And I’m sorry for the extra work you 
have to go through checking the spam folder.

It looks like I really need to have a good talk with our IT team about this.

Thanks again for letting me know — much appreciated!

Best regards,
Damon


