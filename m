Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AA3CA0EDB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 21:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UDpZ/uLV4xgn4kCXyhg6m1oHwpXbM6/gIBFZ0zY+grE=; b=2IYBu4s00k/HZz
	ihcn44BqmWbAVwkqH2+6u0gavtIilCHvyhOsXMInnptg4dYGscpekF3G1DZ5IF0TRk0o3Kuhg4JvG
	Hw+cLUesCZDEB0VFHh7cRvZouomE/3oc1MnFgLuZMPX6yquYBuMhxkSOpeKrJbcv/lt7mxqDNXZy4
	yleEe92ioiGRXEKhfg7w4FyMrX7keW728l5IVBxI5SoPix0Gcms0+nm0ThQ14/2tZrIcIH8sTkl/u
	2RPtjnYh/Y/NTevpLzQK38r5eFhSXuw/a2ms/qXTt5LkUjJ8MnuBvWwlXd8X3vyEvK3lBasLnPvpy
	ylhTabpF+vrnCuBsvn+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulwHs-0000000C1fX-3Zr4;
	Tue, 12 Aug 2025 21:12:04 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulvde-0000000BwPT-2THM;
	Tue, 12 Aug 2025 20:30:31 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-af91a6b7a06so994826666b.2;
        Tue, 12 Aug 2025 13:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755030628; x=1755635428; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UDpZ/uLV4xgn4kCXyhg6m1oHwpXbM6/gIBFZ0zY+grE=;
        b=Xpc2gyFgplVLLj52ruZp0SsjdoWK8yc6gEQRxhryHJdQkv0GTsfa7IVAop1/R0O8qn
         onmk965qJCSENHROv7ZXXg4vFgb3eqKyPBvlUkvQzrIOj3HM23sdDGkUZF3W3I1kw0CC
         bpmyGRTwguJoF17fgw9sf5t5Jjf6G0F4ygvdI281xrxX6fsuw3jAadY7WgaqkuHwuuG9
         7nodFWGkCKAE3CAwfPRd+3Py6X6YXFsGgLFpjC2of1+qrZ6b77vJeqRJ0Sjrh3mXkaQe
         YD+hbW5AGWg2NiNzglKWZEZFCCwMkASA/ITwt1jmDbnXt6TTnnEEl949EgIgua89q4Do
         FHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755030628; x=1755635428;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UDpZ/uLV4xgn4kCXyhg6m1oHwpXbM6/gIBFZ0zY+grE=;
        b=IfmJ2s+WU84aYul/D8K6ZF/w5wntAVQdi+Ja0tSOkivq5YDlHHsyy/IVYePAeiW1y9
         /s3G+PoU3l+RhYZ5fM1EuIzaI+gKiCEM9YiWOgPphxhWmQz3nSH845dd5EWk1BdV9hUd
         bE+PcxkNYvo40Zb+etWhL/zbzjVbQOglGyCMv44081xCrOs9XcagWUwfZWaIsYocXWDg
         d83hYg2CY5LeHA0LTBrrSmYpkdQ0uHwDyWe8rfr4YU8oYxhFNJPryyeW/YhcQEK+hwde
         Nii7TPN75rKtAqAET45K0/m/BwehffsAZMGCkeFmNCf9oga8gih1e2HR9ctmtWbVzAgf
         na4w==
X-Forwarded-Encrypted: i=1; AJvYcCUhORUyuIevZDUNrH6QJWFIttkVgzNU6FurP066IW9owNkJH1v6wgFWm4OZkVOvoFGEIh4JSwXAuhiN7PiO+gE=@lists.infradead.org, AJvYcCXyd38pRZ10eaIGhMafiMp/TAwtqyIDj0IqmmN3QvEqyg0IvAbZ1SX3Kpo2pw/qjQi3FR7HeQtExltr9sIg+/Hx@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf3/N9z8h8OHqcP3eb5w8+iToSMOkG4qQnq+WRwaH4dBdW30ul
	Cqv5tDtJ7uENwGHWgNg4aevxhUoEOjXiX3+zRvX+3bSohoEj+Fq+SRrL1oYbMnTa8/c=
X-Gm-Gg: ASbGncu+dkztT340hMEeWqOrvq8PhbOGMXqbA3XW69udTGQKkP44yhVWJjjhh0jAWT+
	gTKG/I4+waVNzmdGUYiKdhIWOovRSbcnxJuLHJFdN7FoCgs3DmwXmxEzl1PHqjQZkVZPoziJ6Bf
	nXJuaN8wbckcVklnHv1zJO71bGGfTRvZpoQyua0koPL63KTuzt4M8vK7eToXZMnI5LTucJWVDvC
	o+Nt+oFc24k1asvEh5XeD2MWRhH/xSAiJk8L3cJFlS1c3yrSsxsLhapqhYSwPkTVMErl74EF3Y8
	a2n7I527hpRASt8MvLmXuXlFwSDxzxSLKmqIV8sf1621ZWqLABUNKl+ElC5mRQMKhgz/njyqPUw
	YowayLp2bhnDqULDJJknIQ/+AwREpjsj5zUBp/K1XAP2bAZtTM6o=
X-Google-Smtp-Source: AGHT+IE8qPYJK5nv9hP6mJhBYPJdtTcVBRcIuezef0tNEf/XrB7lXj0liRGKyKHHW8hVebGuWOnP2g==
X-Received: by 2002:a17:907:1b13:b0:afa:1a67:c046 with SMTP id a640c23a62f3a-afca4cbb1c0mr54830066b.11.1755030627838;
        Tue, 12 Aug 2025 13:30:27 -0700 (PDT)
Received: from alchark-surface.localdomain ([185.213.155.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3b58sm2266073166b.58.2025.08.12.13.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:30:27 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH 0/3] arm64: dts: rockchip: Enable RTC, WiFi and Bluetooth
 on RK3576 EVB1
Date: Wed, 13 Aug 2025 00:30:22 +0400
Message-Id: <20250813-evb1-rtcwifibt-v1-0-d13c83422971@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF+km2gC/x3MQQqAIBBA0avIrBPU0qSrRAutsWZjoVJBdPek5
 Vv8/0DGRJhhYA8kPCnTHitkw2DeXFyR01INSigtrDAcTy95KvNFgXzhru2kFr3RdtFQoyNhoPs
 fjtP7fqGDmURgAAAA
X-Change-ID: 20250806-evb1-rtcwifibt-a341507658d5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Pavel Zhovner <pavel@flipperdevices.com>, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755030626; l=1045;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=DPUg/AoorRxu3yhwbYOhHRtH0CbbSLCxMzRYqdsDRVU=;
 b=olIxr2X1rvA6OPvIHjWNujq7kqoN3cBugQA6uDhbvCgzXX49DIhFHYGpp25HJaliyfIbItPBh
 9GeZmMsbRDNAsn+459X9Obgn6qN1H6ZX9a+K5vr0zTjK5oFDsVtaNMo
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_133030_629405_22846CC2 
X-CRM114-Status: UNSURE (   8.37  )
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

Rockchip RK3576 EVB1 boards follow the usual Rockchip design pattern
with the I2C connected RTC chip feeding a 32 kHz LPO clock to the
onboard Ampak AP6275P combo WiFi/BT module. In this case the WiFi
part is connected by a PCIe link and BT over UART.

Add required DT nodes to enable them.

The board also has a connector for an external WiFi/BT module, which
is out of scope for this series. There is also a PCM connection from
SAI2 M0 to the Bluetooth module, which is also left out for now.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Alexey Charkov (3):
      arm64: dts: rockchip: Add RTC on rk3576-evb1-v10
      arm64: dts: rockchip: Add WiFi on rk3576-evb1-v10
      arm64: dts: rockchip: Add Bluetooth on rk3576-evb1-v10

 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 115 +++++++++++++++++++++++
 1 file changed, 115 insertions(+)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250806-evb1-rtcwifibt-a341507658d5

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


