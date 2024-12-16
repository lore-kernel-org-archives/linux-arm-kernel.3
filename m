Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44DFE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 19:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17NIerRqHvHR1JGri6TIDEGFBrdt1MPQZH3mzLzlHmI=; b=S2s1XbozAJW+0V3oXVib3bDMbr
	BJcnq+xB9y/e1Qt2YCG+vrv1NvHEgqDloJPWMgKM5BCfTheevl3lsWChSlGarY4TYk7/CF9+/7SFr
	CAot2OgQCfd9EphTfy41z3BYpLyT+YjhiMhZ0FYqUqUdITcq8ayU37jnWMf+eri8+kz5BV0j4XiS+
	UYT13Wn9C0rVTI6FzuCF0BCY8Fgq2VzlmxRyKN8qFGJl9I+pp7fzdZBav2Q8DAihbRm7aOMWMEPLv
	MJ/cl2Sv4LXDjAYWAsYTXw30Bq+HVldP4zfmnQ2FjITQuTGdXuhir3NdPz0bbiE9I4a0Y64N4nUAP
	Kx3HiGUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNHBb-0000000BB6M-0C3z;
	Mon, 16 Dec 2024 19:55:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNH7z-0000000BARm-1fwj;
	Mon, 16 Dec 2024 19:51:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734378698;
	bh=W0KQp3kLhOJuY8Z4Rr+UL5TieURM0dQvz/b45ukAcyE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f4w6lpbCnstfXz53vnc5ntyf0J5+RtJ39qxOCaRzhpVcQewQy9qOGQF7bEBX9lA3V
	 e5Bla/3q4HDuPSx5Mx2OWdHoUA79s7Uhlbea3gQ0bcKcy3LNb/jF1reXeFSu3fa4aY
	 KQe4jmGdy5qfV4X+0URa382VURJ76Fr5LFSCRltvDzseFqyde4DZXIq5+B1S4nYnph
	 FndvyhkcMuL/CUWV/Z/UjltFtVjH69rn2oSfqQC503uYD0ESAymJxwIocFKgjUM5Qe
	 4uj+MNtjJ6yJr2up92i6X/1j36RKjSyiMY2+PFOYmxAUmxLuzsh8/IIDYlwNmYUR/9
	 RgUBHLfs27xNg==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1000])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 64AC317E3804;
	Mon, 16 Dec 2024 20:51:34 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 16 Dec 2024 16:51:26 -0300
Subject: [PATCH 2/2] arm64: defconfig: Enable MediaTek DWMAC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241216-genio700-configs-eth-sound-v1-2-04a719035d6e@collabora.com>
References: <20241216-genio700-configs-eth-sound-v1-0-04a719035d6e@collabora.com>
In-Reply-To: <20241216-genio700-configs-eth-sound-v1-0-04a719035d6e@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_115139_579052_5CC190D2 
X-CRM114-Status: UNSURE (   7.34  )
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

Enable the config for the DWMAC MediaTek glue layer to allow usage of
the Ethernet controller present on MT8195 and MT8188 SoCs.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 95af0377ddc673be7003d7517e3990012a817cbe..188a0f3faedc62d92d0d59a397570e4c88c3f803 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -375,6 +375,7 @@ CONFIG_SMSC911X=y
 CONFIG_SNI_AVE=y
 CONFIG_SNI_NETSEC=y
 CONFIG_STMMAC_ETH=m
+CONFIG_DWMAC_MEDIATEK=m
 CONFIG_DWMAC_TEGRA=m
 CONFIG_TI_K3_AM65_CPSW_NUSS=y
 CONFIG_TI_ICSSG_PRUETH=m

-- 
2.47.1


