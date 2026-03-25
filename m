Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D553EFEA831
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 08:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AXJ1qacwj7Yp46QVdr5q3R/G6cm/tjVaNaLjUk4ZdYo=; b=ZR1O099fvsEajBtdKVvJYWYPxu
	eEXWhn/Cm+rKC678sCNKaDsv5LAKtjMBf7v0iOJNRvIIbVKdD8sDg8VFMXPwLH9YYjzgYLM/P53OS
	nuSRLgYlp+Da3GNqRyrigCTLBhp+uDRzzeexX8AexGVZoeYHyv0wisntJ6tmZcw5fIGG+nEvLoEh7
	MpRApqrCir+Q4ROvmSG4sesVdQeq2i+UkjhKz1bVAxyqQX+ASi9XpN/rYQWTiO3MZsrDmQkmAyrtI
	4/L5hYM6FFV7FTh5J8HgIuuVD8DOZa0ASj18w0ixKnoWexTaUPeMMYbpQQMKpxdYHHf42zIiBT/GB
	ZLvDK3YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5JEg-00000002uD1-2zvw;
	Wed, 25 Mar 2026 08:05:06 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5JEd-00000002uBl-3w4Q;
	Wed, 25 Mar 2026 08:05:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774425899;
	bh=JfkhMwj5pX3vzkYeKIXrU9wJqRr8s1NLWxQWQGgaA3Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dicqqR9komLroysF/R/Cg1U6o5kKFlIGa08ve6xEUpswfU5mDNivsoIierLmjWdUC
	 LoaqQ8AFzE337FNZHwRul2gDUsuEyP7RA/14aAu46Dh9qEG+JaTQZxVd16DS9pSy+O
	 kWAJfSD5iyB9admQAOYSvz3FqRb9qjBCczYH+JWdPHRwhDhj9F0CXu3P4ZSs/vmuri
	 5jP4ST8Z74hMyhx7DAYCPe+IrJnj/rHirp++AU3QIZXkeHp0WOxDFgJDZCNXPUUfTH
	 XTDKew95WoDuIF4PdHP1mmnaCDIRmksi82NqRTxPCYHmgX8XpVoSQ1AtjCMh8TzDxi
	 dsR1zJ/hf1HpA==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AE57A17E3E69;
	Wed, 25 Mar 2026 09:04:58 +0100 (CET)
Message-ID: <d97b05cb-396b-4189-8b96-88eab6f85f24@collabora.com>
Date: Wed, 25 Mar 2026 09:04:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] media: rockchip: rkcif: add support for rk3588
 vicap mipi capture
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YXQsNC40Ls=?=
 <mai.kuznetsov.misha@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
 <20250430-rk3588-vicap-v2-3-77de5ee9048e@collabora.com>
 <ablRBViDR996euua@mdjait-mobl>
 <e894fe10-3780-465a-984d-01f5e8f4c97e@collabora.com>
 <ablWdjlrPLGhDJi4@mdjait-mobl>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <ablWdjlrPLGhDJi4@mdjait-mobl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_010504_166593_DB489FC0 
X-CRM114-Status: GOOD (  22.02  )
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

Hi Mehdi,

On 3/17/26 14:28, Mehdi Djait wrote:
> Hi Michael,
> 
> On Tue, Mar 17, 2026 at 02:21:20PM +0100, Michael Riesch wrote:
>> Hi Mehdi,
>>
>> On 3/17/26 14:08, Mehdi Djait wrote:
>>> Hi Michael,
>>>
>>> Thank you for this nice patch!
>>>
>>> On Tue, Mar 17, 2026 at 10:32:21AM +0100, Michael Riesch via B4 Relay wrote:
>>>> From: Michael Riesch <michael.riesch@collabora.com>
>>>>
>>>> The RK3588 Video Capture (VICAP) unit features a Digital Video Port
>>>> (DVP) and six MIPI CSI-2 capture interfaces. Add initial support
>>>> for this variant to the rkcif driver and enable the MIPI CSI-2
>>>> capture interfaces.
>>>>
>>>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
>>>
>>> [...]
>>>
>>>>  static inline unsigned int rkcif_mipi_get_reg(struct rkcif_interface *interface,
>>>>  					      unsigned int index)
>>>>  {
>>>> @@ -631,6 +765,8 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
>>>>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL1, ctrl1);
>>>>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, ctrl0);
>>>>  
>>>> +	rkcif_mipi_write(interface, RKCIF_MIPI_CTRL, RKCIF_MIPI_CTRL_CAP_EN);
>>>> +
>>>
>>> while this is the correct solution for rk3588, for the rk3568 vicap this
>>> will write 0x1 to the VICAP_MIPI_CTRL : 0x00A0 which will enable the water line.
>>
>> nice catch ;-) However, the TRM (at least my version) claims that this
>> bit has a reset value of 0x1, so the bit in question should be already
>> set in the first place. Thus I decided to *not* make variant specific
>> code paths.
> 
> Yes, the reset value is indeed 0x1
> 
>>
>> Do you see problems in your setup?
>>
> 
> No problems, it works as expected, I was just confused to see the
> mipi capture enable added with this rk3588 patch and not before.
> 
> I just find it a bit confusing but if a nicer solution is too much
> hassle we can leave it like this.

I agree that this is (while correct) not the nicest way. I am still
bringing up the remaining features of the RK3588 VICAP (MUX + TOISP +
SCALER) and it looks like I need to do some refactoring anyway to
support them. When I do that, I shall rewrite this part. For the time
being it would be great to have this merged in order to provide initial
mainline support for this unit.

Best regards,
Michael


