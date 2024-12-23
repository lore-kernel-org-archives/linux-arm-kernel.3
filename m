Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB61E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 11:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PT6dJBizEMfq+XCi6YBum5DiYg08nYTVWU7t/Zzl77I=; b=MQZVV5PdmEwM4t25LkVKmtkWyQ
	Fjydh7Koy8VzUUXBT6spxFDAkAZRNUtc/S2JMLnljzmnU52tEpWuXu39Txh1GeExBk6xJsGcWqQUR
	eBxq4VuIjOrVdcqlXvWnWstA8RK8DeAcTQV7hxkb032CgOzd35EG0+tWmEMnWKyIy2ThCLYNDIl+f
	YjBUdM47HDwiyS8fOjL9jqzFVfovOaS5nPPWmgytFDpKOwS/C8BprqoLo8zhRNQ9lG3MPYICoJ53a
	+uXh6j5tsGOeB665xpbWIkGr99nQzNkPpIRj9DQhN1LqaTwIziXpPtDoE5MeeXq5qzBl8xqssCFly
	FzXTJw8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgTa-00000009sk3-2bL7;
	Mon, 23 Dec 2024 11:19:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgJW-00000009rCx-3Cpa;
	Mon, 23 Dec 2024 11:09:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734952167;
	bh=VQFoZR+e3vnBg0kbnJ082a9e0agtvlM4plm2/HgSJzg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Mf7lwmjDR7SEy7WQ1s2cguwl9rCydkkrQx4xvibGfI5taCWW4R00QaFsAC9GlvG8E
	 e66Jwq+7vGZZiLE0FthsrMoUtQDe1FT9YhmSjKl9dgIEFozsO2awJwRoLQ06qDvO2s
	 GslrvmZ4L+DGne7tcJL1RpDBXAeLWFEoq8TZQDSNlyJEdCJVsXom87+QBFsGp96jHJ
	 NooG+HcXGTh3E8gRM1STK6ShKis66YtDzwn8BlyOyDkcmOw/I1uQq+GRVaCsjeB9ju
	 RNTxxRDPv+uGxtWDUe2K5kVnHaqyMFq/uh0OftDDK+5R47TAEj5kqpRMvffZj+kLmA
	 1v4pzVlz/2ETA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7572E17E362F;
	Mon, 23 Dec 2024 12:09:27 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20241220-mt8365-eth-config-v1-1-7f3ffae35fd6@collabora.com>
References: <20241220-mt8365-eth-config-v1-1-7f3ffae35fd6@collabora.com>
Subject: Re: [PATCH] arm64: defconfig: Enable MediaTek STAR Ethernet MAC
Message-Id: <173495216738.35164.13135364874300805144.b4-ty@collabora.com>
Date: Mon, 23 Dec 2024 12:09:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_030930_998950_BDB5C6FF 
X-CRM114-Status: UNSURE (   6.17  )
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

On Fri, 20 Dec 2024 13:50:44 -0300, Nícolas F. R. A. Prado wrote:
> Enable CONFIG_NET_VENDOR_MEDIATEK and CONFIG_NET_MEDIATEK_STAR_EMAC in
> the defconfig to allow usage of the Ethernet controller on the MT8365
> SoC.
> 
> 

Applied to v6.13-next/defconfig, thanks!

[1/1] arm64: defconfig: Enable MediaTek STAR Ethernet MAC
      commit: 6140ae05d79ce063c976b2cc5660c76e98fbf9c6

Cheers,
Angelo



