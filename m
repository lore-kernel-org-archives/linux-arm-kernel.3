Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC05CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 13:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gDSJ8J5S8jjS2Yt2GqRZf28Sth5mAo70w2sg+sYmBWQ=; b=h5DyqnZEGNw5M6/2tUP/GcGA56
	lIIdIyvDfCJJPj/WxbkTVwt3qfL/NWtH/ZQqB6gK5B1GNxICcvnwhJwXJZMOQvjHLCwbxf2as42JJ
	EFboQkYzi8IvfU8r2cQ+uwMiRXT0kfxQnpzM9A0VpHXvTxCR2v/rTcnZr+aXr6JTQDHW3TIDZmA3m
	BlUP58vQmfYu25Zs9TdqWjIddpoDYfWVkvwM0JvWEi4vEoxWlph6MRsoCs834EK7bbXLrpDE2si/R
	ZdastJEXo+N6xCIO1rJ4BrzWCZ+U+0unRmtaYK5Ajg+nwn11cnP36hE3EuCpbbDXshWOuOHEcQsSf
	HytpLfAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvDj-00000006Lm0-36Bi;
	Thu, 23 Oct 2025 13:19:11 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvDh-00000006Ljj-0JMY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 13:19:10 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4csmp30f6pz9sbX;
	Thu, 23 Oct 2025 15:19:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761225547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gDSJ8J5S8jjS2Yt2GqRZf28Sth5mAo70w2sg+sYmBWQ=;
	b=MpeiHDumhvceLG4lgQMkfm1gG+A0xQd/ShbrURUKhbwttMzzyg4tDxJz3p439OPnaTV4yD
	FQRiIHDH6Bq9O4/hACz6Vo+hojHYS7vfWcur4tflY2qoeCBFqnGkiWVcBHMgsYLyiLI8em
	XzWDk/6+C7uHvJqetRMl6Zm/Pdl+OrZCr9FqUdczUVp4CZrAneKffhBEL8aR9YNS177sAj
	9GS/9l+C2kWlNBYi+Ogc6IRbirq2eYf/0OHCMbw4l0tBCZRfJRYp0Vwp4iF81BomvtgMTZ
	2hC7osLt+RaBdF/qLdY8ChDZ/qy7nLehm7TDuV+EGBBZMitezoI6Xr9k+kdipg==
Message-ID: <4079105a-82c7-4650-8b6d-01989b617a4f@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761225545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gDSJ8J5S8jjS2Yt2GqRZf28Sth5mAo70w2sg+sYmBWQ=;
	b=AVqusD5SsuPwMihcmq489DKJm/Sw2vifrBbdLUImBRMo+6Ovq7mjvhigMaEImB8U9OnKnH
	Zl7uiZE+LUHyCe2fBwFPC5GgMfg7rFeJcsdwhiOtaipkUMEP0Xpb2MdDtXVyq9gLDAB12U
	Akwlxs5eqk70QiA+c4mEla0aaH9K5kBvwasDDv46X2vM5WcGnOJr1pvgIyTlnU0Ntd9Mq+
	i468SWbnHw8EbFeS71ZvL0HmCLSg8EF8KdHLW2JZqmyJfuTO+h9g91T3fVOZcQVr+i1NSp
	hEB0pIpHfB9XQLTQRniIGSoWba5S2bMocZUABd8VtY6x8F4dl6wbgRULzJYHTg==
Date: Thu, 23 Oct 2025 15:19:00 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdXq=4zb421MnwFvhFT_0K0HM=-LhWKueCHnfaEcGEgSLw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdXq=4zb421MnwFvhFT_0K0HM=-LhWKueCHnfaEcGEgSLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: y34odf6yf1ii6mtywukpy3eqxon5pt41
X-MBO-RS-ID: 24cb97ab0f852a5b356
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_061909_259892_113CE25D 
X-CRM114-Status: GOOD (  13.22  )
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

On 10/23/25 3:07 PM, Geert Uytterhoeven wrote:
> Hi Marek,

Hello Geert,

> On Thu, 23 Oct 2025 at 14:37, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> Document new property arm,poll-transport, which sets all SCMI operation into
>> poll mode. This is meant to work around uncooperative SCP implementations,
>> which do not generate completion interrupts. This applies primarily on mbox
>> based implementations, but does also cover SMC and VirtIO ones.
>>
>> With this property set, such implementations which do not generate interrupts
>> can be interacted with, until they are fixed to generate interrupts properly.
>>
>> Note that, because the original base protocol exchange also requires some
>> sort of completion mechanism, it is not possible to query SCMI itself for
>> this property and it must be described in DT. While this does look a bit
>> like policy, the SCMI provider is part of the hardware, hence DT.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Thanks for your patch!
> 
>> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>> @@ -146,6 +146,13 @@ properties:
>>         this platform. If set, the value should be non-zero.
>>       minimum: 1
>>
>> +  arm,poll-transport:
>> +    type: boolean
>> +    description:
>> +      An optional property which unconditionally forces polling in all transports.
>> +      This is mainly mean to work around uncooperative SCP, which does not generate
> 
> meant
Fixed locally for potential V2, thanks.

