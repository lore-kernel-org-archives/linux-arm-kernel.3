Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D371EFB7F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 09:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WIubZXzK5F9ouxqgWF0FClCgkxaDOHC3De7wfbFAbt8=; b=uYmbAfexVFfisR2RJDTgduROyL
	7l85bwgrcpAlSNscSc9F+T8JULKIm+/NeO2RkqnAN+bfEQpMNaF8i53fWK2vSiE644V/Lp7C3zMIM
	w7JZ71Dymh6dAziO4ttpFnah8gDK1N7bAouRo3y7/7dY2WL84neFObSSSxTZItnJNN7xyp+95VlGT
	2MQjMF9cEuzet4cSre2tdn7hxHIgr6h9JOE45leg8ERhbTQ0CD5xgcBBpKHFALXN7Qy/2yveSzPO2
	eiF/IViNoZJRh+FpTF/7Xo822Ks0fTKxvbyb4FjcPrsAgr8Vjfo/3/Pn8Cs2Ke/fyFf6T9N5MINBU
	ZCHGZarw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuonu-00000001lQe-0EzZ;
	Tue, 24 Feb 2026 09:34:06 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuonr-00000001lOm-2ByF;
	Tue, 24 Feb 2026 09:34:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771925640;
	bh=rwBqGNstFp5t0Kn3FUGpCZ0lCjGXdvzm7ehoHB93r2k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FpyIrnpC5DC/hFyJdF1Ehd500yaAu7RL5MiJI0ozk/SUT0tYrmWh/O1ttk27iZ8B2
	 xi2e2XfRCeeDTcBfXE0nxIuFbeFpqYxr7oEoG3J8MCepdTl7h+Pc8OGbRVxt5nkJNz
	 qI+ZR3ZEoJ0gjkzLH+M4DLjrAgDByWjsOt4Ye7d4u7ypFlS6mOhdglPfPnCypUTpQG
	 ZXI7yYqylvDXEBX5m2BBOVHqv0q92vcJdRf/y9Maf0WGbxe3I6464HuGUErVivslbL
	 HgkVEbk+rLhZmyAGAlBMw8xv6nG+YSRQAcxlkDK09lj82kGFHIeYzuw8Ul/lrEz01K
	 rCdkTbazxDajA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5336917E0BA2;
	Tue, 24 Feb 2026 10:34:00 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250502-mt8365-infracfg-nao-compatible-v1-0-e40394573f98@collabora.com>
References: <20250502-mt8365-infracfg-nao-compatible-v1-0-e40394573f98@collabora.com>
Subject: Re: (subset) [PATCH 0/2] Correct MT8365's infracfg-nao DT node
 description as a pure syscon
Message-Id: <177192564029.11826.9934120449874433312.b4-ty@collabora.com>
Date: Tue, 24 Feb 2026 10:34:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_013403_704799_D18BDDCF 
X-CRM114-Status: UNSURE (   6.46  )
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

On Fri, 02 May 2025 12:43:20 -0400, Nícolas F. R. A. Prado wrote:
> Introduce a new compatible to the binding and use it in the infracfg-nao
> node in the mt8365.dtsi to correctly describe the node and prevent probe
> errors.
> 
> 

Applied to v7.0-next/dts64, thanks!

[2/2] arm64: dts: mediatek: mt8365: Describe infracfg-nao as a pure syscon
      commit: 0651c24658360706c30588cec0a12c05edb03e9a

Cheers,
Angelo



