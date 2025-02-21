Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBC6C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 08:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BSqk9+p/yr3hU+1CBqooOpH6Sum3xmj6u+wUcM2l0DY=; b=ijymZhJrkd4RGm
	WOVftFxBBhfhUQVu8uQxIJNGGhoO6hQndVSZvNYpadkXmNOyYGf2yAnSMffcnA9eo7qqbdP1K81fK
	BQdVvBDcAZfDmoZitjae7ZDafYnJaYmAHkajtCur8FF6bhgJr4exDJkrnalTf+kcQlgzJejzNpEdL
	c7exdcIO0izzG4NtHNLUMEJKB4GcJKdTNFee4vDEEy8tzwLqdOyXPCMlFcLqJybbjqrXAQPul7MK4
	I8HPYxD6f8gOSYL9YCoiRIaDftbLnQZmWyq0s8wn0AzHfvSMGxy78qIekrDF3pNM1uVc6j76nUbJs
	Fk0400DoHRZp8QbHXOoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlO0G-00000004cQe-481H;
	Fri, 21 Feb 2025 08:03:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlNyo-00000004cFt-1N62;
	Fri, 21 Feb 2025 08:01:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 99DE05C5670;
	Fri, 21 Feb 2025 08:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47CEC4CED6;
	Fri, 21 Feb 2025 08:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740124909;
	bh=QX5XQx0HOiQbdiRP32A/ZZWTqbi+RItjZEFRzXGnYts=;
	h=From:Subject:Date:To:Cc:From;
	b=mSqGH+Hw641YNJJx0UsAbMiCvBfNczzOVPM2bf7elvkTau499/UietT1FRhHYu/gM
	 qfD4vN90spN2SKqcAelkxCvnUoKb30dI0G6ZKudnzSadeve1kcvaqP0ylDx3UTQz1L
	 yBjaiGQB9bDnek9G5EV6cff0r0jJTJwCB3WGO3eTczzZW7pHmXLYJR/cYEGm5XAdkq
	 8acK4aGw0ZSof8XUx6gGD2hewKfDKNz+cR+jI8r60vSkEkjoETCnFHM7s9601Egm22
	 gGrF9a+t22/s/mwmga6BIX4KlZMOkJmMDwjA7qtWip3wWDE4rLfQ0kaORioim9yKQe
	 Q4wrlm1a2+99w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH v3 0/2] Add more nodes to EN7581 SoC evaluation board
Date: Fri, 21 Feb 2025 09:01:14 +0100
Message-Id: <20250221-en7581-dts-spi-pinctrl-v3-0-4719e2d01555@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMoyuGcC/4XNQQ6CMBCF4auQrh3TqRTRlfcwLmo7wERSSEsaD
 eHuFla6MC7/l8w3s4gUmKI4F7MIlDjy4HMcdoWwnfEtAbvcQkmlpZII5I+6RnBThDgyjOztFHo
 osZL3WmlrTk7k4zFQw88Nvt5ydxynIby2PwnX9S+ZEBCMMWUmG1ua6vKg4KnfD6EVq5nUp6N/O
 mp1qELXSKylMl/OsixvzeLVbQUBAAA=
X-Change-ID: 20250201-en7581-dts-spi-pinctrl-4160b825ca9d
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_000150_435997_73D4865A 
X-CRM114-Status: UNSURE (   8.92  )
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

Add the following nodes to EN7581 SoC and EN7581 evaluation board:
- rng-controller
- pinctrl
- i2c-controllers

Fix a compilation warning for clock-controller

---
Changes in v3:
- Rebase on top of v6.14-next/dts64 branch
- Remove clock-controller and spi-controller since already merged
- Add patch 2/2 to fix a warning in clock-controller node
- Link to v2: https://lore.kernel.org/r/20250205-en7581-dts-spi-pinctrl-v2-1-ae61df01802a@kernel.org

Changes in v2:
- Fix dtschema warnings
- Fix i2c nodes generic name
- Fix commit log
- Link to v1: https://lore.kernel.org/r/20250201-en7581-dts-spi-pinctrl-v1-1-aaa4a9dfc4a6@kernel.org

---
Lorenzo Bianconi (2):
      arm64: dts: airoha: en7581: Add more nodes to EN7581 SoC evaluation board
      arm64: dts: airoha: en7581: Fix clock-controller address

 arch/arm64/boot/dts/airoha/en7581-evb.dts |  4 ++
 arch/arm64/boot/dts/airoha/en7581.dtsi    | 62 ++++++++++++++++++++++++++++++-
 2 files changed, 65 insertions(+), 1 deletion(-)
---
base-commit: fd042310df40ad759882361d65afaeaa7bf6d7e1
change-id: 20250201-en7581-dts-spi-pinctrl-4160b825ca9d

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


