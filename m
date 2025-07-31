Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDE8C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 07:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRs/hDxYY28k1vGh70q5IQsg9RAMHgUy9QeIIWRPDBw=; b=TSmtkIBAbzH2NkPbkdY7Lejaf1
	AbbGTm0a8qnd/4e94nOTotvjZrn6OdzpT9t1JfLCl1Lt2LwXvVvmCUgeh/cDtDwgd3RsnkkiuepeJ
	r0JkeoZRhLv0DtG7WG+9N9DW+GObDwPSWJRu7LuzvjPbAjTi5E30Ry9/Fvx3YKS4dERjmAwxm0neY
	SxFoFGf8nlU8Rm0JKcTFN+lLc2XTIgJSjJupweFBwVl8pK+QvO2XcznF9Wf1MNxYaFvh0eMN83Mh/
	2xH+13fD/5+jlgo9cAcotEcgn6ZDmtu4rYdzlfYTuN2mxgGKQLitGEjXVB6DXpFaUesHL81iiGDDF
	Gj+0lOXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhNia-000000033cm-0cGh;
	Thu, 31 Jul 2025 07:28:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhNg5-000000033S5-1F5f;
	Thu, 31 Jul 2025 07:26:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753946771;
	bh=xLDZ92NZiZGURqy1KihB6GBNQMXzkiyFkWW7HUN2XkQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dBBNP2PxvhWmV9tpMlbU84kK3XubH6TLRhjv3KHB1DpnXq+DRkLRBkGGApHzeBGF2
	 sTEhUbXPFchJLu56c0oKNH6eAp4lSM50LfL+wypuKg4YRYAmlUwR7GD4GrFWyoO1fV
	 4NRMY9UCGpOtURK0ZfneIbMtJTHaUlfvUi1tqx0YdWwfU+Jbzl9EMs8EG4qYNR7fpf
	 IOWLvNw6VvuUD1eo+L8SiMOFfou3UdyNaMffn6NYbcyrUQMB6JZ2X2QeLWdE1p7U/I
	 RunxdJii1uHH/gX5fM0AbdaQ9HsHcyWOCplLnb/Nosqqs7A5H/Efph6l+u25nxcgdE
	 6u7dq3oTnRlww==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5136617E088C;
	Thu, 31 Jul 2025 09:26:10 +0200 (CEST)
Message-ID: <10fd2758-4ad2-4f5e-97d7-0dcdeefd15c0@collabora.com>
Date: Thu, 31 Jul 2025 09:26:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] dt-bindings: nvmem: mediatek: efuse: Add support
 for MT8196
To: Laura Nao <laura.nao@collabora.com>, srini@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 matthias.bgg@gmail.com
Cc: wenst@chromium.org, nfraprado@collabora.com, arnd@arndb.de,
 colin.i.king@gmail.com, u.kleine-koenig@baylibre.com,
 andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, bchihi@baylibre.com,
 frank-w@public-files.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20250730152128.311109-1-laura.nao@collabora.com>
 <20250730152128.311109-10-laura.nao@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250730152128.311109-10-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_002613_495717_84AE21A5 
X-CRM114-Status: UNSURE (   5.51  )
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

Il 30/07/25 17:21, Laura Nao ha scritto:
> The MT8196 eFuse layout is compatible with MT8186 and shares the same
> decoding scheme for the gpu-speedbin cell.
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



