Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7DBC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 15:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jKrds4Vj9VpxWlbeCohHZvmSocW530LXUZIAJ3ynTZw=; b=hNLml6C0LFKc6XDvzbocQFf5wR
	zZqhQGkrFhiwN+PkoM90xS+R08Q5fwISPMsCgiLu28dr6FpiE3S/7qsGqIDxMQ/wrUjZy/IvQTSjU
	LkGHq/lbW/ijVNWD5Qt175oeh4Oc5oMhKDGLjkvD9KHVdRfACE7rcVNeGz6Lg6hK6qDi/g1Cl74M2
	iRY8VC4ss6kS9OdkNGYxkGvLuB+8Oog2w5TU/fas/C8YZcyUJilVwiLOwbg/Ix/lgAlBq0DO8fYo6
	sna5Wd7RHeQhwTIDo2gOJHErrpZUF+9xXrMCAgnb2m6S4WHUOKPpsh94N/rhN2l6oRRZMJ20o6/YB
	WVuPMJTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwiTW-0000000A7FY-2zn1;
	Wed, 19 Aug 2026 15:45:10 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwiTU-0000000A7F7-1vv6;
	Wed, 19 Aug 2026 15:45:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6620911A40D;
	Wed, 19 Aug 2026 17:44:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787154301;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=jKrds4Vj9VpxWlbeCohHZvmSocW530LXUZIAJ3ynTZw=;
	b=ZguuqLgG498/pjMsosn7OaBTD9B1+NF5ZsweITOEhJ4AJduSLZ2b3PMnCGUys3m+qOziXb
	Vya4pIYMGVkAp2d5P1j1R942XY9FmvGh/clUY+zwgepGVFVNh8hLJCCFuFbHxf2sH3c9qu
	LBo0VDhWdSaU1e+sM0tR6VB+qqrYwK6dSsDwmeaHcYYYnnEu2k5HfbFbXZ3P89LNCVNxfE
	uVRF7DCqv3g899nR56jDa+gFcJyw/gvcaUJDrvUPgTL0EG9wvW6k6Ts0Wl8DVQaBRLpg8Q
	Ey1Ny+HxFcVT2ckiCcnpK7xcQAAdoTDKNUqXn8ya3hN0hCR0fmDhUZBmH1nR8g==
Message-ID: <23091037-bfeb-46ac-b17d-8b86394b119e@nabladev.com>
Date: Wed, 19 Aug 2026 17:44:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] arm64: dts: phy: st: usb: Add STM32MP2 USB support
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-usb@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev <pankaj.dev@st.com>,
 Rahul Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260816213849.1044073-1-marex@nabladev.com>
 <61dc785c-bea1-4674-918d-0f38ea253a29@foss.st.com>
 <41e7978b-933d-4813-9158-00474f531476@nabladev.com>
 <6c900e6b-2f50-4ec2-aca4-3093479bba53@foss.st.com>
 <d6064380-2368-4131-8cde-44734f67028f@nabladev.com>
 <066ce020-6123-4aed-a069-67c51957173d@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <066ce020-6123-4aed-a069-67c51957173d@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_084508_717228_BEFF0471 
X-CRM114-Status: UNSURE (   9.86  )
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

On 8/19/26 5:19 PM, Fabrice Gasnier wrote:

Hello Fabrice,

>> Maybe the DT syscfg node shouldn't be a plain syscon , but rather there
>> should be an actual driver which binds to the syscfg DT node and
>> configures all these hardware details early on boot ? The USB controller
>> drivers will start only later, when the syscfg configuration is already
>> set in the hardware by this (future) driver, since they depend on the
>> syscfg node and the PHY subnodes. Maybe that is the way to fix the MP21
>> without having USB controller glue ?
> 
> Hello Marek,
> 
> Ok, I'll think more about it regarding MP21. Let's continue on current
> series without any additional glue driver for MP23/25.
There is really no rush, if you can come up with something for MP21 that 
does not require the controller glue, that would be real nice.

Thank you for your help !

