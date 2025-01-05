Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3026DE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 10:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YQnL1CsDryGpEfNY2xjHTFY3M6MWphFdJZgrXkZ2tRE=; b=QBzDy9Uxf7euQR
	2DJ/WRd1hKeM+V9qwdUhQB7AwipybQcApZMJxLzhpMeBeN38qsl+RbxdUnd76CP3apDSB/G8+Ytza
	g6K0s7bwY2E1332U5BYsSgqMoslOGFEGKB89KO3AR9S4BQYI/M398WEeL719GfoFWVrqgrr4/l7q7
	6Pgivm1O9KV5HdDYke8gHn6trVDzljZ5U+sAEbWNhSN+BFLvQ2HQPwLzdOS+/OMLPezu+pZSQsc6t
	itWLnrfuKQ8yFA5bY+KEvKf3QuLPbYamPrvruUi8hUaGnNaXIcNF93WXVtFQrGaTH+k6E7K9W8Bwb
	Dt5VRSZfwi6CJkXS40NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUO5S-0000000Gh2N-1YzS;
	Sun, 05 Jan 2025 10:42:26 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUO3d-0000000GgiC-1mGQ;
	Sun, 05 Jan 2025 10:40:34 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-3003c0c43c0so153998301fa.1;
        Sun, 05 Jan 2025 02:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736073631; x=1736678431; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YQnL1CsDryGpEfNY2xjHTFY3M6MWphFdJZgrXkZ2tRE=;
        b=TEdkP6/wcxebHL3KDgnlxFs+tBlIV64eLigIe11jE9sUV3bejPxIez1rix7oT0Olsp
         I+4wkFU6xqTyoVIS1ugC6mBYtqa1jGpgJLTRarYN5hmwADtaqa5ULnmzJ8fmIoyeAgZy
         92oYeNQ4oHivyTleSh8W2qeyIjAsqXCbF11yfuTyqSmB5uKcX4Godx5gGBJ3hm54pkjN
         Tnx/k9seLDib7J9vF+DfYLTlVPUdgG2+84jYeavdmpGOe1/GlYP9EHEP4Nqem7KSt7xu
         66gj7lB4ZIGUZyeF5MNN2+m+j7leJnDTFG9NNAxsptUylXzkFmZ51AMxkoceAURfG6DL
         oeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736073631; x=1736678431;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQnL1CsDryGpEfNY2xjHTFY3M6MWphFdJZgrXkZ2tRE=;
        b=Wq0y8VupSafIIrXLpYoz2fP2kudvrNqgzoQFq3KRedh1mMg2zsxFi9yHUbPY3u4aq1
         moAaED3LL8/mry36LznFPBKKIs+I5b7c7TyDjLOPeRqeixEoYln3ZsJlQZF0DUsAUBT7
         qScb063oPhVMK0k+uCjt71Ek9cxQtztUzyybXKoQHaVTvs7r0HQTjKj7XER0XTzH+OLb
         Sqm/fc+5bWVy9W7Cza4c5IdhLTR5KEQt7bS26mD4RBx4ySWoufpVWDqwxyjubeqbBUGq
         ERYCJ/+rJWLsWye3IxbJjLkHnK7vzKawEk9BO0juxSNkIy8MAn1O7nCVBtuUZUvlgmG0
         kJQw==
X-Forwarded-Encrypted: i=1; AJvYcCUU3GLx/vKkOjtDwuFmbeJTTPcltiTdY6l/bejjWo8UZhVTLfnVLcIObRlaEfsdi9H203wrr+lOAL+xldmkS2Ju@lists.infradead.org, AJvYcCXXIINZgTkwwUg9P413XM0c8OvFPE69NzNdkc72rHWQac2JDmjQZO4VTcb2qKv4MD2YuzZnZjyuP0qgbbBCBYs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxwvRi6MO69FIwVzacshD0c2NcryE4TqhIGK08rw/E4hNwV/U0L
	CZFjfPXQZhdSDa702kWw+K9V9SYKFtYd5oV4Bsv66wnMa2qEspA=
X-Gm-Gg: ASbGnctwUXBHC/C1nUwouCBd22JObdQdOCeqAr0wXPxksjmoRwD6OsmHsj6PWg5Pi0e
	+9WIHifaVWpNopzePHwYw7N/ir7NFrVH3Vw2Mjm9Tcj+Xr1svalnaSXWHMfAwOqQ3/9cRyEPQEx
	Wq4HZtApwCCTLvRzYcjCuvWObmj6KqxUM5amVVBTbOAQRwRgvMGutcX+39YqGw8wQDkRmAiIXNt
	luGzlkn6r61fwOI+zDj0+kwQoVT7AEBfQykRep3sJYQKQGvoL9Z3o/ryvc=
X-Google-Smtp-Source: AGHT+IERRIp3Y0UvWyRkwrMRr0BsZBIh8incTHBrB81DOY7dDuXDPWllfCz61KCJiCZEZ7Kv08qxVA==
X-Received: by 2002:a2e:a99b:0:b0:300:33b1:f0cb with SMTP id 38308e7fff4ca-30468552d25mr157497421fa.13.1736073631152;
        Sun, 05 Jan 2025 02:40:31 -0800 (PST)
Received: from JetTurbine.homenetwork ([2a0e:e6c0:20d3:2100::1d])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b082e01sm52248861fa.98.2025.01.05.02.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 02:40:30 -0800 (PST)
From: Ivan Sergeev <ivan8215145640@gmail.com>
Subject: [PATCH v6 0/2] arm64: dts: rockchip: Add BigTreeTech CB2 and Pi2
Date: Sun, 05 Jan 2025 13:40:29 +0300
Message-Id: <20250105-bigtreetech-cb2-v6-0-ee7bc9c4df46@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ1hemcC/2XNTQqDMBCG4atI1k2Z/GnTVe9RutBx1EDVkkhoE
 e/eKAiCy2/geWdmgbyjwO7ZzDxFF9w4pJFfMoZdObTEXZ02kyC1kFLzyrWTJ5oIO46V5OJmta6
 UtlbkLKmPp8Z9t+LzlXbnwjT63/YgqvW6t4pTKyoO3Ao0Ji9rbBp6tH3p3lcce7a2oj54BWevk
 5d5LWsFBAWevNm9AQHm7M36X6rGClEJQDj6ZVn+MUwRIC4BAAA=
X-Change-ID: 20241224-bigtreetech-cb2-18944b349916
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ivan Sergeev <ivan8215145640@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2471;
 i=ivan8215145640@gmail.com; h=from:subject:message-id;
 bh=uXgW7Mn1cwXHnXy7IQyPfZ4a16mCUartPFZEUilmAC0=;
 b=owEBbQKS/ZANAwAIAbzfXRlQM5b9AcsmYgBnemGe8uxT4HeY5mP53tFyzgFh5KJ1PPVbTs0yL
 iTaFrgJjvGJAjMEAAEIAB0WIQROCZtApKFz1fvvsOS8310ZUDOW/QUCZ3phngAKCRC8310ZUDOW
 /T4VD/9khYN+hbdrUMJLmbpnuZgHWmq9Tj+6qFfvNVhJiwTXjr5orGnMNqGkwPqH3/qH7y/u9eK
 Ns5/rC8/nEeJZVwjThM0X+9vmKjx/+JhILDAl3+MyWNB/KzclTu2unhm4EgBG6aV3+kfcrK1npL
 PPJTUsxmovNZ3QjFdujDhWmvGhpD/6e7LY3o7UT8Xt1cHEWlxPmvJwRbi3muBLZpvh3pCPWiQBS
 weY1i+kpJv5yrjkgDre1whdX86Phcn59ygk9DfrgbhzPZYqVXfKdbVTJL7EQDczvPvvbiINsOxF
 2d5JwhCJsydg6z7WAQLjqQNtg98X0wCSt98FTEAk7T3XkT9g49DvV4DgwWFdkwKC11ujDWQ0GP3
 Asdg7Sa/X5thDUbobYdSXVBHxXQJ0IyemJj3+HWKp8vkTvzp72W2FICmDIbAdttvxxCmUaRN9AQ
 oHMJ1NqILc/iciAc0rtzlP/35iARpoU5jBDa1VW6BMILIbs6xwbarel41CpblHPVesszMZ4dS4U
 UQRdeuDm89NSd6wCVIg7ulve6cvxBJBB0U7EBPzjLMY5fIhSykYY+2tn+1wEaCD3fsbYUobr4qm
 83m8TaaPX5BxE7TV3TLAwOBreXifusxbKEqP+t7Da6qtdlEY2WvwIu9kxfGTQW6m32ywRD3Khoc
 P/z2I8SLlTY1xMg==
X-Developer-Key: i=ivan8215145640@gmail.com; a=openpgp;
 fpr=4E099B40A4A173D5FBEFB0E4BCDF5D19503396FD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_024033_492189_8B8BADF2 
X-CRM114-Status: GOOD (  10.45  )
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
 .../boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi  | 919 +++++++++++++++++++++
 .../boot/dts/rockchip/rk3566-bigtreetech-pi2.dts   |  10 +
 5 files changed, 952 insertions(+)
---
base-commit: 63676eefb7a026d04b51dcb7aaf54f358517a2ec
change-id: 20241224-bigtreetech-cb2-18944b349916

Best regards,
-- 
Ivan Sergeev <ivan8215145640@gmail.com>


