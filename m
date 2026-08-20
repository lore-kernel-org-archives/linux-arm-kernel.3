Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6034BC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 08:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPi7sm06f+rNS7fquy7GY9UlFStzSoKD+j+fIOo56U8=; b=BzzR+bjBpWG1TT4XbRvmLR1xqR
	y3sqxKYAgcYOpuHzlz7wgdks5cINZzKmL3t97D1vg7WRVUGxA+NTzMLkWZ3yDFJVLitnzYZIVXYsV
	v0tHf4KNPHITwd7zAUAfdoDwthNpNqUaVJtJ2QNjzanYNVy8AyqYjniU2glIAMAoQOTuAZ1imDWpg
	gwZkWaBGMFqcU3zzaAKRWdZ9T5yyr+vru8RhsY927rJNSl7l46VKs1bL1x0fv8WaEjP4QVjS6iIQZ
	AcSWP04sf3ezmhgi2v143M0K2ZbALienJd4gkK9A1Gb1xjANbSfTmyysgLZ92suoMpJ1IYNVwyLBi
	nS89kSPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxv7-0000000B8DN-0qPg;
	Thu, 20 Aug 2026 08:14:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxv5-0000000B8D6-24pg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 08:14:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E4F0040871;
	Thu, 20 Aug 2026 08:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401171F000E9;
	Thu, 20 Aug 2026 08:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787213678;
	bh=jPi7sm06f+rNS7fquy7GY9UlFStzSoKD+j+fIOo56U8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=MFlj5GDQYfTBb96020wGzI27jJge3IEPrS/7HPMaR0/CmZi3UFGBs8FHwqklsQCmc
	 PeppwrzCQ7gnFgwmpdwvC1U27xaI3U9+PrdZt/34jyOQN7jKBmSQBxrPvII3A3HB5q
	 /vG15BaR9eKcchddxD+T7eAPszdqKE4g4/mNgiidJFMEivXl6uDsRnybI8VgkNR76o
	 w7RNQ1jc/GLXs2h56IxlPaczB3rZRHFYI1ekrc3TWU4/7XOxuvWT9t1Q9Am9sYoYTI
	 HN4RD+P1iCorA6VCP0jCXr12vDrkxSUGTUrxjOwQZqIJDDSYc6Br80ZvElja3gdBRP
	 PprSprNFgoaEQ==
Message-ID: <c38cb98e-0746-4b28-b0c9-ce59e8338048@kernel.org>
Date: Thu, 20 Aug 2026 10:14:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: net: wireless: add flag
 marvell,ignore-regulatory-hint
To: George Valkov <gvalkov@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, andrew@lunn.ch,
 krzk+dt@kernel.org, francesco@dolcini.it, johannes.berg@intel.com,
 kees@kernel.org, miriam.rachel.korenblit@intel.com,
 rafael.beims@toradex.com, avraham.stern@intel.com, error27@gmail.com,
 s.kerkmann@pengutronix.de, gregory.clement@bootlin.com,
 sebastian.hesselbarth@gmail.com, robh@kernel.org, conor+dt@kernel.org,
 Frank.Li@nxp.com, chunfan.chen@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 stable@vger.kernel.org
References: <CADOrJmbTyrGGkq+9OJDXCgTa2HvNo8BWxoE6yjafcrOq7WNamw@mail.gmail.com>
 <20260817215428.84740-1-gvalkov@gmail.com>
 <20260819-generous-nickel-dalmatian-b6bb08@quoll>
 <CADOrJmYfBe3ADun_kFjFSH6YOSTX7Vu3UsFsL57yuRdaQ=eJCA@mail.gmail.com>
 <e554c007-67e3-4fbf-b85e-5de02f649e83@kernel.org>
 <CAGXv+5H7AhZgZ06r9KO3HLZ9Cymkai+Cv9SgVTuSC1PjgGf8hg@mail.gmail.com>
 <d6c8f19e-f154-4b57-9101-cf3b73e9794f@kernel.org>
 <CADOrJmYxKTyDkKPaKCpH37RsyyZJZ+4uReE--+uvnHmEdNJVOw@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <CADOrJmYxKTyDkKPaKCpH37RsyyZJZ+4uReE--+uvnHmEdNJVOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 20/08/2026 09:50, George Valkov wrote:
> 
> 
> Krzysztof:
>> regulatory-hint for me means usually regdb, but even with your meaning
>> you tell SW what to do - ignore hardware regulatory information.
>> Property should not tell what SW should do with hardware. Property
>> should tell what is happening here in the hardware. In this case: what
>> is the reason behind.
>>
>> IOW, why user of a board in country X, where regulatory data says X,
>> should have the correct regulatory data ignored?
> 
> Because users in X buy a board for X and the regulatory data says U.
> 
> Indeed when the ROM regulatory hint is set to US and the driver
> reports this to the OS, the wireless-regdb restrictions for US are
> applied. This would normally be fine, however the third radio in
> WRT3200ACM and WRT32x, reports US on all models including those sold
> in the EU and other non US markets. This creates a conflict with
> radios 0 and 1, which report FR and also with my correct setting: BG.
> With the wireless-regdb restrictions for US, FR and BG applied, radio
> 0 refuses to start.

So if you move with your router to US, you would need to change DTB?
IOW, the DTB is per user? This is obviously wrong... What if one device
has correct regulatory data written and you ignore it? Why would you
ignore it? If you decide to ignore correct regulatory data, then you can
as well ignore it unconditionally and this property is not needed.


> 
> Would you approve any of these or suggest a better name for the flag?
> Should ROM be in upper or lower case?
> I omitted 'in-ROM' to keep it short, because the driver check line is
> already longer than 80 characters.
> - marvell,ignore-regulatory-hint (current)
> - marvell,ignore-regulatory-hint-in-ROM
> - marvell,invalid-regulatory-hint-in-ROM
> - marvell,invalid-regulatory-hint
> - marvell,invalid-regulatory-ROM
> - marvell,invalid-reg-hint-in-ROM

The point is that the regulatory hint is NOT INVALID. One device was
sold in US with US data, so how could it be invalid?

Best regards,
Krzysztof

