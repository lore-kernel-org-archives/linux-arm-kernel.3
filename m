Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC36C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 13:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1o1hEI9ehFzjcmFIjKLUxGqLLuWtSgWzjdJQmZ5TVU=; b=Xm5NEUQztYQI82gSfTocJ5K2PS
	oB+5kgqdcvsQWIyUVab24u0qIYrPZPG6Hj1lJ3fVIz8ZBWctCUv6JFpFdrZ5b0wOibjvx8yeYfMO2
	kF6wx/qJDPfFr0Gh3rW6/ITkIklmiyX9EIMlAxYbSSxYxUQI6NBK4elAaBHfOmAJ0WkcOdiP0Oe2R
	bN3k8p4tGjdcVGvGGotf89FQEa91G513R2amCDP3FupbdXVGe2Wx+xqlVNf+uMt449YASd7LUfz2r
	bKMyPVvjlHR5NAOPDSnraA9VA/Lb+6XiwTnxcY3Arzt3CuYP4o0bfbLGXQ8P+Dusvk/07e9H36imM
	RNKxL3eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAU2T-0000000Fpjw-1mRn;
	Thu, 01 May 2025 13:33:21 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATz0-0000000FpDv-2ivB;
	Thu, 01 May 2025 13:29:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=D1o1hEI9ehFzjcmFIjKLUxGqLLuWtSgWzjdJQmZ5TVU=; b=mhB7DIOajWNSMuUcbfvMHL7kB8
	un6M7OMns1VYgULwqEMU0qZeYMnfGsiWTyUvRF/yDynCr0WQvA/JCVXjz6VFAUJ04l9bf6WopKwGt
	wG7SJ2F2yszv9CeyTwzAUD1UBs9hyPlOxMFTtuoeMbxcNHqM35fZLEe2KJg1KiEI0mdGgifwYlz8Q
	WXIH2k1yVgQ8TfTNlmEG513/1GtuYbPLtHf4dQfhteST54RF3GudkWTQ+/4Oe8m+PdaKI5HFNJ2fz
	44VfLxqqD5yltUBpaYkFx/IfgVmorXr4oF2/LEZIv1yiQLYSx4ovd+f8H7Xc5NVHbQmyfVu/FdLKF
	nae3z9WQ==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uATyz-0001xd-6X; Thu, 01 May 2025 15:29:45 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org,
	krzk@kernel.org,
	John Clark <inindev@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	sigmaris@gmail.com
Subject: Re: [PATCH v2] arm64: dts: rockchip: rk3588-nanopc-t6: fix usb-c port functionality
Date: Thu,  1 May 2025 15:29:34 +0200
Message-ID: <174610616060.401554.9572972965046310319.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250422210345.196050-1-inindev@gmail.com>
References: <20250419023715.16811-1-inindev@gmail.com> <20250422210345.196050-1-inindev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_062946_703415_ED36CF2E 
X-CRM114-Status: GOOD (  13.99  )
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


On Tue, 22 Apr 2025 17:03:45 -0400, John Clark wrote:
> The USB-C port on the NanoPC-T6 was not providing VBUS (vbus5v0_typec
> regulator disabled, gpio-58 out lo) due to misconfiguration. The
> original setup with regulator-always-on and regulator-boot-on forced
> the port on, masking the issue, but removing these properties revealed
> that the fusb302 driver was not enabling the regulator dynamically.
> 
> Changes:
> - Removed regulator-always-on and regulator-boot-on from vbus5v0_typec
>   and vbus5v0_usb to allow driver control.
> - Changed power-role from "source" to "dual" in the usb-c-connector to
>   support OTG functionality.
> - Added pd-revision = /bits/ 8 <0x2 0x0 0x1 0x2> to the FUSB302MPX
>   node to specify USB Power Delivery (PD) Revision 2.0, Version 1.2,
>   ensuring the driver correctly advertises PD capabilities and
>   negotiates power roles (source/sink).
> - Added op-sink-microwatt and sink-pdos for proper sink mode
>   configuration (1W min, 15W max).
> - Added typec-power-opmode = "1.5A" to enable 1.5A fallback for non-PD
>   USB-C devices, aligning with the 5V/2A hardware limit.
> - Set try-power-role to "source" to prioritize VBUS enablement.
> - Adjusted usb_host0_xhci dr_mode from "host" to "otg" and added
>   usb-role-switch for dual-role support.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: rk3588-nanopc-t6: fix usb-c port functionality
      commit: 60087bcbd1206a546c570c453dee5f5d961ef5b3

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

