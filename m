Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FEAC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 17:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0f5YNGtGXZGXrwigSl+PnIhY0xFh0vOHEscnqigtM4=; b=4oPUdXhRcmJ9hdWjpYU0eY5/gY
	6GgnozNS/0XDJy/1gRPycgbGQEfQmkd2W7esiGG1vvfFdHh7ICztAsJ+XtMatcpMCI103ufpj22Zx
	N7fYVJq/OC4oc3M9OlvybTpmvR6HspQs46hlb+uqman7UEHVeXsunbJp/qzS43pnOq7nnuzLnWtCf
	7M85xT8A16o3B0gAechDluZ2V1pacoL5eB/ed9Yy5k1gqxsOMvRXS94psnEdhX3f75OdexS+RVEIt
	yZnPRe6MzF8rXGLSy3fJ+m7RJqsxGTWgGj0uMVHXTjTW0w30SJAE20vcBgiadOGvZ5G3s3st5QTq2
	5ka/CXXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD5Sh-00000001Tg8-3ClS;
	Thu, 08 May 2025 17:55:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD5Ms-00000001SlN-0hqD;
	Thu, 08 May 2025 17:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746726547;
	bh=NcPJopNj4QkFL7RS7LVqktzn6/GCRQbuGX0pRkX8TIA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XTuAt1SgdJEza/9SbifnqLSJSgjB972/wjCBQ4zB3U7U6nospO3+6eIcYL+rtNfjE
	 sxb3lfhHTGD3oGVRFz79G6Nnb84SAPtqpnRnUd9GQmE8mXINfUkx1idUAysy9c5MQM
	 zoGf09oSbA94/cdhAJymXsALo+SPNw6ewMMYDquq4VBAG8Zsv88Ejj/21PlLvUo1Pm
	 zIYvpsafdbcHvmv+AvWryvuYpcNKbQzdhMcrV1u7/WG3kxj2JnYkfJgTa55lOuXO5X
	 m/p274Pdc+GayWx9HrLuWhoRSBH+pgQCIIWoENfxJocIBvxysx7rUJyzuc6N66EFIz
	 ENXzUZgprlMmw==
Received: from jupiter.universe (dyndsl-091-248-213-080.ewe-ip-backbone.de [91.248.213.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C808C17E07E6;
	Thu,  8 May 2025 19:49:07 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 7069E480033; Thu, 08 May 2025 19:49:07 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 08 May 2025 19:48:50 +0200
Subject: [PATCH v2 1/5] arm64: dts: rockchip: move rock 5b to include file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-rock5bp-for-upstream-v2-1-677033cc1ac2@kernel.org>
References: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
In-Reply-To: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=992; i=sre@kernel.org;
 h=from:subject:message-id; bh=NcPJopNj4QkFL7RS7LVqktzn6/GCRQbuGX0pRkX8TIA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGgc7pO+niDJzvLdND9x09wwRxmWRhstVzAud
 5dt2ER8DWsTUYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJoHO6TAAoJENju1/PI
 O/qabLYP/1D279busEQJkEEWFCEGNrbv01oemTLzeZyBXScZgGgvwi7BO4SfPVoOd1CifrkQF5o
 DCYZLZvmeQP8HgLat/TqO7nlLi4jsIrq2ZWKwfMTUcOd+ENyDgblj0hMusHe6z2rIUaZKIo9DW4
 /42RooyfPkzZyclnkZvDSLqXgkAsxff5GslPfx3okLTn2ipP+JYmofhhhmb5+JHKeYI0JJ95IRn
 2GbwLltBcd4ztiqaNdtA9dt2OykAF9+sve2903Rw2GIukeT18KbjquCoB+MhFEeTDYXAABQZXD1
 I9G35Ehu1fhyfuB0mYfH0MUgUht+2jcj3Ma0f9G8gxZ9onsOlOBo0mtXL2FKj581mvylvFRML5/
 ePF2qlM8AH3bDu//gW5Ty/BCuj+PegTQ/dxFvC2rDSeHXvtNWTpfiKYKdyleLvyWQBHl4jHkRpa
 niU7iIkP+vF2UNfzA9yj21u+BPRDodLJxawG6daTEXuUfZzbMOyMAzLQz3EmiP3qdoKVGoFVrS2
 DHOb6WtCIKKCzCT9Fl+FP3L3u/U4SrZ0CEJeQa7/qupMx4k69DEp7+mkporOAJz7ESRV41vGxJo
 upJFs5awz+Rux9s4PF2y2jj099DJmJFBd3uV9gTCNxweK+dakgiATKHRBJ44IvYVE+JhQw2ADsa
 DgQ1NasBMWT8GcjUiUSotWA==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_104910_355710_F7125000 
X-CRM114-Status: GOOD (  12.03  )
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


