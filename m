Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFA6FD3758
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 12:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=do0BN02JpxbtxKX+wWJ7Osy1fAw9wO/zuPc7l6zseOM=; b=KUZCqwgzVhkFZehP/bZGVi4TTl
	gz9M5VtUMAHUWeOIzwn/B/3MqR2x+8GJKVscRK4lEC8UQklrxRNe38qR2m7yag8DjQfAgO+blLQ1I
	ZdkHFCMWYv8wXjANFNUezyYeZC/F1A3sZo9nW3JQYnNqkAH2edWmFECw3FHGc2lqfOB6ZJ9xxLF5B
	HOb9ac7VSqL0Kp/fbUUnfviru2NultVyqUM6fIwWgBMi2hyZtbOo1X0B2IMgu4bYSm7S906kr8unO
	zIzM5tqQW5N1DnuIOLE0SvyqDilPni7M0XDJGnsFcVvlSVbR8/maig539CD2ERibRCSL9k6+cTTp9
	c7NvNdvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEFd-000000041KY-1FRB;
	Wed, 25 Feb 2026 12:44:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEFa-000000041Jx-1VP8;
	Wed, 25 Feb 2026 12:44:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772023459;
	bh=wJo7H+wg7oWjDPXBu3O5+/hGWpnIf4Wz8/+O3JhSsoY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ROxU34RDm7sR9Vf1z2KVIJOAc33DQRkColUGHO9bPXNdfSXDKCWB+kgKzU/2LahbC
	 IN2jKNzQGcZbLJ9PVmjr3InHvPCLUq/KKnrb8n5HYQg5Lh5ftnWAzx8chNslc9RTVq
	 NfzXDc5kK9IQcM/6uZoFCAQoTrm9pGb9fLjUgJ8kRqEL6oY5uDdn+XkRWCqK7eyZk6
	 eO4ja1rhXmf0aTJhPhhqnL3lckGI/QJKVaTWxkIXtFVzIVhdEgGWpqM9a6bQGuxz/F
	 ghh74A4oAgJgKSFzLwI/sXuUDRZkWBTEhNID/9IlYsvGoFNAeXsmUakRKmQeXcQJBb
	 0tJf+Pq55HDKA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AEEBE17E012E;
	Wed, 25 Feb 2026 13:44:18 +0100 (CET)
Message-ID: <821f0078-9d4d-4548-ae6f-5f43cf5bcd6d@collabora.com>
Date: Wed, 25 Feb 2026 13:44:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 22/23] scsi: ufs: mediatek: Remove undocumented
 "clk-scale-up-vcore-min"
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "chu.stanley@gmail.com" <chu.stanley@gmail.com>,
 "robh@kernel.org" <robh@kernel.org>,
 =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
 "kishon@kernel.org" <kishon@kernel.org>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@HansenPartnership.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nicolas.frattaroli@collabora.com" <nicolas.frattaroli@collabora.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "broonie@kernel.org" <broonie@kernel.org>
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 "kernel@collabora.com" <kernel@collabora.com>
References: <20260216-mt8196-ufs-v7-0-b5f2907c6da7@collabora.com>
 <20260216-mt8196-ufs-v7-22-b5f2907c6da7@collabora.com>
 <e452951498ae82433337ca428bd49c7358194dd8.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <e452951498ae82433337ca428bd49c7358194dd8.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_044422_595476_DAB89A6D 
X-CRM114-Status: GOOD (  13.62  )
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

Il 25/02/26 11:37, Peter Wang (王信友) ha scritto:
> On Mon, 2026-02-16 at 14:37 +0100, Nicolas Frattaroli wrote:
>> The MediaTek UFS driver contains support for an undocumented,
>> non-vendor-prefixed u32 property named "clk-scale-up-vcore-min".
>>
>> Since it is not part of any binding, and would not pass a bindings
>> review in its current form, remove it.
>>
>> To return this functionality, it needs to be resubmitted in a series
>> that also introduces it to the binding, and justifies what it is used
>> for. Compatibility with downstream device trees is not a valid
>> justification for its existence.
>>
>> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> Can MT8196 work on Gear 5 without raising Vcore?
> I'm afraid it might cause problems.
> Maybe we can add the correct binding for MT8196?
> 

Might cause problems as much as literally on every other MediaTek SoC with the
current version of this driver.

Besides, the right way of declaring freq<->voltage relationship is with OPP
tables, not with custom properties invented out of the blue - and support for OPPs
being generic is already supported in UFSHCI, so... moral of the story:

As long as the platform is correctly configured in the devicetree, it's going to
work without any kind of issues.

Regards,
Angelo

> Thanks
> Peter



