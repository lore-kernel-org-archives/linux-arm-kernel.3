Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722BCCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RvEyUa3aBwqq9pzCfPLROE7hTwVNse4Jw4z6I6A3IUI=; b=GpCqurajyEexLEJN+Fd+FJTyXQ
	3b50htZN7qnVCNA3Cjjh8aKL30BuwdZ/EeG/dJBYZNtwcgNMbZnY9c/CgXtsU/c/A23W2Uqedw0YL
	79nVtKbmw4xoxT5WXdNgamoid7BG57aHxGL+8owGGFXn42FsfalPcdBRmhsP2iA7WTrYweZ5f4S3c
	g86dpaC6rlMmuA6xXUywcqO848K9/zKpEggsRuDSZ90W0dLqJVlMvF4m+VL316UoeZfJnVEWUKBkS
	jdKYoZnnYFYTZydT7U5pTpoKBi7pq8EKB/W6Ai6hl4LMvqkLhRHyT+2JkqytX/JTyDnlT8HpHhk/a
	RE0LZhsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugXO-00000005V83-1Vla;
	Sat, 06 Sep 2025 00:12:14 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uubal-00000003wjX-2LbV;
	Fri, 05 Sep 2025 18:55:24 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cJQX723qKz9t8p;
	Fri,  5 Sep 2025 20:55:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757098519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RvEyUa3aBwqq9pzCfPLROE7hTwVNse4Jw4z6I6A3IUI=;
	b=jDe8laPw/CLEhVt/gns4C/GwvDOWL06hGuCYyYa3+2qOpGK8EPAzeZdJvNlG1HNMmx/V77
	ggPWH+R6vZ+2gZ11rp+ywtzQ/R/L7+W+HPQb8NzF5cK7cWoIcA0+KFtqQZQpDOOOR1PyP2
	R87zmaaRv9s9XE5e7Y/X+6xPxWI9GKBIYFYFx9HWr1SCgwrQ8Hs7g2PLQ13QW+7tlIiEuo
	r/HqRjzXM4jFgCKZ0HduZT1EdPsuHiEjYtqqYlC2ZQ11LjxYW5A1vxjzzN2d0qFfH9hWkU
	KGvZv77cHfVYqRcjyDavC35eVjKIgIBeBbSz9My9uMfQaRAleVyMIZci/ZC2tg==
Message-ID: <3ba2de63-4282-4b1e-a576-0b4501e56a7b@mailbox.org>
Date: Fri, 5 Sep 2025 20:55:16 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] regulator: dt-bindings: rpi-panel: Split 7" Raspberry Pi
 720x1280 v2 binding
To: Conor Dooley <conor@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20250904200036.168222-1-marek.vasut+renesas@mailbox.org>
 <20250905-humble-framing-3d9b786c87a2@spud>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250905-humble-framing-3d9b786c87a2@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 1610ff316d30fa5ccec
X-MBO-RS-META: 7bwgeaepbm4mhh4ckbu5hz6y3qkdg661
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_115523_818047_5949F62D 
X-CRM114-Status: GOOD (  12.04  )
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

On 9/5/25 8:46 PM, Conor Dooley wrote:

Hi,

>> +examples:
>> +  - |
>> +    i2c {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +      gpio@45 {
> 
> ngl, seems strange to classify the device as a regulator in directory
> and name, but use gpio as the node name in the example.
> 
> Otherwise, this seems fine - if you feel that the hardware is
> substantively differentially to what's in the "v1" regulator then
> keeping them apart is valid.
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
I can rename it to "mcu@" or "mfd@" some such ?

I originally thought it could be compatible with the V1, which is why I 
tried to conflate them into single binding in 6d09c6e474bd ("regulator: 
dt-bindings: rpi-panel: Add regulator for 7" Raspberry Pi 720x1280") , 
but they are too different, so this undoes the change and creates 
separate binding.

