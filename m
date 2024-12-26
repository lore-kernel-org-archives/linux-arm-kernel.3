Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10582E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 18:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mb676prD6vZfXlPCYO8bwgu4yZ+DojLMITMChJhintE=; b=Za3Vvk7wRcypLOxwOzJScC5ITp
	MkN/xJtaQOBrYPIFPwN2XixTQN1LsZwj8zEQjyg0/w9cP94pqBsbZpC9B7bye4NIEg3MXArSNtxDO
	LvwVZgnc5HWOHizGJfUeARyh+RuTvG21M+OSxdWXKOtZvQtvvGoA8CeFCx93tJXu0FoyYLqV4U3ew
	bwst4nxaKB8qF5wAr0FS+X7uct0cNiDA0iD+Kfon+QmZTUpC2eTJO3LVNmNABpqV7shoIYtiWSl1M
	Bice4xYd9FhR5tQoIaE2Wz6TpS9Y2U52LAkt5sS5VY/JzU31l6BxwH/hNSRnJXYnlsYDWxyxkctC0
	0ahH0PUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQsbI-0000000GD1e-27mB;
	Thu, 26 Dec 2024 18:28:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQsa6-0000000GCm9-0nq6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 18:27:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6BBDEA4032C;
	Thu, 26 Dec 2024 18:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B741C4CED1;
	Thu, 26 Dec 2024 18:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237653;
	bh=wiHAYMlaZnvLr1hgim1YMb7gxYlq1ThyIG0imbA+IAE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gvCcLmj31Wm5ySBZzq6kbWHqiVV577klPlktZu6UQ5SW+DOxuLmeJcjHfNbxRr1OH
	 g/kPrkev66JBDDYKLU/pQDRCDLIdgqBrhdnEIQUPX91SeCfuoP0tVMF/yw7jzElrxa
	 QYDeQFB0MkycCEtDdUQPtYLiHv3Shx6fIwNd6A/4w+yqYPWtifC+i1eWxxpjVt+rqG
	 5LuRF0b6qxvS4mqFBA/qOR0a+qIJfWsgQVx/7UEUiEEeQuti7XdLeq634k/OprarlZ
	 BiZLmTHFqMKGoIgQoJ6bxIxB1zcQKu8QnGTry1bvzIWbbJ6zd887aa1VaI3h4iPqF4
	 BAnvLNtJKN9xw==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@denx.de>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8996-xiaomi-gemini: Fix LP5562 LED1 reg property
Date: Thu, 26 Dec 2024 12:26:50 -0600
Message-ID: <173523761382.1412574.17501027929471451345.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241006022012.366601-1-marex@denx.de>
References: <20241006022012.366601-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_102734_299584_214D3F44 
X-CRM114-Status: UNSURE (   7.07  )
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


On Sun, 06 Oct 2024 04:19:48 +0200, Marek Vasut wrote:
> The LP5562 led@1 reg property should likely be set to 1 to match
> the unit. Fix it.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8996-xiaomi-gemini: Fix LP5562 LED1 reg property
      commit: 02e784c5023232c48c6ec79b52ac8929d4e4db34

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

