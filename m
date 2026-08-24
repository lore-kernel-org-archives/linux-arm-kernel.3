Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737E2C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 10:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdYkIXIlftjAnppC8SHjw1JTObFUeSukQACJZ/mcO7Y=; b=qk0acxZL/RjO25IpQj22x0uUFp
	9IppXvSG7iHcOHTMBuWgMApSidqgo7rcEQEyuNADhEr+E5yykplAKXgFL4xCfchmw9MRnbMmUvfvX
	6HVYEPUeWbmbtU6EKJuiRPBej9xz83rjq7Ai+W8nfHqQNooAJKDxc4zi62hs9sdCjJarN1Oq7owIu
	h6Z4OWHkU+n65ykKol4l23anpZOGPhsQM8QFQAIi4jG4BbwUODQr9ox7X+W6uKGmkHrGGQIs3o0Fs
	434pdIH2IUKskwwka5sA+MPM0OIqDwp0VRGq38dT32Y1a0EK6WgOROdFitxzSnRBMq84xsQ0v1z4F
	zqU0kyDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyS3S-0000000GPvn-2uoA;
	Mon, 24 Aug 2026 10:37:26 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyS3Q-0000000GPvM-0q71
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 10:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-2eefaa527c; t=1787567842;
 bh=YdYkIXIlftjAnppC8SHjw1JTObFUeSukQACJZ/mcO7Y=;
 b=dA1hYzjDyPEsrhFx3oWFcBOYCK8/4K090/CTH/aKk+OB2WfInwT09Ql/qnfPYRpGBGWlwM2iA
 DRza2+Wci18bG4zjcqQoZ41c12CU8Uw3l0JXVZlJCPyNf9wTefS+/E7jYqnSUAhl4dT+yZBqfTt
 Ky/OKhyarf2t3RoggOw74Tw=
X-Forward-Email-ID: 6a8c1edf8bf58215f74c5bbc
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 121.127.44.73
X-Forward-Email-Version: 2.13.16
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <91a95ba1-504d-41ef-b44f-59408b0939b8@lineageos.org>
Date: Mon, 24 Aug 2026 11:37:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Exynos850 GPU support
To: Sam Protsenko <semen.protsenko@linaro.org>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
 <20260820142330.84514-1-tturner@lineageos.org>
 <88e40f93-ae65-4eb0-827d-9c33c52bad24@oss.qualcomm.com>
 <GVYP280MB1213F9511E062056470AE74AA1A42@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
 <GVYP280MB12134B4DF9D6CA15C7867CF8A1A42@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
 <9c83836b-b4a6-40af-97b1-bbf696258547@kernel.org>
Content-Language: en-GB
From: Thomas Turner <tturner@lineageos.org>
In-Reply-To: <9c83836b-b4a6-40af-97b1-bbf696258547@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_033724_357542_8255E2E2 
X-CRM114-Status: GOOD (  28.03  )
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

 > Can you please tell us a bit about how you tested this patch, and on
 > which board? As DPU is not currently enabled on Exynos850 SoC, I'm not
 > sure how exactly GPU can be useful. If you have a use case or a
 > testing procedure we can run on the E850-96 board, please share.

I tested this patch by running phosh (PostMarketOS) on the Samsung 
Galaxy A21s device, in my tests logs indicated that the GPU hardware was 
probed successfully and things were working. As for DPU, I simply 
enabled CONFIG_DRM_SIMPLEDRM and that was enough since the bootloader 
configured the related DPU bits. Since I don't own the e850-96 dev board 
myself a testing procedure you could do is.

1) Set status="okay"
2) Enable CONFIG_DRM_SIMPLEDRM and CONFIG_DRM_PANFROST
3) Try and boot some form of GUI and compare logs from dmesg with mine.
4) NOTE: we set up fixed regulators during our testing with some support 
from a secondary bootloader, however it should work with dummy regulators.

 > Would be nice to have a more detailed commit message overall. In
 > addition to the above, it probably makes sense to also discuss current
 > limitations. E.g. thermal, PD, and DVFS, which are enabled in the
 > downstream kernel's GPU node [1].

Yes, I have updated the commit message in v2 of the patch series to be 
more descriptive about what does and does not work, I hope that level of 
detail is sufficient but feel free to point out any sections I may have 
missed.

 > How? The node is disabled.

Not sure if the e850-96 device supports this functionality so for the 
mean time I left it as "disabled", but would be interesting to see if 
Sam or Alexey could test it too.

 > Also, you need to version your patches correctly. This is v2. You also
 > need changelog under ---.

Again, sorry for not including this I am still getting my head around 
the process, but in the v3 of the patch series I will make sure to 
include it.

 > You almost never use this parameter.
 > git format patch; scripts/getmaintainers; git send email

Got it thanks, Sam has been helping me with some of the kernel etiquette 
and procedures in a private thread so hopefully the next patch set 
should be lots clearer :).


One other thing I wanted to ask, do you think it would be best to 
include the logs about the GPU probing in the commit message of v3?

In the next patch version I am going to reword the commit msg to be more 
precise, i.e Add nodes for GPU. Can add more information about how I 
tested it and possibly logs from dmesg.

Cheers,
Tom.

