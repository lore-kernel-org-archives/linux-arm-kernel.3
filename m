Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F18E65D0B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 00:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1I+8cWLkRZIi/BV4IKPI5W32DddwVLd1vKWfehM2gA=; b=xbGP/nSvAnFcrEH3x5fbolGimt
	A5sXbtavWUcNujVipRT0ISf4OcTkG/6NZ53wo1B71rJfj8N3QuQtKNm4qW+ZP53eG3RxxoxRtL7Fc
	2OkvimUsIU2QuwqJ630ux/YdeTpQpfBCwLwYKGv5K+Ap/FZ5fzCKZ6r2aqwY7MCy1wBI7Ea8T8PeV
	U7TLtwd5ky2IX566DKe/SKhIdVbHg61xiMH5AuSFdpe01Yr7urcb72Iq2PBL32ke4NmryTLGcGVaB
	/SaBXucZfzpOMLFkutCsZ/ShHms+JT7HBp/H9534t8nDGTsE7X2S5JyLiX4h/bkZ+cW+iam+/eOXY
	axM6UfeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEHyH-00000001HbI-1SMm;
	Fri, 22 Nov 2024 00:56:29 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEHw4-00000001HDX-0nLg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 00:54:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1732236841;
	bh=T1I+8cWLkRZIi/BV4IKPI5W32DddwVLd1vKWfehM2gA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RU73TvfE9jQCiayiefvYQq6OgCagPxOTLZXEkNDt96tKd0KZJIgesMdZGbaWIQFUZ
	 9skdEkbMBUInwC+EaFpWF9P40wZD4j8D2Co3U2vvENhpb+kOYeSb5GOA8HQqcDC9Ts
	 pmZhr41GyJH6WlZlalhT59KnweAlhD6WT8ZLmBdipsSiJToUtsDysu0GUoXhyGq/36
	 huXQipJhSIt46ScYrAamK9JGD41x4gWu+T4TPPqwQsDZN2r/FItXuDOlu2dI+znp5b
	 nGpgLY8Ra+nw6nGiYNCwbj29EjuiiYS+kCY8Z1LlAmxZwy8fob0ixrWiY0ekT1eQ9H
	 5npHOCCECq7YA==
Received: from [127.0.1.1] (ppp118-210-73-187.adl-adc-lon-bras32.tpg.internode.on.net [118.210.73.187])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9EF3068F88;
	Fri, 22 Nov 2024 08:53:58 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Patrick Williams <patrick@stwcx.xyz>, Potin Lai <potin.lai.pt@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>
In-Reply-To: <20241121-catalina-dts-20241120-v1-0-e4212502624b@gmail.com>
References: <20241121-catalina-dts-20241120-v1-0-e4212502624b@gmail.com>
Subject: Re: [PATCH 0/2] ARM: dts: aspeed: catalina: revise catalina dts
 file
Message-Id: <173223683845.339623.11713825079934765892.b4-ty@codeconstruct.com.au>
Date: Fri, 22 Nov 2024 11:23:58 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_165412_455162_733C604A 
X-CRM114-Status: UNSURE (   7.02  )
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

On Thu, 21 Nov 2024 12:34:03 +0800, Potin Lai wrote:
> Add following patches to fix issues.
> - revise ltc4287 shunt-resistor value
> - remove interrupt of GPIOB4 form all IOEXP
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>


