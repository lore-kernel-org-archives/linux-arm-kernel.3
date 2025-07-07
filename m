Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1485C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 11:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gEgmPAnx7RxjGkp6sszWf0Y/7ZsMaOtHMS1JPEyCaDE=; b=ktFAc1GQYm51Rkd+C6p9apoXgb
	kHsYgUmRRsgQRsryiAIXoIWsPBXiavNQluiLWX950YqgvIVowLKXKecCXpGrVKmbjfWTEYHVKUtkd
	kPoNSJu5K9F4VU8ikcxiZF7zkCoIuihOAeBEXqK7v/MBMYsf3vHNes12FW5Ofzy5zsk9UeGmB9P11
	n8XgUhghvXzMCBsAPT4A3PWS4Td9Iw0BdxE6mfAAb45ltxdk8LVO4IPUGR0bYaZmDzzFaYYPBWEZs
	NmQOdOLY/WxuLahdRAliwWXliBnhCsossbIMzddqVI7wb7ws499LRTi+lfOurnCvSXfpmpYiyyjH1
	EKngAs1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjsM-00000002GIc-3yic;
	Mon, 07 Jul 2025 11:19:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjQ9-00000002CcQ-3d0o;
	Mon, 07 Jul 2025 10:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gEgmPAnx7RxjGkp6sszWf0Y/7ZsMaOtHMS1JPEyCaDE=; b=J/RyR2ylPZSsBonmrpIQJ9BVy3
	bnK6kVYlxCvGV3rxkVcC3at++/Z/hwZkoqUvr57O2k5nFojs6R5TmOb8voBfq2+hBm5l1N3zxyrEf
	jVtQNuM4H9Rw7NX2bezt6HP85xmuAzQ4V/8L0pDa1wXWI8zA7xiXj+GbGCTce8PhWYxtSOt8Cja8p
	DZIU5oSwqdTGB4X2JegLU2IW1lDv3V+Mk3JezPMgJEbgxI3G9wLmEaHPX3HI/tPlVQMEMqRtO3Bof
	yncEVR9vIVzGFdSGxxBl6yLRZQFarfm1GoRuk+YTU/W/bCdXqPag41rTU5eIbGyPsOWu/tGq+JrD7
	71I7DWNw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjQ6-00000008Sk7-2Dm8;
	Mon, 07 Jul 2025 10:50:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751885392;
	bh=utlkw0o5NARZFk83JwXbp9lywwmgReSbAqfiKiWu4X0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oz8v7duMOV+G+tHbirtD/TgsoaVCm/SBdJXqX0p0ME6pE/uG9hl2Gx8g81dhEP2pg
	 5Ptd7ycGg754PAl23h2yWs7NhLW5sip1kvKL2cRUe0BSvBP1j4i/GOx04Cxwu1uG4E
	 fujalaUTbE9aEAMNP4s5sDJY4A+cPfEA9OrAgpEHX6YcJ1/zDjh9VX1M74RMbz0SR+
	 /UuWnlvw5F29HFVj7EIuxcXqzssN4EPFIa6CkJLLDkb527++3XPGFnTU9YFJbOSc3h
	 jE061XUCbiuFsosE1XDZoxEu9gR5DkwwazcHtt53BVwsI1Wm7q+eFX1phnLk59vdk+
	 UA5xhFzFB1z3A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0089017E04EE;
	Mon,  7 Jul 2025 12:49:51 +0200 (CEST)
Message-ID: <36353ccd-07fc-4415-9db2-54977b25054a@collabora.com>
Date: Mon, 7 Jul 2025 12:49:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] pmdomain: Partial refactor, support modem and RTFF
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, ulf.hansson@linaro.org, y.oudjana@protonmail.com,
 fshao@chromium.org, wenst@chromium.org, lihongbo22@huawei.com,
 mandyjh.liu@mediatek.com, mbrugger@suse.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, kernel@collabora.com
References: <20250703110247.99927-1-angelogioacchino.delregno@collabora.com>
 <5bfcd5e059e86a96807426bfc6543209d09b557f.camel@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <5bfcd5e059e86a96807426bfc6543209d09b557f.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_114958_799242_42C09920 
X-CRM114-Status: GOOD (  15.75  )
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

Il 03/07/25 20:27, Nícolas F. R. A. Prado ha scritto:
> On Thu, 2025-07-03 at 13:02 +0200, AngeloGioacchino Del Regno wrote:
>> This series is a subset of [1], leaving out the Hardware Voter
>> specific
>> bits for MT8196 until the discussion around it reaches a conclusion.
> [..]
>> Compared to v1 in [1]:
>>   - Changed mediatek,bus-protection to access-controllers
>>     as suggested by Rob (thanks!)
>>   - Added commits to document #access-controller-cells on all of
>>     the access control providers
> [..]
>> [1]
>> https://lore.kernel.org/all/20250623120154.109429-1-angelogioacchino.delregno@collabora.com
>>
>> AngeloGioacchino Del Regno (10):
>>    dt-bindings: memory: mtk-smi: Document #access-controller-cells
>>    dt-bindings: clock: mediatek: Document #access-controller-cells
>>    dt-bindings: power: mediatek: Document access-controllers property
>>    pmdomain: mediatek: Refactor bus protection regmaps retrieval
>>    pmdomain: mediatek: Handle SoCs with inverted SRAM power-down bits
>>    pmdomain: mediatek: Move ctl sequences out of power_on/off
>> functions
>>    pmdomain: mediatek: Add support for modem power sequences
>>    pmdomain: mediatek: Add support for RTFF Hardware in MT8196/MT6991
>>    pmdomain: mediatek: Convert all SoCs to new style regmap retrieval
>>    arm64: dts: mediatek: Convert all SoCs to use access-controllers
> 
> As already pointed out by rob's bot you're missing adding the
> properties to
> 
> mediatek,mt8195-sys-clock.yaml
> mediatek,mt8188-sys-clock.yaml
> 
> on patch 2. But other than that, for the whole series (since the tag
> wasn't added from the previous version):
> 

Oh I did, trust me I did.
But then I forgot to squash the changes in the patch that I've sent.

This all means that I need more coffee: fixing that now (both the patches
and getting more coffee :-P).

Thanks btw!
Angelo

> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 



