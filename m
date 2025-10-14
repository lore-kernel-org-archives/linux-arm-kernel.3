Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39910CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 13:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3kisYYJrLUrT8e3FZu19lB3U1OVttftZK5ZY8XI5SE=; b=wMwjr6rcIpAihayeIHGzJCJo3p
	RoeiJ3Enpad9LVJuZaE+wFaOTbdW7ShB0P3iROpBjIAK//DPGvAw19k5KSscK44SDRDDe2hjWOkhy
	SnJbRj4xxUo1S/aSrIBnLtBGSaL61nROqqr2gR7EjeA9w+7XvfskdRcl7RDk//jN73Xn1b5s6FPo4
	id/puzRTRIgnqmuI7Ep6AKRkTyUuMXdDm1NGyXjre23x9Kel/H3tNk0YYOBZXqfkQeYRcea0/qdAo
	B10rEkTkHLZ4u5VbFPSgVYjIiru9+BDbQmzx2jjGSzX2CFCltIqhVJOVLf5SJ/qSBp2bof6ZVmP6/
	yO95hUzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ew2-0000000GSFo-02hv;
	Tue, 14 Oct 2025 13:19:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ew0-0000000GSFH-1yyh;
	Tue, 14 Oct 2025 13:19:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=n3kisYYJrLUrT8e3FZu19lB3U1OVttftZK5ZY8XI5SE=; b=fwx9wouZVT6j0L4gNXYf7V+3tw
	p+jPMsEaMEi/AJZPl0Gka0nYsEy8yRDWtd6cpx7SercQzoqI9bqPcWUviZ7wcS7PHXgZ6KaJ8z+tn
	J4JYepjJJ4xTO8y+MTYVJmbaRPEmoZwKme88gXFDjo7nDm0bNNvR6XxdUOs+2jQvsf/Ijn27JLr8U
	7/+XGifsMCeLXYSfQ0/AgstpF76bUZ4R4Uh2QaJ8/5BSsCyHwSkXAAFxPLHJTy7cFYzPiZ/oGqzxq
	gD2VXF9KJ9pMlUsQiiBuhzXzxEMFKYfLL8pmJO9U2RZrMuo4/uWa9jN11STJ88RWoSz64EK2OZjLE
	YVENgX6g==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8evx-00000005Byt-0oId;
	Tue, 14 Oct 2025 13:19:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760447951;
	bh=gQxUDGegM8VkIfBkYPZWqsIF3HBSy2cYwjYwHQ7pvC8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iK/ZnFL+jXF169b5rN3F52mi251gRInDD9/xPQ8/C9/7szD2G5wZAyninheV9MaQu
	 TFC4rTb07gkWxiROZwPNoItAa0pJ58kyvKCfij1PcgT4B566aZQB2IEmBf+xiTJ3Wc
	 uid6RwjuflaJfoDEVo+iBxLmpcdxskvWTq90NAjmOhDg9B2dfF51VN+vztqZE4zYbg
	 2q0QA3ArZvEVNyaacL9iqwD0hWJMChnnm4ZnB4kUzjk3qh12k01GXXiJ/9W3y/jF9b
	 241yHy8DfmaFSaW0O8HfDH1ssOJvSZvfOMIPdvHO4qjTksbj8MTM9+WeyCpX3pYAkT
	 t6Gtjycqa9LUQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2924B17E003B;
	Tue, 14 Oct 2025 15:19:11 +0200 (CEST)
Message-ID: <831f714b-f27a-4a3d-b256-e170ff0d65a4@collabora.com>
Date: Tue, 14 Oct 2025 15:19:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: gpu: mali-bifrost: Add compatible for
 MT8365 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250813-mt8365-enable-gpu-v1-0-46c44c6c1566@collabora.com>
 <20250813-mt8365-enable-gpu-v1-1-46c44c6c1566@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250813-mt8365-enable-gpu-v1-1-46c44c6c1566@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_141921_558896_58C220EB 
X-CRM114-Status: UNSURE (   6.67  )
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

Il 13/08/25 11:25, Louis-Alexis Eyraud ha scritto:
> Add a compatible for the MediaTek MT8365 SoC, that has an integrated
> ARM Mali G52 MC1 GPU and compatible with arm,mali-bifrost.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

P.S.: Can anyone pick this so that I can pick the devicetree commits? :-)

Cheers,
Angelo



