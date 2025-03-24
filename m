Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F91AC36008
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 17:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0f5YNGtGXZGXrwigSl+PnIhY0xFh0vOHEscnqigtM4=; b=TjTKo+yxhWCvs+DeW87e3KEXYA
	SEHrmDAleMDovswLnz06qjnz8FxeixbhG8FeWuwfnz6/w4V5wWms2m0YLiWZ89Kdale5Miqrl0ucW
	QAXaJriAyfoSQzI5Qd+lcppNGBRQZjTK7ednbUOoDQtLcjwXuGlCvmt9SJzL4yRZ1cS5yLHy+99JU
	DsdibzZOBsfnz6ubpliUReGkm/W7ZKJz+1lBW+UWU1fb+VUbckcB8xix/I+9W5zYJw+p1cLdVX+FW
	/kFpMRa30nNnP37h3OznTdsb8ab1EN8ubXaj/pioHbaM4Sx3Xu2hMp5m0WXTTTJYDkdpWB+c9glYd
	Iw4/l+dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twlMQ-00000003lRU-1eRo;
	Mon, 24 Mar 2025 17:13:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twlDt-00000003k2N-0DU7;
	Mon, 24 Mar 2025 17:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742835863;
	bh=NcPJopNj4QkFL7RS7LVqktzn6/GCRQbuGX0pRkX8TIA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KvIyrkXjD1AqH24UsP+0/qiibVyXFwpBc+LY1/w6GIg0XBoP1YoQtWTien4bT499O
	 oU9EStS6kAO+0luuoMJokjzOsINpTgLCY5Ctk1ykYpCfJJDgy67juhAr9ltylCjqGV
	 y++JZZabIKxqj70NR2o20BXmnh9pCa/OL14KhRPYIL/KCsgk9U4xkeHxAkCF59Lw/E
	 5kfMNXQzM+2AZ4ZV2/8Bb3cP3l1eUcuAoDdR6oOVhiaagfOY2GH96Ks7kBqzh5/Btv
	 Mb1wpOipEpUObxEkFhl7vHfaGiDVj6ndV5Pdne2gUAa8rKDUNJ2Giwc4L4gRq+jCEK
	 z+0UrEhEp8SLQ==
Received: from jupiter.universe (dyndsl-091-248-188-184.ewe-ip-backbone.de [91.248.188.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 18B2617E0A80;
	Mon, 24 Mar 2025 18:04:23 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D647F480036; Mon, 24 Mar 2025 18:04:22 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 24 Mar 2025 18:04:22 +0100
Subject: [PATCH 1/5] arm64: dts: rockchip: move rock 5b to include file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-rock5bp-for-upstream-v1-1-6217edf15b19@kernel.org>
References: <20250324-rock5bp-for-upstream-v1-0-6217edf15b19@kernel.org>
In-Reply-To: <20250324-rock5bp-for-upstream-v1-0-6217edf15b19@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=992; i=sre@kernel.org;
 h=from:subject:message-id; bh=NcPJopNj4QkFL7RS7LVqktzn6/GCRQbuGX0pRkX8TIA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGfhkJbrMXGmfQ2nwIyb2HseFcb3BZuRbFxhj
 lv3TZvWB0s134kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJn4ZCWAAoJENju1/PI
 O/qaLzkP/AiLeIlniF7EV2ceuFniQbWROAgLHK5bQo4k/CkqYVE9NvW+ia54EEqwOENOB/Ro+VN
 +mFX8AvAtVOnqsn40lf9Xg+9dlJdZFvJaOCZLSNdscRBHujP/eu1COtwusr0A9Dwq4PD0cX4fd7
 2XCvFiRtkLBwGFmfgaRqEgvu8yqLtD25/wnDF4zmkiA/C4A/GDL1GrQZZ8OWILvkNz2j96+w3ix
 Cxlf9HpZ5PcrLOhSxxaWZ93kj76sVRrYVSw/9qfqONTeHJjYktWjvGq2o1aL1M6dRifDYBq5agl
 ikazqgLAKcU3HLKdq+G+JWUjLKYEQUffaqENv3hmk/d2mQLQznwVAsiNLxKdPSaTAJSDYLxLZHL
 ScSw/LfWM89e8nbmbdbczScUn4G4HoJ8Krt9N4LlS4w+5Kkt/JOiyXBoyzWUBcpT6FJPhJdxFlv
 ZjZAOJZuWT+PYOTjoFDNr22IdB/w0U9Yq1iUbFHGhyQjbEJJKL2yvbJ+RU+OpCDbKrOz69+ZbP1
 VZyhxxrzKaHg1YBFcTyEa3DA2mRUaSGLtpUSqZKKlHEocLIjw+2JsPB8Dp07y1Pp/1eutyfnA/0
 m5pXeBEV7lPTd76F/5yLkGh2RTgHcHLBtJbU8VzFqeopg8teAo9cJozf8WeAopHSt6ULq7ZQnyS
 KeK/MncpkkgSh8JOybwYuGA==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_100425_279779_311C986D 
X-CRM114-Status: GOOD (  11.89  )
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

Radxa released some more boards, which are based on the original
Rock 5B. Move its board description into an include file to avoid
unnecessary duplication.

NOTE: this should be merged with the following commit to ensure
bisectability. The rename happens in a separete commit during
development because git does not properly detect the rename when
the original filename is reused in the same commit. This means

1. it's a lot harder to review the changes
2. it's a lot harder to rebase the patch series

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/{rk3588-rock-5b.dts => rk3588-rock-5b.dtsi} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
rename to arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi

-- 
2.47.2


