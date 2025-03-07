Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E10BC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 10:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8Kp75eNva9FFtHsXA+rrxjkWgcyYqWzjsrKEbu5VZoQ=; b=n8RzbQmyHGImOylzzA+MUgVoQ1
	2IKhG2ENQWlhj1YcAhEd59OJ5+icV3Nat1mrJz769UHI0Y98OlGnAz7cvVSaOK2TTSLmpV0+jnu/S
	7N7yis2VGiGFj7eKgWXCQfbru5qyk8ibQ8aQhl/2M+napyfjv8UnbVVcepxLTJc7yWImpZZK2bD8Z
	B2VeLBGSQVZVTlgGIH8l99ga4LoQI270+cT69ynwnJjKxeg8T081sJYotGiRfTc+5FQ/WX4J3p7ry
	J5NKfFktxSd+lfysnhNlHSdV40HRiih+KGjQcpCQOSakI3P6VnB2/p4vANIXRetwgS00pMgOCk7tC
	agFH6xmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqUYN-0000000DnLV-3VgH;
	Fri, 07 Mar 2025 10:03:39 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqUV9-0000000DmSS-2kJu;
	Fri, 07 Mar 2025 10:00:20 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:3300:467f:62a0:f2ba:1721])
	by smtp.qiye.163.com (Hmail) with ESMTP id d586ba78;
	Fri, 7 Mar 2025 18:00:11 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Yao Zi <ziyao@disroot.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v3 0/1] arm64: dts: rockchip: enable SCMI clk for RK3528 SoC
Date: Fri,  7 Mar 2025 18:00:07 +0800
Message-Id: <20250307100008.789129-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHh5NVkkYQ05ISU0fTE5CS1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQUhIS0tBT01MHUFNSRpLQR1JGRpBSkxJSllXWRYaDx
	IVHRRZQVlPS0hVSktISk5MTlVKS0tVSkJLS1kG
X-HM-Tid: 0a95700c562a03a2kunmd586ba78
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6P006Sxw5CzJILjZRNyo2OAo6
	Pk0wCTZVSlVKTE9KSE9KTUpJTUhDVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBSEhLS0FPTUwdQU1JGktBHUkZGkFKTElKWVdZCAFZQUJKTzcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_020019_867371_955ECB0E 
X-CRM114-Status: UNSURE (   4.64  )
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

Same as RK3568, RK3528 uses SCMI clk instead of standard ARMCLK.
Add SCMI clk for CPU, GPU and RNG will also use it.

dmesg:
[    0.061333] scmi_core: SCMI protocol bus registered
[    0.125780] scmi_protocol scmi_dev.1: Enabled polling mode TX channel - prot_id:16
[    0.126628] arm-scmi firmware:scmi: SCMI Notifications - Core Enabled.
[    0.127233] arm-scmi firmware:scmi: SCMI Protocol v2.0 'rockchip:' Firmware version 0x0

CPU frequency: ~# mhz
count=611657 us50=19994 us250=99945 diff=79951 cpu_MHz=1530.080

Changes in v3:
  Remove unnecessary assigned-clocks

Changes in v2:
  Change sram to reserved-memory

Chukun Pan (1):
  arm64: dts: rockchip: enable SCMI clk for RK3528 SoC

Chukun Pan (1):
  arm64: dts: rockchip: enable SCMI clk for RK3528 SoC

 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 31 ++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

-- 
2.25.1


