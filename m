Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB72C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 09:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1RiWtLO8VNQPU8YB74tHFSwgOx71KqqDsRGA0ES6vA=; b=zoFw+68XzYDQamlpf7N8WcaoOY
	gBKLEhGxnl/tNLSAvdY1uflzYDJac9ykjG3ps4E7PERhpD99OUxhepWvtlckXNzL3Jw1e5ilSUo58
	5quXiQd0idO283gjyGy5NQd+LVtp/YoRMHTxhmZh7nfPqsHpXgTh1BH42oJ+dl+usMiNmdn+Y6cTV
	JWgzqQigDkdE6mt43jLnVw5c9XURNah4iApIVbR1lT5foBdo83jL22W6G11w22IHaE4hLUXPnUq5u
	4Z9rE8Y+njUvXIgSR0e6fHuWHTvOFDX6p3zflK8lgIaqbeo+1i6dGvHhrs75JItAskccU2DJXBcOD
	fIJK8zAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txjAH-0000000AWYI-1kYk;
	Thu, 27 Mar 2025 09:04:41 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txj8J-0000000AWE8-0VuA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 09:02:41 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 90F79A05BE;
	Thu, 27 Mar 2025 10:02:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=W1RiWtLO8VNQPU8YB74t
	HFSwgOx71KqqDsRGA0ES6vA=; b=E61gGyTBdifXDaAGlQu9TU0t1/vkLn5f1WTf
	kL8PBLD3Az5qSyISZLH806zyRlgvL7Rw7Qm1YLGyz9kC7aFrqcGV9VFPLpwCejTU
	0ezuyDl2ptXmQeWglg6cCEhn4HmSA1vovnVtZ5KRDbz10fnhDw51HjRdMHWBaP2R
	SyvkJ2QDfMQBib6rnPinoi2a/12vilb1ge3X8OgoOF7Ndou9ZvETZD22p/uOtZoV
	+DS+71SHF0E0qJ0sOnM/ntFmYrFvAUYdyH80YxQbqPXGoAsAI/kKPwlnzYxLEGEJ
	TqxGqncaQxKppJ62MuzY/WEJm9XZodBCFXiki26yz4G2/AlA3u0fonjFPPj7CsVu
	2QEN1dQ+PsBp5pLFbjlGeFc8+rZQ6fGUvKdgd+7AI+eFR8wrjwvTZ484E7aklffr
	KeQhOSP/KdGNISl7NNoCpLlgr6KIFzzPOqN7XgKcQF0HDEDE9OeDeNj17YWJmtJj
	78wmNC+OLf0TOoLcWWA2UTditlnM8MHPDXXDXluLxnGv2rB/Fhc+bw9dYaPGB/Dj
	Cu3+I7zwDWb1yClIuuxO2okVo151d7qQuJAKVxMnZm2Q/CkRMoKUbTJ2ATk2PEbY
	XxOWwI6vXod2Hu/w/EESuAgcHKu9J9eTYpOyzknI+wyczNgYmowoUh2bcHZ4gzHU
	i12a8V0=
Message-ID: <3e6d7071-1ba9-484c-9dcb-c5da6ad1ffe3@prolan.hu>
Date: Thu, 27 Mar 2025 10:02:24 +0100
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
Content-Language: en-US, hu-HU
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <CAJZ5v0hJZBxU6SSq9C8gp2peETFWu0jbhrM82B5GvQkVXPR+9Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.254.37.248]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D948526C7760
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_020239_631812_2AC3D4D9 
X-CRM114-Status: GOOD (  23.46  )
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

On 2025. 03. 26. 18:38, Rafael J. Wysocki wrote:
> I said I didn't like it and I'm still not liking it.

You didn't really elaborate further, but now I'm glad I could understand 
your dislike.

> The problem is that the primary role of pm_runtime_set_active() is to
> prepare the device for enabling runtime PM, so in the majority of
> cases it should be followed by pm_runtime_enable().  It is also not
> always necessary to call pm_runtime_set_suspended() after disabling
> runtime PM for a device, like when the device has been
> runtime-suspended before disabling runtime PM for it.  This is not
> like releasing a resource that has been allocated and using devm for
> it in the above way is at least questionable.
> 
> Now, there is a reason why calling pm_runtime_set_suspended() on a
> device after disabling runtime PM for it is a good idea at all.
> Namely, disabling runtime PM alone does not release the device's
> suppliers or its parent, so if you want to release them after
> disabling runtime PM for the device, you need to do something more.
> I'm thinking that this is a  mistake in the design of the runtime PM
> core.

Well, this is the order in which the original driver worked before 
anyways. As a quick fix, would it work if we created a devm function 
that would pm_runtime_set_active(), immediately followed by 
pm_runtime_enable(), and on cleanup it would pm_runtime_set_suspended() 
followed by pm_runtime_disable_action() (i.e. 
pm_runtime_dont_use_autosuspend() and pm_runtime_disable())?

> If there were functions like pm_runtime_enable_in_state() (taking an
> additional state argument and acquiring all of the necessary
> references on the parent and suppliers of the target device) and
> pm_runtime_disable_and_forget() (that in addition to disabling runtime
> PM would drop the references acquired by the former), then it would
> make a perfect sense to provide a devm variant of
> pm_runtime_enable_in_state() with the cleanup action pointing to
> pm_runtime_disable_and_forget().
> 
> If this helps, I can do some work on providing
> pm_runtime_enable_in_state() and pm_runtime_disable_and_forget() or
> equivalent.

I mean sure, if that's something you want to work on, but it sounds like 
it would entail much more work, plus it wouldn't be easy to backport it 
to 6.14.y stable later.

Bence


