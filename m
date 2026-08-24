Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F5CC61DB4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 09:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5JNIKTk99mqX00p9EnKMWbWpSfVVLgeAoJqGdZVoMMw=; b=VXWbYDcCIgzJq7XZYj6RK5Ll6W
	8VO+6r7hjbI7yZs9Me8naccLqskdNZiqg2vRIZc9fZz6InsjuJu3ZIayNFjJd+yp9iOVmvA6UUBb8
	M7sucaEYqH2WK38ytLyOtcsl1Lf+Gc6zl1/bb3ctdF447McU6htPyXEHwsJjarDvg5jV0x+TNVj7Y
	dsUxCRQPIMNB8jqxUwqGFeSMHQxziIRTskKzvieE2U5O0iMCZLFLXyAMM8JvmYhJMxYLbhvBsVaJw
	0LOQXq2ePkec5ySv9VQqi+KDmBNwQ6lVJ+8OX2tTbzhE5Qja5kJk4BYZ9x7ForZqPSaqB4+YiXi7N
	fT7UAXiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynlG-00000000WYq-2jVt;
	Tue, 25 Aug 2026 09:48:06 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynl6-00000000WUF-0aq6;
	Tue, 25 Aug 2026 09:47:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 441FE11C187;
	Tue, 25 Aug 2026 11:47:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787651270;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=5JNIKTk99mqX00p9EnKMWbWpSfVVLgeAoJqGdZVoMMw=;
	b=FJ86VyC1TPOUb77sWpRnoea6tlZBvYmblAYhnllz8Flz1PEpParjwdM16bQAIXKkT7GAkE
	XXDix7PGuR/qBJhFMIhY6COUahTYhjlA/q9ZvV8S+c/RmKCynKgaRqn1S3gics8Bk1o2nP
	vcD6YyZxSLj7lQM3AIK7kxQF5UkGtCo/I3tiT/uye7RMic5eWiGzwFjPAmbsPP0G3CvwJg
	WivJduJcOmrUVPQS9ErUNzPJzedQmhf4RQIgVsD/PI8R0I3+pAXYwosQ1IFYksCVc7RN01
	J83hjGHVA3k+nX6YqbtmsCFB7qhuuEczTZTg+3E7yaA1Fivmi8/BqJOQoWr9qw==
Message-ID: <ad353c4d-c6c8-4ff1-993f-e50b156a4401@nabladev.com>
Date: Mon, 24 Aug 2026 16:53:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] phy: stm32: Add support for ST STM32MP25
 USB2-FEMTO PHY
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-usb@vger.kernel.org
Cc: Pankaj Dev <pankaj.dev@st.com>, Rahul Kumar <rahul.kumar05@st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-3-marex@nabladev.com>
 <b470667d-6a15-4eb1-9332-07f25f069b3f@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <b470667d-6a15-4eb1-9332-07f25f069b3f@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_024756_359142_7F733A55 
X-CRM114-Status: UNSURE (   9.99  )
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

On 8/24/26 3:17 PM, Fabrice Gasnier wrote:

[...]

Hello Fabrice,

>> +static int stm32_usb2phy1_init(struct phy *phy)
> 
> Hello Marek,
> 
> Could same init routine may be used for both PHYs ?
> See below comment.
> 
>> +{
>> +	struct stm32_usb2phy *phy_dev = phy_get_drvdata(phy);
>> +	int ret;
>> +
>> +	ret = stm32_usb2phy_enable(phy_dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	phy_dev->is_init = true;
>> +
>> +	return 0;
>> +}
>> +
>> +static int stm32_usb2phy2_init(struct phy *phy)
>> +{
>> +	struct stm32_usb2phy *phy_dev = phy_get_drvdata(phy);
>> +	int ret;
>> +
>> +	ret = stm32_usb2phy_enable(phy_dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (phy_dev->mode != PHY_MODE_INVALID) {
> 
> The only difference is here. On the PHY#1 the mode should never change
> e.g. mode == PHY_MODE_INVALID. So same routine may be used for both PHYs ?

Since there are separate ops for each PHY, I opted for avoiding this 
conditional on a PHY where the conditional makes no sense, hence the two 
separate init functions.

>> +		ret = stm32_usb2phy_set_mode(phy, phy_dev->mode, USB_ROLE_NONE);
>> +		if (ret) {
>> +			stm32_usb2phy_disable(phy_dev);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	phy_dev->is_init = true;
>> +
>> +	return 0;
>> +}
[...]

