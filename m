Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254D6D59F7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 23:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RbaXcDiI9VKQ24EWX+KiopF96b7wPeWxBZ4dioG1uoM=; b=ZCS5u9ypDlW0kzIcoMSCfQtV7o
	rPBM0Qg0yY3pSf609uMZA+w/LOwfetmA/OF69YPknhuVRFZT2bKoXqnC57vCX+43QVJ0mhPBj6CEy
	Qh+jbKyl6DjbBgkwbRcXKqlbmubXzw6NFctSbGb2kiuFIgEA7Hi+o7p4BUg6lGMvhxsBykDjdsq1i
	lQtXc38yBSsr51BVOWJseyB3jz+s296AnDPd/kOIHjp3wCoP7V5nHNJ5kQLepZjKzEPKTlR+rHG65
	cEnN7V3wIZIDJVViFZq66Xebe9LM7YcT3QlprLiXamuWkCa7PJSGM2dta6b25YVcOkLLzdTp6CIES
	9V3GXV5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8piX-000000055nl-3tT2;
	Wed, 06 Nov 2024 23:45:41 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8pfj-000000055Cl-3CHD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 23:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1730936566;
	bh=RbaXcDiI9VKQ24EWX+KiopF96b7wPeWxBZ4dioG1uoM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KS40TnrW8Q4bk1DyTkKfLOstKJyzBhfs5ZulLiWbEpfar7mxzWJ3GXGlcfD+5+93l
	 zr3C+mL+qwB39ZIWNMJEvyFAl6UzFgJ86J39fiM/68WrJQSfXlimFGquBaG+eQKmqS
	 xSYc7YkYYDT2dTzqPpFdCqU1Yb0fbIq2jI7oa5+wsm8V3onLLAtbXQkzTUjLR0D685
	 hwLFYEplpiSWky/Jqv6+gFhqGqxQVDZCiY5hOSO991mliNUYT5BXyu8dev0r3iSLpT
	 LtzmQPPbhvZzhUKiwxWEQLla6BjzFYVPjXdcgSF97fD75+Gq8l3qS6WPrIli+iRsHS
	 WzAC2aVletFAw==
Received: from [192.168.68.112] (203-173-7-89.dyn.iinet.net.au [203.173.7.89])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 780016B4F1;
	Thu,  7 Nov 2024 07:42:45 +0800 (AWST)
Message-ID: <361ed68842698f0f07f01bbd474367908b699bbf.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: catalina: add hdd board cpld ioexp
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Potin Lai
	 <potin.lai@quantatw.com>, Cosmo Chou <cosmo.chou@quantatw.com>
Date: Thu, 07 Nov 2024 10:12:45 +1030
In-Reply-To: <20241106-catalina-cpld-ioexp-update-v1-2-3437bcfcb608@gmail.com>
References: <20241106-catalina-cpld-ioexp-update-v1-0-3437bcfcb608@gmail.com>
	 <20241106-catalina-cpld-ioexp-update-v1-2-3437bcfcb608@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_154248_007631_D42FC1E7 
X-CRM114-Status: UNSURE (   5.54  )
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

On Wed, 2024-11-06 at 16:58 +0800, Potin Lai wrote:
> Add HDD board CPLD IO expender based on latest CPLD firmware support.

Can you please be more specific regarding CPLD firmware versions?

Andrew

