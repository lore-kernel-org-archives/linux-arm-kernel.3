Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593E9C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 08:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJa6N/GzykXQ82C/0kl9ZKXv34ovu/9qaIOQC1R2/8A=; b=z9jgD/egWhElxs5aCGEManqSuO
	zi7UaEUv0L4l0kSsBCnp8SFvqA8ebOV41yuAzsxTiCkBIKPQQ42ie76gBYy87ckoVjKCLLp/pmKEM
	mvsN73NOZRQctfVPvyP+NZgC1AbSO7XZBUVrdpKc0slZJsa470h0FururQgz5RfQ/XJOLVU5wWyGG
	9dsUrS9mo536LuVtkRHQIi09wdXvUL4PIYiSUtfb2OvOvtSH4kL6MnI3rWxlvFyzGJVt1chy9B95/
	f5/EWvkSe2Q505/2QmFOKJEG/wYSTcmvzaksiCvCyQshJNeGT+sZOdw3q+zJI6LM4dk0PUyTyAlS7
	eFkP6STg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1BR-0000000Ctho-2qSZ;
	Fri, 25 Sep 2026 08:21:29 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1BN-0000000CthR-0K3s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 08:21:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 770C64E4083B;
	Fri, 25 Sep 2026 08:21:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 452506073B;
	Fri, 25 Sep 2026 08:21:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C13E3103294AF;
	Fri, 25 Sep 2026 10:21:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790324477; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=sJa6N/GzykXQ82C/0kl9ZKXv34ovu/9qaIOQC1R2/8A=;
	b=duqAEeCH9IFXoRNfqumO2lC2Xy2TTY11sXerBkjGu6tAQpgrVfEshA3afCWU1+DeH0BCJu
	88xCQ9Fn/PapNnDRjHPcWqxtiVIS3Q1jGcOTfelc3YR/mP4hddOPH/liRm4mJb1dA90WqM
	qDcQNpxvQgYSanCE6Qy6alUgVdi/gQfmF7X1Y+dR7K1aw+SppzrWT3g/9UYGP6D6hD3Rhe
	P74Td7LbkgGf6q+y3ugM0FIXqTL37JVnWJvfHEWTPEywCN0ryzc/5enFWPZPsk5+ZKKiW7
	r+oX2f1ihaXuui9FVJZSaYK8K44hqjQ5M6sFsvagCRTXFB2Wf6g0CjAodttg3w==
Message-ID: <f8fc89b7-15ff-4915-8f1c-49c3b2357699@bootlin.com>
Date: Fri, 25 Sep 2026 10:20:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 0/7] net: stmmac: More selftest-related fixes
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Minda Chen <minda.chen@starfivetech.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Jose.Abreu@synopsys.com,
 Nicolai Buchwitz <nb@tipi-net.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, PKneuper@dspace.de,
 David Laight <david.laight.linux@gmail.com>
References: <20260917215339.2022523-1-maxime.chevallier@bootlin.com>
 <20260921152202.64d4c67a@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260921152202.64d4c67a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_012125_269334_0CBA77C5 
X-CRM114-Status: UNSURE (   9.86  )
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

Hi,

On 9/22/26 00:22, Jakub Kicinski wrote:
> On Thu, 17 Sep 2026 23:53:31 +0200 Maxime Chevallier wrote:
>> This is V4 of stmmac selftest fixes, addressing Sashiko's issues over
>> the MTU patch. This lead to the introduction of a new one. The
>> dev_add_pack races have been addressed, however the double-vlan issue
>> stayed there. Ovidiu is actively working on it, let's wait for his work
>> to land before fixing that.
>>
>> Nicolai, I took the liberty of keeping your review tags on affected
>> patches, let me know if this isn't ok.
>>
>> This is another round of stmmac selftest fixes, mostly about the selftests
>> themselves but a few things were discovered w.r.t MTU and buffer size
>> handling, see patch 5 anf 6.
>>
>> After this is merged, I consider the selftests to be now reliable enough
>> to run them nightly on every stmmac series that's sent, and I'll be requiring
>> clean selftests for new glue drivers.
> 
> This got to the top of the stack for me, LMK if none of the AI feedback
> is legit. You mentioned the VLAN one, not sure about the rest.
> The EEE complaints look like nit picks but also some are easily
> addressable? LMK..

Thanks for applying :)

Much greener now :

https://minimaxwell.github.io/stmmac-ci/

Maxime

