Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A703CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 11:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFCFqJJ2yYgftGOHrDOB1eCkuMcyYEeSx/3Uy2cezt4=; b=rVneANVQ3hdjyCeO6xRoQVKlhV
	kfYD3pmTTJCnJ4jdTKpD3KQc8eJWsrIF1qAuto46elHvSSdDeVXbCPMCU++mMMT2iIyCWzwWS7rSV
	mvqhL2IqIMY8mAWNWnhGjbvNR0pquObP0OkkhDs9Dp3o7XnOXPIb2dhyymdsSGAH61nfjzQG6O0o+
	WudkFzoiZInRe/ua8oqqiUY7Z5LuD2dc8Kp0URQOMZhXwcqgUrX48dqkzY0TIOlWR8baJzMwpvWBV
	NvTGInKo3cSzWZjuCOmHMF1k3Q6FWbdHBIestcmOVLZUIKJ8zPCnR5FFjGJbV4so7AmHBoIf1S4aA
	lWVtYlCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDH6-0000000HJ1L-2tN5;
	Thu, 18 Sep 2025 11:58:08 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDH3-0000000HIyZ-0Cb2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 11:58:07 +0000
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758196681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sFCFqJJ2yYgftGOHrDOB1eCkuMcyYEeSx/3Uy2cezt4=;
	b=G7ugUkXqxMUCE8FsjPJQ22Hre4q2kdem8h6hk/uCjbvJpROARfJIrnkpR2PvX1RIAGCr0S
	EkqHK+glaXITYC8n6aXQwpimzX3qXHBrkbnQGQAzYxsQHlAJgBQwZEj/b0xou0S6N91qmP
	rVTcAMISTLPphUqyYo8jAbLHn0mIbR4=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] ASoC: pxa: Return -EOPNOTSUPP instead of -EINVAL
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <81926717-0884-4df5-aaf2-a938c58ce892@sirena.org.uk>
Date: Thu, 18 Sep 2025 13:57:47 +0200
Cc: Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <56ED1961-1092-46F7-B2B4-218AC279837E@linux.dev>
References: <20250918112102.64314-1-thorsten.blum@linux.dev>
 <81926717-0884-4df5-aaf2-a938c58ce892@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_045805_784039_3C691CD2 
X-CRM114-Status: UNSURE (   7.63  )
X-CRM114-Notice: Please train this message.
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

On 18. Sep 2025, at 13:33, Mark Brown wrote:
> On Thu, Sep 18, 2025 at 01:21:02PM +0200, Thorsten Blum wrote:
> 
>> Return -EOPNOTSUPP from mmp_sspa_set_dai_sysclk() instead of -EINVAL for
>> unsupported clock ids, and remove the obsolete comment.
> 
> Why?

The comment says "not supported yet", so returning -EOPNOTSUPP (or
-ENOTSUPP) reflects this more accurately than -EINVAL, unless I
misunderstood something.

Feel free to ignore this patch if it's inconsistent with how other
drivers handle this (I didn't check tbh).

Thanks,
Thorsten


