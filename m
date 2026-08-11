Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0840C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejjPang1xU/F/9iQxqedxUqRw2rwTNlrqqXQ/ycObk0=; b=PXoQFZVo8xQJOX/f0AlNWMaK3D
	JVQjxyd/k+es3CCaBFbG49bGqJH+ASKoVnHeL60XQWD2LvHFfzAkbXxLoSe0jd4V4adLfHWz+lghM
	2D4VY3C6X7VS2O5YXYje5YKjworRKF6+5VIXMwS3fGT7Qby6aBd4iYZ4G5McUmpz0saJPNbmahga1
	gXveB5w9fe8W5vICD6GXGNhYIUCchW8Ftpg4QVTW7dD5hrUzOXlCGgM95IfRGPXaCrnHgBorUJ8Lk
	epGoWDTnBqeLgqbpzGS8NUDQHjQBYVjVQQ1tjKHb4ZMhBIourmtfphE8MQEZ9Wxt4Z1ivuGyryLZP
	wOdTJKIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpag-0000000EXWh-3kl5;
	Tue, 11 Aug 2026 16:44:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpaf-0000000EXWS-0d47
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 16:44:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 854AB600DA;
	Tue, 11 Aug 2026 16:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0686E1F00A3A;
	Tue, 11 Aug 2026 16:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786466676;
	bh=ejjPang1xU/F/9iQxqedxUqRw2rwTNlrqqXQ/ycObk0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=McyxGQoKdhDE7vq8s3suh+8h8i/PIBcr6/65ChoeIgzh5um+Gw4wWS5hVwUtTSVMr
	 stPy41mfXsRRQscxKlTStdpT0AyntLDrMdveDlw02scJwlZXhQJHo+0F+2nJdN/VQ3
	 6Jcd8S2J6p2r0N5hSnwnJk8SX3hdBW9GnRyaTPFp+Odkg2505O3NI/dTKCBAbGLodO
	 jktAdUQUEpI5gV7SbGs4XFij+DEZmiJcwoz9LqjKprTLvlLrp7KWVhQ6OMg2YmK+t3
	 bars+xoGvjf2/PPl/EjkiBEgec2w57d/DGH/Ax3/6fx52qMSMEvbfk74Or/7uEYje0
	 aXnjNC+Y3EURg==
Message-ID: <0b4f3e19-0944-47f4-a113-1e0c2a5af08b@kernel.org>
Date: Tue, 11 Aug 2026 18:44:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: reset: Add Apple SoC CIO reset
To: Conor Dooley <conor@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260809-b4-cio-reset-v1-0-4f33777d9b4b@kernel.org>
 <20260809-b4-cio-reset-v1-1-4f33777d9b4b@kernel.org>
 <20260810-unveiled-specked-a856434db8df@spud>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260810-unveiled-specked-a856434db8df@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 8/10/26 18:02, Conor Dooley wrote:
> On Sun, Aug 09, 2026 at 02:16:02PM +0200, Sven Peter wrote:
>> The CIO (USB4/Thunderbolt) blocks on Apple Silicon SoCs have a reset
>> inside the power manager that has to be deasserted before their
>> co-processor can be booted. On t8103 each port comes with a dedicated
>> register page, represented as a standalone node. On t600x a single
>> register shared by all ports of a die is located in the middle of the
>> PMGR MMIO region instead, represented as a sub-node of the PMGR syscon.
>>
>> Signed-off-by: Sven Peter <sven@kernel.org>
> Fix the sashiko complaint and then
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable
>
>> +  - |
>> +    power-management@28e080000 {
>> +        compatible = "apple,t6000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
>> +        reg = <0x8e080000 0x1c000>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +
>> +        reset-controller@1a034 {
>> +            compatible = "apple,t6000-cio-reset";
>> +            reg = <0x1a034 0x4>;
>> +            #reset-cells = <1>;
>> +        };
>> +    };
> Probably the fix is actually moving this to the parent device bnding.

Thanks for the review, I've moved the example to the parent binding 
where I just had to add the reset-controller node itself and could drop 
all the stuff around it.


Thanks,


Sven

