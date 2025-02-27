Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D70C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 00:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5qldtwKTOk2lyY9k2JiKh0YOeGWKV3wOOQCJvRufmo=; b=YQLz2s0zZosHxkMAMR0yxgtX80
	+vISyj5q01TNWRdVxQu79oaLUMyTNu6if+9F2sqxdckNld7HRU7EB339lESwQ27nPs0a93wQ0GrXd
	bDPETlaGO8+k82AywAKMYsNapJkfe+Jw2KxXt9rpV6opfbEqDgBm8V/dDYLaSVL+RljRuTJmskIy9
	FWoCnSxi4/es6uyOXBvnXrPOnDlHAtPvNkdFCAvhduEOzNFDnnCLnimMLjRD1+YVL9qEbdG2msMP3
	0Kwzik+YGmb4imNBlgRHe2rLHkaKCcQnMdSKFsL7MQbS1GUpy4pyl88Ch/fgXUC/OjQX+4//PwdYb
	TYdxQrfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnnp9-00000009E6I-494g;
	Fri, 28 Feb 2025 00:01:51 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnnkV-00000009DZG-2c6X;
	Thu, 27 Feb 2025 23:57:12 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-727388e8f6cso760485a34.0;
        Thu, 27 Feb 2025 15:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740700622; x=1741305422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5qldtwKTOk2lyY9k2JiKh0YOeGWKV3wOOQCJvRufmo=;
        b=dPdlfZDa2W/GIMcPtK2QU+UTQ8GCSvIGSYqPezWOMSBuRUNhwL4PjEMBuRTkKX8UOC
         C9ec4yjtT9ck1JIZnQ30Br9KnhVdMBG5FbdtcYmZW/MJc0kOZ3Y1HACQ1WCWPmteI+Ox
         jATRHoPEnUYPx+Khw4keJo625NJbWgw9i+6Hkk/Z+cI6TDAVWe1Ju3HfqkqPTTJTbFyH
         pWPS0ga4CWIoOy3ddIMRfNdVEkyocQAXbF7P+kfd7FoZPlIYW7DZkfSajxPbirjoFmyW
         JiKBBqWb4zngySNrdoY+4n7pZYv/pSgwF7f3RYfx0hfc65Lhj76oX/WCZ6Reb01DeE35
         GF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740700622; x=1741305422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5qldtwKTOk2lyY9k2JiKh0YOeGWKV3wOOQCJvRufmo=;
        b=R35TwdsJfG+Z+ZPHy1Q5Q9rc/5xFBK/ccmJ5/J3xghapEa3aOKOVjHvhFldt3YbM8F
         5SxO0V0rP/I0DoMl4X/Zq0aFUMlbBpg7nxUCRlZfoJ0mcPxH7WeUXpWXn/wOpV8won4f
         XLEq3CBV7PMxaAg3v1vGHF5ZgeNSea3UffMPQEDF5y+uNCm3/uF7yjOTwlrryrUAumMS
         wEDeuG1IV3Yttefvkmx8mAjI94iwL7Cwm8IkmxJifbhudvmvEkQqRuTmTMaD9IUeW/qR
         XGTtiFC1HqEjH9R+ENhq96ouL1YAQJclPLIhiltqzrtSTkU023Mjgnr7HHAJtF3yeYp/
         E3Ww==
X-Forwarded-Encrypted: i=1; AJvYcCVYId67aCEJ8v0ORoyJhp1o6yrGUmtHcyw/HRZbujF0OnwWANdaki4o9a2cvfgYFHMsmqk9vGSJ2V2VCMxzOdMd@lists.infradead.org, AJvYcCVznwfx5SqPLjgX7IWhCG7s3ksiWNIAjIBc4j1/eO8ZKYYYyF3zsZpEkhxn/GRhcOOsN7oE58wjK/oOWis4Mg0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd6AnynXpCj1thlo8PBExXkoQm9rM6rqJWyKIn2HT2VcCzicjx
	7+mF0Y5DZ6OnXuqi1tf5w4osQ2fBovu0qFrxpGhLTAHe6QcgE8Q5
X-Gm-Gg: ASbGncssGMNhdV/Obm672RiEbHl2QyagpiUctkILZx2Etdx/1jHSHz0uRT6ObA7YNbv
	yFdaJrOm73NeRVuP+2RyAKXJh98dtwIVUSgO4wPfzCPugBMMfHxijj7OKXIcABBYYvARKVaszev
	KML4L9U1S8oVeGUztioBIvu6lblEgKJSh6ezBRA2RX5eR3CU/2JJuhMcaq2ChQMZnYkkvGkgQOF
	6tzvBG7mWtgkTbnj7zAKLzHUL7v6LtnP7SAYbCRe1t6f2gTKodHBr4YkQVGOx4yMTUdo98wI1U6
	24YJoC8yYV2cLgE/CgnNr5FPmEyfVuNp7is=
X-Google-Smtp-Source: AGHT+IGEdHKwS2hSSdb/fkXNu1lxMp/LqiB34cBRPY7akjBzyiDCblI/9TJhTawmjo7GuyZgfRQ+1g==
X-Received: by 2002:a05:6830:2784:b0:727:2b73:cbbb with SMTP id 46e09a7af769-728b8286a11mr661836a34.12.1740700622642;
        Thu, 27 Feb 2025 15:57:02 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:87c8:8ae4:f338:6188])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-728afd7694fsm443893a34.50.2025.02.27.15.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 15:57:02 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Cenk Uluisik <cenk.uluisik@googlemail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Florian Klink <flokli@flokli.de>,
	Muhammed Efe Cetin <efectn@protonmail.com>,
	Ondrej Jirman <megi@xff.cz>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH 2/4] arm64: dts: rockchip: Enable HDMI audio outputs for Orange Pi 5 Max
Date: Thu, 27 Feb 2025 17:56:21 -0600
Message-ID: <20250227235623.1624-3-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227235623.1624-1-honyuenkwun@gmail.com>
References: <20250227235623.1624-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_155703_658163_D2181622 
X-CRM114-Status: UNSURE (   9.67  )
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

HDMI audio is available on the Orange Pi 5 Max HDMI TX ports.
Enable it for both ports.

Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
 .../boot/dts/rockchip/rk3588-orangepi-5-max.dts  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
index be8cc96b5308..8b1d35760c3b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
@@ -50,6 +50,10 @@ hdmi0_out_con: endpoint {
 	};
 };
 
+&hdmi0_sound {
+	status = "okay";
+};
+
 &hdmi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&hdmim0_tx1_cec &hdmim0_tx1_hpd
@@ -69,6 +73,10 @@ hdmi1_out_con: endpoint {
 	};
 };
 
+&hdmi1_sound {
+	status = "okay";
+};
+
 &hdptxphy0 {
 	status = "okay";
 };
@@ -77,6 +85,14 @@ &hdptxphy1 {
 	status = "okay";
 };
 
+&i2s5_8ch {
+	status = "okay";
+};
+
+&i2s6_8ch {
+	status = "okay";
+};
+
 &led_blue_pwm {
 	pwms = <&pwm4 0 25000 0>;
 };
-- 
2.48.1


