Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F621C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 21:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUMHYKa7L39EF19ViKQjDuDWwTrq9xKyIvYi8RpFFDk=; b=wrFBeb59X4i9cvAYM0Vz5oy35f
	edU1TJ51vJ7tuEm0DWyGazmiWNPHRbeTb1ZwG+H0kTnUdnjRlvwjhrMB9qrB1ysjbMqd+Yt0Az2R0
	ltevnPHvKJW7MY65oOvrDNDI40PduB0aZPP6zcpThIs5mgKoTKsqYUy94GXbt437QKEx6kJueN+u5
	dkX42rNIi4Y0mCVWKPq09Zxm6dHLWqYrQk4k3P+JXvywFQYZ3qDLFDr4i3GFeolZiirHMk792LzEB
	C0A3pJehWToDB/cljm6jKkHYPg5xS1oMbyjnq9dXdy862F+4uVG6Ekwclc2h1Jrt0fmvbsJhp1llW
	MpHz60LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8nTI-00000002YMf-4BMP;
	Sat, 26 Apr 2025 21:54:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8nLu-00000002XKR-2sdn;
	Sat, 26 Apr 2025 21:46:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=NUMHYKa7L39EF19ViKQjDuDWwTrq9xKyIvYi8RpFFDk=; b=Abd1CJpAlWjkAMlngJsBMAUMHz
	N8W2BZqVYPzJuMM8KTW1R+6DTRKZNBh4d9Tts/YNSKxTOUrxKarOfZLmR8efVBy5G5Y75DYrCSwil
	zCcxn46OJF12NM9dmeSlin70yJ02lE34pdTgi2FN/JJqLQrZvBTHnAW+DHJ9ZyzuLS/ls6gQLfSPB
	Dy/gfMMl7sPfaupIkRc1b5oCJwKLgk2qWHKjEB/zSc4n2FccJIPmWc6VrRCaoq4gVSZN1tNeUC7Vs
	9M6ghrWF1PCpyZr/PItEEzImft2bvJdCgVFNE6qp7TApbttdi0OEkcASWdWvEbyrNqQ+gx6fkTu3q
	6E4dCVDQ==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u8nLs-0001OR-PO; Sat, 26 Apr 2025 23:46:24 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Tom Vincent <linux@tlvince.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Assign RT5616 MCLK rate on rk3588-friendlyelec-cm3588
Date: Sat, 26 Apr 2025 23:46:13 +0200
Message-ID: <174570370122.31943.10553095973503218576.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250417081753.644950-1-linux@tlvince.com>
References: <20250417081753.644950-1-linux@tlvince.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_144626_720148_0D7010DE 
X-CRM114-Status: UNSURE (   9.53  )
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


On Thu, 17 Apr 2025 09:17:53 +0100, Tom Vincent wrote:
> The Realtek RT5616 audio codec on the FriendlyElec CM3588 module fails
> to probe correctly due to the missing clock properties. This results
> in distorted analogue audio output.
> 
> Assign MCLK to 12.288 MHz, which allows the codec to advertise most of
> the standard sample rates per other RK3588 devices.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Assign RT5616 MCLK rate on rk3588-friendlyelec-cm3588
      commit: 5e6a4ee9799b202fefa8c6264647971f892f0264

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

