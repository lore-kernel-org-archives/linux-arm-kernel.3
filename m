Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B6ECCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 16:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtIof8SCWCroGVoENxQQQlqWlkaVwCCOeq74Vwc6uSE=; b=wHymh84NdeAr9OkwO5EnCBPvvy
	hvQhVNOIgmeqIBDF6qv75fzFDU+KoYKYizKSqmU0EvXT9aCz1oftN/Sx+FdKo3Im/OCPcWElbfuJv
	YQFjMQza6tqHpKYj/mAevsIJJy+v3UH8l6mGoLcC0eXuCcYpuPGk6LJcwjfrcBB984xPQcnJqQ/kO
	IANkqRAvp6R2nqFVHR3HloXMYox0LJREs/leO72Ugj395kCbltBSZYN1TPISJBwK8P4Ijd/3KkTRZ
	L6IKmryq04tzIJHsXf8E0rQ+pbuZk9Yvs0DI8A2tioE7ztNPASXtU14kNuXUSPJQpQ6AHAbU1sF/R
	INFeHUmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ACd-00000002M0j-1ai3;
	Tue, 07 Oct 2025 16:06:15 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ACb-00000002M0C-07K1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 16:06:14 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1v6ACJ-00072o-Qx; Tue, 07 Oct 2025 18:05:55 +0200
Message-ID: <947409d8-9a92-46f2-a6e7-49f3aa44d74f@pengutronix.de>
Date: Tue, 7 Oct 2025 18:05:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/16] media: rockchip: rga: add rga3 support
To: Krzysztof Kozlowski <krzk@kernel.org>, Jacob Chen
 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
 <20251007-spu-rga3-v1-16-36ad85570402@pengutronix.de>
 <bf989d9f-9e8e-4acc-b502-1674ce215318@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <bf989d9f-9e8e-4acc-b502-1674ce215318@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_090613_060526_7687A620 
X-CRM114-Status: GOOD (  23.23  )
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

Hi Krzysztof,

On 10/7/25 10:39 AM, Krzysztof Kozlowski wrote:
> On 07/10/2025 17:32, Sven Püschel wrote:
>> Add support for the RGA3 unit contained in the RK3588.
>>
>> Only a basic feature set consisting of scaling and color conversion is
>> implemented. Advanced features like rotation and cropping will just be
>> ignored. Also the BT601F color space conversion is currently hard coded.
>>
>> The register address defines were copied from the
>> vendor Rockchip kernel sources and slightly adjusted to not start at 0
>> again for the cmd registers.
>>
>> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
>> ---
>>   drivers/media/platform/rockchip/rga/Makefile  |   2 +-
>>   drivers/media/platform/rockchip/rga/rga.c     |   4 +
>>   drivers/media/platform/rockchip/rga/rga.h     |   2 +-
>>   drivers/media/platform/rockchip/rga/rga3-hw.c | 490 ++++++++++++++++++++++++++
>>   drivers/media/platform/rockchip/rga/rga3-hw.h | 186 ++++++++++
>>   5 files changed, 682 insertions(+), 2 deletions(-)
> Your order of patches is a mess. DTS cannot be in the middle. In fact,
> DTS should not be even in this patchset, because you are targeting media.

sorry to bother you, but could you go into a bit more detail on how it 
should be done correctly?

I guess that your message refers to "7. [...] If a driver subsystem 
maintainer prefers to apply entire set, instead of their relevant 
portion of patchset, please split the DTS patches into separate patchset 
with a reference in changelog or cover letter to the bindings submission 
on the mailing list." [1]. If this is the case, is there a general rule 
to determine if a separate patchset is necessary? (I've also noticed, 
that I've wrongly assumed to keep the Documentation and dtsi commit 
together and should've moved the dtsi commit to the end of the patchset)

And do I understand it correctly, that the Documentation/ change is at 
the correct position (only the dtsi commits being problematic)? Based on 
my understanding of "5. The Documentation/ portion of the patch should 
come in the series before the code implementing the binding" [1] this 
should be right before the actual implementation (after all cleanup and 
preparation commits).


Sincerely
     Sven


[1] 
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html

>
> Best regards,
> Krzysztof
>

