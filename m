Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86190CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 12:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+pg7I8Mbwg4j0XO5DjLnEMwVuYoSblXIRe51x3rQuQ=; b=y/kAZPDlD6avNhp/cs0YJou/b+
	LlAlWFDfO10rUmXbIpE6IxRZ+fFYP950XRD7GVOJcgOHxRG7Kw0GXRTaqmgNXdeBHVsjhxcD5OYXh
	aVSd0bBoR8P8iakWCO147CigCv2D0/Z9MOzfa+neTgPUo7fDrzofsOUh0h8Rf+PaewuREpQNaevNe
	Mq/xfBI2p3foWW+uclO+tVRpm7l8quxLAKo46j9MpmFsG2wrIUTwaJUu55A4uylv6FMsalHYYcsH/
	FHGPejmICSRrn6JB4MxRaVV48zAJ0YueZY2Q7ILCh41e5XkwI5OAyEuAHZHdEF1y5B3CeAe3M7ewD
	ilOMzqZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwqH-0000000FaHs-3IYL;
	Mon, 18 May 2026 12:13:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwqG-0000000FaHf-1UIO
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 12:13:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8+pg7I8Mbwg4j0XO5DjLnEMwVuYoSblXIRe51x3rQuQ=; b=Xnp+7OGTvt13GaLRVeB6osuNQ7
	tWJSSX4i4iFEVmx3nZjyVZCeJ79sV/XEHJ8wDp5Lv3jkXsfy+Ot6euaHOZrLQk9GxTXzk5BokkYs+
	cHB+WEmAo4Rd3rqNtEOI5SJJTQ71LBbRefwgbsx+/Umk8K9tVwj1gfqAX12BVqX8Z56lXdbIp2FPn
	0FP4B6xEXxjPSxrOjzuAI5gXqA/YRK0HqtaffLe7oQEpfMgrys50BuH01PgmXJYT3gB7q6GtAqI10
	70cKs5y5byBTTGq6JNKTYiWE2MhYbU6a+aetMLjSeKE93vce5LVd62Lfg3wh0Dth+9wFrCRHEFr9K
	lDKrAHhA==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwqC-0000000B5M5-1azO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 12:13:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8+pg7I8Mbwg4j0XO5DjLnEMwVuYoSblXIRe51x3rQuQ=; b=h6zoxgCfEzO5HKeM4/v8EtMWON
	whcBygWdkmhNKwZCFsl+iokpvANX/698CIKgRWqNW88Y1fgmNUxMSKfaaBrIKSjqZNaobeZzcVXJN
	ivkjIstgzb8zRMlkJ6VM7s1Gc4eGegr+SuJ+FDnGMQCRYShuV4BKsdpZmTmqr/kYZLLc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wOwpt-003UGf-TX; Mon, 18 May 2026 14:12:41 +0200
Date: Mon, 18 May 2026 14:12:41 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch,
	devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Message-ID: <ddb781dd-e117-4f9a-a5a3-94c192d8c2ef@lunn.ch>
References: <20260518033440.17569-1-prasanth.padarthi10@gmail.com>
 <20260518033440.17569-3-prasanth.padarthi10@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518033440.17569-3-prasanth.padarthi10@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_131300_808422_117C416C 
X-CRM114-Status: UNSURE (   7.59  )
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

> +&mac0 {
> +	status = "okay";
> +	phy-mode = "rgmii-rxid";

It does not matter if this is what the vendor does, it is still wrong,
unless you can show the PCB is adding the delay.

   Andrew

