Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399ABD73619
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 09:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hj6fNFtAPqjvcKNyoaS58PuL6Fels25tfOvkc5p2vf8=; b=HxJLqUOf2dPpF+k5WFuSNM0AeU
	i/2iX2YpYQXP+aVGugtD3mX2aqckAcJoMvKJD++iyU0W3TyXi/oCYFdKaaO/qWyOgGJxQozbfqAiw
	nkYd3KE3Z0PY2pkJaxBA8wnluoSEivlkltvD1R+UmDktbhXsS53Gph14KIAJ7I+xvpalNSUU/weD4
	OsAnJhdFEz4IWKTepigb39VWWyaCCKt/yxRYDLREyHcN9NoOjo3Ive6+lPCjelXJ0tVVSjA0XqAvH
	6ozWmc+G1DUqUyWFTkntpncxZz42LEoP1t/x8PLWTgN/q33RmmtMweyGFHLbmraXlAuEWA9q359qa
	35PQuS2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPPU-00000008wDq-1Nci;
	Tue, 03 Dec 2024 09:41:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPOT-00000008vuj-29Sa;
	Tue, 03 Dec 2024 09:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733218832;
	bh=wkD5ZG0b5Saq9pX6c33R8kg0GEShIHTUFOKG19yOu1M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jNP3uz9XNK7fEx4lT6DwfIANO0jhE77WW89/iGPKIJncfQhE5pCDHYp84sW3Rg5mO
	 YoZyuO4bpY1QnomLTM8cDWAgdw3EGGRK+flPCEaYCAuxUYrWctGEtsqo7HjpOzrQL/
	 Z5h81p6oRlRzkoplzQ9Mx38wEP49TC8oHK9pcYGmUuqh0PR5i3yItFuRYwnEhpNWNR
	 0KAueuldIlzgNqlicmV08rx+9EYG+InTyTbBY+udrE6+OL0n90M2d6d1PXPG0DLS5O
	 k6enp4yTVI0+v9Qzwa6Yy/qD4gat9UIYcUsgIk7cNCN4Zj46u79pX2+e1hJgAObLr2
	 +emi3+hD5NpcA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 88E8417E35D0;
	Tue,  3 Dec 2024 10:40:31 +0100 (CET)
Message-ID: <754b7179-a3b9-48b9-90eb-cb6d6754edf6@collabora.com>
Date: Tue, 3 Dec 2024 10:40:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/18] arm64: dts: mediatek: mt7988: enable pwm on
 bpi-r4
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241202122602.30734-1-linux@fw-web.de>
 <20241202122602.30734-19-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202122602.30734-19-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_014033_708320_3B6733CA 
X-CRM114-Status: UNSURE (   5.64  )
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
> Enable pwm on Bananapi R4 board.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


