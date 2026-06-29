Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77520C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 07:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZvz0aou+WZ6xfcW7DezVt52N1axyhsLIrxTaxT5eWc=; b=obaol8gxvyGp4LYHABGWiWtpkh
	06qLjevAB6texGk6u0RAjh+bg7JEFWfRfSrNP3ktZqUUiHcm7CCHDCT1sd/bk3erqWs7v+XvwMwKR
	MTyhxP6TUK4uPn2MFZaZahIO/g2CC8tP61kpXOWY0lt9R7RjdYTZpPuAzHmka4liX5/2ng5kMrhY1
	MAAP3zF6SRMEzkJOl5SQ8C+1wgiGJUNafT54b4cOBAT/HrfrsnM83vWqDjzBa+XEs3WCv8ospFwbw
	A8jZe4KI+G1YYCmkOtRmf2F54PPKXoM8iw77xu9aI6XUojx1AzgcrgwCudaSdv5LxIVuJDMy6QtwX
	CNP3Fcyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6Q6-0000000DtPh-0stj;
	Mon, 29 Jun 2026 07:28:42 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6Q2-0000000DtJx-29ok
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 07:28:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A0E1F1A0C9B;
	Mon, 29 Jun 2026 07:28:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 684445FF96;
	Mon, 29 Jun 2026 07:28:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60445106F1504;
	Mon, 29 Jun 2026 09:28:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782718113; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=rZvz0aou+WZ6xfcW7DezVt52N1axyhsLIrxTaxT5eWc=;
	b=uJzRZS/e5R+g0fsbl5WTvQKTKVP43DQ+Fv4j4TKDsgOU03SLdpkMV/v/dIA5Ic3OLuSXl4
	jStlfqA4nT5HzgjPB5OzmeZ8UOlDgwJr2ZW1jfw9G2xQjPjZSd6mFulSBLZq8aU8LG+Y58
	jvMQi1v7a26BOOnPUZHJvRVr6+7Mq56EPv//Z1knFTFGzxgb6XV7w0Y43h94fndPuac8cj
	n71jYXg7dbiuVaavrBCRORkBtZrSZW0aUp/s0ZRcbALbE5Zs721ShQIHjGC9SusDZsHrRR
	Xs9sWzc5aOHJ02GwWiC5LkR19929fMNP1ZJdo4SgYzXHPDg46qqsXYoRWbrgpA==
Message-ID: <af735626-e376-453e-b215-6d0eddd5868e@bootlin.com>
Date: Mon, 29 Jun 2026 09:28:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v8 03/12] net: phylink: add
 phylink_release_pcs() to externally release a PCS
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Saravana Kannan <saravanak@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
 <20260618125752.1223-4-ansuelsmth@gmail.com>
 <a271385e-302d-45c7-a1df-aebd380b427b@bootlin.com>
 <6a3fc312.6161eb1e.3441bb.c0de@mx.google.com>
 <178defc6-8e60-4b0b-b3b0-f0f2a4003b68@bootlin.com>
 <6a421c2d.1e0bfc4f.b2eb6.06fb@mx.google.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <6a421c2d.1e0bfc4f.b2eb6.06fb@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_002838_706874_864F5358 
X-CRM114-Status: UNSURE (   5.94  )
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



On 6/29/26 09:18, Christian Marangi wrote:

> Nobody stops from implementing custom parser in fill_available_pcs and
> return a PCS pointer created directly by the MAC. (In such case late and
> release won't be needed as everything is present when phylink_create is
> called)

Ah alright :)

So my only request then would be to update the phylink porting guide to at
least point to the PCS documentation you're adding to say that the select_pcs()
op is deprecated :

https://docs.kernel.org/networking/sfp-phylink.html#rough-guide-to-converting-a-network-driver-to-sfp-phylink

Thanks,

Maxime

>

