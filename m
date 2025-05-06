Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F2EC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 08:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CjrhW+xfT1bi3JyTNKGb801aMZtNGnqQXD1/Vo5czKg=; b=KuK2uZEYmBFwhLNfdG1Mq3w/x3
	69uECBia8BF7LChYSRmHI0LnS2yVfR74AXnrRyMgMe+djnS25g2P56uc24EDYPO+xlJ1f1wqhdCaC
	NkoEyK1nH1IZPRsHPoLO5Qa97FkC6xhktVXqMa8VvhhU5k6WCbk2QL3LaOw0X2HtuBcZKXmGXFm0D
	FaeSB0vWabJnAny16qy4tRyFJPqqEonE81K+x26CvKJc2IUxfQbvLJrpDPHKheuk6yuAmjF1MFEnv
	5Gc7rNrBvwO6SuW3SQdLCV+6nqtUejH+SndLotb0dXmSBWi38ZYulx0nEcBDy7FBXJrBif2I8FVjk
	Bfx5JQbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDjO-0000000BAzw-2nGk;
	Tue, 06 May 2025 08:32:50 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDdd-0000000B9FM-1ULu;
	Tue, 06 May 2025 08:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746520011;
	bh=ad97OQP3nn2YqrRFzD02fywEVWGG5tYkx4QSKxSCpwA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PSEM0vscIDZEYCJakmdi0kRAntYLb0wMyGU6c9qz0Juc7BWnKyWS47x+iU8c6Iohq
	 YNODsLJ15zrpgMeWLJOoCUzdgAuLr+q6xr3Cd3rVYej9uPvt7R14fVfitnc3XNH5YH
	 u9asjHeS1kTlgc1VNkOh0ik7QLr31oqHKgi3ZZ9GCZMTP/ogpjkZobGQjZSrZ7RZzE
	 24JCQMsyeV3fO6G7LEKxUC8MmK5UpZ+kTtdbrFtzA64OzEkuNPrVK0jY5qrFjh4C6G
	 65tYIaZBsZoxBK51I2o1rLf59muGHUeWdKxrJnyeOIjYst0loXUOvSA1mOFj9Ul/CD
	 cU4Bbklzo2WWw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B3CE117E0B46;
	Tue,  6 May 2025 10:26:50 +0200 (CEST)
Message-ID: <ce48bcb3-1881-41bb-aafe-bf90b78d47e4@collabora.com>
Date: Tue, 6 May 2025 10:26:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: mfd: syscon: Add
 mediatek,mt8365-infracfg-nao
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250502-mt8365-infracfg-nao-compatible-v1-0-e40394573f98@collabora.com>
 <20250502-mt8365-infracfg-nao-compatible-v1-1-e40394573f98@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250502-mt8365-infracfg-nao-compatible-v1-1-e40394573f98@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_012653_533607_E3D856E4 
X-CRM114-Status: UNSURE (   8.60  )
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

Il 02/05/25 18:43, Nícolas F. R. A. Prado ha scritto:
> The register space described by DT node of compatible
> mediatek,mt8365-infracfg-nao exposes a variety of unrelated registers,
> including registers for controlling bus protection on the MT8365 SoC,
> which is used by the power domain controller through a syscon.
> 
> Add this compatible to the syscon binding.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



