Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88490CCF2F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/pI93xM8TxONZgeEa0crJvJ1WfFkATHU0jB0fvokWk=; b=w8hXMVVF3ZzbMQnxG3CMdTt/r1
	aux2XjLRABqjooSI9vYPXhcCZqRLRiZIIYGw5gD9NM0oW9eeQ8pnMY5h/tVgn440SaoB86KjS94q+
	cwYheuE4RFLhRyrY73Pykq7jlJryEAPTpvlWIxfUkhozucHHU/ykImaRhnsLr33ltd8tJ3gf+vV6+
	UCN6Koehjk4AKXQ3o2jLInWrbdWHwWHwL61YkgSladXIAcH1NXQdflC20VSsqzaGzYTnQ9qkH6XcI
	nJfbDlR9bZ1gI0Sa1rpA+NA7+SK1+n903BTSKiUySwBgba9jds7ly+YdmJgX51DInlDmdzu8nZFXf
	4IjS/wOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vho25-00000001wxX-2PhG;
	Mon, 19 Jan 2026 12:06:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vho1v-00000001wqk-0bqL;
	Mon, 19 Jan 2026 12:06:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768824404;
	bh=pPdubwyELJ6eLp6ruX+Kdi2iQrXdabzZV/vm7/YSVjU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k1k9lPCXUjqexHoc4MT9fjH24GqwS6e25/S5egxGsqN7wAgUpKktMAlNW5K7rMDI8
	 0k+yKOSSRv0UTGep45P9j5uoBGr2cpnxcg0dYIhFkRElMvN/AYXN2ZAIvo6+6hyAxt
	 8S1IS2C/vhVICIrxuLhDSfmqOtCfVUwtC0yORqiXgpQHP5/Whm7jSgVI8J94Ova1Mh
	 aam4DM7QxRXUVwUpX5vStEzGHE9yr1tyv/VsK4FA96+DdHfCn46a1nqDirArP8nmCF
	 0hcfnjVG/CekH6ekakMeJa4XDfFcDc4H45luv28JAU9L00+IqLhStBanOofMZVY3C3
	 K+piMja9NZL2A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4686F17E0117;
	Mon, 19 Jan 2026 13:06:43 +0100 (CET)
Message-ID: <351b7dec-8b82-4ea2-87fc-ab07b2fd145f@collabora.com>
Date: Mon, 19 Jan 2026 13:06:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] thermal/drivers/mediatek/lvts: Make number of
 calibration offsets configurable
To: Laura Nao <laura.nao@collabora.com>, srini@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 matthias.bgg@gmail.com
Cc: nfraprado@collabora.com, arnd@arndb.de, colin.i.king@gmail.com,
 u.kleine-koenig@baylibre.com, andrew-ct.chen@mediatek.com,
 lala.lin@mediatek.com, bchihi@baylibre.com, frank-w@public-files.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 wenst@chromium.org, fshao@chromium.org
References: <20251125-mt8196-lvts-v4-v5-0-6db7eb903fb7@collabora.com>
 <20251125-mt8196-lvts-v4-v5-2-6db7eb903fb7@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251125-mt8196-lvts-v4-v5-2-6db7eb903fb7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_040649_548719_03AC89C3 
X-CRM114-Status: UNSURE (   6.26  )
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

Il 25/11/25 17:16, Laura Nao ha scritto:
> MT8196/MT6991 use 2-byte eFuse calibration data, whereas other SoCs
> supported by the driver rely on 3 bytes. Make the number of calibration
> bytes per sensor configurable, enabling support for SoCs with varying
> calibration formats.
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



