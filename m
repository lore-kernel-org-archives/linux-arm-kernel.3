Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AC6CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 09:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qUewYvs5quWL8CZ5KUc8yRAa2rvIV3/2PN0yp7OZqoo=; b=plItHZszrbLr2xF9K1qihpX6Xi
	PUk4lwl62BaDaL4UHBpGUaQhr2jygSBh2d4HiRQy+e3OxqfOhjqNO4j5odPUtsaiVEx3WBGcGHWu2
	gQCGb4nLIvq5omYukekVhZoQHRs1qnybkljEIlF/lMldDXvi9dUqVfc0Y8lBmttR8xB/OJo03wJ5u
	lF4C9GQx0/261+xut53lOYR6mQdiaLwRLh8GAn1N0sxI5Jmb7pv+0JGgBefwv/aycZp6LRQp7ry+7
	6dVHD9+8CPkCJicxE/mdAvX4LMgj+COLskJrocHx2W/4x/ASzDoYgN77nAoByHhKqIUnANrV35EHx
	vF15aDBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8un-0000000GUqS-0XVv;
	Tue, 21 Oct 2025 09:44:25 +0000
Received: from mail-m19731106.qiye.163.com ([220.197.31.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8uj-0000000GUoN-13KX;
	Tue, 21 Oct 2025 09:44:23 +0000
Received: from [172.16.12.149] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 26a698a5f;
	Tue, 21 Oct 2025 17:44:12 +0800 (GMT+08:00)
Message-ID: <1221dd6c-2035-4e5d-8052-341da279fe81@rock-chips.com>
Date: Tue, 21 Oct 2025 17:44:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] usb: typec: Add default HPD device when register
 DisplayPort altmode
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20251016022741.91-1-kernel@airkyi.com>
 <20251016022741.91-2-kernel@airkyi.com> <aPYImGmesrZWwyqh@kuha.fi.intel.com>
 <954a67d1-1759-4e18-8eef-3fa14fb3cef5@rock-chips.com>
 <aPdI7Vb_djrfCfbT@kuha.fi.intel.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aPdI7Vb_djrfCfbT@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9a0627a3a903abkunm5cd7977fb8e2b1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUpDS1YaGRpIHUpDTBlKGU1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	9VSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=g6OhVZ/yiqpa03UuI1XX7K9vWZ8zWP3G2Gzz5rhk0AcJK/U+UJws7ashU78Y+//2Cp1XYy8iR5A+1sB1SdjmB78dMX58786reFgEn7dhTHoMucj84RbJ6zYHbg7CDu7vWXLe8oopZFd6uuDFaXjD2L3+MUHefnrApM/1yNbvoa0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=qUewYvs5quWL8CZ5KUc8yRAa2rvIV3/2PN0yp7OZqoo=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_024421_821609_751BE74B 
X-CRM114-Status: GOOD (  16.65  )
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

On 10/21/2025 4:48 PM, Heikki Krogerus wrote:

> Hi,
>
> On Mon, Oct 20, 2025 at 07:07:46PM +0800, Chaoyi Chen wrote:
>> Hi Heikki,
>>
>> On 10/20/2025 6:02 PM, Heikki Krogerus wrote:
>>> On Thu, Oct 16, 2025 at 10:27:34AM +0800, Chaoyi Chen wrote:
>>>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>>
>>>> Add default DRM AUX HPD bridge device when register DisplayPort
>>>> altmode. That makes it redundant for each Type-C driver to implement
>>>> a similar registration process in embedded scenarios.
>>>>
>>>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>> ---
>>>>
>>>> Changes in v6:
>>>> - Fix depend in Kconfig.
>>>>
>>>> Changes in v5:
>>>> - Remove the calls related to `drm_aux_hpd_bridge_notify()`.
>>>> - Place the helper functions in the same compilation unit.
>>>> - Add more comments about parent device.
>>>>
>>>>    drivers/usb/typec/Kconfig         |  2 ++
>>>>    drivers/usb/typec/class.c         | 26 ++++++++++++++++++++++++++
>>>>    include/linux/usb/typec_altmode.h |  2 ++
>>>>    3 files changed, 30 insertions(+)
>>>>
>>>> diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
>>>> index 2f80c2792dbd..a6730fbb576b 100644
>>>> --- a/drivers/usb/typec/Kconfig
>>>> +++ b/drivers/usb/typec/Kconfig
>>>> @@ -2,6 +2,8 @@
>>>>    menuconfig TYPEC
>>>>    	tristate "USB Type-C Support"
>>>> +	depends on DRM || DRM=n
>>>> +	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
>>> This is wrong. DRM should not dictate how this entire subsystem core
>>> is configured. The dependency needs to be on the DRM bridge side.
>>>
>>> You can for example use the bus notification there to see when a new
>>> alternate mode is being registered, or use some other notification
>>> mechanism.
>> Is it a good idea to implement notification functions like
>> drivers/usb/core/notify.c in TCPM, and then let other subsystems (such as DRM)
>> listen to these notifications?
> Don't limit this to tcpm only. I would suggest something similar what
> we have for usb bus: drivers/usb/core/notify.c
>
> So that, but for the typec bus. Then in DRM bridge code you just use
> typec_register/unregister_notify().

I will try to add drivers/usb/typec/notify.c in v7 to implement this. Thank you.


>
> thanks,
>
-- 
Best,
Chaoyi


