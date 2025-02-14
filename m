Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F59C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 02:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Qo7TG+1M8z3JC0pkM4EGUDa0n9MzjrESImS/Z+p1ec=; b=uJ8FOspWtT7osfPsbtenXny1n3
	RJZkBsKdflG8WFlD0HEk+0QC5XewxZb8qiDX3EzimAeGOiYRixZwvFqsyVRfTtQU61RPnRqVJFKqM
	QgsKxfPLz9kWJ+QEJH6ynh/2ovn9nRXenwITx4Ti7uA2EeyRx2sW6OBClX3KGNQo5xanicYdHmZHi
	1kbRtu3WrfbMI6R4pl2GxnCwDkglbEsK7N/LjU8OVyHLbYcJ9pj5aGX8VZrzkiWJl1mcJYS+mzEuI
	epVkntYLcWidbJg86u6M+pBSwrOP6XATUQujkE5SEDqiuOfVdqtKTNSW0UNYGH4YHKD5++pVTRL8d
	G67Mlnqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiljn-0000000DOjD-38RK;
	Fri, 14 Feb 2025 02:47:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tilD6-0000000DJWn-2SST;
	Fri, 14 Feb 2025 02:13:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1FF0D5C0654;
	Fri, 14 Feb 2025 02:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41CF1C4CED1;
	Fri, 14 Feb 2025 02:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739499223;
	bh=ODJBeAyu7yG9wfg1tMx7ifensJoaGn0MRyzsb8NOKTs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=lrABkyUPohJ7Xv2Hzb2tmHYKBu0Z8Q55WtJqrcMQ6X8E+W8cqVBKIkhVwDdzY5lzX
	 IGoZ1aXzL5/65FQExBtHXqqLq5qyoD2BBozd1pJoCRo92vZJROq078UHdNH/n/dGvo
	 mSOFnJjyy3kaIXQ1viaZ45jozeN3JRPtLHVlzFYLuDSaBGq3axnYFc0bDi4HKp6z7n
	 wUEiHNxPCUUgLBhZHHx3EZWAZIicpHvwE0SKm+lyj+cEQMtLwwtUfIhBNrqJAfzcfb
	 OVcTvsK37RuH/IMTZOTivAAFYTeeizQ0VWuw4MGECnqQcwkjlb3D0PIhSV0glPtVL5
	 EYggi3uIEqDbA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6EDC021A0;
	Fri, 14 Feb 2025 02:13:43 +0000 (UTC)
From: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Subject: [PATCH v2 0/5] Add support for S4 audio
Date: Fri, 14 Feb 2025 10:13:39 +0800
Message-Id: <20250214-audio_drvier-v2-0-37881fa37c9e@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANOmrmcC/1XM0QrCIBTG8VcZ5zrjqBtaV71HjDB124E2Q0uK4
 btngy66/H/w/VZIPpJPcGxWiD5TorDUELsG7GSW0TNytUGg6JBzZObpKFxczOQjQ2U6qbltD+0
 V6uUe/UCvjTv3tSdKjxDfm575d/1B8h/KnCHTlrdK4SC1wZOZb2Eku7dhhr6U8gGrkwkdqgAAA
 A==
X-Change-ID: 20250110-audio_drvier-07a5381c494b
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com, 
 jiebing chen <jiebing.chen@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739499221; l=1437;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=ODJBeAyu7yG9wfg1tMx7ifensJoaGn0MRyzsb8NOKTs=;
 b=IrYG6+tVk3zdh0UgKNgdgxRY+xWdt28tefwfjiNO5BANQ+TJ21Qx+JAznmInNJ7kI3fsjNZfz
 IWlwUx5kJtmA4NHvM8XL6TIpzmiiJ1CRbtjSwHivS4etqDvXEIsuYMa
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: jiebing chen <jiebing.chen@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_181344_747433_6969EC4B 
X-CRM114-Status: UNSURE (   9.11  )
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
Reply-To: jiebing.chen@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add s4 audio base driver. 

Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
---
Changes in v2:
- remove tdm pad control and change tocodec base on g12a
- change hifipll rate to support 24bit
- add s4 audio clock
- Link to v1: https://lore.kernel.org/r/20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com

---
jiebing chen (5):
      dt-bindings: clock: axg-audio: Add mclk and sclk pad for s4
      dt-bindings: Asoc: axg-audio: Add s4 audio tocodec
      ASoC: meson: s4:support the audio clk
      ASoC: meson: s4:support audio tocodec
      arm64: dts: amlogic: Add Amlogic S4 Audio

 .../bindings/clock/amlogic,axg-audio-clkc.yaml     |  18 +
 .../bindings/sound/amlogic,g12a-toacodec.yaml      |   1 +
 .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 219 +++++++++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 370 ++++++++++++++++++-
 drivers/clk/meson/axg-audio.c                      | 410 ++++++++++++++++++++-
 drivers/clk/meson/axg-audio.h                      |   4 +
 include/dt-bindings/clock/axg-audio-clkc.h         |  11 +
 sound/soc/meson/axg-card.c                         |   3 +-
 sound/soc/meson/g12a-toacodec.c                    |  64 ++++
 9 files changed, 1095 insertions(+), 5 deletions(-)
---
base-commit: 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
change-id: 20250110-audio_drvier-07a5381c494b

Best regards,
-- 
jiebing chen <jiebing.chen@amlogic.com>



