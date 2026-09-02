Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F56C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 14:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UBvLVixT6RLkfZb5JmChiUQYBB/FY97zNKMHPqvta4I=; b=uuRibkfwRArQtFjQuIe2O961a4
	jolgE2BJBfiqDg1BLk3VyyVZ5v7yA2reMOyglL27eGrzK5CqN4qF/mIo7Nu1nZbjrWBEStzaEst7U
	YIFzrXIT56VfkvbgnBTW9nSecdTFkEcWElYfB8tH8dMpufqcq/q6Yq4ZO1/3fQSn84pKYSGsJc3eV
	2moxkX4MieS2v6GsrS3e0he6BXzDIwQCd2FrILLzkNBsRYNWZxjF56fc3+eGsGZb5wUVAtz8poxtE
	IJ/75hiswh+IUKybTcjqfy2SdpiDcZq0pXqDWhT2It6hKMS2c7LE6xAGjMwmIsT2Tq1Wm4kz2hWP5
	fwKYI2oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lWe-0000000EsUN-0gsy;
	Wed, 02 Sep 2026 14:01:16 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lWb-0000000EsTl-2tam;
	Wed, 02 Sep 2026 14:01:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB580116285;
	Wed, 02 Sep 2026 16:00:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788357666;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=UBvLVixT6RLkfZb5JmChiUQYBB/FY97zNKMHPqvta4I=;
	b=c0vhFCUm60JhACOaILD6cYJwpBpRswO/i3lqu56CVr/czbBMgUfZFhRhbswuSBOvFcrnt5
	umsfz3gNoE3y+FnfJ725bec1sYgvHj2t1SqJVD/kdEkf1hGQBn/uqXfm5NDB0KPZbgL/4L
	CTSBib66XoXyCKoCsMikTAIk9LokJgaqTN/1d44C2d1aHp2PQ5eHeXdoNYSoWFifK7bXyk
	bzuIEEq++2YUKG7ID8qeLFFn2yZ9jC3/VeID1XIl++kMZdccFMXY12U0+Q8saPOwPsPkA1
	qcldKnPecGK9avgb+c4COn2TAIRkF/ucNtNpYd2RtxyB3CZnCnlfkasnOhLK5w==
Message-ID: <6ffc69b6-4f93-4799-a369-f71ce9d97530@nabladev.com>
Date: Wed, 2 Sep 2026 15:45:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] phy: stm32: Add support for ST STM32MP25
 USB2-FEMTO PHY
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 linux-phy@lists.infradead.org
Cc: Pankaj Dev <pankaj.dev@st.com>, Rahul Kumar <rahul.kumar05@st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Rob Herring
 <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260828150739.174460-1-marex@nabladev.com>
 <20260828150739.174460-2-marex@nabladev.com>
 <4a33230b-3e5a-4132-8467-79b864a91b99@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <4a33230b-3e5a-4132-8467-79b864a91b99@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_070113_948587_47718242 
X-CRM114-Status: GOOD (  12.37  )
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

On 9/2/26 9:52 AM, Fabrice Gasnier wrote:

[...]

>> +static int stm32_usb2phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
>> +{
>> +	struct stm32_usb2phy *phy_dev = phy_get_drvdata(phy);
>> +	u32 mask = SYSCFG_USB2PHY2CR_USB2PHY2CMN |
>> +		   SYSCFG_USB2PHY2CR_VBUSVALID |
>> +		   SYSCFG_USB2PHY2CR_VBUSVLDEXT;
>> +	u32 val = 0;
>> +	int ret;
>> +
>> +	if (mode == PHY_MODE_USB_HOST) {
>> +		if (submode != USB_ROLE_NONE)
>> +			val = SYSCFG_USB2PHY2CR_VBUSVALID;
>> +	} else if (mode == PHY_MODE_USB_DEVICE) {
>> +		val = SYSCFG_USB2PHY2CR_USB2PHY2CMN |
>> +		      SYSCFG_USB2PHY2CR_VBUSVLDEXTSEL;
>> +		if (submode != USB_ROLE_NONE)
>> +			val |= SYSCFG_USB2PHY2CR_VBUSVLDEXT;
>> +		mask |= SYSCFG_USB2PHY2CR_VBUSVLDEXTSEL;
>> +	} else {
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = regmap_update_bits(phy_dev->regmap, phy_dev->cr_offset, mask, val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	phy_dev->mode = mode;
> 
> Hello Marek,
> 
> The 'mode' is used typically when exiting low power mode. Should keep
> track of the submode too here. See next comment.
> 
>> +
>> +	return 0;
>> +}
>> +
>> +static int stm32_usb2phy1_init(struct phy *phy)
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
>> +		ret = stm32_usb2phy_set_mode(phy, phy_dev->mode, USB_ROLE_NONE);
> 
> This part restores the mode, when existing from low power: Controller
> driver (dwc3) calls phy_init/power_on. The submode should be restored
> too here, instead of USB_ROLE_NONE.
Will do in V5, thanks !

