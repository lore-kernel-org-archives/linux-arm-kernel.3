Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C103E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 12:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldpU7U+iDeDqdGmWrr2McLkbrGNSwEPYJtJhCL7zXIg=; b=GcGaYECnm20tINPABBdmL1l5+U
	Ieh/ECMfKtoSBw7OxwsDVtxay8rSH84qjzcOKH0VSrGy3yxdj5a/gkFhfzuhvJuY7qKAcDO65WhqK
	JVeD0lMsx+3cXyHXrSJfwnIpFUWYYIGk6t4g13wYCt85VEHockb/QVDYfoogXBMhx0VCi0LJLPo1k
	jL4blgV3wZrnpUhziXy21izHU2YT6vw9bwl2E6Qvb7b4MTOetfCK78hPfku9vcBMFh6V2MTEp5snl
	E16QD2pSNw5RmNkPUm6OtoFBD7G61fJbzCQcP+81S8ns1mBBzQGN+MNF4oxGuWgBP7MovPtuoDvyV
	bQyzMaQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPhCJ-00000009y5G-1Y4N;
	Mon, 23 Dec 2024 12:06:07 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPg1O-00000009oYG-1Sv2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 10:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1734951030;
 bh=ldpU7U+iDeDqdGmWrr2McLkbrGNSwEPYJtJhCL7zXIg=;
 b=sON0gedR1ram4Gzmd9Faq6dzeR17akklVFBSXvGjjUwmqklid9X6a0eJdsw8upYSLHeY/WuN8
 OTbSbkvSsyb4by2A3Pp0P6yRRA3mDi+jiGVr24NJhOBRX8vlmzWRm1ke8XrSKW4mIdkNS0zQ2hR
 f9ApoMvv+0RxTs7dgafEp+mx/4oeN582Qjfz1ElVs0e9XxuJgnRWnHmRbu5OFAj/yCj/xdPafwq
 rOfnpCF4/rjIpdBvWsZsBkk7YcRC05MCNmaquOdUJPnyCiGM8IfCyhM5vBfFLwOaDZ3djvtgRlw
 hXZYFVxIIpTu7whGC1otWVYyGrAjjEoOQAPIlj/kHg3A==
Message-ID: <d7b2e993-c6c8-4e60-bfe2-80857ca8a992@kwiboo.se>
Date: Mon, 23 Dec 2024 11:50:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: default to host mode for USB on
 Radxa E25
To: Chukun Pan <amadeus@jmu.edu.cn>, naoki@radxa.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <4D8217DF36191C3E+be8bbb4f-ea52-4f81-8501-ff551f54621c@radxa.com>
 <20241223030006.852427-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20241223030006.852427-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 67694076445b82250f09d24a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_025046_723597_302FF7C6 
X-CRM114-Status: GOOD (  12.86  )
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

On 2024-12-23 04:00, Chukun Pan wrote:
> Hi,
>> I've been using the uSD card for a long time as a bootloader only,
>> so I don't know what the problem is.
>>
>> Do you have any information on how to reproduce the problem?
>>
>> Best regards,
> 
> Not stable on openwrt/lede, sometimes falling to sd-highspeed.
> Maybe it would be better to switch to sd-uhs-sdr50 mode.

I would advise against using any sd-uhs- mode for sd-card on Rockchip
RK356x boards because of a timing issue during boot between mmc,
regulator and IO-domain drivers.

Any board that support changing between 1v8 or 3v3 io-voltage for the
sd-card is possible affected.

There is a race condition during boot and when IO-domain driver has not
been probed before UHS tuning is started the tuning is done using a 3v3
IO-domain configuration instead of 1v8.

This can typically be seen by comparing UHS tuning during boot and when
same sd-card is removed and re-inserted after boot.

Ideally this race condition should be solved instead of limiting use
of UHS modes. However, use of sd-uhs-sdr50 is typically more forgiving
and has been used on other boards.

Regards,
Jonas

> 
> Thanks,
> Chukun
> 


