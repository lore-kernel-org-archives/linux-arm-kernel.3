Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689F1D4979C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 04:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rhEFsIyeO9/bohMMUApbf99ns68IWWVqqif2pJjO7rY=; b=rl8MXkFHJVkmC1
	swLdOGJk4E7AEpcLUHoClLiY9dF7g3Lww0Cf169cYEmxQFnAAni8xn2lGHd1zXB3013TWth/yG/gV
	vhohWT3z4Mlk/MbAOjy10dwd+/oThjcu9A1dq+TU35lR5d5VQ7Jm6t8kY+hd80aK6hFLbXHVdm19n
	BNuoqauPgEGSaya6tpIrWCh8n7b2/IWce3+2cxfi2t+mc1PhHzjieK1HCBVGTmbCkOMhJBGONqpVP
	ioM7YBxjBsWoWS6PqWr6rCBseM3/Y+KiYYxzCC2PuNp7m/F0ON1V9CA8prhoSI0knLjDmMqBWwk3c
	b/MOQHxXpchjg5n+n2tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHyJk-000000054IF-0UDh;
	Mon, 02 Dec 2024 04:45:52 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHyHn-00000005456-0rdd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 04:43:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1733114627;
	bh=fUm+qqsoUhyhoDF7UbcYwPSaynQbVoMDU8DxEViQStw=;
	h=From:Subject:Date:To:Cc:From;
	b=fN2mxUAhLt1SoQCU84xHuJ01DSgbo0GssCksMuhBrUanU5LsrmyQlRU76FTmK0yyl
	 kuSPOaDOkvXCjfKgb9GbsG4ufhH3IrfVz3raBH8Ku8ucvXLSV/OjCETvWNiT0XntoF
	 Tb/NfaV/9xClQYg3F2qA4Pokz5WzxvA2VCVglLR0bVuSH74hj8GC++y8SzarYGTXC5
	 L9hUfDRH6TGp5Tp4p/PtYOMZ3Fw6TPLh/Ekj88H8REyAiZ0hpqb2frIIGuQjcadcsy
	 JYc4TlWAPoxYHZKpcMFpDKAqTueGL9iM+F6zY/OwfnG5P7Kcl4K+q9EYiOADTaTnWr
	 G2ayd31BQqZkA==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
Subject: [PATCH 0/2] sunxi: Add A100 syscon nodes
Date: Mon, 02 Dec 2024 00:43:25 -0400
Message-Id: <20241202-a100-syscon-v1-0-86c6524f24d7@epochal.quest>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO46TWcC/x3MMQqAMAxA0atIZgtNLBW8ijhUjZqllQZEKd7d4
 viG/wsoZ2GFoSmQ+RKVFCuwbWA5QtzZyFoNZMkhkjcBrTX66JKi6Tv0MwdP7AhqcWbe5P5v4/S
 +H73Q4LVdAAAA
X-Change-ID: 20241126-a100-syscon-7316bea62e42
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Cody Eksal <masterr3c0rd@epochal.quest>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_204351_309691_F370B3E3 
X-CRM114-Status: GOOD (  11.39  )
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

Hello again! Happy December!

Here are some very small patches to add syscon nodes to the A100's
device tree. These had not been added yet, as they hadn't been needed up
to this point. However, Parthiban and I have been working on patch
series in parallel that require either the syscon or the SRAM nodes it
is responsible for; specifically my patches add support for the A100's
ethernet controller, while Parthiban has been working hard on bringing
up the Display Engine.

Thanks as always!
- Cody

Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
---
Cody Eksal (2):
      dt-bindings: sram: sunxi-sram: Add A100 compatible
      arm64: dts: allwinner: a100: Add syscon nodes

 .../sram/allwinner,sun4i-a10-system-control.yaml   |  4 ++-
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi     | 31 ++++++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)
---
base-commit: e70140ba0d2b1a30467d4af6bcfe761327b9ec95
change-id: 20241126-a100-syscon-7316bea62e42

Best regards,
-- 
Cody Eksal <masterr3c0rd@epochal.quest>


