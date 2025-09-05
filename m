Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2DECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 17:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ixXcdqyuNr1VgQXgWjsF1xkuEAC5opz8oCbKicjrwI=; b=PIB0/pQAizy1GjwQgpEvUK24yw
	AcLqBtATs6uhO9tIy/KxL8+IDRhP57aa/RfFfENa60llAbQB14nj5WXLZbzDtz7KP9UP+JOJ8GEzy
	ssQBkyJlxxWrdVa163p3aRE1cr0/Ctf0GXQXydVQxTIRxQmJ7PTFC4p1MKrK3hWHLmx5uOu/+eS0A
	sR3KCs0lhD4e5NDUkpo4ag6vEwKwasqbgSxdkqG63F3D3Ie5oe7fY+I/XbrJvYw+hxQrrDmmMHyFz
	YTBmIs8wMfG0aDOs4xnmNCMj4OCZJcXdS++sZlAvOveB/f2Fa+ArOIdE8yQhTy4pgcS918Vj658qz
	wOZmLwxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uua8y-00000003RK4-17Ef;
	Fri, 05 Sep 2025 17:22:36 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuWRL-00000001xZD-1inK;
	Fri, 05 Sep 2025 13:25:20 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-24cdbeca71eso10145895ad.2;
        Fri, 05 Sep 2025 06:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757078719; x=1757683519; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ixXcdqyuNr1VgQXgWjsF1xkuEAC5opz8oCbKicjrwI=;
        b=MxbGBREgG/gZ1Z7O5sbE8E9DctcvbSCPOhjLzXVrNYuNd+46W20SmcN9ROa+Ea2NXP
         zMrY9KVlAhbvwZ6108epY8iQkBgzCrhMfs89Cw/7w9S35eHeo+sMpIzi7uQo+KvMiWpf
         txOT+fAdpYiEUPuVDKspcMLx2BZF9WSSfGvdEFl25rsfhRdJznoHX5GORUArIxo2XX0r
         cImlfEujE7ZUt4fazs1A7k10ueek9I/WzdScqitbd+UawoywINOjMedcbUaPeLpibIfW
         HJJuBT0yF+X2GaxSeJRWTQt2iXe1ij6ZHEkey2We7+B3o8NoBdVgvuq+4UqG8VxtGDUN
         Uubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757078719; x=1757683519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ixXcdqyuNr1VgQXgWjsF1xkuEAC5opz8oCbKicjrwI=;
        b=gXxfDgKVXmdrQWkMinS5sUMEk6buvUm8CzXgBxs2kPIVQBTz93ckpGn+uhwOsfOHqj
         R5mVAxN33wWinv1bAEzfE0QI7D6ue2yLoOH05Yh55qNfDry7NoVwNdmKP+ExS46dfVA/
         sq5yaADcYxpRuxmuBBoz6g0iWcH7yt1OuqOqXUvaOtdgmq07sL+giL83jsrU0NgiNqRw
         hmYrIGdhceda2AgUWol7aMBgWLlDQzwcfaV/Sypvws0B4RiTTlyT8h34akNLGwjbIYYc
         0IHv3h0tBjBS8l0ORHAFpoaI+0AKqQU+K1qKQ7s8gRhniifE26DmxHXgTrsp4YDrNCiQ
         PFsw==
X-Forwarded-Encrypted: i=1; AJvYcCVP9dVMQa/GFP9gUJFOMYdfih4bxkkqwZsioQBnATSjQ9mEybi6FaSniI5F7Vj1ul0N4ZtBI/TgTf04pvui0ww=@lists.infradead.org, AJvYcCWoTLA8wm4JJtamuddNnZCE5tcrknjIS4qQu8GJGB2por7w2Tbuyz4J817qkQ80J7GFDOwoV0B3gwUNTGil3vKf@lists.infradead.org
X-Gm-Message-State: AOJu0YxM77LVbooWVzA1O63GdI32OVBwTPO73lUthYLsnXlIUssOE0I7
	k/tSpqjwulbM6ULRZ71Ir/WAR3k9qZqTdkiv3aAn7zjNYIpJgD4MLZ7KbWffIsc1PV+/qeXu
X-Gm-Gg: ASbGncv4QRfqLUntKRvew4z4lxJSp98uqlN2WpbYKqlpBuC4elvaP24Q392xHiY8IDx
	8y8HDhZb1RqqfUyaYihisjeQ0Prw4g7iwnxIO9bZjQBdKAc2EGENfaPtFrvi2skhWcSzLRIf6D9
	bhgZqEGhznS3qzVfuqrfG0zb3Y51T9kpE96BDel/XIAueOIBOICZOctpJ2Sh/vHdnzux/S2+CHP
	LuZIvd0QkyqVkgLirBXziIq583Rc0uqjQ8hvOI4Ut1hCGHF4pavu62+Iwj1C4paZGPxgk+WEJHn
	TK/+Ncs+jpmyFhuzYKuOTniN47RSESM1SFlZzh/Hr7XZX1KWolLGfJKD0C9d0HQCkrvemfgjHck
	hJUd3QTgzhS+ya721WND0OQ==
X-Google-Smtp-Source: AGHT+IGL6dl25eU0xEnElNx+LVYolPJfhrDoa8h/iqZ5Qb9Zslkxe75tLPHNBliKx3Sf+xjeHY/XlQ==
X-Received: by 2002:a17:903:2ac4:b0:24a:d213:9e74 with SMTP id d9443c01a7336-24ad213a1aemr272621245ad.49.1757078718677;
        Fri, 05 Sep 2025 06:25:18 -0700 (PDT)
Received: from localhost.localdomain ([2401:ce20:10::d4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c8945d8d4sm76447955ad.127.2025.09.05.06.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 06:25:18 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v1 4/4] arm64: dts: rockchip: Assign I2S 8 channel clock for rk3368
Date: Fri,  5 Sep 2025 21:23:28 +0800
Message-ID: <20250905132328.9859-5-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250905132328.9859-1-cn.liweihao@gmail.com>
References: <20250905132328.9859-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_062519_453570_78991465 
X-CRM114-Status: UNSURE (   8.82  )
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

I2S 8CH needs assign correct clock to output frequency wanted. This
patch assign CLK_I2S_8CH_FRAC as CLK_I2S_8CH_PRE parents.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index cdcbc0a944..d931b5f5ac 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -862,6 +862,8 @@ i2s_8ch: i2s-8ch@ff898000 {
 		compatible = "rockchip,rk3368-i2s", "rockchip,rk3066-i2s";
 		reg = <0x0 0xff898000 0x0 0x1000>;
 		interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+		assigned-clocks =  <&cru CLK_I2S_8CH_PRE>;
+		assigned-clock-parents = <&cru CLK_I2S_8CH_FRAC>;
 		clock-names = "i2s_clk", "i2s_hclk";
 		clocks = <&cru SCLK_I2S_8CH>, <&cru HCLK_I2S_8CH>;
 		dmas = <&dmac_bus 0>, <&dmac_bus 1>;
-- 
2.39.5


