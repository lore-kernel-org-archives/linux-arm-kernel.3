Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39C1D7833F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 09:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgivGtifQdMWHyutAmug9hzNl1CXiRSjQdkPau2Qpno=; b=N9F4WDs034qcN0dPWqQmR29x1Q
	Z7nYZykf20WzYqm5Erhli0jBxUTuUrBRbPiTPTP5GIZMeLb2LgJvLVOZhmZRsHDKC406Q08KbA3cA
	wAx94zIvDfl5AZFq//TzT7paovMR6vfuujn5fO/TbQ4Wb4SEO7u97gFzZBzZPDqBVZihr0FWvSO89
	IqQ/otcQ7cW/JNrV9KVEfT48xhkyor/EOYQPcIE9U1UcAYo8qrI4YUBDzQq5QwWbuwaECa9wJnijZ
	Kp3c85wlbkuFbYdNXc04Kg8+dRoZKanmuDNSxlu/mY90M5D+zatTagSutVXfGHDubZJpoxsgY+A3J
	GyidpOGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPXH-00000008yIV-0SS2;
	Tue, 03 Dec 2024 09:49:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPOd-00000008vy9-2FlN;
	Tue, 03 Dec 2024 09:40:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733218842;
	bh=cuml/lyWq/tsezamLt04fwUzFmq8PP+5VXGFR2GMyMo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HUWm0h12pGgiL/8lxd0bUBkyu+jfMDfgyJOmmhQkCZ6MdXi860AG4jiQBbukUv/Bw
	 1PZZlenb/Sy/hxVha2zoZx0p/PzEIX7U5Xr/4DuwqI9fsTAea2hlPgyijGY+T+4s9r
	 rIOD/o/K91AAHE0WqnQCF9p0V97Pwbc5LabwsxY4gIetQGD8DnY0/D/1c1ojym4MJA
	 kONaZgHGf04KJJSCJEMbHUppCRi1MOlOAj8knA9M9WAQk+tYrW5joze+AmSvdPRYP1
	 WUf5nBfaUv55effbna4uJWYnAkofoL0cHFcEg+rl7DgzS5QUtAKOO3uW/njzsMYTvF
	 hmJxeXAtJEL4Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C265617E35D0;
	Tue,  3 Dec 2024 10:40:41 +0100 (CET)
Message-ID: <8196dbf8-983b-406d-aa85-db51b5609293@collabora.com>
Date: Tue, 3 Dec 2024 10:40:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/18] arm64: dts: mediatek: mt7988: add
 operating-points
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241202122602.30734-1-linux@fw-web.de>
 <20241202122602.30734-10-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202122602.30734-10-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_014043_723260_38FCA077 
X-CRM114-Status: UNSURE (   6.02  )
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

Il 02/12/24 13:25, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 

arm64: dts: mediatek: mt7988: Add CPU OPP table for clock scaling

> Add operating points defining frequency/voltages of cpu cores.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



