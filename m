Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06544C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UUqUozeRUbn4nbrTWMJQlf6Jo77GV6T+nGHxfg9jgGE=; b=T8hSNYOy915dvi
	vIPkEk4aXvN6zBIoS6fzTw3Z31s3yyFL/buWS6zZAcmW0nrI4ToS6/ZC/XuA3npM6r7WwL11/fmLl
	yJVazaZBEmhKSvEsjHPB4hgVN40lGKQfsaesYj0p0yNG17UCaNJtkI4HFmOwRW/RN599LC7gZZZm/
	pF4r1K6UnImhTop3rf1uME9Z6LpV5p+H3Ts+ELQR2frPzrbVrfCfLQSOVLaoiiAjFUiMn7cuOXqUG
	HmaSwaGOons3wmofJzvc1/Mjf0WTfD+oZIpWTKLKj1Kjm7d9AjEVQytEEeLViZd0cjZxQux/lypX/
	NEupxYGnVGm+lSqB2DWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjj0-00000008XHj-0kUe;
	Thu, 27 Feb 2025 19:39:14 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngFK-00000007yZa-2ICY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 15:56:24 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 69D45A1B66;
	Thu, 27 Feb 2025 16:56:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=UUqUozeRUbn4nbrTWMJQ
	lf6Jo77GV6T+nGHxfg9jgGE=; b=Oo9w98fRv+aKEJIHDPo3VPKA/ET9wpJTZce1
	Cx4ygAyZrV9UN67wIN0w64ESKqoHTC4VNIUK90yTwJtt+nX4sn78J+c3iZVCngfY
	VvO0IbnWz+omdAWXRy53lKUVJXRaazsqlsGZz2Js3isGNuf1iayMxobZr/olXBzs
	LbV0GQ5ChYuOmidh+1HHoXC4MIlHtg/9FqO3L2ejIW8NdA/lQ/7dcboXLHYypuy0
	OINcAKjJLDQUtbrSTgQti3MnaISSfv9nDkPgln6d+JqmONBr4lq64mwfYDt3kYZZ
	HrBPQwbvAomqpV/iPHO5ijQaWtfNqZxYh6sTZW1qUceCsAJFrjTt0MU0Xdq1IO9+
	AjrW5+Ulrb6vWrF2VOCslJt63xG7ZsdUIF/9PUkJxnjJ1h5s/aAmCIVym3xnrjSe
	kZ4xhFipH/+CzIdQFpkrhfrkiiZrO8hIeOS6K2SiuRQebNpEHPFcdw3zmzbvNiWK
	Mi1GQSvvUdRqHeF5H6QA48jdrUbbEXbl2ktFj0mMcwB1J2vjlRIovcSYrXswMfw7
	azPlssEGN8L3JC1hHgGHu3spJP0BfnioPmIdIFbf/LgN8OCygGBbM04EQafhupY6
	vqdDOyND5XN4ShcjVuUNt/bgvS0hwDanT844Bm9FUVWfKCgnI8FldfdOMoEm0vHC
	xeQFLPU=
Message-ID: <077f23f1-3e5f-423c-aa97-ee7fcdf1475d@prolan.hu>
Date: Thu, 27 Feb 2025 16:56:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] microchip-tcb-capture: Add Capture, Compare,
 Overflow etc. events
To: William Breathitt Gray <wbg@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Kamel Bouhara <kamel.bouhara@bootlin.com>
References: <20250211151914.313585-3-csokas.bence@prolan.hu>
 <Z7h0AXV1zlgp9Nw-@ishi> <8fb9f188-3065-4fdc-a9f1-152cc5959186@prolan.hu>
 <Z7vihBqOgP3fBUVq@ishi> <bfa70e78-3cc3-4295-820b-3925c26135cb@prolan.hu>
 <Z7_xTQeTzD-RH3nH@ishi> <20250227135330.GC182392@tpx1.home>
 <Z8B1LDT-n2XTTp8q@ishi> <202502271437280a6701d8@mail.local>
 <Z8CA9RTZWChh9cJW@ishi> <Z8CKQvRjqH9lwzgO@ishi>
Content-Language: en-US, hu-HU
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <Z8CKQvRjqH9lwzgO@ishi>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852637760
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_075623_102402_3AE9B65F 
X-CRM114-Status: GOOD (  13.42  )
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
Cc: linux-iio@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>, linux-kernel@vger.kernel.org, Dharma.B@microchip.com, Jonathan Cameron <jic23@kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On 2025. 02. 27. 16:52, William Breathitt Gray wrote:
> Sorry, let me step back for a moment because maybe I'm trying to solve
> a problem that might not actually be a problem.
> 
> I see functionality settings available in the TC Block Mode Register
> (BMR) that can affect multiple TCCs at a time. Are these BMR settings
> exposed already to users in someway? If not, do we have a way to
> introduce these settings if someone wants them; e.g. would the
> AutoCorrection function enable bit be exposed as a sysfs attribute, or
> configured in the devicetree?
> 
> Finally, if there's not much interest in general for exposing these BMR
> settings, then I suppose there is no need to change how things are right
> now with the microchip-tcb-capture module and we can just keep it the
> way it is. That's my only concern, whether there are users that want to
> control these settings but don't have a way right now.

My knee-jerk answer to this is that if they do, they will bring it up by 
submitting a patch or bug request. But I'll let others chime in, we only 
use an extremely small subset of the features of the TCBs.

Bence


