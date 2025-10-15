Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B87CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 08:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tOvwEUej9aThBZWBlEqEMMt3p2wmj0YSi54SZmh0G3s=; b=yvjdu7FfibMjlgUWYjEMD0SoW/
	k9DxdIIUFrAu1SP7GkU3ZkpPucW8BZwPq4b1AHZfYKdBaTRiYtCS94Vm4aVrkd2+FezAAvjRH2BJY
	EDmr+Xbh/P3J/DCndajhA6gxzKxwAmNZDlE3l0w8ZfpD302MW1GQ5toGO5dh/a12RFVo0/lgtSbfL
	HbWHzybwUPecndO9vFmwEVtUtJ9UyzI5R56ig5eKEzRV1W0i8IefEFdqJGNqHwKkLxdj2bCo9lHSM
	fQ0xPytcgri6biSeKh8XRybm2+Cd73tavgL35WWGwQ764VJHJMnDJCghwEuFXiSHvggO04/mqrTx9
	wAmlF23w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8x8y-00000000yZa-1T6H;
	Wed, 15 Oct 2025 08:46:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8x8t-00000000yWt-1dkL;
	Wed, 15 Oct 2025 08:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760517953;
	bh=XOGY5weYjz0PiayCterLaiEnlsWjQtw9y9up2bDmOsg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GjkGHF67ScAYrb7IvLKJvMSEUfi0mN2Xa/y5Rcfy4tOIUPekVBfiaLoo9l79yRkQb
	 hetxLA6ID23ZEsfTHO5dEC6Oz2kJ+MTRfnVAWDPDwLeBpVjs3G6tJuj6B54BoUDkUe
	 tF8YJZjguG24puC7gXYHH/yDij89WPu6z/TJhv1j1W1IrA+wpLR6XzGMJpCEyjgq3c
	 A7dgr/Yv2Lf6n/cLaIOd4Fvu5N2E1GhcIvGwXy+QMszSNLJBguBkwUNKXT2P17Ibw/
	 arrU+qH+5cMN9Nbs5XeVuFs8T4c3h8MBUnnfExI+AauUjTFw7CamhW2jebZaLckFB2
	 xTjl8zWTjlhtQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DAAD517E1340;
	Wed, 15 Oct 2025 10:45:52 +0200 (CEST)
Message-ID: <02c98be4-6baa-42e0-a226-506a817c83e9@collabora.com>
Date: Wed, 15 Oct 2025 10:45:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] iommu/mediatek: Add a flag DL_WITH_MULTI_LARB
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
 <20251015032509.5057-3-zhengnan.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251015032509.5057-3-zhengnan.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_014555_577984_0CFDD966 
X-CRM114-Status: UNSURE (   8.11  )
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
> Add DL_WITH_MULTI_LARB flag to support the HW which connect with
> multiple larbs. Prepare for mt8189. In mt8189, the display connect
> with larb1 and larb2 at the same time. Thus, we should add link
> between disp-dev with these two larbs.
> 
> Signed-off-by: Zhengnan Chen <zhengnan.chen@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



