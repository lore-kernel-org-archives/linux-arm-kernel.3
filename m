Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36621C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 02:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+TiEqyL1AH0iOF6kXInInA83bu0TufgWM4xm6RFb5sQ=; b=YxoyFA4DFouJu0BBbJDZ1IdJ98
	5p/E77iX8qeqiUMKjMIfPyJn7jrJHJlHA0II2Yu0RgXJPrDCs5QYECKDY1Gc9nxJHBzP6lOlTpKq/
	AbyyRlYwNNDRyJc/Dn7blL/pN/QeVk5gmI2iym5h72MJvatZchvyei6CYp2PIWEJhYnYdVxN7xQL4
	pOAyT4VWDm8b3rADEWI7YZ4cY39cLyul0JgsfzF0QHbpXzDqEyaB08G0T+L1wXKdbhETFZkiz3B6B
	nPhaxhFi8JGOGRvjGFsoCUy5S/201XQYmJZoKqL28yjmSnVHYl+9zwx4VVB2UQieeSj5aNbHzOzwa
	9imUqq+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhIwP-00000002lbN-2fLs;
	Thu, 31 Jul 2025 02:22:45 +0000
Received: from mail-m603.netease.com ([210.79.60.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhItu-00000002lNR-0A0b;
	Thu, 31 Jul 2025 02:20:12 +0000
Received: from [172.16.12.153] (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1dcdf18ba;
	Thu, 31 Jul 2025 10:19:51 +0800 (GMT+08:00)
Message-ID: <63ec11cf-7927-431a-995e-a5fc35ef1ba7@rock-chips.com>
Date: Thu, 31 Jul 2025 10:19:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Add Type-C DP support for RK3399 EVB IND board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
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
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20250729090032.97-1-kernel@airkyi.com>
 <3kefqzjewmsyzfvyi33kvlgjd6jphjg3fsnixb3of7yb3xkgs2@hgi6xfkgd653>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <3kefqzjewmsyzfvyi33kvlgjd6jphjg3fsnixb3of7yb3xkgs2@hgi6xfkgd653>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a985e475b1003abkunm77c0d17969e27b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhpLHlZKTE5DQhgfSUsZSBlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=RO16iif7fvE2I/NqgFVWubst7c5eff+ThID3ba+yjSGE1Deh2av4GXUdv8xcfOjIoQRF5I8v1uaoBxKb/+DD1K1YmFe3nXoNmqmLqsqYOc6GjQA/eU0CqsQeM8yRVB7HTls4tRM/6RHXOdZnkUd6HI2cIMr02K/o8X0yNF8Ofbc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=+TiEqyL1AH0iOF6kXInInA83bu0TufgWM4xm6RFb5sQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_192010_650787_05A78414 
X-CRM114-Status: GOOD (  20.87  )
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

Hi Dmitry,

On 7/31/2025 3:13 AM, Dmitry Baryshkov wrote:
> On Tue, Jul 29, 2025 at 05:00:27PM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> This series focuses on adding Type-C DP support for USBDP PHY and DP
>> driver. The USBDP PHY and DP will perceive the changes in cable status
>> based on the USB PD and Type-C state machines provided by TCPM. Before
>> this, the USBDP PHY and DP controller of RK3399 sensed cable state
>> changes through extcon, and devices such as the RK3399 Gru-Chromebook
>> rely on them. This series should not break them.
>>
> [....]
>
>> ====
>> 2. DP HPD event notify
>>
>> The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
>> the CDN-DP can be switched to output to one of the PHYs.
>>
>> USB/DP PHY0 ---+
>>                 | <----> CDN-DP controller
>> USB/DP PHY1 ---+
> Could you please clarify this, can you switch DP stream between two
> USB-C outputs? What happens if user plugs in DP dongles in both USB-C
> ports?

Currently, the software simply selects the first available port. So if 
user plugs in DP dongles in both USB-C ports, the DP driver will select 
the first port. This process is implemented in cdn_dp_connected_port() .



>
>> BTW, one of the important things to do is to implement extcon-like
>> notifications. I found include/drm/bridge/aux-bridge.h , but if the
>> aux-bridge is used, the bridge chain would look like this:
>>
>> PHY0 aux-bridge ---+
>>                     | ----> CDN-DP bridge
>> PHY1 aux-bridge ---+
>>
>> Oh, CDN-DP bridge has two previous aux-bridge!
>>
>> Now, I try to use drm_connector_oob_hotplug_event() to notify HPD
>> state between PHY and CDN-DP controller.
> Does it actually work? The OOB HPD event will be repoted for the usb-c
> connector's fwnode, but the DP controller isn't connected to that node
> anyhow. If I'm not mistaken, the HPD signal will not reach DP driver in
> this case.

Yes.  What you mentioned is the case in 
drivers/usb/typec/altmodes/displayport.c . I have also added a new OOB 
event notify in the PHY driver in Patch 3, where the expected fwnode is 
used in the PHY. So now we have two OOB HPD events, one from 
altmodes/displayport.c and the other from PHY. Only the HPD from PHY is 
eventually passed to the DP driver.



>
>> Patch1 add new Type-C mode switch for RK3399 USBDP phy binding.
>> Patch2 add typec_mux and typec_switch for RK3399 USBDP PHY.
>> Patch3 drops CDN-DP's extcon dependency when Type-C is present.
>> Patch4 add missing dp_out port for RK3399 CDN-DP.
>> Patch5 add Type-C DP support for RK3399 EVB IND board.
>>

