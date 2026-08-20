Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0413C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 15:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbqnG3DMyrwpxnsNWXHiZn9LCzAndIE7W5YifE88PDY=; b=FeEuZDVTHI4zcfty1sEjMt5T71
	kAJMlO9x2inkXr4bz/qEhrPXfrHogfPhpV4a+p4P5uqhDicQPtAhWZ6YOr5goC1D/7DqznaqqV8bB
	8tANRog7tp0DmeQta30dcOCOwDpph/mGqr/qELEZDEEjTyI8pSCBpWoEAwr5ODQUnqIEcjiejivkT
	VkRzHxC/DQX9V7Ghpra7Ymx5fBrojTCeKY3QXDa95s6qAx4WFJqUb1aNcoSQ4R9QLNrNREvhFZO/E
	nnT9LCWbFvbzdrDvK7BPwpOYxNUoHkv8+URAPY1rQ+9BH4iZC9V4QEeRoPHvS3oDCjJLRZHbzyanj
	QC8PFYsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4S0-0000000Bmb9-0AYn;
	Thu, 20 Aug 2026 15:13:04 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4Ry-0000000BmZo-0rvl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 15:13:03 +0000
Date: Thu, 20 Aug 2026 17:12:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787238779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cbqnG3DMyrwpxnsNWXHiZn9LCzAndIE7W5YifE88PDY=;
	b=ebvlP+j6W3N3VZOYkqOXtyBjSDxTIkLWGo8hBYhqXMqO8RyvjYoztFkOeXPaTb63NTH7Yn
	xmE17shxKckpIdarz/KY4TQMei0BrJ76UDYynjcFcosT73SfxdDjx34XcWsRxnbGGmk+m/
	eRs7LN1UKEMf7WxwsV8OJsA8IoaEzcw47iULE2orQtPjdjp96Acn13EvRscEZQSdBDKsLf
	SH/4RYiVoKiWMj0QXsJNC0k1+1I7i4cb9CYql2Xq1lsULcVXY2I+oT3BQ2Ctn0zLEsh/DA
	vZe8HN4KGcV8dPJnwJ1BqNV3xis0yefjhnO+aaJdU88MbhQGPWE39r1uF2FazQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787238779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cbqnG3DMyrwpxnsNWXHiZn9LCzAndIE7W5YifE88PDY=;
	b=0A0vBAJLYsxDfMa0hzZKbBIqFxDDFr8x8En/dsyxHUEBFmtlIsvduZX+/h1Fa+j46nSZFv
	MbD3+qRtpxXUGfCg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Florian Bezdeka <florian.bezdeka@siemens.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH RFC 0/3] genirq: Allow drivers to respect userspace IRQ
 affinities
Message-ID: <20260820151257.PtSDccEP@linutronix.de>
References: <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-0-3f79a99cadaf@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260819-flo-net-7-2-make-stmmac-default-affinity-aware-v1-0-3f79a99cadaf@siemens.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_081302_399597_EC8419CD 
X-CRM114-Status: GOOD (  15.31  )
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

On 2026-08-19 16:30:29 [+0200], Florian Bezdeka wrote:
=E2=80=A6
> The typical shortcoming of those implementations: They do not honor RT
> relevant settings like the smp_default_affinity or isolated CPU cores.

"irqaffinity" if you refer to the boot command argument.
"default_smp_affinity" if you refer to the proc file.

> Device IRQs are balanced over "all" or "all online CPUs".
=E2=80=A6
> That raises the question why request_irq() is called on "link up" time,
> while the low level vector allocation takes place during device probing.
> At least that seems to be the common pattern. Can someone tell me why
> this is done this way? Shouldn't we call request_irq() at the same time?

The IRQ vector is created while the system enumerates the IRQ-chips.
Once the devices are enumerated (such as the NICs) the devices is linked
with its IRQ. I think an exception are MSI-X devices which could ask for
one or more interrupt and then (at device's probe time) the PCI core
will link the requested amount of interrupts so their actual number
could change.
The driver _could_ request a "managed interrupt" which would be mapped
to a specific CPU. The difference to a "regular interrupt" is that if
that CPU goes down, the interrupt is not "moved" to another CPU. Instead
is remains off and the driver needs to deal with this (this is common
for NVME devices).

If the device is not programmed (as in IP address has been assigned,
link is up) then it should not create any interrupts. So it might be
reasonable to not request an interrupt either.
I *think* uarts do the same.

Sebastian

