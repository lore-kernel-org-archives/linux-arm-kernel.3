Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C09D6E2B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 16:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fpfs5Yw14x8Q64EiuaznPYbDXviY+y9LVMU8kmcpM2o=; b=qXJRHIzi4RssOFIcFZ/Uc+GsnM
	cKmKQ1tYbxL5ty+MdlCkkMorEbhXQPkmpvslUJHdnlyMkbsoG9HF1kBOXhdcjN5i6/+ZRCcezz9BY
	ptZ+Pl4dPINxH5r2ij/ezmD4/56mdin4XwfRuvwmYO+uDOz00RzdWaKY6d/Z+hDxxNgPPJK1XRlWq
	c4CvNeaZuXRIe7WibqjyT9K7mieHgK7iC2TcykY+qcp2TG9soClubWaW1ZiUzrK4ziS/WHQecOVSF
	K6oo/U7N4SVjsjLHPsEJKsNFaD69wHLCIOhy2bvKPCovPTDeuWGkpoL/IukO0pYqlg0MhzQOFF4Uy
	HS+wwY5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWH7K-00000008ql7-1rVv;
	Thu, 18 Dec 2025 16:44:42 +0000
Received: from mail.hetzner.company ([2a01:4f8:d0a:203a::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWH7H-00000008qkg-2csc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 16:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hetzner.com
	; s=lms2212; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Fpfs5Yw14x8Q64EiuaznPYbDXviY+y9LVMU8kmcpM2o=; b=TIvIl8Vye4if2Ep+wXRRuhl8gR
	WLUGm3b4XGDOiVIJAzNDQ36RYVc0PIMcGtm+vUMYeU/BLo7ux1uEnpR+QYNgxOjqyMZi9k/2ie+X5
	6Wt2xx4S3KLgbhHU053QLxSOXsaLXm2yEdk8tuLoY1ptfkmIfvoA3QHTPKbjyC8JQYKYHl6o7WuWN
	9H1uH3ptIGkM3VAbbKwZs/rcmoXTxUFdvVt5/1V+niTaVwGxrAnMeXyC9vA2KT4AH6vbKZkXXsUQJ
	tLcgexQZwbXIJFwEft0vqfXUfjUNfZEdWmTJWiuvfM73Jce7kZHmM1UCW/4kj/a07g/KAncJeNHzx
	aZtKwvpw==;
Received: from nbg1-vpn1-entry1.hetzner.company ([78.47.119.212] helo=[10.1.220.249])
	by mail.hetzner.company with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.94.2)
	(envelope-from <tan.siewert@hetzner.com>)
	id 1vWH6o-00FlwY-9i; Thu, 18 Dec 2025 17:44:09 +0100
Message-ID: <b10a233e-02c3-4b02-8f11-098f6fb8197c@hetzner.com>
Date: Thu, 18 Dec 2025 17:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: aspeed: add ASRock Rack ALTRAD8
 board
Content-Language: en-GB
To: Krzysztof Kozlowski <krzk@kernel.org>, Rebecca Cran <rebecca@bsdio.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Cc: Billy Tsai <billy_tsai@aspeedtech.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20251218161816.38155-1-rebecca@bsdio.com>
 <20251218161816.38155-2-rebecca@bsdio.com>
 <5aa36c56-798a-40cc-b0b8-be3f7c92136f@kernel.org>
From: Tan Siewert <tan.siewert@hetzner.com>
Autocrypt: addr=tan.siewert@hetzner.com; keydata=
 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
Organization: Hetzner Cloud GmbH
In-Reply-To: <5aa36c56-798a-40cc-b0b8-be3f7c92136f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: tan.siewert@hetzner.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_084439_957312_5568CB00 
X-CRM114-Status: UNSURE (   9.69  )
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

On 18.12.25 17:21, Krzysztof Kozlowski wrote:
> On 18/12/2025 17:18, Rebecca Cran wrote:
>> Document ASRock Rack ALTRAD8 (ALTRAD8UD-1L2T and ALTRAD8UD2-1L2Q)
>> compatibles.
>>
>> Signed-off-by: Rebecca Cran <rebecca@bsdio.com>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Tested-by: Tan Siewert <tan.siewert@hetzner.com>
> 
> How was the binding tested?

My bad for sending the wrong trailing header in v4. Tested-by should've 
been only on the dts instead of the dt-bindings+dts. Either way, `make 
dt_binding_check` was what I did to check if there are any errors 
produced for `asrock,altrad8-bmc`.

-- Tan

> 
> 
> Best regards,
> Krzysztof
> 

