Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A6FC982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 18:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1IYSOWDSdVHavPw5AagIbmQivLGnywmbta0NyEZGhlY=; b=ddz4FE/V3eMqN2IY8ZZJJo8trp
	Uiy12CPkHONssSO2c5hGi0+k6Bmkkp6w0yPtr1y/+rnbRcwTVgv0bFHMK43bxgxQTr2sX3508mkCG
	0bKpH3HRB/byI4wVIXBhO7n0Fn1+YlQQKYKv4TtLLfYGGLwou+8d3B5yuXCVIUOXPYZryid7Dy50y
	M4iur8APpJcR83FD78H02YvL6IptrIhMh0Wtw/LeuauLN9wllOLmiUt2tURZYsDKy0YGnJBGpWVb8
	jbd7Uwi9b+zxnkYmkgO6CuSzZNoMRlyoP8gSVB6hyf19MkDzAc+7Zmhwmt0K8EWQeeVtqKZPtw760
	WwrAuqxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8iwn-000000039N5-3PyB;
	Mon, 21 Sep 2026 18:41:01 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8iwj-000000039LZ-45ll
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 18:40:59 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1EA91034B8;
	Mon, 21 Sep 2026 20:40:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790016045;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=1IYSOWDSdVHavPw5AagIbmQivLGnywmbta0NyEZGhlY=;
	b=CvmdGQZE6caIekfX+VDVlUD40Y5GvROg5DGKfHwS7TBY3BImNPFYKzza7e1TKqC4dD/vKK
	THgiqTiqT0Ri5qTYOVW5R389tgFAZEd2CFeWc3H+d3l+mccWIgsCzOoD4nmIAEmMdvhuQZ
	Czyj3A1NtzviXQA9VFjLjePVN6xQACIQ8YJJMjHP8nfeU9JOaQiooFdy+SkVU8ls4op29b
	v/PuV8XzpIWGdTCDc0Qbqk9T+ljPBzEfl+tLgBgQd6yBTwrwglyP2ktPmNjZItmUquh4V/
	Pqrt1zY+WuQlRjQ6QCMaQsBMr+pXlhzUkv55tN35mV+6m7+ZWBbHkdGyYjhnKw==
Message-ID: <c43103f6-348c-48b9-a831-ecb9379ce46f@nabladev.com>
Date: Mon, 21 Sep 2026 20:40:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/imx: upstream direction for i.MX95 display support
To: Liu Ying <victor.liu@nxp.com>, Piyush Patle <piyushpatle228@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, daniel.baluta@nxp.com,
 Frank.Li@nxp.com, shawnguo@kernel.org, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
References: <20260624100326.413699-1-piyushpatle228@gmail.com>
 <aj5MNiKSCiEDvDzL@raspi>
 <CAMB+xkayaViXeC2GyMMUfeCMzA4=fh-Dq6NYOL-hzKoLfAF19w@mail.gmail.com>
 <aksVMhFr8YzedE1w@raspi>
 <CAMB+xkY2rut-sEUMyFnXqYCNmyseP4nAGj4BfreORTTM=SN8_g@mail.gmail.com>
 <akuEOT2FRa77L0Jn@raspi>
 <CAMB+xka8Fame7aFZSiWEtVcozSTXX8g9MKJu+cycU2vtiSDHmQ@mail.gmail.com>
 <akxjwULa-p6c6IvR@raspi>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <akxjwULa-p6c6IvR@raspi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_114058_698558_96CBB0B0 
X-CRM114-Status: GOOD (  12.34  )
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

On 7/7/26 4:26 AM, Liu Ying wrote:

Hi,

> I need to point out that i.MX95 display controller also has 2 display engines
> and 1 pixel engine, which is something missing in your code.  This makes me
> think that you have no enough i.MX95 display controller documents.
> 
> Generally speaking, I'd say there is a lot to be improved before posting the
> formal patch series.  Gut feeling is that maybe it's a bit too difficult
> for you to get the drivers right.  As I said earlier, my original plan is to
> add i.MX8QXP prefetch engine support first with the posted patch series and
> then to add i.MX95 display controller support, but maybe I can try to add the
> latter first - just need to find a time slot.  However, adding prefetch engine
> support first would directly show a reason to people why two DRM drivers are
> warranted when adding i.MX95 display controller support.

I haven't seen any MX95 DPU patches posted (except for my work from last 
year), was there any progress since this discussion ?

