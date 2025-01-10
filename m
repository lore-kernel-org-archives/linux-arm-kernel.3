Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FD4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 10:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SnFH98ibQzsvQhtTYNyPTVrfsL5nJpMT8T+fexoCZ8A=; b=MkP1ygVoNBCtacKzgP5/7XS5IM
	8l+uSCgeH2I7XK+LcLgbZloalEFfaP9t2WCfHtJVuqOs3K/PUKCvgJozNWzo6QxC1iuBV1MRcivcE
	2Hr8oAQUpcTzMedF173IfyCHRtlysc3x/pKNJIiYYywAkz2YfBqT8VowQyd3WYvNjtrBdOQ3PPiOo
	59lz6uZpmRn9uag0wA1LwDrfn+Q0IGf2wknClSx41ES+bi+PwYkW/FqJoGT84bI56+PqDuZUcx2JK
	Vy6FoEUIqjDsqi4cb3X4MYcuWWlx/VPiCN+DmaUTBWidtNrdh3J+VQwFWRZ2RTVEQpselT0HbKjJE
	4DHOWadQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCBG-0000000EvuL-12fe;
	Fri, 10 Jan 2025 10:23:54 +0000
Received: from mail-m49231.qiye.163.com ([45.254.49.231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBxM-0000000Et1n-3qZW;
	Fri, 10 Jan 2025 10:09:34 +0000
Received: from [192.168.60.65] (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 85663352;
	Fri, 10 Jan 2025 18:09:25 +0800 (GMT+08:00)
Message-ID: <46372c17-d317-4477-9635-36564c73cc6a@rock-chips.com>
Date: Fri, 10 Jan 2025 18:09:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Kever Yang <kever.yang@rock-chips.com>
Subject: Re: [PATCH v2 11/17] dt-bindings: pwm: rockchip: Add
 rockchip,rk3562-pwm
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
 linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
 <20241224094920.3821861-12-kever.yang@rock-chips.com>
 <qvr7x4anlxxtpxjywrqjihxyxejw4i73wrh2ibl3hasayew4s2@obyuxce4ez4g>
Content-Language: en-US
In-Reply-To: <qvr7x4anlxxtpxjywrqjihxyxejw4i73wrh2ibl3hasayew4s2@obyuxce4ez4g>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDQxpDVh1CQkIfSRhJThpLSlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a944fb0ac4c03afkunm85663352
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PRw6NRw*EjIJOQ4wEUpNIjw#
	M0gaCwFVSlVKTEhNTktITE1DSUtKVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUpLQkM3Bg++
DKIM-Signature: a=rsa-sha256;
	b=CgI98iJrbeouOxI5b3pc4yw7d68VlP0GdydTJiwcX10/5mN0FWV7zhLTXRanZv0ZTZD/hnL1SHzCg3YBgWbnO/UGPiuoYcbjTq2OeVjvfuU6Ow+ExujrV0lg1V6Sd5ZCOgZAQPX/6enhwZ/j/Ecn/1WeiNZWAdMyXOh5dKijOPw=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=SnFH98ibQzsvQhtTYNyPTVrfsL5nJpMT8T+fexoCZ8A=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_020933_128953_EF681620 
X-CRM114-Status: GOOD (  13.61  )
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

Hi Uwe,

     Thanks very much for your review.

On 2024/12/27 15:24, Uwe Kleine-König wrote:
> On Tue, Dec 24, 2024 at 05:49:14PM +0800, Kever Yang wrote:
>> Add rockchip,rk3562-pwm compatible string.
>>
>> Signed-off-by: Kever Yang<kever.yang@rock-chips.com>
> What is your merge plan here? From my POV merging the pwm update via my
> pwm tree would be the easiest. But if you want to let it go via (say)
> arm-soc to have it all in a single tree soon and then base new
> development on top of that, that would be fine for me, too.
I send this in a patch set for a new soc and board because there is
no driver change needed, and I think it would be more clear for the new soc
support. It will be great if maintainers like you can pick the patches
for the module which I guess is preferred way in the kernel maintain rule?
Or else I have to follow the comments fromKrzysztof to send patches one
by one separately.

Thanks,
- Kever
> In the former case, please tell me. In the latter case:
>
> Acked-by: Uwe Kleine-König<ukleinek@kernel.org>
>
> Best regards
> Uwe

