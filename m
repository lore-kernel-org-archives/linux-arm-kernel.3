Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A85CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 23:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hfowH2iHudGa0LkdrtS84kdcHbiN+9po/FhXQJzKNc=; b=ocMSMRsXQebtntEQlLo84YKB0f
	bs1XRX//HFnDF+vF/SB+iUxeb2n1g7m14FLrBS9R35zaE/aMh7VhA95Q/9FQVVXwbg9itPemA0gez
	uZHkYF+T9dunzeLudu70bLDLsQJeAH3072dP3flTFDh9LeDUANRGhtcU5uvA421S8z5T7rtbZUP+u
	kLQQUmQ8tQNZFFQPtNfAEALYRjIQ2cLL3Ir1OMIuoU3CkS00hXr/MAA+Kl4DdsX0vQnXUMrH2Cef4
	30fkTILvsssyuNr51KnYNovoSSVYy9gN2z6FE3P3u5fLYQrXBs36ylkpPT/onqp313GnCc0ZmlRJi
	Y4ZVkjlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8nzo-0000000Hawt-2pDo;
	Tue, 14 Oct 2025 22:59:56 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8nzm-0000000HawZ-16uK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 22:59:55 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cmV6J1LRGz9tvJ;
	Wed, 15 Oct 2025 00:59:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760482792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4hfowH2iHudGa0LkdrtS84kdcHbiN+9po/FhXQJzKNc=;
	b=lDEcy0IlAKe7LED+HzIzOHqp7CRKXKALzRrQvDKmrcT+wSLI8n83tfSuSjmrDfFXpayuFZ
	D/To6s3CvThP/7sijhPgJ0EAXtGCAvTCiKU0hr6VoOZ2EXwEd+pirxb2DYcmsWOwxuzKe7
	v2fyfqfHItH+5h09GPlqQAPfuAxAu2azo2UqNy56zXTOW4MqPFdpitQ2Xxx4iE9aNGqlC8
	nb8nbZLPr4IhuTRN8T7YfzqaTccW2zL4BslS3CNut000rO3wDjAN+VZeuR/mrLzeHKRzKc
	ypTa4p2sU3wR40taTxUJFxAGHWs3Yr4evv0CtGzFYK5qYoB/fC8RKzR3INpzsw==
Message-ID: <e93779e7-026b-4b48-9d9b-dfef3d953749@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760482790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4hfowH2iHudGa0LkdrtS84kdcHbiN+9po/FhXQJzKNc=;
	b=xUVFUheZfugfP5J1pOCixDTQUpRLR9ZwawCcYGvcbW0pX3TvbJAVoSQR0l//+64oGR/MuC
	blIqT6PMlEMDE32pIZjKikeZZZ6Esi+Tluf4fTwEaEqODCW8cHnbbowg5IEy5Pol3VmG/t
	wJdllMmbnaVfbRqAKkNHWe9SxD7JNhKUw1Iq4FYbKsa0Bd/x04aPTN5wXuX/CIicFhqQY2
	NXckdpuJlHBs606HssIwzgcfZWsjPuVfR2lY02+kbvVV2raxdD0+jRTlQzkqilhKH6y4h/
	TS/wUVguGXKs4890cebtTyZCBWI10ZFHQBYEgCllVDjVFIe98h00NosUuw2sug==
Date: Wed, 15 Oct 2025 00:59:45 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
To: Matt Coster <Matt.Coster@imgtec.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
 <20251013190210.142436-2-marek.vasut+renesas@mailbox.org>
 <d4ec2cc2-882a-4842-ad8c-42033ceb2bc7@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <d4ec2cc2-882a-4842-ad8c-42033ceb2bc7@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: ya4auwctb7mmsqbrry9umriad1d3o4wa
X-MBO-RS-ID: 34d82dfc4b4fa9568db
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_155954_449429_EB8D8E27 
X-CRM114-Status: GOOD (  20.44  )
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

On 10/14/25 1:52 PM, Matt Coster wrote:

Hello Matt,

>> +++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
>> @@ -2565,6 +2565,18 @@ gic: interrupt-controller@f1010000 {
>>   			resets = <&cpg 408>;
>>   		};
>>   
>> +		gpu: gpu@fd000000 {
>> +			compatible = "renesas,r8a77960-gpu",
>> +				     "img,img-gx6250",
>> +				     "img,img-rogue";
>> +			reg = <0 0xfd000000 0 0x40000>;
>> +			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&cpg CPG_MOD 112>;
>> +			clock-names = "core";
>> +			power-domains = <&sysc R8A7796_PD_3DG_B>;
> 
> My comments here apply to the other dts patch (P3/3) as well since the
> integration appears to be identical between the two SoCs.
> 
> There are two power domains on this GPU and the SoC exposes both of
> them; no reason to fall back to the single-domain scheme here.
> 
> I know the sysc driver declares the dependency of _B on _A, but the dts
> shouldn't rely on that, so can we have:
> 
>     power-domains = <&sysc R8A7796_PD_3DG_A>, <&sysc R8A7796_PD_3DG_B>;
>     power-domain-names = "a", "b";

Both SoCs fixed in V2 , which I will post in a few days , thanks !

>> +			resets = <&cpg 112>;
> 
> Is this a reset line? Is it a clock?

This is a reset line. The MSTP controls both clocks and resets, but this 
particular phandle describes reset control.

> I see this pattern used throughout
> the Renesas dts, but I'm just thinking how this will interact with the
> powervr driver. The reset line is optional since some hardware
> integrations manage it for us during the power-up/down sequences, which
> appears to be the case here with the MSTP control (from my brief dig
> through the Renesas TRM).

As far as I can tell, the pvr_power.c toggles the IP reset after the IP 
clock were already enabled, so the IP should be correctly reset. What 
kind of problem do you expect ?

> Related, see my comments on the bindings patch (P1/3) about how clocks
> are wired up in this SoC.
I tried to reply to that one, hopefully it makes some sense.

