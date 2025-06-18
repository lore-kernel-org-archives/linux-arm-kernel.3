Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4191C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 16:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjarBw8YUxmhrSGbVYOGUDgfaWcKywGCpsph81RhDYw=; b=lU8w+rWNarZKbRG8Zlicv6jCTG
	BM7dba2hMAN8rRg+UOfizM2vPi1F8q9lgVtiICL9sHqMa15R7dkB8NLGLebjwdq2dqmY5Y5calbej
	lAYItmKQjszY0AZJBYTPw8Zb/hnwn5CWAMud6yepqQjMioCkp26ZAPz7MCn1j9aGErYYrRKvzx11M
	EmYvpyoVs7GMN+aoVRlbtrsQQ0xt0oHwiCPW8pPjIm/ngyMmnydHkszlOSTG88rr+zkqVuvPJzw5T
	ImU7dyHIzkeRS460m59Gq+wL0ykWY2QtcZPMiUMMnxvDDfO795U02JodeYv7PIbaJsj9ObXUz4iUX
	myciqg4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvjZ-0000000Ajon-2ObF;
	Wed, 18 Jun 2025 16:33:57 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtwe-0000000ATCL-2RL7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 14:39:21 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4B145204A8;
	Wed, 18 Jun 2025 16:39:19 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UtMEojEv1TMF; Wed, 18 Jun 2025 16:39:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750257558; bh=8oYMcM5NtNjasov9o5oVzWKXy6yG0PqRwFxgVhFio3c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=V0+cTyMsI0vM0XXOuWLswDaMtDr7XnYIkeYAxZTMtQEsIn0dxQ5xSV1Clfoeq+acj
	 5zQaf2V0DhFVmljetSNPkh5R4xu0XWIUtHusq7b/PbPwgxr9zTGFh8pYjS5XjDna7d
	 2CQQZBWvq0+aMJ1/xJUOtQxuG2IeCIHuW4RG8ndeqrEDqHRUI/sk38ASGPFoAGLxCr
	 RvACOeXHperP7Un5uGExsAbmd9EVxMFk0YghLlBJtiSbRPniXhHnub9m4vQpQfjVRU
	 hfr2YtVwa0G3YlwhpUMNs+HDj9O/wBCzsogs7cBkxc0H6SybiI5COQwYm6wub4OsFb
	 WRkW2+9pMkIug==
MIME-Version: 1.0
Date: Wed, 18 Jun 2025 14:39:18 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arch: arm64: dts: exynos7870-on7xelte: enable display
 panel support
In-Reply-To: <99e31fd7-e0b6-406f-bf4c-ceee8a0db93b@kernel.org>
References: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
 <20250612-exynos7870-drm-dts-v1-3-88c0779af6cb@disroot.org>
 <99e31fd7-e0b6-406f-bf4c-ceee8a0db93b@kernel.org>
Message-ID: <03152ec8103544ad4155dfa5c3ba9a42@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_073920_758977_54CA7B81 
X-CRM114-Status: GOOD (  11.75  )
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

On 2025-06-18 09:57, Krzysztof Kozlowski wrote:
> On 12/06/2025 17:23, Kaustabh Chakraborty wrote:
>> Enable DECON and DSI nodes, and add the compatible display panel and
>> appropriate panel timings for this device. Also, disable the
>> simple-framebuffer node in favor of the panel.
>> 
>> This device has a 1080x1920 Synaptics TD4300 display panel.
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 40 
>> ++++++++++++++++++++++
>>  1 file changed, 40 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts 
>> b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
>> index 
>> eb97dcc415423f405d7df9b9869b2db3432fb483..86a7fc2554a137752862c37d27cf9813b3ac5514 
>> 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
>> +++ b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
>> @@ -40,6 +40,8 @@ framebuffer@67000000 {
>>  			height = <1920>;
>>  			stride = <(1080 * 4)>;
>>  			format = "a8r8g8b8";
>> +
>> +			status = "disabled";
> 
> This should be rather removed. What is the idea behind keeping disabled
> node?

Ideally should be removed, yes. A disabled property was added so that if
required, it can be enabled downstream simply by a patch which removes 
it.

And I also understand that upstream doesn't care what's happening 
downstream.
To upstream, it is effectively a dead node. So I'll remove it.

> 
> 
> Best regards,
> Krzysztof

