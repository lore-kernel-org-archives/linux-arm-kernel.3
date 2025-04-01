Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E524BC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 11:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUgO5sgu7lUMgGp9glFE5sNrpXQ18Em+bdXksqVwffY=; b=qqOwBS/xXcrtZLS0R7HMfZWkpc
	kNs5FuRWxtp/BTUz/uEnnIpTWUGigxeXnPJM4GFFkKzvxmPg5yZ+zV2Suhv8U6FX5Nzy+/srM/hMJ
	V+VHEMb/RlO0sPHMI0z95CxVZZeEUJJSTIPiGkz7tm+ofbdI87H3laqDC6bzVWbiQlaQRWdOKEEIO
	lzv/otp1bZamcpYQYZywyxel7m07NSQETwxmzgczRIkJcraU2so7zQhg9VNOIWEBodX4xswLjv6V1
	TfaWEMCIJ9gA+Joo56StXvNBvx6nBtgo365zIqAZ3DhtqUZzPJvFNt3Yqy9c38Q93rOs8Sh3WxP/a
	u+k0K3Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZWg-00000002khp-2xUO;
	Tue, 01 Apr 2025 11:11:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZUu-00000002kRO-1Uh2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 11:09:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 175A76115F;
	Tue,  1 Apr 2025 11:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D57DC4CEE8;
	Tue,  1 Apr 2025 11:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743505775;
	bh=PPv3xZIaLfz6iEjfD3QWE/BzXA85IVTbjNSjcOtzP7U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HIRt8ESxjaNP4dTFe9O3bTFy/yc4Vu8mZMdpmsTV1O+ZEF+LbVTvmeTdNe5uqlEy8
	 umJiahRypk/xeeWaVMe4va3ULlpaUeYCFlqqL1U4f0cXbqv6v6f3Q4XI5Yygk3r1Wp
	 cEy2UJ7XqYXnGLNXHgSzbpnSZ5OKYv2vUIy/28pHniQp9deAa+5cpxWxPHtDU11q3K
	 zU/WCCttTgF72QlRDoFjFyMmobHsBJ7GMIYVWTjvb/jnBwa8qgAD6BRJfmrJ+eAW5a
	 RlFDzk77WkXP5nhXHns+2iFJ8bEfZyUeOhKnTWLR3Z6IOreQmYw1rAjnvBm14JnHV1
	 lfJAt5Bi2TZhw==
MIME-Version: 1.0
Date: Tue, 01 Apr 2025 13:09:30 +0200
From: Michael Walle <mwalle@kernel.org>
To: "Kumar, Udit" <u-kumar1@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p-j722s: add rng node
In-Reply-To: <e2a37e72-d9c8-4329-8a5a-f2c9865cdb5d@ti.com>
References: <20250313144155.2382316-1-mwalle@kernel.org>
 <837cba5f-f49e-4cbf-9cbe-2b25f7c9d4b8@ti.com>
 <D8UECOJ2NMCU.3ALYIKSODJ479@kernel.org>
 <1ad2d8c2-6a0d-419d-984d-4974adb0e1f0@ti.com>
 <D8V323NBB32P.3P8H103L83HZK@kernel.org>
 <e2a37e72-d9c8-4329-8a5a-f2c9865cdb5d@ti.com>
Message-ID: <ea82dc29e93d53b659916f2fed10982b@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
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

Hi Udit,

>>>>>> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
>>>>>> [..]
>>>>> For completeness , this is ok to add this node but should be kept 
>>>>> disabled
>>>> Shouldn't it be "reserved" then, see [1].
>>> yes, should be reserved.
>>> 
>>> With marking status as reserved.
>>> 
>>> Please use Reviewed-by: Udit Kumar <u-kumar1@ti.com>
>> Thanks.
>> 
>>>>> similar to
>>>>> 
>>>>> https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi#L662
>>>> j784s4, j721e and j721s2 have them enabled. What is the rule here?
>>> J784s4, j721e and j721s2 SOCs has two TRNG blocks,
>>> 
>>> example for j721e, one is used by kernel [0] and another by optee 
>>> [1].
>>> 
>>> 
>>>> You also disable the hwrng in optee in your evm according to [2]:
>>>> CFG_WITH_SOFTWARE_PRNG=y
>>> We are planning to use this hardware block by secure firmware.
>>> 
>>> Therefore request not to use by optee as well
>> How will you be able to access the RNG from linux and u-boot? I'm
>> asking because I'll need it in u-boot for the lwip stack and the
>> HTTPS protocol.
> 
> For now,  If you need TRNG then I can suggest to use optee TRNG (ie 
> build
> optee with HW TRNG).

I'll be using an uboot TRNG driver. But how will that work in
the future if the RNG is used by the secure firmware?

-michael

