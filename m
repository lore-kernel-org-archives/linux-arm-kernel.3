Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7574CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 17:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sw/Y+heIE2Vkbrbo96JH8p+ZhrdF9Vqpg0lLY9c5cd8=; b=JV/EYho4/D+V39D0F11m5zLHmP
	YM5OA5NVuOn3viRGE7QfoZTwAYtehYm1KsiiWgZzOQeEXSUIe4p+/xivQaEx1izZmQ2dAi+9j4Apa
	xltg15TlmoIJ9XHVXEihUH2n+Ppb9ElLkmueIJ4p5zH/Y+l7orvon3p60tpe+Wmwjl7VfWNdke7KP
	8RVpDYaayUV4l/IITyY7AnGa0PTcR+seESezzHGIeKI9WYTmSk6xWSjq74HhPyX/SJBalzBJQyLYz
	YWJ+wBwVO4xusNGuFnj055L7SYrlThxQfhyKY+0iJJTiZR7656a42l6bafk9hxkjtj03nV3/sRkQn
	pdu41Xmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us2pd-00000006WCZ-2O86;
	Fri, 29 Aug 2025 17:24:09 +0000
Received: from smx-b.mailgw.jp ([210.171.6.216] helo=rmx-b.mailgw.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urybs-00000005iij-1kco;
	Fri, 29 Aug 2025 12:53:42 +0000
Received: from bccml.bai.ne.jp (bccml-a.bai.ne.jp [210.171.3.161])
	by rmx-b.mailgw.jp  with ESMTP id 57TCrNJG016915-57TCrNJH016915;
	Fri, 29 Aug 2025 21:53:23 +0900
Received: from [192.168.11.5] (bai859bcd79.bai.ne.jp [133.155.205.121])
	by bccml.bai.ne.jp (Postfix) with ESMTPA id 79A4881773;
	Fri, 29 Aug 2025 21:53:23 +0900 (JST)
Message-ID: <023eb3ad-0826-42e4-8172-08a26db31676@bcc.bai.ne.jp>
Date: Fri, 29 Aug 2025 21:53:23 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: rockchip: Enables sound output from the
 audio jack on OrangePI5 Plus
To: Maud Spierings <maud_spierings@hotmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, robh@kernel.org
References: <20250826134456.9636-2-opi5plus@bcc.bai.ne.jp>
 <AM7P189MB1009A67370CA029038DF2A69E33BA@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
 <0b061e42-0a01-4839-871c-a5d760dbddeb@bcc.bai.ne.jp>
 <AM7P189MB1009CB3632FAAEEE43D9CED5E33AA@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Hide Hako <opi5plus@bcc.bai.ne.jp>
In-Reply-To: <AM7P189MB1009CB3632FAAEEE43D9CED5E33AA@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-FE-Last-Public-Client-IP: 210.171.3.161
X-FE-Policy-ID: 3:1:2:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=bcc.bai.ne.jp; s=20240516; c=relaxed/relaxed;
 h=message-id:date:mime-version:subject:to:cc:references:from:content-type;
 bh=sw/Y+heIE2Vkbrbo96JH8p+ZhrdF9Vqpg0lLY9c5cd8=;
 b=yiDV/oPhM+N3eRfoDyIkF25NIdhLR9RhlFvqCT3kLrNvWAbL9xKedo7hm653n1r8+M8UjIJZvXja
	vW1PIfBcYUWTfnfWPGY1/FPmmfARC3ZBmnbBgbnzKrDOQVlddS+PLdcf9JaPJr9LR/xqip8iRFeP
	7L5cvn07bUTACgBxcvrjnMBiUmeKcP05mfkGnCiBYuPFsk2ub3HUMGdrz+W8fEFgpQzm6r8DPR5R
	n1TJlyJLsgDjwwOCZ5nEcqT4UO3d4UffsUZ17edLfizS0DOAHwM4pBsr0mDfy3bal56tt2b7kKWW
	/dp5m1736qCWzgEMXnYAPkspnj+UTc0vsdyXcg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_055341_231039_3719734F 
X-CRM114-Status: UNSURE (   7.49  )
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

Hello Maud

On 2025/08/29 21:09, Maud Spierings wrote:
> On 8/29/25 13:59, Hide Hako wrote:
>> Hello Maud,
>>
>> On 2025/08/28 17:47, Maud Spierings wrote:
>>> I recommend rebasing on the latest next since my fix [1] was applied.
>>> I also recommend testing it with that patch, for me that fixed the 
>>> headphone detection and enabled audio playback. The microphone is 
>>> not working yet though.
>>>
>>> Link: https://lore.kernel.org/all/20250823-orangepi5-v1-1- 
>>> ae77dd0e06d7@hotmail.com/ [1]
>>>
>> Today, i build linux-next.
>> But sound not come out from headphone.
>
> Is that with your patch applied ontop or unchanged linux-next? The 
> audio was very quiet for me, even at 100%.
With pin-switch patch.

Analog, hdmi0 and hdmi1 do not exist in /proc/asound/.
Hide


