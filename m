Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA0AC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5NZkbZfp4QWxq6NIlGw0GUtfJE7/9+ScOiFCYA8JVFU=; b=aPyTpSu5mi5TXkdTIUS332tOMU
	xAY7gGVhiA4IXuY//AIzNzFY+U+Sh+5AF2BdD/CLSuq0NYrTYbVOcJYWcCqTL8eJz6JcQyBGY4lXB
	PBEMMl99nRMNkla07D/2kCpo3u5AZZhcfwHpNQKUHERIcTMVvMv08s1qRBOKVOeZMeg6wU+yPHvc+
	udRo8a4I1GufYnmz5dLGTPKtQK5mke5wXfHlpuPx50Wjr0VJdVV6AA/PflsomTAiMs/zTDQyd2z+w
	JuXkbCkPqsdhDbjkGAx+/yGOAMdQ/wAMO8Rx0atfeoWDo9E2zYQIOVp/+ljKb3kiG5y5qTCdBOTZm
	B60BlSdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RZJ-00000001kSF-3O6H;
	Fri, 04 Sep 2026 10:54:49 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RZG-00000001kPR-1xLx;
	Fri, 04 Sep 2026 10:54:47 +0000
Date: Fri, 4 Sep 2026 12:54:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788519282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5NZkbZfp4QWxq6NIlGw0GUtfJE7/9+ScOiFCYA8JVFU=;
	b=V3+nX3+dicgX0EdZFKSsoPUtS1mpf6m3jZmiy99PBeEDoL+7yaIxWWlLzWOsSzF3Dm34sm
	OBQXEXK55pW33YQgXBliVZLSs1UJ7UDgENPmtM30IaX5oAz9zRlTet17nlV2MIJxsSbXaI
	YAKv94l2EbIQpZ6ZRNIAHBA618vbVMXWLEhxOMfiq2l2pI2tq32X1hU0kqDkBZgKkf+KO+
	bseqYFHHWZVjJnDTYSS9nEpN8NFDVnHLh1/z3h2KNu0NZXHWBJxINzMQUiDyFterUNT5wR
	vZfKHz0YW8i8RNECZMOwCgHB39Kzf+Zhii2QcGxlRiR+vp2cK9a61tScgWKVVg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788519282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5NZkbZfp4QWxq6NIlGw0GUtfJE7/9+ScOiFCYA8JVFU=;
	b=q0Qjfy7Z4Y/z6m3z8RSkHYN3a7Y18qDnT/VCW+8eyKAEaQ3eS1i86ezFykReHCm4rfq9O5
	6rXnMrrJzU5/z7CQ==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712-rpi-5-b: add spi0
 interface
Message-ID: <i6fbcajsiol77m6x3dbcay6bgpxwhy5axayb2633yklxl6rswl@luknor3eryoo>
References: <20260904-bcm2712-spi-v2-1-6f8fdfb030bc@linutronix.de>
 <apqej5QyjOHu702A@apocalypse>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apqej5QyjOHu702A@apocalypse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_035446_654699_EF65F599 
X-CRM114-Status: GOOD (  13.02  )
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

Hi Andrea,

On Fri, Sep 04, 2026 at 12:33:51PM +0200, Andrea della Porta wrote:
> Hi Gregor,
> 
> On 11:24 Fri 04 Sep     , Gregor Herburger wrote:
> > The Raspberry Pi 5 routes the spi0 of the rp1 chip to the pin header.
> > Add the rp1_spi0 node and its pinctrl node to the devicetree to enable
> > the spi interface.
> 
> Just a nit-pick: in the comment it's stated that the spi interface is enabled,
> which is not true since rp1_usb inherit status="disabled" from its node
> definition. This is fine because the user would probably want to enable the
> spi interface through some overlay, so no need to resend the patch (at least
> for me), so:
Indeed. It could be rephrased to:

	Add the rp1_spi0 node and its pinctrl nodes to the devicetree to make
	the spi interface available.

@Florian: Should I send another version or do you want to change it yourself?

Best regards,
-- 
Gregor Herburger
Linutronix GmbH | Bahnhofstrasse 3 | D-88690 Uhldingen-Mühlhofen
Phone: +49 7556 25 999 35; Fax.: +49 7556 25 999 99

Hinweise zum Datenschutz finden Sie hier (Informations on data privacy 
can be found here): https://linutronix.de/legal/data-protection.php

Linutronix GmbH | Firmensitz (Registered Office): Uhldingen-Mühlhofen | 
Registergericht (Registration Court): Amtsgericht Freiburg i.Br., HRB700 
806 | Geschäftsführer (Managing Directors): Dr. Wilfried Wessner, 
Katharina Kopp, Alexander Gieringer

