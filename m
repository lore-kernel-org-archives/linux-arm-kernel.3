Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD27D5CC82
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 09:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zlFTnug5tI2ynQSk3/l+OrJRxDnAbZI1K1JqVJUkos=; b=HurXSS7TUt0ZCprAa/QaovywQl
	JdbD5npjn4lzlY3muifukfm7WnkwQCP2weEbFi/os6WhwfUNttXnN88+D9kz70bV/eFsLohQqOUbb
	+X+X1+6IxaxEhPUfI5nitQiEeHnjGPhMXz1s96/6jD7wlsEmdWIaSon094LDjsUve8e/HLXat4WPh
	7UFjC5YANpqAEE0/qCuWNhcRr9glh6MDFFWtH6ES8s9+hUpEbQ1t2BPPi5vaoV0k0Ja7glg3tWHCJ
	7vso2xJAxfFAIIgpSyjO7n1SRdOGqmlvmGmsFX9tiwN7KdFBPKH+v/pjjJjgL2LD+Zwh8jphkC5xE
	OuEvu9CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t65R0-0000000HSme-0xxV;
	Wed, 30 Oct 2024 09:56:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t65PK-0000000HSOV-2PJi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 09:54:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F6DD113E;
	Wed, 30 Oct 2024 02:54:57 -0700 (PDT)
Received: from [10.57.58.72] (unknown [10.57.58.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2FBD3F73B;
	Wed, 30 Oct 2024 02:54:24 -0700 (PDT)
Message-ID: <ab36709d-a181-4621-a8e5-0ef38b80186b@arm.com>
Date: Wed, 30 Oct 2024 09:55:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 1/1] cpufreq: scmi: Register for limit change
 notifications
To: Cristian Marussi <cristian.marussi@arm.com>,
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, rafael@kernel.org, viresh.kumar@linaro.org,
 morten.rasmussen@arm.com, dietmar.eggemann@arm.com, pierre.gondois@arm.com,
 vincent.guittot@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_mdtipton@quicinc.com, linux-arm-msm@vger.kernel.org
References: <20240603192654.2167620-1-quic_sibis@quicinc.com>
 <20240603192654.2167620-2-quic_sibis@quicinc.com> <ZyH9HvKmYjlJC8_x@pluto>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <ZyH9HvKmYjlJC8_x@pluto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_025430_890531_B809C1C7 
X-CRM114-Status: UNSURE (   9.61  )
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



On 10/30/24 09:32, Cristian Marussi wrote:
> On Tue, Jun 04, 2024 at 12:56:54AM +0530, Sibi Sankar wrote:
>> Register for limit change notifications if supported and use the throttled
>> frequency from the notification to apply HW pressure.
>>
> 
> This sort of got lost in mbox...apologies.
> 
> As discussed offlist, the issue with cpufreq and multiple SCMI instances
> remains BUT it will be solved later on with a different approach, so
> as of now this LGTM.
> 
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thank you Cristian for re-visiting this.

That code also LGTM and fits into my other construction built on top
of it [1] [2]. I had a talk with Rafael below that [1] about this
subject patch.

Feel free to add:

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

[1] 
https://lore.kernel.org/lkml/20241029094452.495439-1-lukasz.luba@arm.com/
[2] 
https://lore.kernel.org/lkml/20240403162315.1458337-1-lukasz.luba@arm.com/

