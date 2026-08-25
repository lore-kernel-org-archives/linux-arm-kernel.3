Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D70C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 20:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJsN+ycmZ6jkrcNxbgl4Kd5KYLWAfFZNuUGOdqM3yDU=; b=n3ZCvvcjEWOPFHO46Q3pn/oOtq
	qdArBievXeYhhi/LI++yF5Qawwi4Fx5E3YGjbryVoSGkwrVqGgPo508849bSrAPVQTGVQC+ilVjoG
	VlENOPLRQ3yOJvaBKz7PCLC0ffYQp4gHNbyZU9CI/A3/8jNEypsHGAw20nvZmy6ntGT3h91AlqrPz
	fM2GJHWp7lIwQ1oYwMU3Zd3Ra3HPM9FIDsAmjiyCUhxxljKmlk769IIA9qYCCVVxDF09bEazgQUbl
	FekRQrYaxJuyC/38lTnPmKiBFyZDo2zh0HWPLnxnRhEBiHiXbEusJKcKgXHuymNEu2UOAomah/nK1
	/mOAu75g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyxnt-00000001RWB-3qC6;
	Tue, 25 Aug 2026 20:31:29 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyxnq-00000001RVl-3yMq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 20:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-2eefaa527c; t=1787689885;
 bh=TJsN+ycmZ6jkrcNxbgl4Kd5KYLWAfFZNuUGOdqM3yDU=;
 b=R6NdCGRhmwsPGcK+ib7VBfTg6zFDEePGsBHTA8OXRomfl+MzOcmn7O17It8nBecuj748rco9n
 JRC4IUjhCmNeNQLwuVE3tcrIY3AAQVuzH/KRzvfOzk48F4r5ikd+fPu9KZ7gYm4vb1h1YO4BySH
 GpgKp1JDJCo7yPEb1KRzRc8=
X-Forward-Email-ID: 6a8dfb9650593cdd5fd1dd31
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 121.127.44.66
X-Forward-Email-Version: 2.13.16
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <82427334-8196-434a-a7bc-601e88ca8e03@lineageos.org>
Date: Tue, 25 Aug 2026 21:31:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Exynos850 GPU support
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: krzysztof.kozlowski@oss.qualcomm.com, semen.protsenko@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 peter.griffin@linaro.org, alim.akhtar@samsung.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
 <20260820142330.84514-1-tturner@lineageos.org>
 <DKY572QGTWSQ.3GW5FQV7JF485@linaro.org>
Content-Language: en-GB
From: Thomas Turner <tturner@lineageos.org>
In-Reply-To: <DKY572QGTWSQ.3GW5FQV7JF485@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_133127_061749_20542153 
X-CRM114-Status: GOOD (  12.30  )
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

Hi Alexey,

On 25/08/2026 16:50, Alexey Klimov wrote:
> 
> Hi Thomas,
> 
> On the next submission, could you please also add my email
> alexey.klimov@linaro.org to c/c list?
> It is interesting topic.

Sure thing.
> Offtopic: I have working patches that enable cpu idle states on Exynos850
> but they are not upstreameable due to PSCI (needs some argument
> shift in one of the PSCI calls due to messed up MPIDRs).
> If you will be interested to test/use that, please let me know.
> 

Absolutely would be interested to try and test that on my ERD850 device,
feel free to send patches/instructions my way.

On another side note, I noticed that on the e850-96 you setup basic PMIC
functionality in u-boot, on ERD850 we also do a similar thing via a
secondary bootloader (uniLoader), was curious to know whether you or Sam
have tried implementing PMIC capabilities into the Linux kernel at all and
if so how successful or unsuccessful has it been?

Best Regards,
Tom

