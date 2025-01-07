Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FA5E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jnf8VyoDYiHZmOXYxmfMb9csMh46hORnKVBGufpe0W8=; b=yW89m6CufIujwHuiPbLOCRsCf7
	iLuQSIgBkqZ3wBCOKxLprGF+Nio78BB1Se+UoN8UA2MRCuUsGQqhXvsDLlX+tEnC7OuUDa7m45fjv
	4YholXLPOMllX79T8VEKg2OCu5QJ7Rv4QsWvVE84CUzZjDyxkTCpR4ugNb4uAfLXwep96tFY3mL5D
	z+UI3aCNYYzur3PD/9Ft9lo52B1tpP9Z2FGTZjWeZUkDjvGGLPtN+3ZPPtpPDcGx8GO72xpHiwG9F
	q7Q1uN+frMQ3IwBMtY9mqfBsO/QNKMLN8c027Xyn52g13s1VGc1O3kriHJRoJzsyGwCWtuZzGqW2A
	bRhPSeDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAOF-000000059Ug-0b1v;
	Tue, 07 Jan 2025 14:17:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAGg-000000057P8-0PqP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:09:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 59357A4144A;
	Tue,  7 Jan 2025 14:07:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B1FDC4CED6;
	Tue,  7 Jan 2025 14:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736258952;
	bh=8BDLYUYf++vdrqb+LR2+oH4WmfnIOFOg7FweOzpyr30=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A1+xXhQMRlsJ54nJKYiiZ8RmnKFUOnBXEY38VI0i0ytdjVibx+Bcvc4wvkbjYPHn8
	 YMs9zjqn5G2VoJjwr2qeiC+58MKlswK2cIlYFTQwmrY3l+IA8AJR2BTmQ3IHVRdw6z
	 Q2re7J6cgvh2Mv53wiN3yMHdv/AaLLim3pGKOPRV0XaPBXIKuuXLo/SF+VTzEThOYt
	 VtR/LHnBti9ZpAlt1PkuzZL3XbZLpVyYwfNrvhjSH4sI4YxwpFa2enxSdHGMjDv4dM
	 2XoOFIr+aQizk7YQclkKwkEI15sqNH0BJ2o9CJpbUOUsKb/LV8AzLX7QlwoW+/p/PE
	 hRJMqVXnTv+EA==
Message-ID: <db1a2109-9a03-46a3-b24f-fe9fbc74b875@kernel.org>
Date: Tue, 7 Jan 2025 16:09:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 3/3] net: ti: icssg-prueth: Add Support for
 Multicast filtering with VLAN in HSR mode
To: "Anwar, Md Danish" <a0501179@ti.com>, MD Danish Anwar
 <danishanwar@ti.com>, Jeongjun Park <aha310510@gmail.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Lukasz Majewski <lukma@denx.de>, Meghana Malladi <m-malladi@ti.com>,
 Diogo Ivo <diogo.ivo@siemens.com>, Simon Horman <horms@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 Larysa Zaremba <larysa.zaremba@intel.com>
References: <20250103092033.1533374-1-danishanwar@ti.com>
 <20250103092033.1533374-4-danishanwar@ti.com>
 <31bb8a3e-5a1c-4c94-8c33-c0dfd6d643fb@kernel.org>
 <5cc13a7f-b3f9-42d5-b9e2-7da5cb54af5b@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <5cc13a7f-b3f9-42d5-b9e2-7da5cb54af5b@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_060914_295120_E2C93AF9 
X-CRM114-Status: GOOD (  20.36  )
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



On 07/01/2025 16:01, Anwar, Md Danish wrote:
> 
> 
> On 1/7/2025 6:53 PM, Roger Quadros wrote:
>>
>>
>> On 03/01/2025 11:20, MD Danish Anwar wrote:
>>> Add multicast filtering support for VLAN interfaces in HSR offload mode
>>> for ICSSG driver.
>>>
>>> The driver calls vlan_for_each() API on the hsr device's ndev to get the
>>> list of available vlans for the hsr device. The driver then sync mc addr of
>>> vlan interface with a locally mainatined list emac->vlan_mcast_list[vid]
>>> using __hw_addr_sync_multiple() API.
>>>
>>> The driver then calls the sync / unsync callbacks.
>>>
>>> In the sync / unsync call back, driver checks if the vdev's real dev is
>>> hsr device or not. If the real dev is hsr device, driver gets the per
>>> port device using hsr_get_port_ndev() and then driver passes appropriate
>>> vid to FDB helper functions.
>>>
>>> This commit makes below changes in the hsr files.
>>> - Move enum hsr_port_type from net/hsr/hsr_main.h to include/linux/if_hsr.h
>>>   so that the enum can be accessed by drivers using hsr.
>>> - Create hsr_get_port_ndev() API that can be used to get the ndev
>>>   pointer to the slave port from ndev pointer to the hsr net device.
>>> - Export hsr_get_port_ndev() API so that the API can be accessed by
>>>   drivers using hsr.
>>>
>>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>>> ---
>>>  drivers/net/ethernet/ti/icssg/icssg_prueth.c | 83 +++++++++++++++-----
>>>  drivers/net/ethernet/ti/icssg/icssg_prueth.h |  2 +
>>>  include/linux/if_hsr.h                       | 18 +++++
>>>  net/hsr/hsr_device.c                         | 13 +++
>>>  net/hsr/hsr_main.h                           |  9 ---
>>
>> Should we be splitting hsr core changes into separate patch first,
>> then followed by a patch with icssg driver changes?
>>
> 
> I wanted to make sure that the changes to hsr core are done with the
> driver change so that any one looking at the commit can understand why
> these changes are done.
> 
> If we split the changes and someone looks at the commit modifying hsr
> core, they will not be able to understand why this is done. We will be
> creating and exporting API hsr_get_port_ndev() but there will be no
> caller for this.

I think you can explain in the commit log why you need the API.

> 
>>>  5 files changed, 97 insertions(+), 28 deletions(-)
>>
> 

-- 
cheers,
-roger


