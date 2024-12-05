Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C83E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xa4qOzWebqyoqN03ikOEpI/XchKP1JIXxUpSaO+MxQ8=; b=EviqSZAcIuggZGo3hOMY+sKDI1
	aKkymgcB+HlUtN0OADbMNsnBEi8yb/tf4rlKCiA9lBuvyMjo7EPvogMKAV5D5MVh3obsEsDukh+m+
	Y3M4at5fubGk9VVVTBZ93LP7omTeOd3e1AjuDy99nMFWBXfX29tQum4kJ5fRYngEA1FIx/zeP+Xie
	9cZeO9Owl7459W/foW9c+TiYVT1PyRceRNmxG6IxPTFFrecX5gFGcTieThR9S6CAe9Jy5wqowcCTj
	JedrfCflZCICIoxJjufYgssdXRxXSdnTctvRp5QRUQ+3rPIlFhsV4lZ8B6BPdJ//XoUC+MPD//FpD
	RwO/9iZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBDS-0000000G0K2-0j3Z;
	Thu, 05 Dec 2024 12:44:22 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBAa-0000000FzZZ-1fox;
	Thu, 05 Dec 2024 12:41:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733402483;
	bh=rHmCl6lOxwKsmMP1jsaeX9KNOQnpCPCPse1HuQKfLI4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U0sIFgoNfEO6j3PZBD0uvAovbT/QaHD9P2PV+gogu+7O3LZR+KX/fcnQ++LnnVKeX
	 6/g5BAIqaqHZw2fU2I6efp0RFaTTJTNaXdqWDW99IYqhuLxQBn39IeIaka1eKU8WlV
	 oHEQi5cLZGdzoZqbnDCxFynsNrOo2JBozW1I8EiiH8KS8PhUDptedr+jycpYZZkHS5
	 hRAZ8H0+SwloMzstGFnLsokAYMDP8FEemvXIOh99KoivZYT9lsRGm4PRQhdVmkUkph
	 2sjfv6K5bSS0vpfE+VfKWhL+fq+gfOk+a16tmf1NPUe/J8WrllWX/VUhPfjeYZm7Ui
	 mOj/Olvprrc1A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 700A017E367E;
	Thu,  5 Dec 2024 13:41:22 +0100 (CET)
Message-ID: <787b0b53-547f-42eb-921f-a2635b462df5@collabora.com>
Date: Thu, 5 Dec 2024 13:41:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: mt6359: Add #sound-dai-cells property
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org
References: <20241205-genio700-audio-output-v1-0-0e955c78c29e@collabora.com>
 <20241205-genio700-audio-output-v1-1-0e955c78c29e@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241205-genio700-audio-output-v1-1-0e955c78c29e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_044124_577435_F538C0FA 
X-CRM114-Status: UNSURE (   7.28  )
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

Il 05/12/24 13:13, Nícolas F. R. A. Prado ha scritto:
> MT6359 provides digital audio interfaces. Add a #sound-dai-cells
> property for it to allow pointing to it from dai-link nodes.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



