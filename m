Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE1EC02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 23:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6fywcASxWYAyXe88HcHEfSTs2+ci+gNxhmlmjs1+cpQ=; b=4qEyOnEs4Kd8PBQ9qIfIbpNeni
	gGJ2gKoA23ItpBPS1Q8CaL3Fu63vikcaVw4eSYRbYMbByKPUpLRLtACENuunSxv7DnJdHmBPb7guk
	6iwn/0f1mJ5WA5Er1FQJ+V0KzwzMIHmrmYbz+AHyFT7Scf9OWxgZbvAjvlP/dJlPU1pIVxLCkmkO5
	k36eEHoOPyFvYRSxocOFtty77M6dRw4BzGBe9Xuy3KnAIYe65IZP9erX1giRhtQCIKHSyFNys34zE
	7k2q9KP1s023oefV0dbpHVsDsy/m4QkhuMifbXiU8jeZg9guv8Dbb71tb5SgVUashHD3/Yl6+o3jr
	KcGS1d9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfSmM-00000001rxi-3qmd;
	Tue, 04 Feb 2025 23:56:30 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfSkm-00000001rpB-1ybG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 23:54:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738713285;
	bh=6fywcASxWYAyXe88HcHEfSTs2+ci+gNxhmlmjs1+cpQ=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=SpMfykSluKgdk8YeirzJeNWJPS6WWBTrvit5wimmjLcvuMQdWaUsPh4ytqTNWoMOj
	 3TIKvTfWx4ToxQe+CStSaV5W3cA2HKgwoWnTErraOKCRglgNaz9YF/bP6B85VU1UX3
	 1Eh2/Yt5lGqp8aW5C/Q/a8JSS+hE5JMkMQtrA4g7AMp645tnHm5KgExy9sUd/V6svF
	 R4u9YssW0MsdCMYQSA5GrX95gSQQfct4UFdEmc7ef+KscsF6uv31LXH0AbNfSF1UCd
	 G9pEjBB4R2LOdPPtAQH2BfzWmUUZS2pijenEHUmrwCh7c2H/5g7hA5Cs2NV1Gzakqw
	 KZDjolH9iCcMQ==
Received: from [127.0.1.1] (ppp118-210-185-209.adl-adc-lon-bras34.tpg.internode.on.net [118.210.185.209])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 27CE77104E;
	Wed,  5 Feb 2025 07:54:43 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250116090009.87338-1-krzysztof.kozlowski@linaro.org>
References: <20250116090009.87338-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: aspeed: Align GPIO hog name with bindings
Message-Id: <173871328303.403310.37142305555247656.b4-ty@codeconstruct.com.au>
Date: Wed, 05 Feb 2025 10:24:43 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_155452_718873_F4E437F4 
X-CRM114-Status: UNSURE (   7.09  )
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

On Thu, 16 Jan 2025 10:00:09 +0100, Krzysztof Kozlowski wrote:
> Bindings expect GPIO hog names to end with 'hog' suffix, so correct it
> to fix dtbs_check warnings like:
> 
>   aspeed-bmc-lenovo-hr630.dtb: pin_gpio_b5: $nodename:0: 'pin_gpio_b5' does not match '^.+-hog(-[0-9]+)?$'
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>


