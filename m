Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC959C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 06:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3rI2bsP7XchvYTNXStgTcfig5JYAnA5Tib9gCqBkes=; b=nhsK0/9RBcJF1HK4UlNlwKKpVY
	BI3UhGvXEganBMosY6Ak5MM2sfAPwfszzQxbN8FbZHOaIeMfa2qgu5PzqmkFvfsRFBs8xojOxi5PP
	J/JZ1ukyPm3LkTUigvPbcpdPId9t/tf3xbC2TA98iIf6S4ZGbRtqx2xsBrgZYouwG4fBDqitFF5oz
	7FJleunG8jcQzSMlXGYlsKEGhUkLO0KoyoGTcKiVaquWPv1e4Wlh7hiXIDNyLP9zvYVSDblUd5TCb
	V6Jp/qpACDQJCV0FwmTqTx70Xd8C3PR2EJXYZrlU++jzepEplUbBBOp1d0zG3K6pWBSGr62HMPanT
	vvjrys4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulipk-0000000A4DM-2h6P;
	Tue, 12 Aug 2025 06:50:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulin7-0000000A3yy-156r
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 Aug 2025 06:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=n3rI2bsP7XchvYTNXStgTcfig5JYAnA5Tib9gCqBkes=; b=iUm6yRgKnGpVBfvhbKTRLrAIII
	xQNjJUieYs2RE+FkVt/dkJJOb+lYFo4uyhOQfeB99hbtZ+3aE/rI7lx5FnlKgGm9JvvsDCey4ifDH
	o4zVACM/GsjR705t7cq4C25shdKwnT8dWS00OAY90yi0DtyndnJbQuf8TsPuscRwQQpeo6TrAFYsg
	hnFa6JwraUl4e2THGhRFvJirSMCYFDtZjZM2D+o1eW/+cP249/Uo3wXhOnnw5hf3GY7+LdSVIQU+9
	T7xYw9N8Aj9Vo+Fa3Nt3VgV7J+vISWhlpeuIhV13Lfj5dWkI/scQuXAE3Vd/LYST0M4WPQ1pFBg26
	pEhU3V9g==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulin3-0000000FiTk-1B3g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 06:47:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FC9D440F8;
	Tue, 12 Aug 2025 06:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA68C4CEF0;
	Tue, 12 Aug 2025 06:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754981237;
	bh=/HZqQfR9eGDYw52QNI2P2rJt4fBRwuB/h0GTLpd4Xek=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IXTxxK6UaeBi3I4CEDYFNOhvzeZDrcnMZRNlK4ga9/i8THpqqn3sj5jecXiGOKOsM
	 u8YT828jgG+PTBp86bsbR36fuRfDDiuMvnDtZIC5xQTUvezx6bH3GoaoZtuUcSeEQm
	 R0eA5lNuvMdKRKe7JCF3ZWqnAh7cGS3pTLLepqk3LC+dGmxPoSfCVQObpcSdxWPQFT
	 +tTuzrIXVjgtp7YEnnUN2P7nRc0q8v4uuzbroJvbX0CxIaBnQ3QNdnMzOdRbCRqNm+
	 2IC70RGDkRsFkeVLkfSQnOo7fz31ag4mJI10DKwoYWZXXvbr5ReQfinot5xj9SdKSU
	 CsAnAYBpK1y9Q==
Message-ID: <e695c61a-e183-4eea-a7f6-1b2861b2129f@kernel.org>
Date: Tue, 12 Aug 2025 08:47:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: media: Add Sony IMX585 CMOS image
 sensor
To: Will Whang <will@willwhang.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250810220921.14307-1-will@willwhang.com>
 <20250810220921.14307-2-will@willwhang.com>
 <20250811-successful-military-dragon-d72486@kuoka>
 <CAFoNnrxWwqT9WA-h2WOsUe6Q-qEoz2mTHLpDogAyMwiXXZ9MrA@mail.gmail.com>
 <f12e6ff3-6ec3-487f-bf9c-0f8c06ee6444@kernel.org>
 <CAFoNnrxhUof8BBrefm1L1peTxg==Koz72TY+54G_8QUy-rrT8g@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAFoNnrxhUof8BBrefm1L1peTxg==Koz72TY+54G_8QUy-rrT8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_074721_653323_59D85ADA 
X-CRM114-Status: GOOD (  16.31  )
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

On 12/08/2025 08:31, Will Whang wrote:
> Hi Krzysztof,
> 
> Reply inline,
> Thanks,
> Will Whang
> 
> On Mon, Aug 11, 2025 at 11:23 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 12/08/2025 04:47, Will Whang wrote:
>>> Hi Krzysztof,
>>> Reply inline.
>>> Thanks,
>>> Will Whang
>>>
>>> On Mon, Aug 11, 2025 at 1:01 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>> On Sun, Aug 10, 2025 at 11:09:18PM +0100, Will Whang wrote:
>>>>> +description:
>>>>> +  IMX585 sensor is a Sony CMOS sensor with 4K and FHD outputs.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - sony,imx585
>>>>> +      - sony,imx585-mono
>>>>
>>>> I don't understand this second compatible. Is this different hardware?
>>>> Can you point me to "mono" datasheet?
>>>>
>>>> Your description should explain this. Commit msg as well, instead of
>>>> speaking about driver (in fact drop all driver related comments).
>>>>
>>> Mono version of this sensor is basically just removing the bayer
>>> filter, so the sensor itself actually doesn't know if it is color or
>>> mono and from my knowledge there are no registers programmed in the
>>> factory that will show the variant and model number. (That is why when
>>> the driver probing it only test blacklevel register because there are
>>> no ID registers)
>>> Originally in V1 patch I've made the switch between color and mono in
>>> dtoverlay config but reviewer comments is to move it to compatible
>>> string and not property.(https://lore.kernel.org/linux-media/20250703175121.GA17709@pendragon.ideasonboard.com/)
>>
>> You only partially answer and judging by mentioning driver below:
>>
>>
>>>
>>> In this case, what would you recommend?
>>>
>>> compatible:
>>>   enum:
>>>     - sony,imx585
>>>     - sony,imx585-mono
>>>   description: IMX585 has two variants, color and mono which the
>>> driver supports both.
>>
>> ... I still have doubts that you really understand what I am asking. Is
>> this one device or two different devices?
> One device that has two variants: IMX585-AAMJ1 (Mono) and IMX585-AAQJ1
> (Color). Silicon-wise the difference is just with or without bayer
> filter.
Then I would propose to use sony,imx585-aamj1 and -aaqj1 with short
explanation either in comment or description about difference in RGB
mosaic filter.

Best regards,
Krzysztof

