Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE34C3ABCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 17:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81aBPS6yBfZnl27zRH7ZXiOuAu20NzRTJepaZfWeHBs=; b=ZI4TATDJo0g9DEAZqdi1OUbWBN
	OHRowqRymkIXvmLO/8FVyhAV7Kb7wXgOV6ZzihErBuR1VhEpRZHDM29J5uKK0Q5xdGSrUjKfxFt+Q
	ERM2oFUniUUhr43qgOoZDDcBul+vAdF4SGPmn0urA6Zaptj0+GHlfQhhxKWkkosc5PSHzZP5voQgU
	W2D526bA6S+E+cP512LHhn08gLGapRPQlSvr8P5eHvLJROEVtWKVFglXIjbcRz3Gt+LL+NX9iHJwh
	7YTO97uv8JOaimQy6Yv0OdkGR5cZF25uo/CrLGy7SPudzjkVmuK6YuOVXkwmw8kyrjsiDxtE6hlUK
	eenFj2jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4vh-00000001Mu3-0dDp;
	Thu, 08 May 2025 17:21:05 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3so-00000001Fee-28m1;
	Thu, 08 May 2025 16:14:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=81aBPS6yBfZnl27zRH7ZXiOuAu20NzRTJepaZfWeHBs=;
	b=nO8XRuLaqeMEuHMiGg9pJfKjkfKjM+1nBX1d2T192PZgLu6UTTHVGO6dXzLDW0
	cf/AsM6lG5pEV67BuhdNNSy0k9bRt19USAk9majVuVTNoA4jdIixL8ThyfVnZqF0
	HUDD0DJf8rE0C9zNyn9/2YPnlyot7ejFIaDGGmtjL04wY=
Received: from [192.168.71.93] (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wAXJmHo1xxoaC4OAA--.307S2;
	Fri, 09 May 2025 00:12:25 +0800 (CST)
Message-ID: <25c89e3c-9625-49ac-b816-945ab9145f87@163.com>
Date: Fri, 9 May 2025 00:12:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] PCI: aardvark: Remove redundant MPS configuration
To: Niklas Cassel <cassel@kernel.org>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, lpieralisi@kernel.org,
 kw@linux.com, bhelgaas@google.com, heiko@sntech.de,
 manivannan.sadhasivam@linaro.org, yue.wang@amlogic.com,
 neil.armstrong@linaro.org, robh@kernel.org, jingoohan1@gmail.com,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250506173439.292460-1-18255117159@163.com>
 <20250506173439.292460-4-18255117159@163.com>
 <20250506174110.63ayeqc4scmwjj6e@pali>
 <8a6adc24-5f40-4f22-9842-b211e1ef5008@163.com>
 <ff6abbf6-e464-4929-96e6-16e43c62db06@163.com>
 <20250507163620.53v5djmhj3ywrge2@pali>
 <b364eed2-047d-4c74-9f30-45291305bc4b@163.com> <aBybUYYhrmlOeLAj@ryzen>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <aBybUYYhrmlOeLAj@ryzen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAXJmHo1xxoaC4OAA--.307S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr18XF48WF4Uur1kXF1xAFb_yoWkCrbE9r
	9IkrWxC3WUGan7Crs7Krn3ArWqqayDZ345W34Fy3y3A3s8ArW5uFs0k3ZaqF1rtay3KF4q
	kryYvF1jkrW29jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbku45UUUUU==
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbBDwpGo2gbipOKhwACsF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_091402_937006_CF722486 
X-CRM114-Status: GOOD (  15.55  )
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



On 2025/5/8 19:53, Niklas Cassel wrote:
> Hello Hans,
> 
> On Thu, May 08, 2025 at 12:47:12AM +0800, Hans Zhang wrote:
>> On 2025/5/8 00:36, Pali Rohár wrote:
>>>
>>> Sorry, but I stopped doing any testing of the aardvark driver with the
>>> mainline kernel after PCI maintainers stopped taking fixes for the
>>> driver and stopped responding.
>>>
>>> I'm not going to debug same issues again, which I have analyzed,
>>> prepared fixes, sent patches and see no progress there.
>>>
>>> Seems that there is a status quo, and I'm not going to change it.
>>
>> Dear Niklas,
>>
>> Do you have any opinion on Pali's reply? Should patch 3/3 be discarded?
> 
> While I do have an opinion, I'm not going to share it on a public mailing
> list :)
> 
> With regards to your patch 3/3, I think that your patch looks fine, but if
> the driver maintainer does not want the cleanup for >reasons*, that is totally
> fine with me. However, I'm not a PCI maintainer, so my opinion does not really
> matter. It's the PCI maintainers that decide.
> 

Dear Niklas,

Thank you very much for your reply. Let's wait for the decision of the 
PCI maintainer on this series of patches.

Best regards,
Hans


