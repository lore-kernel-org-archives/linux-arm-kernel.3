Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54003C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 13:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPQ5Rb+uDwVDwRdIPGfF+58tdlTfGsVmd3yos4V09g8=; b=df/e8zrhs+NGYrD40ou/Y8sFhe
	reaLwEHv4VzkSjnyvvaNALyHr0/R/z+igMN78IgEZYuMOC68rnYhgzLEv6mstIisGLSTUN2IOZ8hc
	NGDVBQA9dqtLOQMyQOuccf7RuxNxsau09I18j6Tkn8OW48pObjQ63RSrpCCnCA5fyG6wkG/Q644+5
	b4XIYOR/77vxiegWfVItSUOe+YAnQoBmyAazuf1+flJp5v4QlVY0+P+0oMb251fGPTACXZTll5GXM
	sC6Df3sDavy/uLACHLyVIMGkyj++TCwNyzvM0OZ2VZ07iCywYp848j+Ym7RuZcXqzKAOwmeC2GeoO
	jVt8t5JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txnKX-0000000B4zt-0dvc;
	Thu, 27 Mar 2025 13:31:33 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txnDm-0000000B3po-0CYQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 13:24:35 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 43674A0796;
	Thu, 27 Mar 2025 14:24:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=tPQ5Rb+uDwVDwRdIPGfF
	+58tdlTfGsVmd3yos4V09g8=; b=T2v/kcmB6tFbyuMu5NwmyUBgQSYcIZKoLVvT
	oKdfDBwuWwd4mEaI427gIs6DV11zNLJqBlNPkTB9q9VCSbGoKQeTgrOwT7pHo7HW
	XV/aWJIA2l/KtrQPr93rwrfzoR4jPfCNPRYyqO488WRHxe53iuk+QI9fYjXnJPFs
	EU5v8tOejto2U2l7GGUVyQ/5tPvPWN58lJKONcUFQKLjZFrTikFLcHvacHfSj8na
	6E6mMKWQaSFwkTqdogWkpHOXieAF1mlON2XkbEdsZ+ZSqG9lkRZ40DnkVr7alnKu
	jwFnQMY3U9ulEYHW/h6P7sItZibRIllIGHAMf6o+JcWNY7eOQJLvoq1FH0PISx5u
	S5tvsFJ8olJ/17CZ9vyv5ggtr7I5hw2hnyDMjVgFr0X0FKtDkWFnwkNX39065bHx
	6McZHOM0D88TSlA9qGKNev5v0qtiZfD/Z/X8wwjo90USD6Xo9wbFgyoJx5iEmQCn
	yJV8Z+Xkzgbq5Z9AD/iEgJGJO6T99nJjGSqsUIM2J5ysC+OX5KPq1BUCbLXwOREc
	a+uCIKoD8GtLJ06TpNDepzG9A1DZPgwW89JlnV5LA2FOOeW7W6sQxC4tJXlNjfTg
	LpuEFSuLYs/B7MGNgsBDjFV30EQa7a+Q312BfYb8uP4XQp4/pfKpttQOfnAoGPd4
	UkLAqw4=
Message-ID: <d926d2c2-8cc9-4a71-b8ca-b5f03ac9afb8@prolan.hu>
Date: Thu, 27 Mar 2025 14:24:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] pm: runtime: Add new devm functions
To: "Rafael J. Wysocki" <rafael@kernel.org>
CC: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Varshini
 Rajendran" <varshini.rajendran@microchip.com>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Len
 Brown" <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, "Alexander
 Dahl" <ada@thorsis.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Pavel Machek <pavel@kernel.org>
References: <20250317093445.361821-1-csokas.bence@prolan.hu>
 <20250317093445.361821-2-csokas.bence@prolan.hu>
 <CAJZ5v0hJZBxU6SSq9C8gp2peETFWu0jbhrM82B5GvQkVXPR+9Q@mail.gmail.com>
 <3e6d7071-1ba9-484c-9dcb-c5da6ad1ffe3@prolan.hu>
 <CAJZ5v0jka2r9PaKsF0FE2qJaFfnVNGd8sZRE6Aay-Ugpzot44w@mail.gmail.com>
Content-Language: en-US, hu-HU
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <CAJZ5v0jka2r9PaKsF0FE2qJaFfnVNGd8sZRE6Aay-Ugpzot44w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.254.37.248]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D948526C7766
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_062434_556720_44634CC6 
X-CRM114-Status: GOOD (  14.11  )
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

Hi,

On 2025. 03. 27. 12:08, Rafael J. Wysocki wrote:
>>> Now, there is a reason why calling pm_runtime_set_suspended() on a
>>> device after disabling runtime PM for it is a good idea at all.
>>> Namely, disabling runtime PM alone does not release the device's
>>> suppliers or its parent, so if you want to release them after
>>> disabling runtime PM for the device, you need to do something more.
>>> I'm thinking that this is a  mistake in the design of the runtime PM
>>> core.
>>
>> Well, this is the order in which the original driver worked before
>> anyways. As a quick fix, would it work if we created a devm function
>> that would pm_runtime_set_active(), immediately followed by
>> pm_runtime_enable(), and on cleanup it would pm_runtime_set_suspended()
>> followed by pm_runtime_disable_action() (i.e.
>> pm_runtime_dont_use_autosuspend() and pm_runtime_disable())?
> 
> On cleanup you'd need to ensure that pm_runtime_disable() is followed
> by pm_runtime_set_suspended() (not the other way around).  Also
> pm_runtime_dont_use_autosuspend() needs to be called when runtime PM
> is still enabled.
> 
> With the above taken into account, it would work.

Ok, so which is the correct order then?

1. the way it is done now in [PATCH v5 2/2] (which is the same order the 
driver has been using before anyways):

     pm_runtime_use_autosuspend()
/-- devm_pm_runtime_set_active()
|   /-- devm_pm_runtime_enable()
|   |   /-- devm_pm_runtime_get_noresume()
|   |   |
|   |   \-> pm_runtime_put_noidle()
|   \-> pm_runtime_dont_use_autosuspend() &&
|       pm_runtime_disable()
\-> pm_runtime_set_suspended()

or,
2. swapped set_suspended() and runtime_disable()

     pm_runtime_use_autosuspend()
/-- devm_pm_runtime_set_active_enabled() [new fn]
|    == pm_runtime_set_active() &&
|       pm_runtime_enable()
|   /-- devm_pm_runtime_get_noresume()
|   |
|   \-> pm_runtime_put_noidle()
\--> pm_runtime_set_suspended()
      pm_runtime_dont_use_autosuspend()
      pm_runtime_disable()

Bence


