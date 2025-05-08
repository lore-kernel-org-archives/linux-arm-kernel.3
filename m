Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F54C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 08:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJA8qf/a3/CEnL5BL/9QwlsuH0YIPmI8h5VL5Yt6JbM=; b=zfSI8Ii2ubtgAyxXoTcng9sXFW
	y7t6Lxe9jebcWkr6S9vDWanDScmBM2uA1suUqGelYOziIPhm0dyzKB3zMRFzFV5SR3ye820M86mVY
	LX51dHraSi566l9/kWQwTvxM5HswvWLYA5AmYbVflvUA608O7CARozlyowZFOcvgOiUDED0kRNOyq
	sih8BI1jdpzCC3UdcUrRBp2LTFj5h4noy9O5Ptex2/UZvAMbwkz8HfHOhLu5Z3nr/li67By8by3wx
	S5oiumsexF/k/UbUVuDNRSpYy/WHlFY+XAC6zwkncu+5DG4oScLvrqEGYYoX/qvbElQpbGp/vRguP
	w5sa331w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwVi-000000005sG-32xI;
	Thu, 08 May 2025 08:21:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwPv-000000004q7-1gOJ;
	Thu, 08 May 2025 08:15:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746692142;
	bh=7r6OTGgvged4uco8BW+BLg38bSJrp+WvRqlr9YTSWRU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bfgaKB4vrzTursOZlFORwMk/wp4advCrn57O6uhdlNElcWsKrQilcXdLZQA5cYlJl
	 OAKG6Inmp4uKTeuGkeNFlV153FIuunxAuY2iXaBWSvvMdewGtnPLDbkI7+K/LQiDJB
	 I5oSwtc+AG7YaLGkj9k6W616zq/0E8Q/cvoU9hZdP02Bf3AvhuzzUngWEd685986bb
	 P23lWwUmd9xuq+HCci8PCoe+lWyjltOo4eYUpfThnaKrcsO7tk393+hEGOD5gls2Cy
	 meTxEVjbHFbMCTNW6cxIv5LYBphOGAUs7AX49xaiLCycgIv8YZw37sp+tj+pHkyJgv
	 3M+2lQ+Y8eUZw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 47BB117E120C;
	Thu,  8 May 2025 10:15:41 +0200 (CEST)
Message-ID: <97ec1373-1662-49e5-aecd-407a2ab2c2aa@collabora.com>
Date: Thu, 8 May 2025 10:15:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: Add compatible for MediaTek
 MT8189
To: Sirius Wang <sirius.wang@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 xavier.chang@mediatek.com
References: <20250508063546.289115-1-sirius.wang@mediatek.com>
 <20250508063546.289115-2-sirius.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250508063546.289115-2-sirius.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_011543_587352_84F449B8 
X-CRM114-Status: UNSURE (   6.63  )
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

Il 08/05/25 08:35, Sirius Wang ha scritto:
> This commit adds dt-binding documentation for the MediaTek MT8189
> reference board.
> 
> Signed-off-by: Sirius Wang <sirius.wang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



