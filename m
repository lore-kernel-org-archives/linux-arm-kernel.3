Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59908C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 08:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOVE8ERVcdvnV2l+bviWeKhAZwDCoktNkI360zMeYh4=; b=uZUz27qZ8Zi9a94cKCqnE+tdBc
	+z2drluPJj3QrjTmt4K1gOzpfwA8+eWywXp7nxcpXkxkklLo1PyNcqjndBwAJdzhmxEIiR9EfEjhs
	SMPY/O+RMLCyWNVZwXPoXvlvyWG23hrQroA4P5CWYViYxyNmixvP7U8dbacgAuRTK8k8rB59XbR/l
	bKqv6HseVeJFCEDmdK1c/vf2CmVIxZE/6DpQGn15y73qqvFcCeWwA09UJvybtxwm5nqvTgVnVHGfj
	ggLl3iQCT3l5tXCd6rzzKW6/UTGBL3Ub6f+vL7gLCewLIf7Mx+tddaYtUvc1xXPk6/FEUNPCN5GBs
	6NdMrl5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueV7g-00000004PXm-1fvj;
	Wed, 23 Jul 2025 08:46:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUef-00000004Lou-3WiZ;
	Wed, 23 Jul 2025 08:16:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753258608;
	bh=+VQ4AqRNQYlMRlFVDGpoehc6xQniWJm1BPQ7EST4cqg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NzoEBDDFyHT92D135vYyDMDEg/L899CZaatPg8ttNTCMCzYXMmO9SSXl8HJxzi/eB
	 ouGmCUtK+4g9lbugxf9cGXhtzHCTnX8aIjeBUxrjc18JZeoLDMEQBa66bHd+PZAT1f
	 ANBKPB8CKnumyYU9hNBgfDomPdJJE2gw6cG4kKNlaKgq29lChRTcNb/z+nYrZaEyFl
	 +uML3FedhGDrxPcoHXNNSn23ekKEKAZxz/UstEwZT7/AmC43Zkhp0V1hhbBQ94jRaq
	 oUmudd6wIoxXJ6Cd5j5nPhZfQJbMPGWctqn/5XiCA5PMpcUPLSUC/fJhDMKNOJcIMu
	 yHgFL6I3Dm9Hw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 96B8517E017D;
	Wed, 23 Jul 2025 10:16:47 +0200 (CEST)
Message-ID: <5d7557f0-841b-45ea-901c-5b595ac8bde3@collabora.com>
Date: Wed, 23 Jul 2025 10:16:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183: Fix out of range pull
 values
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo i Serra <eballetbo@kernel.org>, Ben Ho <Ben.Ho@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250722171152.58923-2-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250722171152.58923-2-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_011650_032926_194F2444 
X-CRM114-Status: GOOD (  15.02  )
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

Il 22/07/25 19:11, Rob Herring (Arm) ha scritto:
> A value of 10 is not valid for "mediatek,pull-down-adv" and
> "mediatek,pull-up-adv" properties which have defined values of 0-3. It
> appears the "10" was written as a binary value. The driver only looks at
> the lowest 2 bits, so the value "10" decimal works out the same as if
> "2" was used.
> 
> Fixes: cd894e274b74 ("arm64: dts: mt8183: Add krane-sku176 board")
> Fixes: 19b6403f1e2a ("arm64: dts: mt8183: add mt8183 pumpkin board")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> This is just a few of the warnings related to mt8183-pinctrl... Mediatek
> is #1 for DT warnings on arm64. And by #1, I mean worst. :( It would be
> nice to see some progress on fixing them. Otherwise, seeing new Mediatek
> bindings rather than fixing the existing stuff makes me grumpy.
> 

Thanks for this fix.

You're absolutely right about this, let me check what I can do (and if I can get
some colleague(s) of mine to look at that while I'm away in August).

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


