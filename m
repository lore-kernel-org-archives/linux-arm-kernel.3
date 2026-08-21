Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611BBC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 13:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zgZgDh7aVAOkoqDbyZC6cL4rz+qele9fsZ91dWkXpg=; b=MMWJFk73nArfENNRSsl4dax/FS
	jXZUZDyphRTOI4tsXT5MRIm+VxLhUzEoz59riCB00NNWwi7GREVRGP+nhOrIGUMeZBi6BW3hEd9Rf
	EeYxGEA1OX62zFS5XudHB87nUiNSHfS9mXXIbe5G6WqGUlBD5nO5xhYNyTaXwc3bWdhHT0usYQ6dN
	OcF8adso2kh0UNXue0yYtRdH/dtmnpkKKQtOLBllGhOvnJUumB88kW41mArBB2fi39OrohlU97hJN
	oVkFOs5TWQxAawlwXe/kk9YsHZX/zeO3Ra+/iCcg5ZLNUopHyxZcjuwgG6QcwOmWWGCEyoyF9ZAVs
	1lofZBtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPVA-0000000DRgY-11t4;
	Fri, 21 Aug 2026 13:41:44 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPV7-0000000DRfN-3JPM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 13:41:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 164874E4131C;
	Fri, 21 Aug 2026 13:41:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D4CF9604AA;
	Fri, 21 Aug 2026 13:41:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A1F8011C77174;
	Fri, 21 Aug 2026 15:41:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787319692; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=0zgZgDh7aVAOkoqDbyZC6cL4rz+qele9fsZ91dWkXpg=;
	b=AvqrzzRi+NQofrXerRpVaUlPTHMdubK8vJEVHpvd5n3vpY3hl7s1q+Drkz88ytOfSNvBUT
	50qqcaqJkrPUomdZvFRO/2hiKkicz7NjhEbJa67uOCGDflXDGba1c+pK9s8yDKudYf/bXd
	b3pshwfgjRkxfrMY/AY4NljfBFR6hwvEinqkSLai+LDJkgn6oH/l8WTa+SupL9zRigA90v
	Gn5BMW1PrjKEV+ACddGYpEH72sW+oJdAp4efjtau+0piUPrnmHP1WKuEmY1rQI38bOyU9d
	iQUP6LVY5oWzWmEhsHaoy4BENg+khWgebv3TTVPmcNf2EHDGCwCntjYG5EdCtQ==
Message-ID: <5693c628-dffb-46c4-8f7c-5a5a6c101660@bootlin.com>
Date: Fri, 21 Aug 2026 15:41:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: stm32: Set TSO/TBS Tx queues
 default settings
To: Kurt Kanzenbach <kurt@linutronix.de>, Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
References: <20260812-stm32mp2_txtime-v1-1-f9e2462cc85d@linutronix.de>
 <20260817103337.74c30adc@kernel.org> <87mrujzzjv.fsf@jax.kurt.home>
 <20260818075335.48936b08@kernel.org> <87h5kq1s1f.fsf@jax.kurt.home>
 <20260820144528.7107ba90@kernel.org> <87y0e0x7ic.fsf@jax.kurt.home>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <87y0e0x7ic.fsf@jax.kurt.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_064141_984272_35F8EBB0 
X-CRM114-Status: GOOD (  20.98  )
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

Hi Kurt,

On 8/21/26 09:22, Kurt Kanzenbach wrote:
> On Thu Aug 20 2026, Jakub Kicinski wrote:
>> On Wed, 19 Aug 2026 09:35:40 +0200 Kurt Kanzenbach wrote:
>>>>> I want to use ETF Qdisc with hardware offload, which is currently not
>>>>> possible on the stm32mp2.  
>>>>
>>>> Do you need multiple queues for ETF/normal traffic?
>>>> Or one ETF and one "normal"?
>>>>
>>>> How do you sort the traffic between the queues?  
>>>
>>> So the stm32mp2 has two CPU cores. I've isolated CPU1 for Profinet. That
>>> one uses Tx/Rx queue 1 with ETF to reduce the Tx jitter. Everything else
>>> is routed to Tx/Rx queue 0.
>>>
>>> Config looks like this:
>>>
>>> #
>>> # Tx Assignment with SP.
>>> #
>>> # Tx Q 0 - Everything else
>>> # Tx Q 1 - RTC
>>> #
>>> tc qdisc replace dev ${INTERFACE} handle 100 parent root mqprio num_tc 2 \
>>>   map 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 \
>>>   queues 1@0 1@1 \
>>>   hw 1
>>>
>>> #
>>> # Enable Tx launch time support for TC 1.
>>> #
>>> tc qdisc replace dev ${INTERFACE} parent 100:2 etf \
>>>   clockid CLOCK_TAI \
>>>   delta 500000 \
>>>   offload
>>>
>>> On Rx incoming frames are steered via PCP field (vlan tagged).
>>
>> Thanks for explaining!
> 
> No problem.
> 
>>
>>>>> It seems like a static configuration in the driver today. I basically
>>>>> followed the same convention as dwmac-imx, dwmac-intel, dwmac-mediatek
>>>>> and dwmac-qcom-ethqos. Only dwmac-socfpga does it differently.
>>>>>
>>>>> Tx Launch Time requires a different DMA descriptor layout. Currently
>>>>> tc_setup_etf() just returns -EINVAL if the DMA configuration is not
>>>>> setup appropriately. I guess a dynamic configuration requires to change
>>>>> the DMA config and perform a full release/open cycle.  
>>>>
>>>> release/open is not ideal but still better than hardcoding?  
>>>
>>> For sure it's better than hardcoding :). But, again the driver does it
>>> statically. Maybe there's a good reason for it. Maybe not. I'm not that
>>> familiar with the stmmac driver. I'll prototype something to see whether
>>> we can enable TBS at run time using the ETF Qdisc callback. It may take
>>> some time though.
>>
>> I think the m in stmmac stand for 'mistake'. 

let's rename it stmmmmmmmmmmmmmmmmmmmmmmmac then

> 
> :D
> 
>> We need to start cleaning it up.
> 
> No objections here. I've briefly looked at the TBS thingy. I think we
> just need to reconfigure one Tx queue instead of doing a full
> release/open cycle. The XDP/ZC code does something similar. So the
> infrastructure seems to be in place.
> 
> However, we need to keep track of what SoC implementation can enable TBS
> on which queue. For gmac4 we can probably reuse tbs_en and for xgmac
> there's is capability field tbs_ch_num. Let's see.

Thanks for tackling this, let me know if you need testing. In the past weeks
I've been looking deep in my drawers as well as on various online shops, and
I'm starting to have a farily comprehensive set of stmmac-enabled devices
(although I couldn't get my hands on XGMAC, AgileX5 devkits appear to be way
outside my budget).

Let me know if you need help in testing for this, and we can ask the Altera folks
for some help in XGMAC testing.

Maxime

> 
> Thanks,
> Kurt


