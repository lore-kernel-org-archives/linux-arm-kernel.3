Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0973CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l2FjCeasg3S+d49/HscJHtpwv/awecJhBstOyFczEvU=; b=cyDUoDm3RIALosQTAH8m/W7IZQ
	Jl8Wdr7bSkzqzPnYcPZn+cMjgq6ZPXUjrQ3MoMtqEvd0klCEjMhYcwhZtfNTkzuPLzhBzopbSmrwu
	zxX/H38ZJ6rGL2hJ1II3oqN8MGj5Bi6Vlsa6YnbQCCEjNpbVyYMDq6dR3jGAAUUMbuiO6B/zBUq4x
	rUpWVNMARFyS/L3DhGnWEti0Z7Q9Ot4twULkTx8M1b02ZrKLaUexerjlz6Oe4VAbwlNtVa0Q+eiPY
	+O864hxEnPe1JzLOxe+4waE/Ag6Xa/FnBdJK5v4gXulBgDxnH/RtK0JRiy7QX+bbgfQep8oUvyvkt
	yACTKvhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6d8-00000003jD4-2NDg;
	Mon, 15 Sep 2025 10:40:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6d1-00000003j6Q-11nx;
	Mon, 15 Sep 2025 10:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=l2FjCeasg3S+d49/HscJHtpwv/awecJhBstOyFczEvU=; b=DMw3/XZEo1Y5oDwCI/fwuL53+H
	uVSd7JUkBsUmPqWK1I4VV2dXM8obq7ghxYAQcNc/Qq83vR7wKhwKP3TKhkOPBq+iQ9yR/YhnLwYnW
	SfFKe3VCEhyRSL2EaRHV5wJVAEAMDO2lg9YgpSKN95bnl6R7UYitsjghVtmQm/Kn2dXb+AtNndlNY
	XPrevBRFqahtzOytdDA1uNgtgJ9ob0KNZ5+f+ku0Li3HVFcwtMX5eDukutxvDtylZYdXZkDx3q/1/
	hx+ceJImHSChE7E3cHDaTPZWanDsYvj28Z18opFD5eNlGbb3fT0tIyCDBhsdjA2IzI+S+5eiZZscT
	t2iOOQkQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6cx-00000006w1r-0ATS;
	Mon, 15 Sep 2025 10:40:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757932805;
	bh=UP6Mcdhgx9h/IiABxHuPAIji2/BSzer460KD9eI9Zo0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JgIIq6PdT6WWIYPlXeQFRwP4gji6X+PXRqtG36ww3ZG3Ewns/kcAYNvzNs/e+WZXf
	 bPVg5NU8c1rztgcEITUVepGht6FY0ZDIRc42DuIpVXxOA0Ab/1bYaL7L89HLkHfW8s
	 8UXql401+GVugnasScsJViG+DvE6H1eSBEGsIOsvsZiko0SKSMxIIqYF1TzU9L3aQF
	 YY6/349fUy4OiRBpbHFNU0hgMQJD7qjiq2BVViRjeroyz2p/p4GIArDdB37n/RxLoQ
	 TTAHHda0tPTYYc0PqnZh746qJ5K3ScW41MKLG4KVYyBgcNvmyqJBv+J5bGgB4g2Dc1
	 qI5qIRFGFYfuQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1794417E137B;
	Mon, 15 Sep 2025 12:40:05 +0200 (CEST)
Message-ID: <31ce8038-51f6-4e63-b277-b19c79de38fa@collabora.com>
Date: Mon, 15 Sep 2025 12:40:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] media: mediatek: vcodec: add profile and level
 supporting for MT8189
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
 <20250915091958.31509-4-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250915091958.31509-4-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_114007_182635_8A42045C 
X-CRM114-Status: UNSURE (   5.97  )
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
> add profile and level supporting for H264 and vp9 of MT8189
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



