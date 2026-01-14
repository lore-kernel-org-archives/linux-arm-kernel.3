Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D827D31A28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gkLDGpcH2ixv9Hp34Yj1+ZbXrSOZHF+yU29hk2sNpw=; b=Z8ZElbKIX07rfwtVU8tTKxPkcD
	iM03h3lO32JwTf2ryBCPGiWcn5CXWYe7FCODfxgPCbzlbjucal4oQ1TQgw8OqtKD3d90rit5XAzJE
	hyAB79S11/KHhdEtxnk6RMhHYqU5b4CJNBxtG5EjRnKelGR7J7J7Aw3JQnripesUMfs4FmEBd3mGy
	rPoggdgRdnLKCqZea+KkX2nDl4ZsVzQN0J+LgryV+UyvIq9Pnwa7OFHqkZkUdlYnlfL2QBKfEPIY/
	AKa4PGKBo4A24zsOU9/YUXn2RWGenLAiyjx6WU/x0YImfaUydIVIgHUg4NB/Px7ayKGJIc01WlDUM
	MEas1efw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwE9-00000008KqP-1pgL;
	Wed, 14 Jan 2026 08:27:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwE6-00000008KpE-3n6R;
	Wed, 14 Jan 2026 08:27:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768379254;
	bh=8MK2K1fASDPVnowqxQJ1JsgFLtEXmJrr6pW4o1QRCyc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UdOb5SP5TUuhuFc/WhQJMKtJekNVy54o3R38/WoQOOwEqbI7Va76TVfEYmO9/o7G0
	 osO2Dkd+3GI4pdGm9DxibTNa3cFFqVe8WfdT+MsFCvNhTXYBstc3/Cqb95tBD0rmIZ
	 CJ6f+G2Di4ibr0mPV+RLLFpmBuhlT0vNaDbYp21iDG1XCJzos/SAbwVajHb7AAOaKD
	 WBia4g9eXgNJ4B5l0m6bUV+DiclrhgU/GxxWQTWZRQcoLuhex+WX+X3acRLMP8N2cM
	 1TqAIYUYg0uEW9ekIygOQAyOdpljqwakRH+bvff9FedRviDiosITXaBb58PXcW+RS0
	 ZJVO7cSIognsw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 73DE517E0139;
	Wed, 14 Jan 2026 09:27:34 +0100 (CET)
Message-ID: <b38823d4-1bce-496b-a063-75f2139aa3bd@collabora.com>
Date: Wed, 14 Jan 2026 09:27:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: arm: mediatek: mmsys: Allow single
 vdo/mmsys endpoint
To: Rob Herring <robh@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20260108143934.69634-1-angelogioacchino.delregno@collabora.com>
 <20260113225346.GA367211-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260113225346.GA367211-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_002739_153682_4CA9AB77 
X-CRM114-Status: UNSURE (   9.93  )
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

Il 13/01/26 23:53, Rob Herring ha scritto:
> On Thu, Jan 08, 2026 at 03:39:32PM +0100, AngeloGioacchino Del Regno wrote:
>> The hardware supports using just a single output while leaving all
>> of the others unconfigured (disabled), but the binding did not
>> really allow specifying a single endpoint@0, because in this case
>> one must either:
>>   - Call the subnode `endpoint` and not declare any address and/or
>>     size cells; or
>>   - Call the subnode `endpoint@0` and have at least one more other
>>     endpoint(@1 or @2), and declare address/size cells.
>>
>> Allow specifying a single `endpoint` subnode, without the `@0`
>> implicit suffix to suppress warnings happening on this kind of
>> valid usecase.
> 
> This series isn't needed. We've dropped this check from dtc. I'll do a
> sync with upstream.
> 
> In any case, it's also a W=1 warning which wouldn't be my top priority.
> 
> Rob

Oh, okay! Thanks for the feedback :D

Cheers,
Angelo

