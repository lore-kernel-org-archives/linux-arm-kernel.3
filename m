Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96BAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 23:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkoq468eULIdSiAa93TheBL4sQoUuAbGk8pmYh3mGOs=; b=JXD7ZH+iEidRqSSJILEmj0RdgI
	kaj4I1uwgYJb9uwmUo/a8bahLaj8Ty5JTQry9yr1BJNxAVHgwAAshy3rFzjkAc+v0GqoZbYWxA5hl
	pe5iYBRoPuqLiPI5LIWLqBAJyWrdD857s9J5j68MB0oWMoe6U8tO/XVj3d1B9kZ0WRyEPMt1M5nxu
	zDvCFvYd7D92BJW8afeLa5eHAm9f2RizV0qTOVuNZSgfKRRDjq24AR+6qzlSzl1w65BvI2EJqQ+ma
	mXVFjP1bfs8sj2FTuD2d1/C4mm9jhS9LoIoLtNl/Ffqj9hhfHIH2Uyo9RbxYYGWMKWWM+3KQX0s1a
	128halwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQ3Q-0000000AYGS-4AL2;
	Mon, 13 Jul 2026 23:27:17 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQ3K-0000000AYEq-0ZA5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 23:27:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6C4A21199D6;
	Tue, 14 Jul 2026 01:27:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783985228;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=wkoq468eULIdSiAa93TheBL4sQoUuAbGk8pmYh3mGOs=;
	b=fUzXAIaSuCh0oLPMva5wnofUcYh/u51JZN3FvET/4kCQJLdmKG3HlfRe7x0gCpHXzOogRX
	15xvwUwAu3zbyLZto9isihoLwjwkb3NsO1R0qxFLsyYTYHBzioOy82PKkquo5O0nahn8ia
	/H6Rhz37FuMchcDLUMZKCm78dZuZp3a/6dFdrGjlXUpyrFNvpFAlp3Khnekk8F4HLRFJwf
	54kSvAOTIHjuSJJx+bMJwzLVMqsvgs/1Z2qXyJOEPOUoxHlDiTCD88rkTel5SrMQ9Yh9gu
	vWg1bBFNXt2UWeqGaaLN//bfhV/n6PxulHNZCRcl71tBhwPzVLoQYoXPvc+wgg==
Message-ID: <47178bf9-1fc7-4585-aa17-37ec07152b01@nabladev.com>
Date: Mon, 13 Jul 2026 12:33:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] dt-bindings: gpio: pca95xx: Document Kinetic
 KTS1622
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260711210131.236025-1-marex@nabladev.com>
 <20260711210131.236025-3-marex@nabladev.com>
 <CAMRc=Mds7FAg=e-JGWxK=9vn5A0sdYDhpZ7Wvo3eCKV1tyNpKw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <CAMRc=Mds7FAg=e-JGWxK=9vn5A0sdYDhpZ7Wvo3eCKV1tyNpKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_162710_330163_F0D59CBC 
X-CRM114-Status: GOOD (  14.01  )
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

On 7/13/26 10:36 AM, Bartosz Golaszewski wrote:
> On Sat, 11 Jul 2026 22:59:31 +0200, Marek Vasut <marex@nabladev.com> said:
>> The Kinetic Technologies KTS1622 is a 16-bit general-purpose I/O
>> expander via the I2C bus for microcontrollers when additional I/Os
>> are needed while keeping interconnections to the minimum. Datasheet
>> comparison suggests that it is compatible with TCAL6416, add the
>> compatible string and TCAL6416 as a fallback compatible.
>>
>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>> ---
>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Cc: Bartosz Golaszewski <brgl@kernel.org>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Linus Walleij <linusw@kernel.org>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: kernel@dh-electronics.com
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-gpio@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> ---
>>   Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
>> index 4f955f855e1ab..4631388a7d914 100644
>> --- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
>> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
>> @@ -22,6 +22,9 @@ properties:
>>         - items:
>>             - const: diodes,pi4ioe5v6534q
>>             - const: nxp,pcal6534
>> +      - items:
>> +          - const: kinetic,kts1622
>> +          - const: ti,tcal6416
>>         - items:
>>             - enum:
>>                 - exar,xra1202
>> --
>> 2.53.0
>>
>>
> 
> I applied this. I would have sent a b4 notification but got this instead:
> 
> $ b4 ty -all
> Auto-thankanating commits in gpio/for-next
> Found 9 of your commits since 1.week
> Calculating patch hashes, may take a moment...
>    Located: [PATCH 00/10] arm64: dts: st: Add support for DH
> electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and
> DHSBC
> ---
> Generating 1 thank-you letters
>    Writing: ./marex_nabladev_com_patch_00_10_arm64_dts_st_add_support_for_dh_electronics_stm32mp23xx_stm32mp25xx_dhcos_som_and_breakout_board_and_dhsbc.thanks
> Traceback (most recent call last):
>    File "/usr/bin/b4", line 8, in <module>
>      sys.exit(cmd())
>               ~~~^^
>    File "/usr/lib/python3/dist-packages/b4/command.py", line 417, in cmd
>      cmdargs.func(cmdargs)
>      ~~~~~~~~~~~~^^^^^^^^^
>    File "/usr/lib/python3/dist-packages/b4/command.py", line 113, in cmd_ty
>      b4.ty.main(cmdargs)
>      ~~~~~~~~~~^^^^^^^^^
>    File "/usr/lib/python3/dist-packages/b4/ty.py", line 681, in main
>      auto_thankanator(cmdargs)
>      ~~~~~~~~~~~~~~~~^^^^^^^^^
>    File "/usr/lib/python3/dist-packages/b4/ty.py", line 386, in auto_thankanator
>      send_messages(applied, wantbranch, cmdargs)
>      ~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>    File "/usr/lib/python3/dist-packages/b4/ty.py", line 452, in send_messages
>      with open(outfile, 'wb') as fh:
>           ~~~~^^^^^^^^^^^^^^^
> OSError: [Errno 36] File name too long:
> './marex_nabladev_com_patch_00_10_arm64_dts_st_add_support_for_dh_electronics_stm32mp23xx_stm32mp25xx_dhcos_som_and_breakout_board_and_dhsbc.thanks'
B4 bug ?

