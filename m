Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90F6CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 04:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3QZn1YoSh3Q8XHPm793CBLJp8xovUxZX6zix9L2ZwO8=; b=szglKm97xEIPdwzBlYxZWu6E2y
	1ZuM1OE+pSBUPBrSXoFXmz4VVkGYK4lwqbL6qdEHc2LxRXasm4+FTe1/w93Ewh6cJnSbMmLEWrrp+
	W5ukZeFzKF4nMCzTj+gWk7psIXN7CBn/TH1ziE0QvqD/uDXpJsxnUqXR2EVP9Kf/LUdIBortktXU6
	uaYRRyxKAHgsFgZBh/1VoEbD422+TnWhhmxyAWW6jgbcxGNG39gQixeWzM/yTvum4KNrkTr1m3iHR
	3iFGyvpIjS8JOYKz3RTBLOV31Vz9jCuB1S84ieltorKPDUSCMKXMR1PZrThC2UUREcJqJZaAfh3qf
	mgc/k8Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uowop-0000000FmEV-3f7f;
	Thu, 21 Aug 2025 04:22:31 +0000
Received: from smx-b.mailgw.jp ([210.171.6.216] helo=rmx-b.mailgw.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uowmC-0000000Fm5q-1jdA;
	Thu, 21 Aug 2025 04:19:50 +0000
Received: from bccml.bai.ne.jp (bccml-a.bai.ne.jp [210.171.3.161])
	by rmx-b.mailgw.jp  with ESMTP id 57L4JXgl015567-57L4JXgm015567;
	Thu, 21 Aug 2025 13:19:33 +0900
Received: from subuntu-desktop.bai.ne.jp (bai859bcd79.bai.ne.jp [133.155.205.121])
	by bccml.bai.ne.jp (Postfix) with ESMTPA id A30E88054A;
	Thu, 21 Aug 2025 13:19:32 +0900 (JST)
From: Hide Hako <opi5plus@bcc.bai.ne.jp>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Hide Hako <opi5plus@bcc.bai.ne.jp>
Subject: [PATCH] rm64: dts: rockchip: Enables sound output from the audio jack on OrangePI5 Plus
Date: Thu, 21 Aug 2025 13:15:56 +0900
Message-ID: <20250821041555.4781-2-opi5plus@bcc.bai.ne.jp>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FE-Last-Public-Client-IP: 210.171.3.161
X-FE-Envelope-From: opi5plus@bcc.bai.ne.jp
X-FE-Policy-ID: 3:1:23:SYSTEM, 3:1:2:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=bcc.bai.ne.jp; s=20240516; c=relaxed/relaxed;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=3QZn1YoSh3Q8XHPm793CBLJp8xovUxZX6zix9L2ZwO8=;
 b=Lf/6EaDsG+DNeeEUuOTYCYh93mbMnyyB0JgnHvmdHs6iK5EG7bxI4axBZp2NNPY4p6ZjTA2VxO5V
	KdCBgCSXAYoH1wCwuldMT5q349AuPHkzMNgbMlYSKt0o7M2VX/5JE8Tjfvi6dldZO7BUWZH4dYH9
	5uQu2EOHWL3WXQScftjkwmJIiPueEz5BN6epWMds410OltS0o+zjmFaLcJAzJh2ol4bHzr+NWXRP
	iN94S6DLb1j71EB/+cWl31nDM9hYEXAACoDJtLJEfRWYIy6H2aNopZBocFDQsskaVzN8/LzTe9Xd
	n7ADw1LkGUr5o7OijPL/J6kMkMMiUivDAWt0kg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_211949_024021_11B454D6 
X-CRM114-Status: UNSURE (   8.35  )
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

Currently, analog sound is not output from the audio jack.
This patch allows you to select analog headphones in alsamixer.
Works with kernel 6.16.1, but not 6.17.

Signed-off-by: Hide Hako <opi5plus@bcc.bai.ne.jp>
---
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
index 91d56c34a..656aac2df 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
@@ -113,6 +113,7 @@ analog_sound: sound {
 		simple-audio-card,mclk-fs = <256>;
 		simple-audio-card,bitclock-master = <&daicpu>;
 		simple-audio-card,frame-master = <&daicpu>;
+		simple-audio-card,pin-switches = "Headphones";
 		/*TODO: SARADC_IN3 is used as MIC detection / key input */
 
 		daicpu: simple-audio-card,cpu {
-- 
2.48.1


