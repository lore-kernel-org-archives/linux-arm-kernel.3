Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E401CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AX6geBpkAr8O0AIRV30OjkI208B43a99wZ/5ohwYabk=; b=BeZWOByLUlbLr0kAfcmDVgAFfT
	glqZyZl+fEweTH1Plt+ujfFfDryGemiSkniqXVogVhwS4uIDIq7wYr2K+lCllJtYIN1S4tIEFg5gO
	n5wcydoOWh2l1DOlvFUiRFUpRjrRVkzeHzl6n0Tl1NuAuh2QBB2reb4TKOK4kp/P4U4OYACXoN+sK
	b7LMNjEWmo7L8i/Oi8y7825nTf2up2U4S32XHESBP1Gq8Z9p6XBFlwd1uUQKkKpctRm9fYfW8fkTn
	SykYP+6hzUIMd8A1ggerZ56QtNajEwrP2UjeT7YimpbvpygtdFSzvoZExqtvnhH+5IIIaFaDKmH/8
	QbVCVojw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6d1-00000003j7E-0HKn;
	Mon, 15 Sep 2025 10:40:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6cw-00000003j3V-1zNz;
	Mon, 15 Sep 2025 10:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757932804;
	bh=OrTJg7ML8WF3jd++p1PbmIME638sKP8/rrTaWRexXFQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n2Q/efzHkJGRLxmW/UaOdSLrbTUPUWThFLvuPvZGEzJ2eGVZt5GQGG46KcJwMXAP0
	 KAVfdokKQSDwa0lC09Vrz93yG2kwUCpQZKR374PI9Bj8+N9Fo4ZMpCwIYwxV39txEv
	 Nk1zm1K3b+apyMTdH7rEFbn9/zj+SnULkn1tFn9vHwVK1gDvXBM+5FAYubQzZIGKE/
	 yV7hzHEmt5P2eLzoKiYZXoyE7pO+CW6VO1hlmVvHFQB07SqqdHXk2kv6vxnkhpJrik
	 tvpSPnG8oaT4IUFNgbdtqu2q2yJZOQV/pQIXsPbqdfKNzijMBLQaEaGFXW8TuiPU2c
	 ol5ppgNncVG0Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9DD1E17E132A;
	Mon, 15 Sep 2025 12:40:03 +0200 (CEST)
Message-ID: <008072e1-2daa-4b88-a6c4-a7ff95532e89@collabora.com>
Date: Mon, 15 Sep 2025 12:40:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] media: mediatek: vcodec: fix vp9 4096x2176 fail
 for profile2
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
References: <20250915091958.31509-1-kyrie.wu@mediatek.com>
 <20250915091958.31509-6-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250915091958.31509-6-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_034006_680160_295271B7 
X-CRM114-Status: UNSURE (   7.76  )
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

Il 15/09/25 11:19, Kyrie Wu ha scritto:
> The dram addr of vp9 decoder tile number, which use dram mode
> to set tile information, may reach to 36bits for 4096x2176.
> It needs to get the highest 4bit of tile buffer address to
> set tile buffer address.
> 
> Fixes: 5d418351ca8f1 ("media: mediatek: vcodec: support stateless VP9 decoding")
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



