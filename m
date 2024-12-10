Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88393E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 08:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8e/j3rajoB9/ZiaEY3WAVPbJONb+u5IOygQbHZsF7w=; b=vNgJUvRWmUl+yigeQibDHtz7Gs
	eR5LaLUPxGQ+XUY0qULtJdSjW/SPhGR1K69RLiask2NjZIsI3yQYKeLnUMCqSID68H+RavXsbJQM2
	TtQFsDpr4ilTbzpPsGoVrp5P+ED8+8YVv+NdN2Yx8ZcBYK9HUprjiAIbtlGrTKrHMtu5WuYEwMhDJ
	cWjS7oUDaQewfZsv9ZxwFXhv3WUvF6seUIwubh2IwH7YNRBxKxPQVsMeLu7cyEww1R+iMHp/9b+In
	RkEUcp489oqlNQDFM8Vx8oAMf0hqWbx4ITz4TRjA1Fi3RZgx0kqlyrfQaTxCVhEzjOneZ5YW/aLsm
	z9vE3FtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvkm-0000000AjkJ-0dLH;
	Tue, 10 Dec 2024 08:38:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvfA-0000000AifY-2f6t;
	Tue, 10 Dec 2024 08:32:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733819531;
	bh=n8e/j3rajoB9/ZiaEY3WAVPbJONb+u5IOygQbHZsF7w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ovDlKYiXXO3tJGCZbcwjFkT7+kuztqhqvUzkNwz4//El+zn0w8vaFlLH31ubbHBfq
	 59v2QCYKJ/4wPkLeJkMwEN8Gps5YykbQTjEzQHXBmh+1f82AWjCtXjFp4PCHboYqTD
	 l/8+2dJ1N4a2HCR8yfGEwxNp14LFIY5IIJzRPRlYeEQ7tQ95odIBbh//PCIlBJTHeF
	 d/vVrKE7ylie7Ja1PEwgrZBweFwdlkdMivwLclU3t0cEpCRWSOhFdWKK86cje1vOne
	 qs9nBnfObv18qodQCJ9m9y75TgrfUmp7HEhD8QpNNT133B+va9Pz9D2Lwq2G3fb6jZ
	 NorrQGudizMFQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5808817E14EA;
	Tue, 10 Dec 2024 09:32:10 +0100 (CET)
Message-ID: <d65fc527-5919-4454-865c-4731944e48a7@collabora.com>
Date: Tue, 10 Dec 2024 09:32:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mailbox: mediatek: Add mtk-apu-mailbox driver
To: =?UTF-8?B?S2FybCBMaSAo5p2O5pm65ZiJKQ==?= <Karl.Li@mediatek.com>
Cc: =?UTF-8?B?Q2h1bmd5aW5nIEx1ICjlkYLlv6DnqY4p?= <Chungying.Lu@mediatek.com>,
 =?UTF-8?B?QW5keSBUZW5nICjphKflpoLlro8p?= <Andy.Teng@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?Q2hpZW4tQ2hpaCBUc2VuZyAo5pu+5bu65pm6KQ==?=
 <Chien-Chih.Tseng@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>
References: <20241024092608.431581-1-karl.li@mediatek.com>
 <20241024092608.431581-4-karl.li@mediatek.com>
 <083c8f7b-0969-4ca3-8a91-35f5767c5f32@collabora.com>
 <CAGXv+5Fw+qZhTTgJq0QdiQHgiQP2ByR1tgae2+k4erx+0fp61g@mail.gmail.com>
 <a3c3280478bf86eb97a422782ce60ec4eaa35224.camel@mediatek.com>
 <0f98405c40530d81c342af06dea593e7babedeac.camel@mediatek.com>
 <cf75f3c3932ddc50f5697bc4f394bd77fc16cd39.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <cf75f3c3932ddc50f5697bc4f394bd77fc16cd39.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_003212_825235_23500B9C 
X-CRM114-Status: UNSURE (   9.07  )
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

Il 05/12/24 08:32, Karl Li (李智嘉) ha scritto:
> On Thu, 2024-12-05 at 07:05 +0000, Karl Li (李智嘉) wrote:
>> Dead maintainers,

LOL :-D

> "Dear" maintainers. Really sorry for the typo...
>>
>> I hope you're doing well. Just a warm reminder that we're following
>> up
>> on these patch and really appreciate any feedback you might have.

I already gave you feedback on this patch.

Cheers,
Angelo

>>
>> Thanks you in advance for your review.
>>
>> Regards,
>> Karl
>>

