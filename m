Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A482CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 14:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GdesLHGEaV1JBZuqmJbDS/jaBfHZjxT8ElBdzLC3Tqc=; b=qoN0rzKLW2Hvfr+rWlfayVvYCX
	2ObwaY+7bV9KyU3HbXxaDrABDg4HD+ZS6tyJ8GpzbhbBuJ7NT+5S3nPlGV02iIMDmKwREU49QKIXH
	kh8bF6lGzb/muQr0TTUeXjzhTuHP7RRkjBNcikbEgD5epVaeso8m72CrFcEyfnay2r70gYrnokVjj
	H6XX4jNRTyemiwyAy2vTHfRMRyCYJqb3RJzzsQ28t0dXIojoeTYluEp17xoSFNgRZtj3Qg+VrSXBg
	Wzawc0eMjCp79+EKcrVfaJIrTCyRPigK4pQtOMpIAn5MEixPbVELGeNddxpJBaSKYRAwab3kY4s56
	EQs9j2Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAUeu-0000000B6YK-3ZGH;
	Sun, 19 Oct 2025 14:45:20 +0000
Received: from smtp-69.smtpout.orange.fr ([80.12.242.69] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAUeq-0000000B6XN-2ncY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 14:45:19 +0000
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id AUebvZVGoUjXQAUebvcVLF; Sun, 19 Oct 2025 16:45:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1760885103;
	bh=GdesLHGEaV1JBZuqmJbDS/jaBfHZjxT8ElBdzLC3Tqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=UhuGRoKIJrtlw0wUNoGko+gmYwvyO2Ue7rnSET3mQKJWF7PgHrnsQBQIm5ntnnAks
	 Uubj6NYKVxBD8HHQvM8NEchfP4xsXSjehpzipA2S0JRY4AfXTZO6L2zTjTrQn/P6oC
	 hWQpEJaDjzdnQ4pPZ90dzpXL79Ttiv+FA1vYtKdxnLD+whQBjsmhZ/Y2wjWc8uFphj
	 zV/ce3i10/gDpU327tMMz9w/1m6FtQxiXTP0sdSSlqqR5RWvRCMoyNZUmVk4aeUVp/
	 2ovcvr1cciV0tL0U4xhoqAx6+mfy6RzRH0MXo9tBYcequ07bul60gPvjXDca6K+/vI
	 F7rB+ZwD8sIzA==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 19 Oct 2025 16:45:03 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <26975dab-9631-4661-aaf4-afa213104a13@wanadoo.fr>
Date: Sun, 19 Oct 2025 16:45:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] PCI: j721e: Propagate dev_err_probe return value
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org
References: <20251014113234.44418-2-linux.amoon@gmail.com>
 <a2cefc72-de44-4a23-92d2-44b58c8c13fe@web.de>
 <CANAwSgTtaAtCxtF+DGS-Ay4O3_9JMwk-fJ27yoijhWWbF2URrg@mail.gmail.com>
 <cf656a57-bb2f-447e-ac6c-0ab118606dc9@web.de>
 <CANAwSgT0jSQ3pFR3MQo-ENziqrm=yn-rFBTdHegmknMeFd44OQ@mail.gmail.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <CANAwSgT0jSQ3pFR3MQo-ENziqrm=yn-rFBTdHegmknMeFd44OQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_074517_910440_1DE89A0E 
X-CRM114-Status: GOOD (  18.01  )
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

Le 19/10/2025 à 12:15, Anand Moon a écrit :
> Hi Markus, Vignesh,
> 
> On Sat, 18 Oct 2025 at 16:12, Markus Elfring <Markus.Elfring@web.de> wrote:
>>
>>>> I propose to take another source code transformation approach better into account.
>>>> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/base/core.c#L5031-L5075
>>>>
>>>> Example:
>>>> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/pci/controller/cadence/pci-j721e.c#L444-L636
>>>>
>>>>          ret = dev_err_probe(dev, cdns_pcie_init_phy(dev, cdns_pcie), "Failed to init phy\n");
>>>>          if (ret)
>>>>                  goto err_get_sync;
>>>>
>>> No, the correct code ensures that dev_err_probe() is only called when
>>> an actual error
>>> has occurred, providing a clear and accurate log entry. …
>>
>> Where do you see undesirable technical differences?
> 
> The primary issue I wanted to confirm was the function execution order.
> since cdns_pcie_init_phy within dev_err_probe function
> 
> If other developers agree with the approach, I will modify this in a
> separate patch

This other approach is just broken.

Using:
	ret = dev_err_probe(dev, cdns_pcie_init_phy(dev, cdns_pcie), "Failed to 
init phy\n");

1) is hard to read and understand.

2) would log an error message even if 0 is returned. This is just wrong.

2 good reasons not to do such things.


You should ignore people that are already ignored by most people on 
these lists.

CJ

> 
> As Dan Carpenter pointed out - " Wait, no, this doesn't make sense.
> It's just assigning ret to itself."

Yes, Dan is right.

> 
> This patch seems irrelevant to me as the return value gets propagated
> to the error path.
> Sorry for the noise. Let's drop these changes.
> 
> Since I don't have this hardware for testing, I will verify it on
> another available device.
>>
>> Regards,
>> Markus
> 
> Thanks
> -Anand
> 
> 


