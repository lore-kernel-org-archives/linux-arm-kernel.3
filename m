Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB69DC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 14:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBityMeKqjyowdclncFOnu3VU0emdWfgWBP0wAYzEhU=; b=27BmuF7ywbASQ5TpVKTtEe378Q
	s1zGhEggGQqlsztZUIXKwwt9+qMO1KMBQEWrP56qvyCbg/AOVRAawDZThj20YcteDpTsNcVlvJvNH
	VG3HoE+5HRNeOTDs0z9Eovntwh+ww/auRo6MvEtTolukiiv0yzkT04J865/pUmLIpSXSHx+vPqqVu
	tLZOW4RfiVj69QCUUWBczFlA1wPd4zl9rMwnK4zb7FgNhlvDcuswYYwbk9D3YNguZJ3Z1jw4Qf70D
	kWKLgMEUDdVyt4zc7gA4IsTXlYj4ArUztJxpVdqrVCt0DMrzsETUnvvl94GMSbfEHDplfxCaSuVKX
	jqR1pGEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu9dL-0000000GLwb-1y2V;
	Wed, 12 Aug 2026 14:08:43 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu9dH-0000000GLvy-3frC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 14:08:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 62EB61A15B6;
	Wed, 12 Aug 2026 14:08:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E7C86045E;
	Wed, 12 Aug 2026 14:08:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A8A5911C4CF5E;
	Wed, 12 Aug 2026 16:08:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786543711; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=XBityMeKqjyowdclncFOnu3VU0emdWfgWBP0wAYzEhU=;
	b=dfBfHwg/xTtwCKIqKwd6LzkSS7fZ2K9nMLgE4fMNGfMg0gHXnyWzjlg9RB0m/YIpasZRb7
	wjzm05kYbHoV5COM9bUImVh4MFL+fs+ZmPeqe6pw8KBKbO7hqg3xOQNw3ZpTlWoGCGmvWJ
	7jdEaauWKroly5iz/cE8P+HQcmQV3+5eJJ8pdTVLKSR+bCDE0qkvmiRkClbfVczb9Ftq4z
	Tp2UrALb+ixnUULxtX03D0D53nyok21dsNwlP0X3mzWqczSI5oyC15HPb39l+ACCtRfJ2U
	ZZ+ZGLEUBcvqaLuQbS0h1VZdC1kyU0g5dtk6mg+GhqU1jg5Qdk1LarYlUYBx/g==
Message-ID: <96146485-03f4-4c82-bb4b-9338b6591b2f@bootlin.com>
Date: Wed, 12 Aug 2026 16:08:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: stmmac: dwxgmac2: add XGMAC timestamp
 interrupt support
To: Zxyan Zhu <zxyan0222@gmail.com>,
 "Nazle Asmade, Muhammad Nazim Amirul"
 <muhammad.nazim.amirul.nazle.asmade@altera.com>
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, richardcochran@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260810100221.9166-1-zxyan0222@gmail.com>
 <b3d90606-781a-4055-8529-e68e22a45ce9@bootlin.com>
 <20260812202027.976@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260812202027.976@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_070840_061153_2384760D 
X-CRM114-Status: GOOD (  13.82  )
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

+Nazim

On 8/12/26 14:59, Zxyan Zhu wrote:
> Hi Maxime,
> 
> On 8/12/26 5:10 PM, Maxime Chevallier wrote:
>> If there's an interrupt storm, then this should probably be a fix for -net
>> with a Fixes tag.
> 
> There is no interrupt storm. XGMAC_TSIE was never enabled before this
> patch (XGMAC_INT_DEFAULT_EN was LPIIE | PMTIE only), and
> dwxgmac2_host_irq_status() masks the status with the enable mask, so
> XGMAC_INT_TSIS could never fire. The actual symptom is that
> auxiliary-snapshot extts events were never reported -- a feature that
> was never wired up, not a live interrupt storm.

Ah indeed, quite the opposite then.

> 
> So I'd like to keep this on net-next as a new feature rather than
> retarget it to net.

Yes makes sense indeed.

Can you take a look at the sashiko-reported issues, it spots that this
could interfere with the timestamping on agilex5 (another XGMAC platform) :

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260810100221.9166-1-zxyan0222%40gmail.com

Maybe there's some stuff that could be made more generic by moving them out
of the socfpga code and putting it in the more generic timestamping code ?

I don't have any xgmac boards to verify sashiko's claim though.

> 
> Thanks,
> Zxyan
> 


