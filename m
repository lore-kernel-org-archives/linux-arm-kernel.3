Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FD4CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 11:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLE0eTiI6TFyVoJFE00DU2l+ZzaA7D7Dyj0PBL3xFBY=; b=h2r+vXL7gZB7Vj8xTUTJI4H53R
	hb33DT1K2uQk1uXTTt5/wyo7thWIUKWtjvma1EOUEoBGM8MCAm6V/TTaLBwV8Hn9jUPx2G4do4x0X
	sUoabJ5/sdouiYwvG9IGr0S3pGvFPC9kVOezPDdIDPOOA6Q0ado2H7VIT3NsovrD7yce70NaTJnVq
	PzMNSJvb1Rt9I1lpqAa47UVZq5MJaS3R0Ep4RujlcXsSwyc2t/SQ0ijWwzqsmcmLIrXeoTMh62Vig
	urJRjlakUBGdkuX2tvdNG2wYa4tXfq7HAOPb4HwCO1s0dpjPGMveaPSfs+kUTbbd1eG04uJ7hN/cZ
	K7B+fIYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhqq-0000000FqG4-1L70;
	Tue, 28 Oct 2025 11:26:56 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhqm-0000000FqFd-1ojz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 11:26:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9FA591A16F6;
	Tue, 28 Oct 2025 11:26:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 702EE606AB;
	Tue, 28 Oct 2025 11:26:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EA45E102F23B7;
	Tue, 28 Oct 2025 12:26:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761650808; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=uLE0eTiI6TFyVoJFE00DU2l+ZzaA7D7Dyj0PBL3xFBY=;
	b=yYdtv9h5uVkWuAPwLtXjyYlPWVrzUpwiuyAJcIxNZS3FnWiI8ct9+zIZaKSdyGWZdZP7Zq
	6Dy6UfGWkGAJ6vFf6UrdpipfXfA+/6y0JZjGcBXy1n08RfqyODVLfzUarGcsQWBSNy6Eq6
	ShVX2TJDnIWddhfA0wJRrTJmaZNtRt7CbZRMqp+pBfjTC+obK/NtCiqbCJwfebKY6zOXzG
	8a1/owtEn59F7gvrHb+ZdptxURxJG459LLZXNevh9GK7QhH5hFvT4z5jM8IQmEt2I1K6d0
	QT1GSDByFzGwmPhP8J2WgmRwdnFbGX8WtLq8Fn5+PYxER96BAEyr833Ax30ZIA==
Message-ID: <c2686441-7201-470f-b1b5-063c347bea2e@bootlin.com>
Date: Tue, 28 Oct 2025 12:26:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/3] net: stmmac: add support specifying PCS
 supported interfaces
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexis Lothor__ <alexis.lothore@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Furong Xu <0x1207@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Yu-Chun Lin <eleanor15x@gmail.com>
References: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
 <E1vClC5-0000000Bcbb-1WUk@rmk-PC.armlinux.org.uk>
 <604b68ce-595f-4d50-92ad-3d1d5a1b4989@bootlin.com>
 <aQCcVOYV15SeHAMU@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aQCcVOYV15SeHAMU@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_042652_632066_78CB0423 
X-CRM114-Status: GOOD (  13.80  )
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

On 28/10/2025 11:35, Russell King (Oracle) wrote:
> On Tue, Oct 28, 2025 at 11:16:00AM +0100, Maxime Chevallier wrote:
>> Hello Russell,
>>
>> On 25/10/2025 22:48, Russell King (Oracle) wrote:
>>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>>
>> Maybe this needs a commit log, even a small one ? :(
> 
> Thanks for giving Jakub a reason to mark this "changes required." :D
> I'm not really expecting this to be merged as-is. So why didn't I
> post it as RFC? Too many people see "RFC" as a sign to ignore the
> patch series. Some people claim that "RFC" means it isn't ready and
> thus isn't worth reviewing/testing/etc. I say to those people... I
> can learn their game and work around their behaviour.

Yeah this series needs to be tested and discussed, I am rounding up all
my stmmac platforms in my ever-growing pile of HW as I'm building my
own test farm, but all the glue stmmac boards I have are the ones that
are fairly well maintained (imx-dwmac, dwmac-stm32, sdwmac-socfpga...).
I don't have any stmmac that use the integrated PCS :(

> 
> Yes, it will need a better commit log, but what I'm much much more
> interested in is having people who are using the integrated PCS (in
> SGMII mode as that's all we support) to test this, especially
> dwmac-qcom-ethqos folk.

Let's hope we can get some test indeed :/ 

Maxime

> The 2.5G support was submitted by Sneh Shah, and my attempts to make
> contact have resulted in no response.
> 


