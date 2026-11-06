Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA673606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 03:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gbX/KqLI;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eFI67QEn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6pgUzHBMcni0x6QQo/FZyS4Wix+7yma0HG0CtbjYw9s=; b=gbX/KqLIP6rO/X
	vRMLU+oc2NWG75cYJm4iy+fmhHEOymHw77wahNqPdfsKN1JTKGAdLxjzHU4adZwDUTRznZE8rWLhL
	vMafLjE7vXU6TUAoWx/KkTFpHpNsRezuA6NhbvwbtonoJ5OXLA7yttv4DDupcLv8aBSbNl3du07hw
	jcD/JTf+AYV3fpUA2WnFBw/pTOxuP3Jf3U9Nuol/cln2RQmkes6b/7U6jVR04wu0wvdua5NsFHIFn
	OnZOUBgcT0MjMrp12iIsYrb72gQ3uvgbmnbZH7AJiI7N92zh4JsGFV9888/chO0tP4vhL8jqRGEmx
	ktZ80P7PlMquFS+eE6NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPAF4-0000000B8PT-4ALQ;
	Fri, 06 Nov 2026 03:03:50 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPAF3-0000000B8Oj-0MVR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 03:03:50 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ed1b9e8f43so628115ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 19:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793934228; x=1794539028; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6pgUzHBMcni0x6QQo/FZyS4Wix+7yma0HG0CtbjYw9s=;
        b=eFI67QEnIwUhwkSlUTBMoCHfiHKho1XqkXh0u1yT/iX6VeYhVkr5pdT7+YkwcVeJ+1
         xGlf9Fp9HsWE40gjTDJashpnfDCgorCwCw4Cv88nhbM8FH89TjwjNA1+5m1b6snNvt7a
         vqsjrKw5FU0gYpkXVFUPxmD4y+icnYSkAAMtjsSlC1QRcHCWawJjDHTXYwpeoe1b55c+
         +RlEDoxMj3T2q8XkzXEgrvXYfoUHgcPg3kYFrC+Wk74eaoVAb7IeTTaT75r0ub5hIAYA
         o9OCoxCzWXhzs0nzMiaeH/itRWpyCpx8KZk62h0HaNjPwdM7U7NngCLnQWWomZMVGw6Y
         JVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934228; x=1794539028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6pgUzHBMcni0x6QQo/FZyS4Wix+7yma0HG0CtbjYw9s=;
        b=sf4VON8Z2dkXoEIJN3Md8xU0WQWWVgp2ypnUuTw+8p/qveRt8RbnzbKDB8lVCQtvoV
         BXt+eY966cJvWcsP5GpiUmWRgzDkYaHU4RyOiSLtZkJNBQm+d/sT0GVeURYgN09dv/FQ
         BBD7eAOEPHyYXOOPUw6/tXX7H3WMI7YhsMl2FazvOd/gW5rHawudWIB8sBrnJxyNDrVz
         47GuHju6PFtxc0D1x2sCO2VXeXlqUSLJ61DJEuE78KGNPDKcvyAFx4toJnNqVujEUiY8
         PT/uaFlZ7zjwBJjpAvuc7s0iagPTyu5tsuFFlSu+Q/Mj0wUS7jTOVkMJhcV4ib1KljRY
         JZ1A==
X-Forwarded-Encrypted: i=1; AL+hErE+wk3iN3Cl2TJNi3WZSG8dogF2rAj/nE/ruMlQ4+E52IhyP9PkaqQFpccJVttrxUHOqW38BS93zmEPf1H4zLA+@lists.infradead.org
X-Gm-Message-State: APuU4Z/+GMI2TIyfi0pFmGuE5kHZzrxndGfHad2lwjb9jWQOs/03isYJ
	aJqwh7TMAzJl6ua5jZm7D6sz2t5h8Qal4UtvWDImSQQQ4iEJ0MSLPg1zDJmwLA==
X-Gm-Gg: AYBFou375uLYmH4Di6QBnr+dc3Qn8TiTucbwN6Egbw+pw3HWNjAH29xtZpdv0ttb/NE
	vWoWCSqTu556zx6fUB2bu9nz7C5eJpvwi/Tv3STWK1uxRa1NUIZSA72Xr9w+oxBw40PdJXRBXmn
	ak0J1qTtn6d8yQij781nvxA7yvfNIH+UEWRL/5BOzTW8oYk6lruzn8EiWVM+HUiyHy8rJdOez0U
	RbJO2FfedsEZHGn9fg3epyOnFp+tsfWu2wqkWqhbGf+5QO0Dg6fbQKynZZVk++Gf6mo/Mo6CQMK
	Dlk4WiPqc0Sq17EkRm9Q5453uGr1bPEclhDSEnPP7bzQUGD7aGD7qbqf9uEFY3z/V2ZN9tbqfCP
	zWLzdcRYWhCXwsvEfNMkAp1Vaoe9wmD9Zv9JGBkZ0wtUq48BctAVFhRfr4abLOVTt69JcuuRm7M
	n2ps8E+fxIJJt2LqCXPSXT9FAwuU8tNcb9VG/cJz9MPq9rD1wpSojfv5LvS2DCeYMGyVBYCf1zR
	kYAzvmEQu5q+PorK4TTbazrQrRx5MBCldwqsePBButZu2wGjXdK24XkJEae+5sE8OU5NDLCSvt7
	ehUcsi6XvInqqTml4ep7kf8ABLKMozcRmqF9VzXgk3oWKpTfTm0nyZDAkrKq0gyeb4zuMcLE2Es
	WzGRX9h+mO2c3mgM=
X-Received: by 2002:a17:90b:3950:b0:3b0:92b2:2e74 with SMTP id 98e67ed59e1d1-3b0db6f6c35mr1062138a91.62.1793934228109;
        Thu, 05 Nov 2026 19:03:48 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70a04a39sm118179a12.15.2026.11.05.19.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:03:46 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Fri, 06 Nov 2026 11:08:04 +0800
Subject: [PATCH 3/3] ARM: dts: aspeed: ventura2: Name the USB-UART bridge
 reset GPIOs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-ventura2-dts-update-v1-3-b085ece9bf57@gmail.com>
References: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
In-Reply-To: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=JErXBRcaQqttTRbJYkhlXXvroT4ugDdSkuI4a3TfxsQ=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq7USWOSM+Se8JtxUUwtmuKQLlZfQThISypYBKs
 cRvRTZN/aiJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCau1ElgAKCRClg0K3CVbE
 gTnNB/9gX6LuenOCksACETKUVDRyzmW1xPaQiXCUzc3TTNnKY5mK80xYSM49pNtveFr/8gL9L1A
 4ZTufnTHOb/E1VsKBVmkHFP3tWQSskkBAlnMrvXeOd3N+edRLpX63+IKV+eKhChv6SxYyZmc+u3
 zEi27kslPErTUrWnjUKy2O8vpSLYLBLw3NOHCo/nweTGmxqnMat8zZwPczvXM9kS/b9HROaXEiN
 p9E6HlSi8G3q/mdZreGKcID0wHtwd/VagH7BxR4E+tLjYnpX2VVGiblyJa9VgBSu8RnDRyJPyVz
 3t+HZ4TLKxdxa2ruyituo3pcO5ZAB3zSAPQ/hO//B75hvGtd
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_190349_136364_77F45E9E 
X-CRM114-Status: GOOD (  11.53  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Lines 2-4 of the PCA9555 at address 0x20 on I2C bus 6 drive the reset
of the three USB-to-UART bridges. Name them RST_FT4232_{1,2,3}_BMC_N_R
after the schematic nets so userspace can reset the bridges.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
index a9c5990ef969..af26256f19f4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
@@ -1937,8 +1937,8 @@ gpio@20 {
 
 		gpio-line-names =
 			"", "",
-			"", "",
-			"", "PRSNT_FANBP_0_PWR_N",
+			"RST_FT4232_1_BMC_N_R", "RST_FT4232_2_BMC_N_R",
+			"RST_FT4232_3_BMC_N_R", "PRSNT_FANBP_0_PWR_N",
 			"PRSNT_FANBP_0_SIG_N", "PRSNT_POE_PWR_N",
 			"PRSNT_POE_SIG_N", "",
 			"PWRGD_P3V3_ISO_POE_BMC_R", "",

-- 
2.34.1


