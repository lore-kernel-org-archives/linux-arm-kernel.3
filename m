Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC14CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 08:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bCvI8Qdr1QhWNYJhPeqs8h/rtFjS9YmDEV4QfLDQYA=; b=tRcTjZNHv+1Xl4iGoWoy6hOGvf
	6pFLWJCpVxgTtjKmWWcCvbQbTCxRQzkrPiWpUfvC8BRtw02vUvbZ2Jkg+yl6SMvDe1AV0T9iVNUTj
	Zq4S5W9QUfAsMWG6K53lE4OaU0dk1m3iLQNLWpU84j2piZd2GiTRBD5sPFoysMt368RdSOMLuZGkS
	O07ozot0a5hBpRyCclFMvMVuH9Mfi7o35EJVCbUtPmaNnIIJaBrEMXOxPSIZGqceaspu9RfATzNGH
	1v4CY+K7PXmilu+AEo75uwuLmHVwHPbtaXaujxyKmYxDYJY1QNF9OBWtcKMUNyIHyoEmYaG2pWgeR
	sFBLeaFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xCg-00000000zOO-4AjP;
	Wed, 15 Oct 2025 08:49:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xCe-00000000zMh-1DxS;
	Wed, 15 Oct 2025 08:49:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760518186;
	bh=yn1ks2heKSsmo2MZYoR1wSCC8e1kYOiFpMfzPzh3yvY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k/Utm4TIUGQilymOrYxwYFmumpX0wlq0j2Vmek7or8K31CrN3cIQ464L5pyi9oQbS
	 lU48rixwN1Li8KFbsoYUFNNaw3QQYAhuHuaRKTKFSYxJ7+Aeqqaxc52BqakDjVQbTL
	 SCOyzQF86gv0p/R9rkokMAPscHloc9xCFNBYlEJ/YjA7OdvEkPCCN8XbdZerpgfAJZ
	 R/YRIjRF8zKXnafPZSaJxyXB8GjAOO01Pe+4U1TiJnwnvnSGQEWY7Sc8CB3Fe9DXCj
	 I9SXSiqNPWuZBF7CSkjLwh25wlzVnOycwAgNOruw8PTnYgyNbg8gvuGqEHjtVnJjx4
	 IaZ099ntgZGug==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DEE7617E12EB;
	Wed, 15 Oct 2025 10:49:45 +0200 (CEST)
Message-ID: <707832a4-47b9-4c31-851c-07d129cada12@collabora.com>
Date: Wed, 15 Oct 2025 10:49:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] iommu/mediatek: mt8189: Add APU IOMMUs support
To: Zhengnan Chen <zhengnan.chen@mediatek.com>, Yong Wu
 <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20251015032509.5057-1-zhengnan.chen@mediatek.com>
 <20251015032509.5057-4-zhengnan.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251015032509.5057-4-zhengnan.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_014948_477778_91F50015 
X-CRM114-Status: UNSURE (   5.94  )
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

Il 15/10/25 05:24, Zhengnan Chen ha scritto:
> Add support for mt8189 APU IOMMUs.
> 
> Signed-off-by: Zhengnan Chen <zhengnan.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



