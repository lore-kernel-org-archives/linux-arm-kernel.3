Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423FCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 20:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/Lv67Lu/LgB27+sxxmofmAYOKDa/1iR5nfgRtfrDxd8=; b=AENmhG1S1mEAAN
	6VEK7N/0xkhLN5L7EPe7/5aX+EwjDIl6OjO5+YK4rG9SEP+sSzdjxiU+BNDYLX8w3gTSTdLW5v1sJ
	u/SCmHk61Ym72UDJPgyVa/22vCfNLS35v7Uc0DWTARovJaGk9vr3TweXrs3LLQ9aRnKBRoc6+MDlT
	B4Ibb8tTRft14Mok0Kr6j2mseo7ZG7Ki1aU1ZJP6tSB2+nAugOOnRWHF8CEkbmwnM2nOSxfztUyQr
	RUwfbfOjlpX0Wo+JfJ9QunIvv+Y0EfkdkjiIVlte9kYbc5G9+8BQRJuDO96ne4v3BvwUIhataaA53
	2HNI9PywE2MVX1Fpx0gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUu6P-00000002eHs-3TKP;
	Mon, 06 Jan 2025 20:53:33 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUu3v-00000002dgQ-1DCi;
	Mon, 06 Jan 2025 20:51:00 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-30167f4c1e3so88023881fa.3;
        Mon, 06 Jan 2025 12:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736196657; x=1736801457; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Lv67Lu/LgB27+sxxmofmAYOKDa/1iR5nfgRtfrDxd8=;
        b=FWddk9YwcuaXakGnkaGwc76yXTaVfMNuRefM3GUZ4A1FKn1D1r1XJmaG7BcKxshns8
         ywXlKn5m2zhezN37oN2pF2e5Z1AVmZICsfQIshlsVu7lN5UARpWTL7l4/wniSS8GgblH
         5iE0Vhsnc5IqYEwMBWKr1Yr/zv48+Rro/1ozsldgn4vgb/g0DvDDnp8nwvwj3M0MlJky
         atKHxSCaggcInriPfAtGK8ACBEdi07olAxb9q06xfO8uKizkoSBaie6FrHXu9F2AZI6S
         WtED+ZXqMAJja0bluPy4IXAWS7YX1JnqZr6/E9puOIjRRIBv48XiPmW6jdl5wUj4e26w
         u7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736196657; x=1736801457;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Lv67Lu/LgB27+sxxmofmAYOKDa/1iR5nfgRtfrDxd8=;
        b=Yct+pwVjcaB/ST//niHMAotBpsmSYqH/5zOBq49hA/9rNjOUjW66gcZEa+YJIV01T3
         fjOPhOgxHbnRm35LVjPt6u/wf8s+yWN5TE/wcfILp56fzVxHm+SPEHJl2FHQCOVZXglK
         wOa4+GAheeeSlLwfbSv6ES9TU+gNsek3llVCRF8RoshG+PjAtf6VFtOHCJv36O4MPeFr
         ll/o4xqGYkz5KEOhuY/jUpn26e0Oh4o9HZftN44nN0+sEtBw4imHv3akjB0sAE8vrJUY
         k7hK+7ElQL4irUIbHsnELXm//bjdbPN1AL/7G0m9Z31PnxUlhxRPpTjopRDZoUghRYGI
         mf7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXV8tYYs91ZfPDqSdoG/dpmA+sYcBSh10lVmzE+MLS7uNBnoVn9pyAro272Uwc9fEwikB9FRBO9SBzZBUYQnxI=@lists.infradead.org, AJvYcCXygCWAD3/WKblKZuvQP4tEJam1QpXLtKXqhmevu75GF+V+RngH51uzcQ9F8gG83PJ9VcpXCf2Reg3pu9tjctz3@lists.infradead.org
X-Gm-Message-State: AOJu0YzXg3/p3jx266ItXNQ/tI8/SAd5l1Pf6N+pfa7iCcBVTv8W/s/Q
	TfbWsOMuM9/NcMGd0LFxY0Ah8ocTtzDQaFBTOK1hnPIvUgy4wds=
X-Gm-Gg: ASbGncubW/XykgYYCxNNHdqHdNqcuZ+Fy7j6ai3zsuo9sgFpuGfCWFC8J8lxhWQMOVR
	jlKtCc4AUDibpuMAo9oPxspqdK0ZIyImHxjVvec/esHeFxAkx4fZBTkWrd4s8W7ydhBBS3sVBbI
	RB1TFHDvcMfGSLnZZaBXwzBGwWbdwgMQUCjWL0SIyDBFHhtRRUsi31tZuE4lissWDz8xFPSjdZ6
	I2G+co7eRbPISReh2gG8utb75l7aszrNmDUZzyxkOZoFw7L3FqNsA87ACc=
X-Google-Smtp-Source: AGHT+IGmc1GLzlJn+hMB5AriQbAJh1senQStXYDqcVMWNlEIhtVTPBP5qUirqeNjjY5n6q8lYhd52w==
X-Received: by 2002:a05:651c:1542:b0:302:3355:eb5e with SMTP id 38308e7fff4ca-304685efb4amr197768601fa.39.1736196656012;
        Mon, 06 Jan 2025 12:50:56 -0800 (PST)
Received: from JetTurbine.homenetwork ([2a0e:e6c0:20d3:2100::1d])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045adad2a0sm57898481fa.62.2025.01.06.12.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 12:50:55 -0800 (PST)
From: Ivan Sergeev <ivan8215145640@gmail.com>
Subject: [PATCH v7 0/2] arm64: dts: rockchip: Add BigTreeTech CB2 and Pi2
Date: Mon, 06 Jan 2025 23:50:53 +0300
Message-Id: <20250106-bigtreetech-cb2-v7-0-565567e2c0a4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC1CfGcC/4XNQWrDMBCF4asEraswkkZy1VXvUbqwRiNbkMRFN
 ibB+O6VA4EQL7J8A98/ixi5ZB7F12ERhec85uFSR/NxENS3l45ljnULDRqV1ihD7qbCPDH1koK
 W6tMjBoPeKyeq+iuc8vVe/Pmtu8/jNJTb/cFstuuj1exas5EgvSJrXRspJf7uzm0+HWk4i6014
 5M3sPdYvXZRRwMMDe28fXgLCuze2+2/NskrFRQQvHr3xrvqmZtAnjAmdM9+Xdd/UpIRMm4BAAA
 =
X-Change-ID: 20241224-bigtreetech-cb2-18944b349916
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ivan Sergeev <ivan8215145640@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2648;
 i=ivan8215145640@gmail.com; h=from:subject:message-id;
 bh=afb5M/i+km2PAtJ2Nz3QnHBOB3NgG4YKUgCLhq8io0A=;
 b=owEBbQKS/ZANAwAIAbzfXRlQM5b9AcsmYgBnfEIvN5+BzLEUjoE5fdN8yCy5PrjL79uxtinUq
 pIRc0jibFuJAjMEAAEIAB0WIQROCZtApKFz1fvvsOS8310ZUDOW/QUCZ3xCLwAKCRC8310ZUDOW
 /XI0D/44EudxialxkgVzmRNmWbmgmIDyH42iJXj0MWNDPTNEoeGQWUeG0CEiBIkdAuzdnyTKkze
 EGK4jjGdjcvP7eGcVy3Rwr3zL7Hp3Orjmwmr9R6bmfMMfxsNnaXl6Wl4Vq0tIF8G7etBrw3fNGv
 zL+otklwzlNgR9z5yaILZlo7vuvQeaaEi2yW1wVHg2lIxrABKTfvGd+NRz52YzCg6UnThOWBQkQ
 9FdKIt9P0QzX2HHSUVFCKwv725eleZcwiCSG8hOkdG6JzkNzjOtv3tY4U7CEkO2VdBVxAadnGfX
 wW5QevK9D8iALhy6k2DBzJz6JVQhq++Rc6SF/hcde7qlkl6kLtaAyyCN8XCSVYV24f52to3SBAq
 YntGTPLNncWb8m8fck5i4uh3Mj6/JumSWK4/jZN+AGGM5okBn6WeJ3MMdWSTT9/kvZkBUcWvXf0
 Fmaica+/QISZUsWBIftTf59vNR3u39mKLdfjG0x/ju18qs6yJ09+ri+LFLcaQyFcQ3gztgLTp4H
 W3o3i4GgzozvkxU4/0DtgngJokHP53FCHV0vPwfeJnz2gAd1SwIiji94bTdXFHTY/2pACTA56Vk
 QjWccxKGkIkZ1V0xG8LedjLgEcEIpaYdQBF9gFAUoskE2dxfukWbClL3AMOM4nV//R6AHvw6tzN
 r5x18t+6khBZQKw==
X-Developer-Key: i=ivan8215145640@gmail.com; a=openpgp;
 fpr=4E099B40A4A173D5FBEFB0E4BCDF5D19503396FD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_125059_339036_A5F67AD6 
X-CRM114-Status: GOOD (  10.49  )
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

BigTreeTech CB2 and Pi2 are Rockchip RK3566 SoM and SBC boards made by
BigTreeTech for the intent of using as a 3d printer control board.
It is a successor to the Allwinner H616-based BigTreeTech CB1 and Pi, so
the device trees for CB2 and Pi2 are also done in the same manner: the
common nodes and properties are put into a dtsi file that the
board-specific device trees include.

Changes in v7:
- Removed all of the additional pinctrl nodes that were unused.
- Link to v6: https://lore.kernel.org/r/20250105-bigtreetech-cb2-v6-0-ee7bc9c4df46@gmail.com

Changes in v6:
- Fixed node names missed in v5
- Link to v5: https://lore.kernel.org/r/20250105-bigtreetech-cb2-v5-0-923f911b10c0@gmail.com

Changes in v5:
- Applied requested changes
- Fixed usb `phy-supply` format
- Removed improperly named pinctrl nodes that were unused.
- Fixed names of other pinctrl nodes
- Link to v4: https://lore.kernel.org/r/20241230-bigtreetech-cb2-v4-0-26d2d30e07ce@gmail.com

Changes in v4:
- Removed invalid `i2c,ignore-nak` properties
- Set `#address-cells` and `size-cells` on `sdmmc1`
- Fixed `phy-supply` properties of usb host nodes
- Link to v3: https://lore.kernel.org/r/20241227-bigtreetech-cb2-v3-0-91c556adcffe@gmail.com

Changes in v3:
- Proper formatting and patch series sending (using b4)
- Converted spaces to tab indentation in the dtsi file
- Fixed empty line where the license identifier should be
- Link to v2 1/2: https://lore.kernel.org/linux-rockchip/20241224135751.350379-2-ivan8215145640@gmail.com/
- Link to v2 2/2: https://lore.kernel.org/linux-rockchip/20241224140057.350667-2-ivan8215145640@gmail.com/

Changes in v2:
- Added bigtreetech cb2 and pi2 boards to the list of platforms
- Split BigTreeTech CB2 and Pi2 into two device trees using common dtsi
- Link to v1: https://lore.kernel.org/linux-rockchip/20241222203952.84217-2-ivan8215145640@gmail.com/

Signed-off-by: Ivan Sergeev <ivan8215145640@gmail.com>
---
Ivan Sergeev (2):
      dt-bindings: arm: rockchip: Add BigTreeTech CB2 and Pi2
      arm64: dts: rockchip: Add BigTreeTech CB2 and Pi2

 .../devicetree/bindings/arm/rockchip.yaml          |  11 +
 arch/arm64/boot/dts/rockchip/Makefile              |   2 +
 .../dts/rockchip/rk3566-bigtreetech-cb2-manta.dts  |  10 +
 .../boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi  | 885 +++++++++++++++++++++
 .../boot/dts/rockchip/rk3566-bigtreetech-pi2.dts   |  10 +
 5 files changed, 918 insertions(+)
---
base-commit: 9d89551994a430b50c4fffcb1e617a057fa76e20
change-id: 20241224-bigtreetech-cb2-18944b349916

Best regards,
-- 
Ivan Sergeev <ivan8215145640@gmail.com>


