Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E21C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q736DHMB6Vt/C1yDeSwvodhbjC94EuBUF51gxitZ+iM=; b=dNpdEw0fqKkFgS1uWjv3NfVXi+
	MT7KTO/tlwcUMeBd1744Vuz/VggqVz7+dtbkgImpmGRX+lTkj5d5bDmYy8vIZHV9gmTTihLDHehO8
	1ZXYLmQaovtByIXRKX4yVoWKQo0bfLn7GSHqstVBID3hJ6v0m8O+jixUP2a7VIsk8g1qgoF0SknoN
	Hyy/R+SLPIgx14DnEVhUZMu6dvzs3bnbl4rOA8LMzyMHGu/Ba3boGOwL4sdfvRhp+RDX3JrqDEIT9
	5JGTxw/gt0zZMkmhn5hTY4g+r0OytAf+lEi+sRVmEavdot9DLpu2kcK2PazvdycQe3lj6i3VwsDqq
	a4DwXKYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy08-00000000KJO-38PO;
	Tue, 25 Feb 2025 16:41:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmw8A-0000000HYxv-1Es8;
	Tue, 25 Feb 2025 14:41:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740494512;
	bh=OsoerhI9WsLOOMY2Rdt3PJVqOYEEm1V/Bo7XmSxoDl0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SZSM4FTn4mzwb8jnHbzHxD27ZuvtKTfJeoWas36wv0trYGAcQQry6OLoR3ukrKvTz
	 C35YVDkqeqzBQeTKdVD6uVQgbLBx0nF8klvV5quXrPp+07K/bUAeh/IMzZNBovkgIy
	 0zBYXGivfbiPPAQH3Hm199kjEhIgXtYbzI9hyk9crZQ5KgnqtKgueXQm+5ipi+uSad
	 Snbjv1nYHLoExx0pJ5hSxShigQZrNG1Ob8zmAK1bibWfKUX4ArK8meWksdjmZdvfk3
	 akgSlERNrscerfXhy6KqRntqwCc93FX1NG3i7N/ivcuqgX2Mdc/aEymKpjMF6wKrYg
	 aiMd9Zq1V0gQA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E99D717E0E91;
	Tue, 25 Feb 2025 15:41:51 +0100 (CET)
Message-ID: <c25f36c1-04ab-4681-89c9-6dea7cd26ea4@collabora.com>
Date: Tue, 25 Feb 2025 15:41:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add
 DMIC backend to dai-link
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20250225-genio700-dmic-v2-0-3076f5b50ef7@collabora.com>
 <20250225-genio700-dmic-v2-7-3076f5b50ef7@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250225-genio700-dmic-v2-7-3076f5b50ef7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_064154_477078_94CEBEB5 
X-CRM114-Status: UNSURE (   6.66  )
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

Il 25/02/25 15:33, Nícolas F. R. A. Prado ha scritto:
> MT8188 platforms also have DMIC DAIs, which were previously undescribed.
> Add DMIC_BE as a possible backend for the dai-link property.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



