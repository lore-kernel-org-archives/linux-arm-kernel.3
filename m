Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722C61093190
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdXfxC/dMZXX17/zwTi6UCgqHDsi56vsTD2od6WtMDA=; b=U/Qul1FIczNZvtXX8RldGBxPLZ
	4Fr55SsExWY7BzBSO8UuuUZZuSdIqnW6nPNXerE20bycHdme1X4blrWs0c9y55LbNZE6T67JApiAh
	BQRm8DCYWT8gnbinGjWaTapyGWGAWdmdhxG3KB50wUJh0VSj7mzR4ERjwtlckLzTS/6aoaIEd7RUK
	+ZHl9J5BLzdP9Wo/1WODqKIlXNr27qfHC+xT2T9qaToQergYGjB+hYwZptXHa2ji9G8lpTgXTiFmS
	rQ1cLHIX3ZwGXcVOic+rDyW/gEpsX2zMt68O+gJ6gEme3KKLo2Xq6Cy+b1+VoMuYh3emQ0Iy4JGbv
	rQlUjZXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Vez-0000000CQ5g-0jxC;
	Fri, 20 Mar 2026 08:56:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Vew-0000000CQ49-2369;
	Fri, 20 Mar 2026 08:56:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773997003;
	bh=2xo0ML235ABXW/CQP4Ky6ewJNiBSyEYkOwlyRrA3YTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hsr/1rBoPuEuoE4lyU2jnsbbtkfrALPLDbjpwVSV8r6wMvf8jZZ8xiwp9gVFrnb3y
	 rA9V9yG2oBq2ysJ37mC6UQzfoVvkdKxmV9JMUh6+O8CBszWEdnBc51YF3s+K9iW0Gs
	 oU1E4nQ3CqYX7reSoKvYbqsxbP5MfVLLxpXf65f4XHenCtziqYFXqeRywIwf3DXikn
	 Df0iBBU/Q6un1+Co59Sa+2M7eWYrpqLLOcfJM8D0zVakrNupP8ctkuxUW6rxWgwmKX
	 SDiZVXximvEKryF5HHQvOnWeaaPpCKaiFPqHaWdvIlnZ8OFNfN+/TVl523/jyx3eEu
	 udOJ+IxXzmiiw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 70E1717E10F4;
	Fri, 20 Mar 2026 09:56:43 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com
Subject: [GIT,PULL,2/2] MediaTek ARM32 Device Tree updates for v7.1
Date: Fri, 20 Mar 2026 09:56:39 +0100
Message-ID: <20260320085641.15843-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320085641.15843-1-angelogioacchino.delregno@collabora.com>
References: <20260320085641.15843-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_015646_669883_737D60B9 
X-CRM114-Status: UNSURE (   7.67  )
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts32-for-v7.1

for you to fetch changes up to 5978ff33cc6f0988388a2830dc5cd2ea4e81f36a:

  ARM: dts: mediatek: mt7623: fix efuse fallback compatible (2026-02-24 10:34:47 +0100)

----------------------------------------------------------------
MediaTek ARM32 Device Tree Updates

This adds a single commit fixing a dtbs_check validation error
by changing the fallback compatible of the efuse node to the
correct one in MT7623.

----------------------------------------------------------------
Rafał Miłecki (1):
      ARM: dts: mediatek: mt7623: fix efuse fallback compatible

 arch/arm/boot/dts/mediatek/mt7623.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


