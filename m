Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCB0E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1bxgyK21XFgL5f0Rwvt75D6UhsijdtSx3kp5zwp6+M=; b=0y1hs9EY+DymQXg8APYuf2AGw3
	ZPg8YpeYuU+a3wniCgSO3HuZ5Nww66ldGqlr8YtJkrVilYs4DlOfq5E0qV+Z/k5PHL1ZIuq2ve2CA
	BH66sL8DqbbFsEpRVf/bQs3MKvE2yoKO52GttTOBqLwh+p7iE7fWq9v34i48j1UsLII6B2hycpvZP
	y3vZU+b6uPQa+luTNUBvpVNucWV2RHxCJbultRbUXWqPchiuKLKbZEmww+9gpErV3VzYEB2pkh0m9
	anJzDjtUv8GuUyRLb/MECgX6yQQVT0L9rySmsfRxdAuspj8uFDlrp3UTNEhMhcqTt83xTfTpiZrRS
	8SmwELxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBBS-0000000Fznp-2xYm;
	Thu, 05 Dec 2024 12:42:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBAQ-0000000FzWG-2S6G;
	Thu, 05 Dec 2024 12:41:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733402473;
	bh=2ew62nZba4YQZ2bynWVJtfMpzgzI3hADQYTd4AJiCkY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XZG1gj8c7/0NHtQsK36tD0gwlCtb2uA3HGs3kgMk8l4KavwYgeIqEPrk+2E4rhrog
	 52vs6Uz3buwXdQS7UCHr9CpHm7+ArO0dZYtlmDJFBJMwUvmQ6PALHaGVYPklRz9fHJ
	 sMFwkzkWb/a1t0t3It9+eT8tMmR8qHKMsNTT27Hm7jIrJWPZDtdBvhUoLLynPt5pby
	 K/JoQM5Eu0XfCYTJgbSkSDn03peN51GR01iEymdLV+S79q2ob4/febpL6I4yeqohrl
	 +jLJ1wi3KlEsKAPRsMvz50GD66xfc/2xU8RuCak0cS8aRf3lp+uabv9q2O5UksVUXU
	 ipukA/IFL4amg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6FC2017E367E;
	Thu,  5 Dec 2024 13:41:12 +0100 (CET)
Message-ID: <f6e4b7c7-f67c-4d78-8875-39e640ebfede@collabora.com>
Date: Thu, 5 Dec 2024 13:41:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] ASoC: dt-bindings: mediatek,mt8188-mt6359: Allow
 DL_SRC/UL_SRC dai-links
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org
References: <20241205-genio700-audio-output-v1-0-0e955c78c29e@collabora.com>
 <20241205-genio700-audio-output-v1-4-0e955c78c29e@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241205-genio700-audio-output-v1-4-0e955c78c29e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_044114_762072_7996A7AA 
X-CRM114-Status: UNSURE (   9.96  )
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
> Add DL_SRC_BE and UL_SRC_BE as possible link-names for dai-links. These
> DAI back-ends are currently hardcoded in the driver to the
> MT6359 codec, but they may still be overridden with dai-links in the
> Devicetree to assign them additional codecs or even to make the
> dependency to the MT6359 codec explicit and allow device links to probe
> the components in the right order and avoid unnecessary probe deferrals.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



