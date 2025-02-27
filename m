Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4655C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 14:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33Zkbezka9OfCIWTsVns3mWdwFBxDhYSMXVDe6+Lw0k=; b=F50TCX/RYtZYsQ5QUBGHAF412R
	PxjMqS+yT3dx+ZbtW/rTSGLu30eI93d30BmMrIh+WJu0BiuhTUfj3d9nFx1Vkj8IU/xUB68VRfim3
	GRIDxmTFwLxXK5XjhTAulP+ymZhA/H4uhwPBIHO8Qbtgy0PjYZMhKk7HeaNiQYZET+sJ+9EA70VL+
	sy4Hlc6soVA22bmsJRjhhAsDvxdMJ8y2JJhaXcISMceKznV+TSgY9+6lgO2U8ZC7QJZaLs2gdD2Ex
	j8O93wwxPOvOQtpDTe0X8HURPugKa0VQl3+cyTENPUs6+TIM2t0xlh299hYExg+7bgFQYTvKToeY7
	o0h7gWLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnfHC-00000007pbz-3CMS;
	Thu, 27 Feb 2025 14:54:14 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf13-00000007lIM-18dI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 14:37:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3E5344409;
	Thu, 27 Feb 2025 14:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740667049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=33Zkbezka9OfCIWTsVns3mWdwFBxDhYSMXVDe6+Lw0k=;
	b=dk0X7NKEVYsxppSgwZJT9Cl4v6bC+OLX5Vmx2gRds6URW2FtlH7DWtL/ktNKz6Hfn5iVom
	qzhJfN8BZtIq81Hy14qu4NFA6a4ujjeC16dxfAOp0pnNU6caLcYUxx5ee/UNVATfVm2/V7
	bN3/2JcK42wVnTgELIJlBivuHQ4e8++8vOVn2m1Io5EoL9zn5RJckYSt9jZfgcTO2kNE4G
	GQAjfAEZD7OQGN8usEeKYCS92aFwnHcbdc/uiRMSYGwW6zn5j7VqbasUEAH9m4Am/WQd76
	nmjx7ywjfblHHfh+pHpUcuwVs8WqzngBqMYmOTry8btQ1NscKXTD5xhOn2I9WQ==
Date: Thu, 27 Feb 2025 15:37:28 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: William Breathitt Gray <wbg@kernel.org>
Subject: Re: [PATCH v4 0/2] microchip-tcb-capture: Add Capture, Compare,
 Overflow etc. events
Message-ID: <202502271437280a6701d8@mail.local>
References: <20250211151914.313585-3-csokas.bence@prolan.hu>
 <Z7h0AXV1zlgp9Nw-@ishi>
 <8fb9f188-3065-4fdc-a9f1-152cc5959186@prolan.hu>
 <Z7vihBqOgP3fBUVq@ishi>
 <bfa70e78-3cc3-4295-820b-3925c26135cb@prolan.hu>
 <Z7_xTQeTzD-RH3nH@ishi>
 <20250227135330.GC182392@tpx1.home>
 <Z8B1LDT-n2XTTp8q@ishi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8B1LDT-n2XTTp8q@ishi>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekjeejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopeifsghgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrghmvghlrdgsohhuhhgrrhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheptghsohhkrghsr
 dgsvghntggvsehprhholhgrnhdrhhhupdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqihhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeffhhgrrhhmrgdrueesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopehluhguohhvihgtrdguvghsrhhotghhvghssehmihgtrhhotghhihhprdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_063733_445420_96224CCE 
X-CRM114-Status: GOOD (  27.86  )
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
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>, Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Dharma.B@microchip.com, Ludovic Desroches <ludovic.desroches@microchip.com>, =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 27/02/2025 23:22:36+0900, William Breathitt Gray wrote:
> On Thu, Feb 27, 2025 at 02:53:30PM +0100, Kamel Bouhara wrote:
> > On Thu, Feb 27, 2025 at 01:59:57PM +0900, William Breathitt Gray wrote:
> > > Let me make sure I understand the situation correctly. This SoC has two
> > > Timer Counter Blocks (TCB) and each TCB has three Timer Counter Channels
> > > (TCC); each TCC has a Counter Value (CV) and three general registers
> > > (RA, RB, RC); RA and RB can store Captures, and RC can be used for
> > > Compare operations.
> > >
> > > If that is true, then the correct way for this hardware to be exposed is
> > > to have each TCB be a Counter device where each TCC is exposed as a
> > > Count. So for this SoC: two Counter devices as counter0 and counter1;
> > > count0, count1, and count2 as the three TCC; i.e. counter0/count{0,1,2}
> > > and counter1/count{0,1,2}.
> 
> [...]
> 
> > > Kamel, what would it take for us to rectify this situation so that the
> > > TCC are organized together by TCB under the same Counter devices?
> > 
> > Hello,
> > 
> > Indeed, each TCC operates independently except when quadrature mode is
> > enabled. I assume this approach was taken to provide more flexibility by
> > exposing them separately.
> > 
> > Currently only one channel is configured this would need to rework the
> > driver to make the 3 TCCs exposed.
> > 
> > Greetings,
> > Kamel
> 
> Skimming through the driver, it looks like what we'll need is for
> mchp_tc_counts[] to have all three TCCs defined, then have
> mchp_tc_probe() match on a TCB node and configure each TCC. Once that's
> setup, then whenever we need to identify which TCC a callback is
> exposing, we can get it from count->id.
> 
> So for example, the TC_CV register offset is calculated as 0x00 +
> channel * 0x40 + 0x10. In the count_read() callback we can leverage
> count->id to identify the TCC and thus get the respective TC_CV register
> at offset + count->id * 0x40 + 0x10.
> 

We can't do that because the TCC of a single TCB can have a mix of
different features. I struggled with the breakage to move away from the
one TCB, one feature state we had.
Be fore this, it was not possible to mix features on a single TCB, now,
we can have e.g. the clocksource on TCC 0 and 1 of TCB0 and a PWM on
TCC 2. mchp_tc_probe must not match on a TCB node...

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

