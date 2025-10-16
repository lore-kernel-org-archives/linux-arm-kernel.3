Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4441CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 08:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXsurt/UB6adbtX7xqXZLThjuVgu/eCgnHbY5gWKelw=; b=Pi0dztCnKfCLbJXD7g6AsXTMVI
	pK55nt8CqcKwF4rf4EZROwMStRH3RMNvpPy0/DY6VL22dKXv3Rb9TCXkB2y8wsHR4Ravve8ucwaVc
	duia1k8kTVJWhZsIe0lyQLnlY3PLEXEjQU9mxQxr2rGbq+rzevGNqlbPPjfQ335JuD4u2tJ8y5hE/
	RA2VxfdXg5XOKZgs9HlJRD5mI8jcXxeEczPuCjeayIn01jrtHv7TwSLrwdxOabQgAj3pFazy8doJl
	MlrrAhVKoYh6HQ0KuuuD3c4kzwwX1FmMmYWhtdku2JYsHJGxQW1Kp1vF31T+1iFkcg9ru1aggYrrZ
	mHocafTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9J8o-00000003sO8-1E2M;
	Thu, 16 Oct 2025 08:15:18 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9J8l-00000003sMK-2D5x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 08:15:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 09E151A1410;
	Thu, 16 Oct 2025 08:15:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D17616062C;
	Thu, 16 Oct 2025 08:15:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ACE2B102F22B9;
	Thu, 16 Oct 2025 10:14:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760602512; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=dXsurt/UB6adbtX7xqXZLThjuVgu/eCgnHbY5gWKelw=;
	b=pBEULoiRmAouS3SHUlKOJyrqWJ1t2pWZMEbbaVEaGbDYSH8OzKzPbTtL5dRUoMhvF95Czb
	2A5X4dM7SfrhDOhll7Qjw/V3SmjgkR3m0USf630ew4Kns4/6FGHU/Sy527JAvABxPeBc53
	tEqrPxK2eGLRHIF2YDaF0FGQTOdf5Jp+vf1PKMPgca8yso8uIL3nlUP7lQ7jhH3f6k/IU3
	GtTcWvhzBu8exiUKbVHyINlfRkh8a/F7HLdPego1MiE4fuabbF4MyWu2ZkNz0FFkCPLrRJ
	KOizvsmFFq+vZVxJOQxaPLAAiy0mCHeWPQulGTJZGpUL73FZIkidBmQbw32sJw==
Message-ID: <328d5953-aec3-4a1e-b2e3-268155793996@bootlin.com>
Date: Thu, 16 Oct 2025 10:14:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/3] net: stmmac: Add support for coarse
 timestamping
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
 <20251015145519.280b6263@kmaincent-XPS-13-7390>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251015145519.280b6263@kmaincent-XPS-13-7390>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_011515_710296_522297F0 
X-CRM114-Status: GOOD (  13.92  )
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

On 15/10/2025 14:55, Kory Maincent wrote:
> On Wed, 15 Oct 2025 12:27:20 +0200
> Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:
> 
>> Hello everyone,
>>
>> This is another attempt to support the fine vs coarse timestamping modes
>> in stmmac.
>>
>> This mode allows trading off PTP clock frequency adjustment precision
>> versus timestamping precision.
>>
>> In coarse mode, we lose the ability to fine-tune the PTP clock
>> frequency, but get better timestamping precision instead. This is
>> especially useful when acting as a PTP Grand Master, where the PTP clock
>> in sync'd to a high-precision GPS clock through PPS inputs.
>>
>> This has been submitted before as a dedicated ioctl() back in 2020 [1].
>> Since then, we now have a better representation of timestamp providers
>> with a dedicated qualifier (approx vs precise).
>>
>> This series attempts to map these new qualifiers to stmmac's
>> timestamping modes, see patch 2 for details.
>>
>> The main drawback IMO is that the qualifiers don't map very well to our
>> timestamping modes, as the "approx" qualifier actually maps to stmmac's
>> "coars" mode, but we actually gain in timestamping precision (while
>> losing frequency precision).
> 
> https://elixir.bootlin.com/linux/v6.17.1/source/include/uapi/linux/net_tstamp.h#L16
> "approx" was initially added for DMA timestamp point.
> Maybe we should add a new enum value here with a more suitable name.

Yeah, the terminology in stmmac of "coarse/fine" refers to frequency adjustment, while
the "fine/approx" qualifiers refer to timestamping.

I'm OK to add a new value, with the usual risk of seeing the number of qualifiers
explode if different hardware to that in different ways.

I suggest keeping "precise" for the default mode, and maybe use "enhanced" or
a similar term that would imply that the improved precision is done at the expense
of some some other aspect of the system (and therefore probably not
suitable as a default).

Maybe Richard can shed some light on that ?

> Regards,


