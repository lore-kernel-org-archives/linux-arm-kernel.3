Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86B6C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 12:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+L4x70ZOZGTPWVAoXlLe6xaM+3WtRWF5etY3fPYgCo=; b=LMZFAWrUTEMTrGl4qDYDBTFTcx
	/ethM2FpajtH+lH1vYsblKvB8fjnIBP0M7FJK2luepy/zkbFT7ACeFbtClYVzbJ/1RkLjS1OHFUN5
	0to6jFxnaHgW3ZCL59gNAsUuYweVLu6SC8+k+LZewNEYGXNx5kFFKy1TmiFbYscuyNapUmDWFtk2l
	qP1XYEu9qAY+hTKJgy8LNMesZSGLUZsI+FMJFcSADq48GMVG5OzRdHDPz66//eEeX7tm+6wPB9i6p
	XwiE3eGTirVNEyWLCqGiXjlyKSEcgNrJMjfj3uXdxoplqhygttcrERqTDSw7eWG++IMf/uq4E7kuN
	epbQNKyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udSw2-0000000FEpW-2MTi;
	Sun, 20 Jul 2025 12:14:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udSss-0000000FEfj-26hX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 12:11:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8AC71601F9;
	Sun, 20 Jul 2025 12:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6681EC4CEE7;
	Sun, 20 Jul 2025 12:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753013473;
	bh=MZwQszUH3PF/So1Em/f18h0ala3qC7GcHPl8KVo1lcc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gxCrWSQgaMgOKax1iENySyqGpWXXcbFVmHg0P1y2+inKSXXlOfR/C0Fj4tOvxs5+K
	 RJyOPemUa/w3/M1eNLoEGLH4zKyyMn3N6vUFKngwrKciPNkeJE2Q1NqSSNpWL/d6z1
	 aff2lZfVsHsCbSgIiCbXHukPjZq/4atvY2RgicutZIlwEZODM5ehkBlBj8C4VtdQQf
	 4TnDICR8g6DL7xKBICvnXjg2xiC/6W6oPzuIroCkCdKqYNi/y5Bx9MZh3qWqu1lRVD
	 gkAOFSkDn4ma1wCbXKs7i5VNa9zaxnIqfOkf8dO1iD/twi8A/uuZwAyRYigbgmKmUG
	 cFTJ+lje7nGLA==
Message-ID: <1ea2d93d-1d24-412a-96c6-f0285de554e5@kernel.org>
Date: Sun, 20 Jul 2025 14:11:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/10] gpio: Add new gpio-macsmc driver for Apple Macs
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Hector Martin <marcan@marcan.st>,
 Neal Gompa <neal@gompa.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, linux-pm@vger.kernel.org,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>
References: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
 <20250610-smc-6-15-v7-6-556cafd771d3@kernel.org>
 <8f9fdb3e-9655-44ce-8a2f-c1628c88c929@kernel.org>
 <CACRpkdZdz7eHVjgX-X_UwjJ_qSu5hSPeocuQ9DWSiyjNLU5AmA@mail.gmail.com>
 <CAMRc=McNK3fmbP2UON0EGkjM6gH_1zSHFr_PzZ9JhR7a5swLQw@mail.gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <CAMRc=McNK3fmbP2UON0EGkjM6gH_1zSHFr_PzZ9JhR7a5swLQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 19.07.25 17:52, Bartosz Golaszewski wrote:
> On Sat, Jul 19, 2025 at 5:42 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>>
>> On Sat, Jul 19, 2025 at 2:59 PM Sven Peter <sven@kernel.org> wrote:
>>
>>> top posting on purpose: are you fine if Lee takes this commit with the
>>> rest through his mfd tree?
>>
>> Bartosz should answer this since he's dealing with the merge
>> window for GPIO, but generally it's fine, and it's even using
>> .set_rv.
> 
> Yes, for sure. Lee typically provides all interested parties with
> immutable branches after picking up complex drivers like this. I

Ah, perfect! I didn't know that.

> already reviewed it but for the sake of completeness:
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 

Thanks a lot, especially for the fast reply!


Sven


