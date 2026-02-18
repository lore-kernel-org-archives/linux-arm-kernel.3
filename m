Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217BAE9A03E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 09:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DP8z2bUsJx4G62UXg2hfgSoqlrQfpk9papNyWSX33AU=; b=XwteI6fGmUt5DM
	iE+d+/n/OKPdMqPWgfaF0JW8qnTB59yQv1lh4RVjmjFPXzawuJLgGG1FwyI26A2rBkQfIreSLTkMm
	AeMufWpbs/xkCnGLz3ZM+R2djTclfe66d++iszKvETVGmHs3nnd/nHmwGuNZ7eyJVJ4M+VeY19pK6
	VpDoabDooqXB9PHNL8s0vx6WhtGsYA5gVSO55oDBu+YxJ2tBz7Bq3bHFDH0PYBXlN8W3AaslFPtY3
	C+jvXknvgPYbt1/TGpHQRp9T71k6287ZivIpAbdesf8FlAmy6AMZcl4mxdjbheoZR/ZQH6DbOJ6/I
	7bciuOKFZkmKrxiBubdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdmj-00000009XIQ-3MQx;
	Wed, 18 Feb 2026 09:23:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdmf-00000009XGX-45Qd;
	Wed, 18 Feb 2026 09:23:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771406625;
	bh=/0hkWzIe4d8EKtH2G9BKPTi25LCzBo6R8Hd9DQCMMu0=;
	h=From:Subject:Date:To:Cc:From;
	b=OtR4LkBWQP1eFthukqCvn48r59GyipT2E8fCFZQKjKzawoJ+tvAc+ffk6fWaibeM3
	 vAbwFO2Gs0+omd/xKoGSxp+xQzcZrpP5mW5W6w9UopJx/VSzXNrqWZFa2Dy62nSivu
	 aXrCy6E2E9y834bmoP9yVRK6GFj5IkhDtMfwzukr9mpX6eg8Rqm/3DM4HLjW7RgT9h
	 DRLtJgHQ4unjj/2WeKum2LkZ5etPpsokVh6cviQ/sG6x+VGacThto9dZ+oWe4FXFtA
	 R+CZL8ml39Btka5xNQey9iCob3xBkC6VPmstMCv0FOX0iowbVfTo/CsU8OBLxkyb6z
	 V07tZFJis7bSw==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5205117E04DC;
	Wed, 18 Feb 2026 10:23:45 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH 0/3] Add mmc aliases for Mediatek Genio boards
Date: Wed, 18 Feb 2026 10:23:01 +0100
Message-Id: <20260218-mtk-genio-mmc-aliases-v1-0-e218e9f771c5@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQrCMBBFrxJm7UAbsDa9inSRxGkdNIlmohRK7
 95gXb4P7/0VhDKTwKBWyPRl4RQrtCcF/m7jTMi3yqAb3TW67TGUB84UOWEIHu2TrZAgeWPPpnf
 GmQmq+8o08fLrXseDM70/NV+OEVz10KcQuAwq0lLwf3GBcdt2+kCgDpgAAAA=
X-Change-ID: 20260218-mtk-genio-mmc-aliases-ec9a598b9b9f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771406625; l=974;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=/0hkWzIe4d8EKtH2G9BKPTi25LCzBo6R8Hd9DQCMMu0=;
 b=0xtamJWjRnVkzg3XXOQQ8Gj6AYz91OVmmy/C3+F8bFJ52kEnsonP0yTwupEnEKW9NoO0qzjC8
 6cxOuUUaWlqAgi6vZFFAeccEcVEmaHp5wqJirpRmc3DU1mCvNX6Pq2B
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_012350_182438_9DEB7BFF 
X-CRM114-Status: UNSURE (   8.20  )
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

This series adds mmc for the Mediatek Genio boards mmc aliases in the
board devicetrees that do not have them, so that mmc host controllers
get enumerated in a consistent order.

This series is based on linux-next next-20260217 tag.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Louis-Alexis Eyraud (3):
      arm64: dts: mediatek: mt8395-genio-common: add mmc aliases
      arm64: dts: mediatek: mt8395-radxa-nio-12l: add mmc aliases
      arm64: dts: mediatek: mt8365-evk: add mmc aliases

 arch/arm64/boot/dts/mediatek/mt8365-evk.dts           | 4 +++-
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi | 4 +++-
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)
---
base-commit: 5295425d4409ca3afec37f78306e09b2e9e92e7a
change-id: 20260218-mtk-genio-mmc-aliases-ec9a598b9b9f

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


