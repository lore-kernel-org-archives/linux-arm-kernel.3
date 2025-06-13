Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60203C71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 03:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e1p6/5wXJ3cC6mmHN/REy+JAlhOgHjO6oA0FGENkSaM=; b=feOY+11JCpNGaISrDBWJX5VBnO
	/FjATghZFFwY/WqRWx3JMvE7JzF6wmerEf92LIqfmDRpOo7maGE0ghLCO4Puqhe+KoJG+n71cSKud
	4vwBoBgz/tV2E8jgZHLTJHXOW5Ut4jz3//IbEhhNvKqc6JrKGtk0NNi1koFXeTfbm7h49FahXuqBF
	3HovozLU5AFAywGMCjAp6/8BvEb5+uYN/ug3idtukS9rHAb84HN0S65ESG8dmDskQM/zD+tmbmpHO
	h1aGVQRaLH4sEBuWwcBu7cjoqsUeDJfiu6nbz7F6zuqQBmWXuw0KYpVz+rDYcbAE7SDcuTfIXXrc+
	G4hkz9sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPvRI-0000000FHAe-29An;
	Fri, 13 Jun 2025 03:50:48 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPvL6-0000000FFcs-093C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 03:44:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1749786259;
	bh=e1p6/5wXJ3cC6mmHN/REy+JAlhOgHjO6oA0FGENkSaM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kh0xw04Vx0uKRUojByFDJGN96V6mQZJEqdgMb+sFZJrRXPR0k/Sg2AOzZJ9BmhQnz
	 ZymbgSXTWizHqtKlgh3VnX1QbxpDEHjEQRxh1mYWC4OFD9sDiwuIraTJ07M8GcuseX
	 x+hTeBuRnU5+IdVQwQenGCtRXg2BQynYziyLe4bbX+/hUSrlDChe+APzcnpTQ7H5ky
	 mLvboB8v6SZluNolUQ9O+b5dhWdHaySADQll+syYIRWIvzvWrxytIl7ob8jjULD2od
	 8sq31tiLWR80BcymTcBgJeOL2+EY+UAlnvz7fqqn1/1DVedrXC2LqHCi/6xcvSoeqX
	 xlQJ+/Qioix+g==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id EF2926699C;
	Fri, 13 Jun 2025 11:44:16 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Patrick Williams <patrick@stwcx.xyz>, Potin Lai <potin.lai.pt@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>
In-Reply-To: <20250611-catalina-mctp-i2c-10-15-v1-1-2a882e461ed9@gmail.com>
References: <20250611-catalina-mctp-i2c-10-15-v1-1-2a882e461ed9@gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: catalina: Enable MCTP for frontend
 NIC management
Message-Id: <174978625629.315392.14738595529417409352.b4-ty@codeconstruct.com.au>
Date: Fri, 13 Jun 2025 13:14:16 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_204424_268956_C15457E9 
X-CRM114-Status: UNSURE (   7.22  )
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

On Wed, 11 Jun 2025 01:02:09 +0800, Potin Lai wrote:
> Add the `mctp-controller` property and MCTP nodes to enable support for
> frontend NIC management via PLDM over MCTP.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


