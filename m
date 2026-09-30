Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972F9CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 22:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHPlzGy4dd9m6Tg6m6EuH4FV6ScEYz4fEuF681xzp6Q=; b=22QN/MeL4ZjtnjmeUeX+xBA/Cy
	7FX5if6bp+AqTlxmmJt0P+ZmVhKileBzwP+mZzyGSf4DjFphPCSc9NcTGUtYGu/R01hOx5Wtcon56
	UWJFmbsVogmgJDuv7cPVD3hd9DNoLA0NcY5P9ce9Wl0XZJFLN+0okWELEu+sXodBExQmzjkLPrmS5
	LRWvXwoxb9KBdqK3/MwRrPVj9UZYt/3oOEJ9eEJnEY9zyjVmm3n2/JxgBfAzXUT5B1U8w3kmTEWsc
	06B0nZnqO+TSg+KWBkIv3mrylHhRwfSwVmM5AIfSkReFOQCywH0vUyBh0JMDzJD/6irxh/Rs2Y/by
	MDrDPruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC3CP-00000007Pn0-3wVb;
	Wed, 30 Sep 2026 22:54:53 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC3CM-00000007PmD-0iEm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 22:54:52 +0000
Message-ID: <6213fef4-5cbb-4ed1-8e12-d5529fc7469f@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1790808881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qHPlzGy4dd9m6Tg6m6EuH4FV6ScEYz4fEuF681xzp6Q=;
	b=M4zNjgxB2Iy8jNu//9QdhE0Dkzz6N2fDyRSkLS9yGlSbN/+JioTDFPN1H6yMyt7ew90Rkd
	WsI9Eata4Z2dn/7SvUnE5Qe9pcOzZjTRh8TtKhwnByPPis/W7PDqiKBuMLU+9rybhXTOcn
	EkPDPJ9ZaHWi8DfXy5aVypE5PLHN6PU=
Date: Thu, 1 Oct 2026 00:54:38 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] pinctrl: apple: Add t8140-pinctrl support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260926-apple-pinctrl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev>
 <20260930-fascinating-armored-sunfish-ddcb59@quoll>
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <20260930-fascinating-armored-sunfish-ddcb59@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_155450_436211_6472BB3F 
X-CRM114-Status: GOOD (  16.82  )
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

On 9/30/26 12:03, Krzysztof Kozlowski wrote:
> On Sat, Sep 26, 2026 at 04:51:44PM +0200, Yureka Lilian wrote:
>> This patch series has fixes for probing the pinctrl_ap GPIO controller
>> on the MacBook Neo. The previous code would crash in the regmap_init on
>> this device, since reading the REG_GPIOx for certain pins causes an
>> SError.
>> To mitigate this, we adapt the gpio-reserved-ranges property to describe
>> pins which are unusable and whose REG_GPIOx should not be accessed.
>>
>> Also add the new t8140 base compatible to the dt-bindings, signifying
>> the different behavior of the t8140 pinctrl_ap device, and make the
>> driver accept it since it now respects the gpio-reserved-ranges property.
>>
>> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
>> ---
>> Changes in v2:
>> - EDITME: describe what is new in this series revision.
>> - EDITME: use bulletpoints and terse descriptions.
> EDITME is here on purpose.
>
> Best regards,
> Krzysztof

Sorry about that, I had to send it twice (this is the first version 
to actually land on the mailing list) and forgot that b4 does the whole 
auto-increment and add these cover letter entries. Will be more careful 
and use --preview-to before *every* send starting from next time.

Thank you for understanding,

- Yureka


