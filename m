Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F127FFEC11B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 21:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PIUTAc7XYGt/N46PiFHeqWNmnhdMJjMHjDtUMvdW6r4=; b=TDxt0UG5fyELgXL0TQLuC+F53U
	3llU6k0CB+jX+txQhegvwJroyNpl/jNty/GmK29O3b4XjUMGmYfxaHTMWtcT0lPvnApbcP3TPlo2L
	urGgRQs5tN/4FloKUrmx1pe6dCYJWwj8GooRhbczbfkGG1EwzjYUhs9NAOkpsBUMsv28RMWvbRpDN
	Q8hpphms11MORj8f7Oarhw8k/AdNYc4CoX8ZdROFq5X54O10PeUzsXVPsqatL84OKjERTAP0p/5PW
	+QwBWAjJdfEPpYQZfk/BFK5822nuVxzrrBZ0KK+pry5s9uPrmzRiuhlen/s4ihEYzV9G5c92a/IEc
	+10r7x/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w59YA-00000002Ger-0kiM;
	Tue, 24 Mar 2026 21:44:34 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w59Y8-00000002Geb-0DSR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 21:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1774388668; bh=xQK3fo/yQKWbJQvqeTbsTQNfeWyoFFV9L/347KfXKqk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KpSz7mVbJk01AbKR6ohkXCBFFHzF+7l7H7QD+p7s7iEVzr8UWaj/etWBag4+3d01i
	 /SXlugtuAjUTsDMpkxiK2os5/jBCPrZNjBIVBlQmQn3AoJPJwxG5txq/KtnUfQldBv
	 I/W5rQboHXqQZ2WJ4g9Qob6YLZ5asvHJdlhUgxs0UhjnZwNP6TghcK/JklJc4oj81e
	 bH8WLFWdbz/rSnVp13zUXtIP2gDz9ezhTsM5jjulJGxEtXBPi+sv4+A4xcPXA9y4DC
	 1coYTGRlAIQO44VUhmzypDysYehPXl5mbG3mJmCO/BeiC0zmMc1jQNIKwYa/C5kTwM
	 45IDug++zXg6A==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 7B0A24476;
	Tue, 24 Mar 2026 21:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1774388668; bh=xQK3fo/yQKWbJQvqeTbsTQNfeWyoFFV9L/347KfXKqk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KpSz7mVbJk01AbKR6ohkXCBFFHzF+7l7H7QD+p7s7iEVzr8UWaj/etWBag4+3d01i
	 /SXlugtuAjUTsDMpkxiK2os5/jBCPrZNjBIVBlQmQn3AoJPJwxG5txq/KtnUfQldBv
	 I/W5rQboHXqQZ2WJ4g9Qob6YLZ5asvHJdlhUgxs0UhjnZwNP6TghcK/JklJc4oj81e
	 bH8WLFWdbz/rSnVp13zUXtIP2gDz9ezhTsM5jjulJGxEtXBPi+sv4+A4xcPXA9y4DC
	 1coYTGRlAIQO44VUhmzypDysYehPXl5mbG3mJmCO/BeiC0zmMc1jQNIKwYa/C5kTwM
	 45IDug++zXg6A==
Message-ID: <706e2b88-f200-4c12-96f9-5634f80547f3@mleia.com>
Date: Tue, 24 Mar 2026 23:44:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v2 1/1] dt-bindings: arm: lpc: add missed lpc43xx board
To: Frank Li <Frank.li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
References: <20251015184846.2509016-1-Frank.Li@nxp.com>
 <b75b30d4-e33e-4620-bc37-56b36612364c@mleia.com>
 <aXppf+3Nm7zsYaWE@lizhi-Precision-Tower-5810>
 <f213bdb9-7104-495f-97fe-8190af3ec577@mleia.com>
 <acL_cAQ99B2VliJU@lizhi-Precision-Tower-5810>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <acL_cAQ99B2VliJU@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260324_214428_520238_3CE45E9D 
X-CRM114-Status: GOOD (  12.28  )
/bin/ln: failed to access 'reaver_cache/texts/20260324_214428_520238_3CE45E9D': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_214428_520238_3CE45E9D 
X-CRM114-Status: GOOD (  13.12  )
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

Hi Frank,

On 3/24/26 23:17, Frank Li wrote:
> On Wed, Jan 28, 2026 at 10:24:50PM +0200, Vladimir Zapolskiy wrote:
>> Hi Frank,
>>
>> On 1/28/26 21:54, Frank Li wrote:
>>> On Wed, Oct 15, 2025 at 10:48:47PM +0300, Vladimir Zapolskiy wrote:
>>>> Hi Frank,
>>>>
>>>> On 10/15/25 21:48, Frank Li wrote:
>>>>> Add missed legancy lpc43xx board compatible string to fix below CHECK_DTB
>>>>> warnings:
>>>>> arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /: failed to match any schema with compatible: ['ciaa,lpc4337', 'nxp,lpc4337', 'nxp,lpc4350']
>>>>>
>>>>> Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>>>
>>>> I'll take it for v6.19, thank you.
>>>>
>>>> If you have any other changes in the queue, please feel free to send them also.
>>>
>>> Vladimir Zapolskiy:
>>>
>>> 	look like you missed this patch.
>>>
>>
>> You are right about it. I consider it's pretty late to send another PR
>> including this change, and thus it will be postponed, I'm sorry for it.
> 
> Can I include this patch my imx's PR?
> 

you've already got my RB, and there is no objections from my side, if
the change goes through imx dt PR, otherwise I have to postpone pushing
it upwards, there is no plan to send an ARM LPCxxxx dt PR for v7.1.

-- 
Best wishes,
Vladimir

