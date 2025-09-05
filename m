Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E00CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 10:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9rZsvirjyCgB54v0eHS4TYMBYLXqgQ97b6KeCK2UvE=; b=iyBCqr+cqdZTESIblTyoskqfwC
	ytxce5TZXlu0avHTPDxCsl8zFW6di7U0pho0ZbeW4JGkrAxey4CHqo6xrLBmw/T4qaryUlXQFPiQQ
	KGz42fLzR+47sakhm9vAmwPVXoT2xpj4jnAEHSyoT2FaxEXdDPDlzoR/FsM4XOBy464a2BGd9jCCs
	j1omIq3NItnNQ8mkKHzlvPrOEfV6iIUkgUTNsO1asNzPpTjSFTLUZKRcfrMietsoZGGtVi8Xtslv9
	DNt3Dh3HANtvoKHwikoLVAPjjKkD8c1rXrNR/lE32IKBWpOzNo7uyQlemArWBzLJnROBPlZv+ym1Q
	5FC8LtQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuTcl-000000012aj-2rHF;
	Fri, 05 Sep 2025 10:24:55 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRzb-00000000R0X-0mdk;
	Fri, 05 Sep 2025 08:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757061621;
	bh=0ZLjfCgKTzkozbgbd8XMdFHbNJtpQPMF/G3+eXv83Ro=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jLAzdPzV2aXY044w5Se65gc002FZnkX5GP0OcEZBizFhx64QUSMbaZFFfkpIloE6m
	 PaXwFQNwT985zicojzEdy4oFTVf29K64oQVqPQrzCl2SaXLjKX/jRBTvgCCOHRRe2V
	 CqHo6zu1ELGT1ZQEw30jg9jAsINbSLd/WPekZ3bFWpGLbIIjW/Y+uQTTBMkh2eHr4t
	 kUz38aE/GHGKqbgQXfkNLj1N0Ez7mL5eFOGcx2+9DgxWqSx1l7YXEJU9H6KApRjWWH
	 LXThhsVTqyB0BNld+n8KOu/+gtJAovwCEQ1cgQ+RCKJAhL971pN1t5TYxfWQzaicax
	 5eTR/qdcQyiwA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 329D317E0EB8;
	Fri,  5 Sep 2025 10:40:21 +0200 (CEST)
Message-ID: <649362e6-5743-4cfa-ad9f-6b828540ea78@collabora.com>
Date: Fri, 5 Sep 2025 10:40:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/27] clk: mediatek: Add MT8196 ufssys clock support
To: Laura Nao <laura.nao@collabora.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de, richardcochran@gmail.com
Cc: guangjie.song@mediatek.com, wenst@chromium.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 kernel@collabora.com
References: <20250829091913.131528-1-laura.nao@collabora.com>
 <20250829091913.131528-16-laura.nao@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250829091913.131528-16-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_014023_371989_D1DDAEE8 
X-CRM114-Status: UNSURE (   5.35  )
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

Il 29/08/25 11:19, Laura Nao ha scritto:
> Add support for the MT8196 ufssys clock controller, which provides clock
> gate control for UFS.
> 
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



