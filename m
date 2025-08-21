Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4816ECA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 14:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=boFmMoVdW0hKwddAozpFBhzmvUPCQDdUNMEV/rhOTak=; b=VerPxRwItKXQGWUxVubLTNa8zz
	LwnO/8oNMn/sqKnLw2DST3WqTy/qUFnS0Ww34+ezMbbb03ODInNISkjx4PY5aBXIMhGBoFyt/Z5LK
	BijojaLsvdjNP0L+RaDcmvC+KO7IKa5RuNRNlRcDLyRkBqAU0OpaGAqXyFBRckshkXMBaZVqD3jFp
	DiySntKBZ/VwW/OFtycKsp9leqF6GFTk9NU3R1y7QCAb3x1YbNBZNofROk7sGRJOqTFKhmr0Nlv3l
	/np5ZJXAkZCHRSXEtYQmNsM19UwyJ04aF7LEJfM5/y1QklduOjO4V7mKUDR4XpJrXjfaG+1qM97fD
	oCjycL0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5sU-0000000H9p9-2rpJ;
	Thu, 21 Aug 2025 14:02:54 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3Cu-0000000Gi8D-3C3B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 11:11:50 +0000
X-QQ-mid: zesmtpip2t1755774589t73dceb9d
X-QQ-Originating-IP: MKW7FV7OJTG4N2Nkof6plwcSoT2xUJFMGQvmD+IFAqo=
Received: from chainsx-ubuntu-server.lan ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 21 Aug 2025 19:09:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8973447282876745434
EX-QQ-RecipientCnt: 16
From: Hsun Lai <i@chainsx.cn>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: i@chainsx.cn,
	heiko@sntech.de,
	andrew@lunn.ch,
	inindev@gmail.com,
	quentin.schulz@cherry.de,
	jonas@kwiboo.se,
	sfr@canb.auug.org.au,
	nicolas.frattaroli@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v1 0/2] Add support for 100ASK DShanPi A1
Date: Thu, 21 Aug 2025 19:09:40 +0800
Message-Id: <20250821110942.172150-1-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NpfbsqbTlzxUYzkuM108LYGBzIOKOYf6eQQxrwxF2lLcFWSJ4fcFlLUL
	oLwzx2QE967MnVqMzPXAD7mYwgIZShB38is7YynsH+3TwIfSHSVBQFmtVptShfLGZ6ziTqg
	9Z1/Au9nMijx6qzKbRcUssHiAd5TIAy6b/7NXSvSKqpG8MBfJ1G+0Pi8Sce2bndb4aZ5EMK
	SOfpZGh5wVL+T8i/zlZzvGiN5vEYckWL8dPjbSWP0ClhZVI4Tz1qccZqzV71c5ge+I2v3fy
	qjmLKs+ULKBPseGbntfdPMK/EzqyYmhXhFbB+5eWa3TJIpshSXsMdQrXmKWblhz8be+9aY8
	NmYN9TCqZBKwFpD6lBOxLABZm3iZ3P8vwFteevHuXTGTAMBB+HjwczomEwlx1lUSegnOPxC
	wFaCsEJ5VMXlOG74DnIsHky94BPId4l86GtgrRXDB9DOn6P+wELW9aCuaJmEwQ/HvZGreJm
	+MT0PfvrZZr8MMxMHtdg9gVbrYki3CDl1Y6sKqROZgEjRIBSSqXaDzSlDqW8SFXQ7xOfVoB
	BceR3pcB4KsQfkw4r9MqiZfT3L/0jyPeZW5lHGWpSdr6WJQThvoWZuY6YUX2u/NQ8VBHch/
	NQn07D4ITkiERVDlTuqPWu+O70pB6sdX2qT/CgaL4FhK+7h6qCdiztf4oYtn/SZT3yjwQaR
	MgCb9xY98d94v0JqaSQu9Uyx3U/AjuqSALMZ3TFfnBpq97Et+7NCshR0LMA8JU96OQNXa6E
	/0igXlfalqyEywJ1BZETAZKgZAa2z6usQ6JwsrDZOF7+vwgymbZsoRDgBDWnwqZR6OLKnz0
	nZdUYCjL7MTf1NPgJbcn8f4zNVnytffE+sfxT+5GNv4mWCnQQDhxEqcGgWb8uoSLxLv0WCt
	u7rbkWNrS6gkzy45sOyA1YPlL/p2BJFr0pzCbJe/vhOT4IThGcxy8moIPdJuHq3OJpr8Wcn
	xuCnvMQhSUyoGdoyJlvkN3WPLF+BRbpUhJt7vaLxGWQ1y3P1LoNrdxcxYw2cDjsXKEuEngC
	WaYgAYDg==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_041149_059657_B3B56065 
X-CRM114-Status: UNSURE (   9.19  )
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

This series add support for 100ASK DShanPi A1.

Info of device can be found at:
https://wiki.dshanpi.org/en/docs/DshanPi-A1/intro/

Changes in v1:
- Add support for 100ASK DShanPi A1

Hsun Lai (2):
  dt-bindings: arm: rockchip: Add 100ASK DShanPi A1
  arm64: dts: rockchip: add DTs for 100ASK DShanPi A1

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3576-100ask-dshanpi-a1.dts | 841 ++++++++++++++++++
 3 files changed, 847 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts

-- 
2.34.1


