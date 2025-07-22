Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB80C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 09:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bxqwcZ8eTfywuSZSfN1XKUPuW86Ib5A0rgx1V4sZz+U=; b=YkBeCAksJersD31weuV12xjN1S
	8vuioUiGSjTw+xK/RIbnzbDI31mwsFLK+2dAkk400YnnfLrrbis80+UWXu+6XMgPw9uMaaKalF4Xa
	8fStosw7C54IZor36E4FKbiRaGEgJ050K1GMb4+oRmBqcMe6iWVDQV9djhIoxrfdorCDWtyUMaGje
	wiekIashT1k2l41qNyeqbIeRNJUHTkR3LcHniGCt9Ev8iGzXbOrwIKTqPUbZXRPU5HshMdHxomUbl
	0VpuWyZwh8hTi5Cv43H0PUE8SXk2OFBN51/+DQ8lvqWAFPF1JVMMFrAJAU/WOyaH35KcasQS3GYQZ
	nmSs+0nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9C9-00000001zUR-3YeD;
	Tue, 22 Jul 2025 09:21:57 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8vI-00000001wL8-1jSo;
	Tue, 22 Jul 2025 09:04:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753175070;
	bh=+jviNUvxy5BMeCnPL5e7+yknqDsmCSGYBxWz44Poq0w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SP8EGeypDs2nSDG1wCfpzlGIP+kBfhH7TVL950c8QzunAiXm/tmUp9LSotrcwCuqw
	 kXUuMTDonD+nBAcMbgAMsmRuEa0ZvQuLvHq10oxAXhbWHm3MxwBM05Y0sIHmvPhphL
	 mM3tLF3lBCCAmwE7utZU4nk9vLkb/DEF0HEaf3B8OLAhmEg4oNbPAOjLkJaWtM9iHP
	 OBGZQdbWA4LQ/cHOKgT+z8Dpv0dVEUIVRVEj3lM6IenQTio189dzUPGZ/xTKJWnUVu
	 5ltzRZWjJNZaXd+dhDOFF3yFxdb/eKpfuP4yzgRFWwTzO098miY8CKceMXuvkJdxQc
	 jocwBfrNCkLpQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2A8DA17E0DD0;
	Tue, 22 Jul 2025 11:04:29 +0200 (CEST)
Message-ID: <24c65ecf-ab89-4970-b2ae-00185259d359@collabora.com>
Date: Tue, 22 Jul 2025 11:04:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] dt-bindings: nvmem: mediatek: efuse: Add support for
 MT8196
To: Laura Nao <laura.nao@collabora.com>, srini@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 matthias.bgg@gmail.com
Cc: nfraprado@collabora.com, arnd@arndb.de, colin.i.king@gmail.com,
 u.kleine-koenig@baylibre.com, andrew-ct.chen@mediatek.com,
 lala.lin@mediatek.com, bchihi@baylibre.com, frank-w@public-files.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20250721081459.16278-1-laura.nao@collabora.com>
 <20250721081459.16278-10-laura.nao@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250721081459.16278-10-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_020432_635919_7D04DCC7 
X-CRM114-Status: GOOD (  11.92  )
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

Il 21/07/25 10:14, Laura Nao ha scritto:
> Add compatible for MT8196 SoC.
> 

This is compatible with MT8186's layout - not with the others - and
besides: "mediatek,efuse" is deprecated.

Adding something to deprecated bindings is not even really permitted (unless
there's a *very* good reason to, which you definitely don't have in this case).

Also, this commit has no description - repeating the same as the title adds
no information and doesn't help at all.

NACK.

Regards,
Angelo

> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>   Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> index 32b8c1eb4e80..e209a1132a26 100644
> --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> @@ -37,6 +37,7 @@ properties:
>                 - mediatek,mt8188-efuse
>                 - mediatek,mt8192-efuse
>                 - mediatek,mt8195-efuse
> +              - mediatek,mt8196-efuse
>                 - mediatek,mt8516-efuse
>             - const: mediatek,efuse
>         - const: mediatek,mt8173-efuse




