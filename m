Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1817BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 10:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ioXaEb8AhEb9ppd2CiarkcVgpik13EQZ3YX/6ej2zCA=; b=5Csb52+oXAwdkp
	R8JiuZxQrsO/VHDV/pCaJc5GvSQd/B5QekhgYBX4jSnd32zMmknoOpoloT9P1uKX5AvoI56ZYz5vw
	K5KMTXdB86y4JNdAkUrjR2pXRhcH2pUlUi7x2KgtGcJaOWaEqp667P/PZK38yRA33hgXi3NtKSPAS
	/qNplM+x+PuGCwKOWx2NWs/PRTODTyRXuP4ljz7Mt2CjjELe1/Hw5BztUJi7gmuLeC2NxJxDsxVzT
	3TMsqo8vFuEmVkw/uaIfzIeEIbRdaSSKVzTfoajTAUzIiZfv7Me4kZksivBlXTYo43v76u2TDtlrO
	mAukErBATk1BlBL753NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUNT8-0000000GeRf-0i84;
	Sun, 05 Jan 2025 10:02:50 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUNRw-0000000GeHQ-37bq;
	Sun, 05 Jan 2025 10:01:38 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so14370379e87.0;
        Sun, 05 Jan 2025 02:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736071294; x=1736676094; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ioXaEb8AhEb9ppd2CiarkcVgpik13EQZ3YX/6ej2zCA=;
        b=HYoeh88NhDVIMUmEbfWMjXJ8PrbxThFQ1W7IKe/giImCZXqAMXHEd9k/5vyjVT1Gr2
         4tmMv0pcCP/8yROpkC4HhLn9XmOROa8Savb3Lz0hrLq7Yi8kZdlV6DtwKGlZZJh0MYOV
         xhV/pEOtWt5Ckgby0H2bmKFnZB/zXvepEDPbcRF0z1jkIDDnm/bfVuonpeY+7xE2vQGf
         c+eHZQNonQY+AyqIQvTalTtPxnkKpLj8CSBI+KoxsXwmLkzNNAQZpxDqNrWDX4oK11b9
         5uRhz9J2LZ6EHsWA1Faq5vBtkJAwI+09vallhO038qutZ75UalcCgpVv0a6MF/gzjsuf
         dYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736071294; x=1736676094;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ioXaEb8AhEb9ppd2CiarkcVgpik13EQZ3YX/6ej2zCA=;
        b=nkQiYqCmgYQ3Uer2s2S9Rqko+tj2/ngF9omjZWd/jBYTVvA0AFhWuV9+qx8Oyw6EwP
         4qOEztBnAFlxirj6ZiKsGSP64TfrdB2/9s5JgUow9IguI6ErtObq+QPQc98fjWkdNlxD
         fBBHVSiS6bOosXkfs9tFAOhQ0M9kPOPHboGU/fC9eYE7zotjTRaAcXcEuRdxljashk1V
         VmXyAOe8zj2cSF0XhAOm76PqSohraER9/w4nBthPmCYAN2t4+MxSOsLmceu5EQAhyGR4
         iwPmwGjslGPdvyR6l+LLaZDmgQZDRtvcevL6WXNHN5zsxVfBp/PYrFUvJvBDzMFtxNc+
         Nqyg==
X-Forwarded-Encrypted: i=1; AJvYcCVb7kytg6QcGo7GGOC2mXdKirInZJevcDsAqxwh0EwYDjQuZkwyKTOoePYh3EcqBbr4ECyoLT87Ez4/+TPrZog=@lists.infradead.org, AJvYcCXxUOkgYDP6wKkZ8EL9CfKZx0D+GFt3IhQRQQSSaArZQ6OdajbqiIFoLkUFMQ8QTjvtFhK7UelkXy7cTT1drAy3@lists.infradead.org
X-Gm-Message-State: AOJu0YzPJeeQWropBPHC6dLzPIY7oTkGBamJ+s1eCWrV0Pz+0kLyxDwT
	MyjW7y/pDomW5MLMItSvRW73pWh+BlSip42Hf5j3B8/Vim4lnkZLHUgnrE95aw==
X-Gm-Gg: ASbGnctuUwYSHEzIAArCYkuw3tm5TWr87r5AvNg1jg7m6X/441qKEspWh4Cvp2Js7hw
	bM5yr9QCVYaj36Z8W9nDZtvrPBu/CCbqaPcIas5sF8TNGH0gI9BX4zo3Sc6M35Ah0rHzh2byGDo
	7amAg5Cb9cbMW/7JP9oAaaoD9aosaDWIfXIGu2nD1CcxrfV+8qwjcXXsQmN3rw/Q/kYePC4WF6S
	SnLZ3IXLMRCx3Sy00cR31bLjhteLlp3+FSCvZjeIPym1FRwQ+rVw0Ow6ic=
X-Google-Smtp-Source: AGHT+IGYOoAYruqEmrXXpBPQrWSQF4Z4pQ+Zw4ZngvJDeKbJyND9eGnpgNG9zhGuRrVEioq1mNzSPg==
X-Received: by 2002:a05:6512:33cd:b0:540:358d:d9b7 with SMTP id 2adb3069b0e04-5422957ac6cmr15595789e87.52.1736071293641;
        Sun, 05 Jan 2025 02:01:33 -0800 (PST)
Received: from JetTurbine.homenetwork ([2a0e:e6c0:20d3:2100::1d])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813806sm4580828e87.114.2025.01.05.02.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 02:01:33 -0800 (PST)
From: Ivan Sergeev <ivan8215145640@gmail.com>
Subject: [PATCH v5 0/2] arm64: dts: rockchip: Add BigTreeTech CB2 and Pi2
Date: Sun, 05 Jan 2025 13:01:27 +0300
Message-Id: <20250105-bigtreetech-cb2-v5-0-923f911b10c0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHdYemcC/2WNywqDMBBFf0WybkpeatNV/6N0oZNRB+qDREKL+
 O+NQqHF5blwzl1YQE8Y2DVbmMdIgcYhQX7KGHTV0CInl5gpoYxUyvCa2tkjzggdh1pxebHG1Np
 YKwuWrMljQ6+9eH8k7ijMo3/vB1Fv67dVHlpRc8GthDwvKgdNg7e2r+h5hrFnWyuaH1+Lo2+Sr
 wqnnBYoSvjz13X9AFnh0MTuAAAA
X-Change-ID: 20241224-bigtreetech-cb2-18944b349916
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ivan Sergeev <ivan8215145640@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2326;
 i=ivan8215145640@gmail.com; h=from:subject:message-id;
 bh=Ve6DAyAdX75MBAsvdAMcYRB0imSwGJB9zDUZrNYiJ9Y=;
 b=owEBbQKS/ZANAwAIAbzfXRlQM5b9AcsmYgBnelh8s8U3cjvCpHPRrs2T/+ajFNPVuuPWhJFqo
 l6XqLavdomJAjMEAAEIAB0WIQROCZtApKFz1fvvsOS8310ZUDOW/QUCZ3pYfAAKCRC8310ZUDOW
 /QRbEADX9HM1YyxNIQB/J0YA+nNDhvdWyPZOY6j/rx4I0XtLRB6SoHVugL1pxAzauWVYNJjZb/T
 gB4lu0d/7Ze44LTzww4hPFuF1Fl/wKdLXdVkJqooNzZvdbF3neGaLzK7neXSDozZiQV3nF1a0HQ
 FQBvNp+Wrbelt+vJS3veBiJjJsw+QRrcitDwrUJY5UET82gZ14+Skbe3e/L/sCFKBIT7EgHnkjf
 JUSq/Znv9+s/rp7rQTG0Yn3+MXd5BNfpGSg5+lFdfgU0GLRVfuv6kfBLrARmtzYjLWeBWpwzFF5
 pupDOWhWrh6bYFKMGRoYHldXayd9mhtqQI2vHReKwrp5zb/bGmgGS4uHGmEhEjmTqb6at6IpitC
 QM1fc3Hjjg22Q1cXmy+z67licL5d7CaVXB/iNqybMbqT8Umqt09Px1de45vYDJ5otNtKpwzHskL
 463PwUJV2V+8rKAs4LGtAbWL3bmkvbucHw9IuvmbQOP2htgNc6wkYSkqyq9mcL53Nls8iZuNNHM
 lRN9tEYVoILP/SljACWRlRHdQnlh0qqOYL/WfE3OGBE/ZTNfLw9+bMzu2ozPNkB4/ym01M3WDV0
 7Sm9/c/xUGIldrKU/3NVUr4eb78wNKmfpvPiRDWqQhkFY/h2L4uQOslH6Cc+RULRzfxEmj4aBcA
 DE+JDMkFDcpF/RQ==
X-Developer-Key: i=ivan8215145640@gmail.com; a=openpgp;
 fpr=4E099B40A4A173D5FBEFB0E4BCDF5D19503396FD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_020136_801238_A157BEBC 
X-CRM114-Status: GOOD (  10.28  )
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
 .../boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi  | 919 +++++++++++++++++++++
 .../boot/dts/rockchip/rk3566-bigtreetech-pi2.dts   |  10 +
 5 files changed, 952 insertions(+)
---
base-commit: 63676eefb7a026d04b51dcb7aaf54f358517a2ec
change-id: 20241224-bigtreetech-cb2-18944b349916

Best regards,
-- 
Ivan Sergeev <ivan8215145640@gmail.com>


