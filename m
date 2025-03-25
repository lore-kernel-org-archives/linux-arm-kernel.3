Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536C1C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 13:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27tDlS9I7w+QHFZ7F9553jcj4LUb3Qxba7/RAdMTtto=; b=ICvT6FMO4iprKkik+ibQAnUP7m
	HGgCoOVCUBcevRsQzGZItm/VyYQh4tk/4cSRI46Lh8BoetslfB/pbYbvVu8LCcn+bUdfMjqrIzTg/
	8A3pCvmyFyR1jCevTcU5e4jgMr/H1qY1Qgyxg6WyE1eSLwf7qJ1fGGaxKbU6OGXYjjixIih1DXkYN
	AB2r0IyX+7MJ+c/yZPAE6yCpNPb2wZefjOM8q6YWKOI0LksbKbz7fuSbB/X9yLpN7TE+R+ZzW/fi4
	tkGbRIOD+1qJTzx/7/jr5X1T5a/9w6PJHNI29Q9jT/cW0UGFD1q+w4QMPTa5mMnG9+qxic/li3Bmo
	ARRoeRJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4mH-000000068MM-1bQJ;
	Tue, 25 Mar 2025 13:57:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4hS-0000000661V-1Pkf
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 13:52:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=27tDlS9I7w+QHFZ7F9553jcj4LUb3Qxba7/RAdMTtto=; b=aL/J9f4Z4yCkLb4jBACG4Y2isU
	5nujpsrxB8aBdd1iuoN33K01dhGwOmaoAfvrM784oWlYDMSB2HeuDPdjLWOSk6kRWZMlHs7wq8iJt
	Fs/M0f1fSre36hbt6n6owbKkRbuTjtvCi7ZIzMP/GYYO5+jOE2Cg/sUXSdp4nQAcFvbXfXoK7ORO3
	03PXo/OL3sdLNLVd93eBXUDcyhthTCWy+Dri0sYl0hpXln+iStBeUXhhOX0YyH5n3qi/Dqx60F6Fb
	eA181QO2CG9jLwTsS999AvJun92eQEVXsz4UQngwduGfIHFck6h6Y1m1Y92F4aep5vQ+c3Sl8nl1j
	5ZUtStfw==;
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx4hP-00000005UDL-0tAE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 13:52:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C3A0102EBA49;
	Tue, 25 Mar 2025 14:52:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742910727; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=27tDlS9I7w+QHFZ7F9553jcj4LUb3Qxba7/RAdMTtto=;
	b=MVEK8L5mQphFgbOHAcgIHBn/giW8wflKAJWs62f0xFcpzUrYLbX+LFoVPGQc15MCbKhTsO
	MZTNAFqxpO4JA7BSJiq4agmIMhRir9M7KWdGrTnRt+W64Ah3ipCE9CdgtbJvUbosb7ola4
	PwI3BUezAC7j6UeOmQ+i3UZfZeeMAX5XgHMmCi91PPJCy2ScevaKm3LEVAnMib3fx2Q3gk
	5lOCW3xUQGZcNEtECJry3nyLRmVwZ4Qigs3txjCPfdT8J+ihDGAvACQY9IEuW0MJuYV+Gj
	+l9TuvurOnP4pi4shJ4ujCgTxFbvmOOrjVN0g0sjTtO++Uo/M1BX+Wclwq/vgg==
Message-ID: <7aadf355-edf0-46fc-b969-65c3789375ca@denx.de>
Date: Tue, 25 Mar 2025 14:50:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-5-marex@denx.de>
 <20250324094333.7afb17a1@collabora.com>
 <c1de2afb-3559-4fbb-b13b-2373175b420b@denx.de>
 <20250325084349.344a0f11@collabora.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250325084349.344a0f11@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_135211_454726_DBEAD035 
X-CRM114-Status: GOOD (  13.53  )
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

On 3/25/25 8:43 AM, Boris Brezillon wrote:
> On Tue, 25 Mar 2025 00:37:59 +0100
> Marek Vasut <marex@denx.de> wrote:
> 
>> On 3/24/25 9:43 AM, Boris Brezillon wrote:
>>
>> [...]
>>
>>>> @@ -563,6 +585,7 @@ int panthor_device_suspend(struct device *dev)
>>>>    
>>>>    	panthor_devfreq_suspend(ptdev);
>>>>    
>>>> +	reset_control_assert(ptdev->resets);
>>>
>>> Hm, that might be the cause of the fast reset issue (which is a fast
>>> resume more than a fast reset BTW): if you re-assert the reset line on
>>> runtime suspend, I guess this causes a full GPU reset, and the MCU ends
>>> up in a state where it needs a slow reset (all data sections reset to
>>> their initial state). Can you try to move the reset_control_[de]assert
>>> to the unplug/init functions?
>> Is it correct to assume , that if I remove all reset_control_assert()
>> calls (and keep only the _deassert() calls), the slow resume problem
>> should go away too ?
> 
> Yeah, dropping the _assert()s should do the trick.
Hmmm, no, that does not help. I was hoping maybe NXP can chime in and 
suggest something too ?

