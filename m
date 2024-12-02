Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700D7D7831B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 13:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svV0/3uF6IUmbGm1JvpECltQfqjOP2APO0thyVFbZY0=; b=I0tkG2zGk7alkzMejQGgnXFfaN
	ugq38IJY13N017fsMMZfskBm6vl5cxViQE0ob/h3EwWGmWZOSd2omtAFDuDQUCybU5kSDI4FZaD8R
	mBEvYn/VPdJgnmOwn47GAO/vaLuhAJP99Kj5wbcQeesIxBUuHCZezKCR5F3isSP7I+80rN4+YEwxm
	ehDvXLAuaIvZF2xf2KBh+v+8KaFiTl0lgCVi+gjMWH2ubPGZFUKkZEvh1+aJFINHS0m5kIymvjrHy
	mTLwWFdJGXEE+rDM7G89AUOaz5hQfyOz3jXViW/wByF65gNxcq1h7CXG1H3uyF0xsPaOdeiQ9/8Cr
	b6p4OE2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6MN-00000006DmK-4455;
	Mon, 02 Dec 2024 13:21:07 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6LN-00000006DXs-1QtK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 13:20:07 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 5A3A6A0365;
	Mon,  2 Dec 2024 14:19:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=svV0/3uF6IUmbGm1JvpE
	CltQfqjOP2APO0thyVFbZY0=; b=oSPJ1UrpsayIy6NSbibVCUlxIIjVPArEJBZD
	z6GW2GAfv2RQo9g5ES9C/qn/fPNwK3k9Eo2s1rHC/OJQk+UQVfcdl6d8WXQQYIor
	hw3WL15PHFSpUcE7/K1XeqPfRGsxNVZt21QV+1FE2lepxsDnt3Q0dHceytEZT1pP
	cnsGFl9Oc8jhP6Px5PN5eGfl/hjFwj5ZJsCr3Nfc3OePpNGGkxXS7NtrzrRpCO1M
	X3+AeHtABs7FVqbxeG51TKo3BR/i9SYP8KpB7EOL2LNkc4ACV81O7d/dOOforyDP
	TCnlG3JVwCCMdhcfBUNouuYlFu6mrCOQVr1MCKQuO6Qqwcxo3S+jNuErVWLrHSBz
	JKwQz+iUcWIFGZRYaZf2qhUoxrQX5hDE56TWHfFi6wm0y8SRUnOaiVWOTtyB6bf9
	FfLK5R3jYyZR6nV+U/GP5jzVQlYSa5kwKtRSHLU2KMNm3lU9QVYR85uak8DsA3j4
	WTRMuZ6wOOpyYIGzTYgu0LM59zT4nzapHNBhkV8u+idzs13NHgBvaU+xaSKs8s1P
	NJ7QVuBDdm+HhGF1COCwjvQLJoj7P5e98MbG6Z/usiWP4RltdBo54Zh7inY4oqWA
	vTrDeSB5iH7JKit/HHWSUcGpSOMryzv4og8l3TnHVUJZQa2AJvjnppNELIDJ5e9p
	kPbxNaA=
Message-ID: <47344634-9681-43a0-995a-f7dc025d1d09@prolan.hu>
Date: Mon, 2 Dec 2024 14:19:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] ASoC: sun4i-codec: Add DMA Max Burst field
To: Mark Brown <broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Mesih Kilinc
	<mesihkilinc@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai
	<wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
	<samuel@sholland.org>
References: <20241102125712.2647325-1-csokas.bence@prolan.hu>
 <20241102125712.2647325-2-csokas.bence@prolan.hu>
 <fe02df7f-16ae-4128-9af8-7de7f76734bc@sirena.org.uk>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <fe02df7f-16ae-4128-9af8-7de7f76734bc@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855637261
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_052005_842865_AC20254D 
X-CRM114-Status: UNSURE (   7.09  )
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

Hi,

On 2024. 12. 02. 14:14, Mark Brown wrote:
> On Sat, Nov 02, 2024 at 01:57:10PM +0100, Csókás, Bence wrote:
>> From: Mesih Kilinc <mesihkilinc@gmail.com>
>>
>> Allwinner suniv F1C100s has similar DMA engine to sun4i but it has
>> smaller max burst size compared to sun4i. Add a quirk field to
>> differantitate between them.
> 
> This doesn't apply against current code, please check and resend.

Try v6: 
https://lore.kernel.org/linux-kernel/20241123123900.2656837-1-csokas.bence@prolan.hu/

If that doesn't apply either, then I'll look into it, but it seems we 
already missed the MW for 6.13... :(

Bence


