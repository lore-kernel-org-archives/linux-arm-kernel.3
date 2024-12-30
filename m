Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFF3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 14:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GoaoLq361UaAebRj2ohl7Uye7+ll8RqNIDvB3jVhJOU=; b=i3tWshvyUncHVm
	rqxPmOWNR0ms7qS+b65Myn0L/jTHwfTGb1a0bJis5ay0fL8pjYvv1xw4nrruJz8Y/09EHHL7wAtuB
	L3ICAW6VpL3PlmwlpmEoZHEuejLlaegQMdWtWYB4hayVR42bYo70CNVLNWnV+Q5fBV1QJjphR/IBz
	QA6nQKEvul1HdIHY4lvhh6nnY4TXE+gVvM8niLvCnEGtAE6vgpxO0FV8o8VbG79Pf82SlOEAj4jg8
	Y0dUP5fibvq1Vaa9UmcLH/fcY61kqLj5FJjdVFW2IsOSfm/hHyX9SN+K09VxTDLIONZeap+0LXUYe
	W1O/ij8UN5LGdpJ6y3rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSHFB-00000005Ox5-2yPv;
	Mon, 30 Dec 2024 14:59:45 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSHDz-00000005Ohm-473t;
	Mon, 30 Dec 2024 14:58:33 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-30033e07ef3so61354051fa.0;
        Mon, 30 Dec 2024 06:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735570710; x=1736175510; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GoaoLq361UaAebRj2ohl7Uye7+ll8RqNIDvB3jVhJOU=;
        b=fq2GLV7eie14TgeevO1UCfeN+AblMGKoSLEhmSxtTMu5wGyY+JpOtiV7/nOGWJUyyY
         PVKO5iCt8sJBnnVG7105E1Wusthryrlqw22hlG9wYnwx3cdnALlwog7g5Es36aoFmT3f
         HUzBJWNxFEn5Ka2vJ0TEDAqgrEcdhez8dtQ8xFH/rWXPn4GX2jXIq/AdnXcbyxioVS5Q
         sSUyHe/PnwtZ5ZbRtZkVT8xK8fMGeVMIxS/mn0AsqEXPTfzpUYVVdF9Ks7dWtr3mKKGn
         cTNn5AELIdq/5bJF4Gg1kdE7JbtvT3cLX7brOekkLVYxGeEN2WlCJGS/Jz3L1UbfOnz/
         DNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735570710; x=1736175510;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GoaoLq361UaAebRj2ohl7Uye7+ll8RqNIDvB3jVhJOU=;
        b=m1ZB6jn/CJicyhFiD0hC8zmOt3jyaLqY9aP4jsa0ttC9vA/4ZeBggV+4Eb6zWmxg24
         xuj/NYTx6i+bigiHQ6g2gP77sTUu/dJPC8gZa83WjmCLI8YL4PvnBTi7POvf/IGUUJEl
         lPzATVaCajEyGh92/TDMwq9qzo64WKkcTLNuOEXBumiEHM3MSSZqcC8U6uFYm83tBmCQ
         UrPScxKK2BIeIGxQ0kQ30HPK+ACmE6o9lYmt/1cEOPyDyaFJUy9gK/Jk70SZuMxWTo2A
         JNRNGqA033NrldktuL6X64b6qm8c2ukzenmQzouGfOqobosocEODfG4vNitSzE0wF6zn
         UKVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSS+jjd7BZc8IX5WOzP6a4Tm/kl63JHDIGmDmVm7v+wDpV8VpOXvJCddX6NXU4Fzqse30ZJ+VF3DeRjihpkIA=@lists.infradead.org, AJvYcCXihusLE2YSf6BlxE0tWVJSn78uGKb0ZbDUH9QXx6lirFC/OXqqmjJNcCFA8eH9DMrdw2qO9RRGo0oyLmvYz66m@lists.infradead.org
X-Gm-Message-State: AOJu0Ywnb3CXQ4MygE3J+IBT2Kf2tsKeEnDRmKxFHqeMjErWXNIw25YW
	oZ55hJEdqd8zKDfeZOqDT81SrJUvLWHEi2sPkqxqeyto76PLRko=
X-Gm-Gg: ASbGncs/nVb7kTYvzYxgQYW08BdCXiX85WtqcFFfCWNrtaLgoAv9zrIKavx708kVIGv
	v5RJ1rgC3sMChXOsV9ymeiHOv+2zW/uVjG2OwR7ftsJa0gh/ZL9r1Dtxq8Oy9RL33TDAxLA3yIN
	hwnnC/WQiZWTiTfvIDHwUlgPbh4tLiHkN6EpgFJrFUlW198DEkimtrHUGqh7Jk/SSu3CM60QHJw
	TAJxsXq16MtZ3o0+t5uOPQVc/yGhbuCq9MAU54fBVN8SYMNPxdXsdvz234=
X-Google-Smtp-Source: AGHT+IGisD41W8JWQL0CRagYb+y8h32KJubs/kv1Im6KAp/oPQgc5CVL6cwTewm1uromHqSrkCtayQ==
X-Received: by 2002:a2e:a9aa:0:b0:300:3307:389f with SMTP id 38308e7fff4ca-3046992f1admr99464301fa.0.1735570709482;
        Mon, 30 Dec 2024 06:58:29 -0800 (PST)
Received: from JetTurbine.homenetwork ([2a0e:e6c0:20d3:2100::1d])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b096026sm34385111fa.118.2024.12.30.06.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 06:58:29 -0800 (PST)
From: Ivan Sergeev <ivan8215145640@gmail.com>
Subject: [PATCH v4 0/2] arm64: dts: rockchip: Add BigTreeTech CB2 and Pi2
Date: Mon, 30 Dec 2024 17:58:17 +0300
Message-Id: <20241230-bigtreetech-cb2-v4-0-26d2d30e07ce@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAm1cmcC/2WNywrCMBBFf6XM2kjzaDWu/A/pokkn6YB9kISgl
 P67seDK5Tlwz90gYiCMcKs2CJgp0jIXUKcK7NjPHhkNhUHUQnEhFDPkU0BMaEdmjWD8qpUyUmn
 NWyirNaCj11F8dIVHimkJ7+Mgy6/9tS5/rSxZzTS3TdP2g3UO737q6Xm2ywTdvu8fRpaJLK4AA
 AA=
X-Change-ID: 20241224-bigtreetech-cb2-18944b349916
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ivan Sergeev <ivan8215145640@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2054;
 i=ivan8215145640@gmail.com; h=from:subject:message-id;
 bh=Py96Wx48lY3hRsIyqeH2EhpYqRG2BTz9NWChJmCaiTw=;
 b=owEBbQKS/ZANAwAIAbzfXRlQM5b9AcsmYgBncrUUjViQ8YeoRGDVrpipb2cirggY3zHBYXfq1
 F1YqXzgGB+JAjMEAAEIAB0WIQROCZtApKFz1fvvsOS8310ZUDOW/QUCZ3K1FAAKCRC8310ZUDOW
 /Zh0EACqWeR9kBxbCloxRP0afh3Pza+g+dUcWrZ1L/EHmNo5XgPb1ZQT+04ziChglPu4vq4Jzuv
 BjxfxJVerl9KLj7oMSFj+MJJIWHe0a59tGZG8D+uiIPkFO+OmaYeGVrEROEl+miwAyh6ndIKLhi
 TMy/1f4cJEo3LnBcELpv/ixS3POM2rmEStqCruhTkmmTmpwjk/Ia5gvzGAQTHAJvH7FAAw3zm7H
 cprsp1gj+K8QSB+0UBr+eo+Ui3hMvlJdLTTe+ZetIIFXfjda/ubZkd5TCnRPBJO1wXlzbZ2k6JB
 5mLe9PhLk6MWgc+ateTySzGxEp2BBb8p4y/OJMvXdG9BDFRbMHE9bt3fpNof0RulkFHWZ5EWzDK
 3W72ki7ugASlsHDNvGkRaxLtnFzjh9DVzHyBcKN4GV/jtWrLbFanviLGw/QU/pDpMKZWQb+8m6v
 nQ8YozhPAsw0skXXUYkfvxtqCuf83aMGktYyDA4ieskviJ/8duJqklC/CllcGitUCRJ/el6d9ZS
 /hVRvIrUHBEcm4i2oNveCftLIPB5+dE17BZREKAypEOKjdhLG/DwrAb20jRBfqAsAhTULAcOHra
 7GfqJQAuBK/4t3xfWn4e0EIe87aAHNZXsY3TVTglovzhpGcEhoJ3RFKUsUCWY5GTL0n0MUpF4Y9
 2E9WHi8t+wwnCkQ==
X-Developer-Key: i=ivan8215145640@gmail.com; a=openpgp;
 fpr=4E099B40A4A173D5FBEFB0E4BCDF5D19503396FD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_065832_023745_91ABCC31 
X-CRM114-Status: GOOD (  10.56  )
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
 .../boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi  | 943 +++++++++++++++++++++
 .../boot/dts/rockchip/rk3566-bigtreetech-pi2.dts   |  10 +
 5 files changed, 976 insertions(+)
---
base-commit: d6ef8b40d075c425f548002d2f35ae3f06e9cf96
change-id: 20241224-bigtreetech-cb2-18944b349916

Best regards,
-- 
Ivan Sergeev <ivan8215145640@gmail.com>


