Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5A0CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 11:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fden5q3cwJAtmjxOzXx/h9BbUz6DpV6vAF7TlM0CQGo=; b=lQqJ+uKPF5hqNgi3PrTNP2oJga
	PiIaZ+P4YEv6uoY0vx0KW6IA5t9nCpH4u5CSJX2gaVgkfJ323S9USkGM4NXVXwSsy6YLupeeBu2Qt
	uMY3pWbRISk0ozwXiTTAgiiRTEkT9fvVy3jDEP7HNoGykULbZ2UT9hoaPVKg51gYBtsXJmSlR1VsJ
	Z7DmHsrsPKGYWtBP3mNgO7EXRDmhOqVSIU7ETpJFo0m51yQzGerrGzF6kWMNJhM3nULDycSSVxgLn
	8o82NdoDA5kQjz4Nqhf7h7AWbArBZE3P2TDuykflrzMFAjk9SPQKlUh30RGLYxXBiV8dfOkKr+fFU
	zn/8xzZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBtO5-000000064Dd-41eK;
	Thu, 23 Oct 2025 11:21:45 +0000
Received: from mail-m15578.qiye.163.com ([101.71.155.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBtO2-000000064Aq-0zoB;
	Thu, 23 Oct 2025 11:21:43 +0000
Received: from [172.16.12.149] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 26f1c34e0;
	Thu, 23 Oct 2025 19:21:32 +0800 (GMT+08:00)
Message-ID: <9c52db41-14f3-41a8-9423-3efe604361aa@rock-chips.com>
Date: Thu, 23 Oct 2025 19:21:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/9] usb: typec: Add notifier functions
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20251023033009.90-1-kernel@airkyi.com>
 <20251023033009.90-2-kernel@airkyi.com> <aPni4AeDaem_rfZH@kuha.fi.intel.com>
 <aPnvoSRJefwDlpNO@kuha.fi.intel.com> <aPn4-S7upPOOtenr@kuha.fi.intel.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aPn4-S7upPOOtenr@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9a10cd794c03abkunmb71a32b21958ec
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk0ZS1ZMQklISUMZTxpNSUpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=WPP/CtMyWjsyonpX6WvCM4hzju69HTiJcibUlL0INhLheBqrQM9p7gBHu5od05BDZ6pM2Ukm7toh6d4/A+Fm6M7Yl0FM6QZa7mJzh7xdQAPZNhD/6oM7QLysGDEz2S54WNzl+ZeotjEgaxczFD8HlruoyNi7HkkWDnqtDTw3R7I=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Fden5q3cwJAtmjxOzXx/h9BbUz6DpV6vAF7TlM0CQGo=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_042142_470474_87689964 
X-CRM114-Status: GOOD (  22.50  )
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

Hi Heikki,

On 10/23/2025 5:44 PM, Heikki Krogerus wrote:
> On Thu, Oct 23, 2025 at 12:04:44PM +0300, Heikki Krogerus wrote:
>> On Thu, Oct 23, 2025 at 11:10:20AM +0300, Heikki Krogerus wrote:
>>> Hi,
>>>
>>>> diff --git a/include/linux/usb/typec_notify.h b/include/linux/usb/typec_notify.h
>>>> new file mode 100644
>>>> index 000000000000..a3f1f3b3ae47
>>>> --- /dev/null
>>>> +++ b/include/linux/usb/typec_notify.h
>>>> @@ -0,0 +1,17 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +
>>>> +#ifndef __USB_TYPEC_NOTIFY
>>>> +#define __USB_TYPEC_NOTIFY
>>>> +
>>>> +#include <linux/notifier.h>
>>>> +
>>>> +enum usb_typec_event {
>>>> +	TYPEC_ALTMODE_REGISTERED
>>>> +};
>>> Don't you need to know when the altmode is removed?
>> I noticed that you don't because drm_dp_hpd_bridge_register() is
>> always resource managed. But I think you could still send an event
>> also when the altmode is removed already now. That way it does not
>> need to be separately added if and when it is needed.
> Hold on! Every bus has already a notifier chain. That's the one that
> we should also use. Sorry for not noticing that earlier.
>
> So let's just export the bus type in this patch - you can then use
> bus_register_notifier() in your driver:
>
> diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
> index a884cec9ab7e..65ded9e3cdaa 100644
> --- a/drivers/usb/typec/bus.c
> +++ b/drivers/usb/typec/bus.c
> @@ -547,3 +547,4 @@ const struct bus_type typec_bus = {
>          .probe = typec_probe,
>          .remove = typec_remove,
>   };
> +EXPORT_SYMBOL_GPL(typec_bus);
> diff --git a/drivers/usb/typec/bus.h b/drivers/usb/typec/bus.h
> index 643b8c81786d..af9edb3db9d0 100644
> --- a/drivers/usb/typec/bus.h
> +++ b/drivers/usb/typec/bus.h
> @@ -5,7 +5,6 @@
>   
>   #include <linux/usb/typec_altmode.h>
>   
> -struct bus_type;
>   struct typec_mux;
>   struct typec_retimer;
>   
> @@ -28,7 +27,6 @@ struct altmode {
>   
>   #define to_altmode(d) container_of(d, struct altmode, adev)
>   
> -extern const struct bus_type typec_bus;
>   extern const struct device_type typec_altmode_dev_type;
>   
>   #define is_typec_altmode(_dev_) (_dev_->type == &typec_altmode_dev_type)
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index 309251572e2e..c6fd46902fce 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -20,12 +20,15 @@ struct typec_port;
>   struct typec_altmode_ops;
>   struct typec_cable_ops;
>   
> +struct bus_type;
>   struct fwnode_handle;
>   struct device;
>   
>   struct usb_power_delivery;
>   struct usb_power_delivery_desc;
>   
> +extern const struct bus_type typec_bus;
> +
>   enum typec_port_type {
>          TYPEC_PORT_SRC,
>          TYPEC_PORT_SNK,

Thank you for your detailed explanation. I noticed that there is a device_register() action in typec_register_altmode(), so we can just take advantage of this.


Another thing is that we need to distinguish between different devices in the notifier callback, as typec_register_altmode()/typec_register_partner()/typec_register_plug()/typec_register_cable() may all register devices. Since the data passed in bus_notify() is struct device *dev, I think we can distinguish them through `dev->type.name`? We may already have such names, "typec_alternate_mode", "typec_partner", "typec_plug" in class.c . And then extract these names as macros and put them in the typec header file.


Or do you have any better ideas? Thank you.


> thanks,
>
-- 
Best,
Chaoyi


