Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1AEE9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 20:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HiSDR9iYz4Eudl/oY2B3ZdX2CjZAkxzZ8RDrJcdCjhI=; b=w1KgKP5FZi/D+AkrRYxhwwcXWQ
	IJXgFXzJ9yZjP5qEbFXtjASdoPl99rOvgYV4ZsX3NzKvhXh3KdkRqdI3TVJUikbb1Kq7uDrJOK3ui
	4kybTarH9WfZTeT3Xww9GSqDB6aFHXdbl9NubSdzdbrQVqQ10vyQELoCEEbxesZoCactgbON+tJiu
	PpyImqEym6TayBEBm4Np9u+yw92m57hBmN0kF+EDsjfrxuwh6cMqSO0wjthGs9zksv/fA/QqJo2wc
	Fr73lzpesd0CRftnXvi951NijeQ+5xXtq+jTnzBjvTWe6F92Ic5KzXPlRyVMoStHpndew44JmH1Yi
	L48HgzqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsobU-0000000APjB-0xZg;
	Wed, 18 Feb 2026 20:57:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsobR-0000000APia-2sqQ;
	Wed, 18 Feb 2026 20:56:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771448212;
	bh=OwmdDIcpJBYXHzGN/OiX+qYUOpoVkCDEW7IiyCqnSpc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=S5J56E93P9UTrZ/REL9COO9XVO1m6FzavDwdBnI7cuJx9qGxJ40XAwCrYBoAjPcfd
	 ADWCaNMxXYkfZC54N1hUHXEzkRqADui5iLVUZV6wD/b2E8f8+fC5POkv+NkniUp9rk
	 Vxgaph+ucn/vgPJK/XHE0XezfmulXRqL/JB0NqVaY4pZBxiJfrdc9hLR194YhqQUOJ
	 Jdjz+iTnEe0YYEaqf10jNa7PCI3dWJLOPeCmCFddQG4ws79JF+q0PRhB+12PfWo/G1
	 pcN4bryzGotxtNiu8pwHNGBXqOBsq7yEO4vVrech0z5WeD4wIXcGJRkO98OortxdQN
	 y7nGzuBOHT03Q==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8622417E131B;
	Wed, 18 Feb 2026 21:56:52 +0100 (CET)
Message-ID: <a662745a-1b2a-47b3-a66d-7c1c5c8af525@collabora.com>
Date: Wed, 18 Feb 2026 22:56:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] HDMI monitor not working on Radxa Rock 5B after phy
 rockchip samsung hdptx HDMI 2.1 FRL patchset
To: dubito@online.de, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <b32164001947ba922aefb6ca86a8dc59e9323d2b.camel@online.de>
 <8e410a11-bd7b-4a12-a711-0514a59409c0@collabora.com>
 <1859c940219a4dbfdf0497afbf333e627ab0ba25.camel@online.de>
 <98e46dbb-c8e2-451f-accb-ea48f63f9408@collabora.com>
 <4544ec4ccfa49cbdffee098878df7806223935a0.camel@online.de>
 <08369c90-fbab-477d-9ac6-388deddfd3b1@collabora.com>
 <26e31b3b-484f-433b-833f-c639ee437f63@collabora.com>
 <03b5f3d1-6db4-4835-b2a5-c22c1aa63825@collabora.com>
 <a3c3964e9e13c82d944fa1ee0acbb1a7806dd382.camel@online.de>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <a3c3964e9e13c82d944fa1ee0acbb1a7806dd382.camel@online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_125657_922320_65E651D2 
X-CRM114-Status: GOOD (  15.13  )
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

Hi Thomas,

On 2/18/26 10:43 PM, 1und1 wrote:
> Hi Cristian,
> 
> 
> Am Mittwoch, dem 18.02.2026 um 22:15 +0200 schrieb Cristian Ciocaltea:
>> On 2/18/26 3:22 AM, Cristian Ciocaltea wrote:
>>> On 2/18/26 2:52 AM, Cristian Ciocaltea wrote:
>>>> Hi Thomas,
>>> [...]
>>>
>>>>
>>>> Sorry, I somehow missed the following warning message, though it has been
>>>> already present in all the logs you've sent to me so far:
>>>>
>>>>   rockchip-hdptx-phy fed60000.phy: PLL locked by unknown consumer!
>>>>
>>>> That indicates the PHY has been preconfigured by an external component
>>>> (e.g. the
>>>> bootloader), which is actually a scenario that I didn't verify.
>>>>
>>>> However, this just another way to expose a limitation of the current
>>>> approach
>>>> for managing the TMDS character rate: done via the Common Clock Framework
>>>> API
>>>> instead of the HDMI PHY configuration API.
>>>>
>>>> As a matter of fact, it was actually an item on my TODOs list for quite a
>>>> while,
>>>> but blocked until recently due to several dependencies waiting to be
>>>> merged
>>>> upstream.
>>>>
>>>> Hence I took the opportunity to finalize this task - please give the
>>>> following
>>>> commits in my rk3588-hdmi-debug branch [2] a try:
>>>
>>> I've just realized I introduced a regression while doing some cleanup work,
>>> hence
>>> please ignore this until further notice.
>>
>> I think I got this working properly now, at least it passes all the tests I
>> could run.  The updated commits in [2] are:
>>
>>   fa7cd1e75aaa ("phy: rockchip: samsung-hdptx: Fix rate recalculation for high
>> bpc")
>>   8048db5544da ("phy: rockchip: samsung-hdptx: Exclusively use PHY config API
>> for PLL changes")
>>   0085a382dfd0 ("[DEBUG] drm/rockchip: Add HDMI verbose logging")
>>
> 
> applying these commits solves my problems. I tested 1920x1080@60, 1920x1080@50
> and 1920x1080@30. All work now. Thanks for the quick fix! 

Thanks for the quick test!

I can add you to cc: when I submit the series, so that you may provide your
Tested-by tag if you'd like to.

> And the positive side> effect seems to be that you can now take one of your
> old todos from your list.

Indeed. :-)

Regards,
Cristian

