Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F88C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 15:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkRJVAz25cOKB4Ike8uj1TDbewu9GKT1vjs3etq6Y80=; b=y78adRGPEw6qtcKdjeiY4t1u9Y
	BygNt/CtAM16NqOim45IIhjh5j1PVxREV1SZSO5VImZfrjIASLhuZNDEqvGP9Ozfjl4nD+mpkU03R
	pTSktNOBe9+hF1Jcq/FHjQ+ujQPHJLKXeuG8XkkgpiqnkpSJm1/6faJMtapWplgdELeTEj4GVEeHz
	8jm9CASJZNEQ+aloF7yENUrKs+qVjR7N8pnsOMU0bhJ8IQRf/F4E18Xa6zXwLNnt2517hniBuwwEW
	W5QF4cRnSxtWZi/a7NBpHX68rhzjZ55JKW7PyH38WaWsTn2n+KuNK38NDgSFK76CfdTCdjE92xH0D
	vIUC/ryQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT0XY-0000000HajI-2RL3;
	Sat, 21 Jun 2025 15:54:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT0VJ-0000000Haaf-2y6Q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 15:51:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D9125C3A59;
	Sat, 21 Jun 2025 15:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78776C4CEE7;
	Sat, 21 Jun 2025 15:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750521099;
	bh=RwP81emvQorDLrxRkfUbpFTx2KvYq1XkDDhakXZLA38=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aXtULFaVgekIStsylN4vdg7HUyzivNz0nR/MJSwVzTkpruzTLf09+mzKvXkhSxwD6
	 RfdN8Od5f/jxKMfkRbddhs5qxoS+QoS46W+d0+b1qS8+AJxa+pObgodXZycAnqJbL5
	 gem5fqZiCD+HRYOrXaZXZmKHTNeK1QgLdynUz9VXQ5u4JDhZP5nOO3CQXZfDQZudBp
	 d6cX58KTKDdUT5SRafdvX4onFl9UpYAy5YNgB7V0VjO2pugG98guCnmakD1DhOMOvP
	 IbTJOhfMjLOTL7cCYtNtILPzxbrr9AtexQUIJRZ/m8HT5DhA72WLDVkeB3m3VNKief
	 vEVYcskD2Qe6g==
Message-ID: <f30406ae-90ed-4f81-9519-e6ae2dcc9e03@kernel.org>
Date: Sat, 21 Jun 2025 17:51:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/10] mfd: Add Apple Silicon System Management
 Controller
To: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>, Sebastian Reichel <sre@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
 <20250610-smc-6-15-v7-5-556cafd771d3@kernel.org>
 <20250619114958.GJ587864@google.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250619114958.GJ587864@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_085141_790455_B639CF3B 
X-CRM114-Status: GOOD (  14.03  )
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

On 19.06.25 13:49, Lee Jones wrote:
> On Tue, 10 Jun 2025, Sven Peter wrote:
> 
>> The System Management Controller (SMC) on Apple Silicon machines is a
>> piece of hardware that exposes various functionalities such as
>> temperature sensors, voltage/power meters, shutdown/reboot handling,
>> GPIOs and more.
>>
>> Communication happens via a shared mailbox using the RTKit protocol
>> which is also used for other co-processors. The SMC protocol then allows
>> reading and writing many different keys which implement the various
>> features. The MFD core device handles this protocol and exposes it
>> to the sub-devices.
>>
>> Some of the sub-devices are potentially also useful on pre-M1 Apple
>> machines and support for SMCs on these machines can be added at a later
>> time.
>>
>> Co-developed-by: Hector Martin <marcan@marcan.st>
>> Signed-off-by: Hector Martin <marcan@marcan.st>
>> Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
>> Reviewed-by: Neal Gompa <neal@gompa.dev>
>> Signed-off-by: Sven Peter <sven@kernel.org>
>> ---
>>   MAINTAINERS                |   2 +
>>   drivers/mfd/Kconfig        |  18 ++
>>   drivers/mfd/Makefile       |   1 +
>>   drivers/mfd/macsmc.c       | 498 +++++++++++++++++++++++++++++++++++++++++++++
>>   include/linux/mfd/macsmc.h | 279 +++++++++++++++++++++++++
>>   5 files changed, 798 insertions(+)
> 
> This is ready.  Let me know when you have all of the other driver/* Acks.
> 

They've all been reviewed by the respective maintainers.

I assume you want to take this all through the mfd tree and we'll need 
acks from Sebastian for power/reset and either Linus or Bartosz for gpio 
then.

The one line change inside drivers/soc/apple would usually go through my 
tree and I'm fine with taking that through mfd instead.


Sven


