Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802A3C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 23:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYh/AD6nS8laDFlVoK9osQ5yY8ZdUZ4VHdWngoSYgg0=; b=Ob/zS6GwGDqPGTfBRJg0FRKJ5q
	fqQvkkpaKGwwoifLdud9GuRHEinHD0cHi6X+c/BSBCQFcufvQ+WSFu9CA616skc42tBNoJFrps1rq
	WyWErFhoTKd99++9UP1/5KAyhEL+xLF2Juz/8Dprw7CKGRj/4LrOg60weo2jwFaIWx8aRlj9jwmJe
	VafTsqMC0hv/oNzHwNm22Pd4mqC/mz3l0iF45kLV29to6WOlRrEY7OBaCsNzW9JUU+yw4o37M8pud
	RvouDb2X3v9xcD7uqn1NDv+BWF6wQxepIsbO/N16CPkGKec6VMihrbuVg+//ulj13y1xqauUIXyX9
	qIx1HOgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8QjB-00000000a1F-3jrB;
	Sun, 20 Sep 2026 23:13:47 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Qj8-00000000a0f-2UDM;
	Sun, 20 Sep 2026 23:13:44 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hp2Gk6LC4zMl2c;
	Mon, 21 Sep 2026 01:13:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789946014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PYh/AD6nS8laDFlVoK9osQ5yY8ZdUZ4VHdWngoSYgg0=;
	b=Zzo2IZ+7qi6H7xWvC3tFER2/ngqV5p+JrH/HN5SMSwbt+09kAzn4P0waANcyPWJIe/GXvG
	HbN2h2ZC+R77nXVxhx1usLtN/2DzB1fy6e44dj/6u2/8ckLgWPGpr18J6iipSxr8XRbx24
	DJWcp14c+bg2jeR3xUE1d3Q4h5irBl4S8qwuYYEugG4P6xrSOXqR2OfM1CS6Ef3bM8PtWK
	Q2p3eEg1O8lhSNtKRDlc3Wt6wk3BHd5qk4dugourPKZwz9+nvc5Sgw9aV6HTq4f88rwwC3
	DNaDQhg1wrJ0lM8YHwz8fYTvt59+gMPv+YjXqzwV++Xc8yJMWfWiCnRQDCPWOg==
Message-ID: <797c63bc-b759-459c-99f2-d5c3146cbe67@mailbox.org>
Date: Sun, 20 Sep 2026 19:17:09 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] media: dt-bindings: raspberrypi,pispbe: Fix example
 indent
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org
References: <20260917002554.362516-1-marek.vasut+renesas@mailbox.org>
 <20260918-amusing-rat-of-nirvana-cda3f9@quoll>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260918-amusing-rat-of-nirvana-cda3f9@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 2c0fc8c46b5874c426e
X-MBO-RS-META: m9q3hrijtsm5o47hjkr9iw4k9kpo396q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_161342_786637_E05965E7 
X-CRM114-Status: UNSURE (   9.11  )
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

On 9/18/26 12:44 PM, Krzysztof Kozlowski wrote:
> On Thu, Sep 17, 2026 at 02:25:18AM +0200, Marek Vasut wrote:
>> Fix two spaces before { in example. No functional change.
>>
>> DT checker reports this as follows:
>> "
>> ./Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml:56: example 0 [redundant-whitespace] extra whitespace before {
> 
> I already posted this for more files:
> https://lore.kernel.org/all/20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com/
> 
> And doing such changes file-per-file is quite a churn, so better to
> combine commits.
All right, please just apply yours, thanks !

I noticed it while running the DT checker, so I fixed it and sent a 
patch, hence single file change.

