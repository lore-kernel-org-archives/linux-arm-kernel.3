Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2410EC98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 16:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tueEJexz8lLxUgLlyuxH3o7C1CivlVOYsyBZG5CEAVY=; b=HGvI/ZFAUiLDrqYOTv4Fj2kbch
	UgNKfceeJd2J+CuM12KGbSL8z7k+Ikxu7Zx2Rv59QQAkf5e/un5jX9BqCXTGkNZMFOelN1M+lA6nB
	tmj/5297kbdnyxD9fu9eLWV2zHf/P5Qhg8XCeaP5JZvfu5P/UdA5CQIYM+vnM416ucgQwKgBGPnnP
	X/UBQZNaT9aTddx1nPvZKZfDEsHS7g2MZU+bpSMMkeCPRQ6PsKmUSzjvhT9pGnXIfaWBnz6IeiUac
	ZdTp4kvTEDdto3qusvfu1vVy/P/m6zm0gkWC574bU25nw3yw0ao2hDgSnwRAWbB0qx++gYDNMfW8q
	d3NCDEPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93FM-000000062ER-2TXc;
	Tue, 22 Sep 2026 16:21:32 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93FJ-000000062Df-1B6M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 16:21:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9BF4DC5CD79;
	Tue, 22 Sep 2026 16:22:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C222260580;
	Tue, 22 Sep 2026 16:21:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3053610329134;
	Tue, 22 Sep 2026 18:21:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790094084; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=tueEJexz8lLxUgLlyuxH3o7C1CivlVOYsyBZG5CEAVY=;
	b=lZiYlG9ETLEEIJzn1Sfr+mR+MzscyvuHooi/aU6paqgH7Rkl4nltqX8V8CMm7iefDQaYmW
	oZ1L3ePV2V8qtyH+inEccdDVa8EFjQWX47laMVgBDkn6t4hc/PEuwUz7cOJXSmuK3Mwk9m
	7j8d3YPiiviT5ZVerJQ4FTs8T6wT+eMzZSvfmYtO+jK+4L1Yl916K+nTXaE8odWZ6fXnwy
	flI87G8OkWO5/AyHCdC5Ansk/AmjePUE8ba9bLTpRyUGX54WVW0giWc+Yd/J84gjiOJzUL
	q42Tw4oZSdVh1gYYjRiP+LjdbZGBg02eqJJlXwEpZlobMs/UKfOnSXr+QlTEzA==
Message-ID: <29f42227-d425-4c57-bfb8-e8f34962cef4@bootlin.com>
Date: Tue, 22 Sep 2026 18:21:02 +0200
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
X-CRM114-CacheID: sfid-20260922_092129_530865_227FE582 
X-CRM114-Status: GOOD (  14.41  )
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

Hi Jakub,

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

I'd say the AI complaints are legit for EEE, but I have mixed feeling about
iterating more for that point only.

AI points bugs that are related to 3 main classes of problems (for EEE but
other patches as well) :

 - User reconfigures the interface during the ethtool -t run
 - The selftest outcome depends on how the link was negotiated (worth for Pause
   and EEE)
 - Selftests are sensitive to external traffic being received during the
   selftests run.

Obviously we don't want the kernel to crash because of ethtool selftests and that
has been addressed, but for now I'd say ethtool selftests failing because of
external factors is something we can live with, although we should make them
more robust.

The main thing is that we've always been subjected to these problems, and addressing
that is an entire ordeal in itself. I can followup (my goal is to have all
green runs here [1], this already proved useful for at least 2 patches in the
past 2 months that broke selftests), so I'll definitely work on the remaining
points as followup.

Maxime

[1] : https://minimaxwell.github.io/stmmac-ci/

(These are just custom tests, I want to switch to the real kselftests eventually,
the runner is currently being stress-tested to iron out the last issues before
submitting that to netdev-ci)

