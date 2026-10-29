Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE07606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 08:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PwVTMsW8;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m8NqNvVj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xSAI1Taz7XPgEgkZ0/+WnfXZLsVVAFKEoUaZ094DMNk=; b=PwVTMsW8BJR1GNwIPKBHZZXdPx
	ZP7bbolIH/lVmbvguG+YJAsSB3mKbvjssigXJ2ef5GvVhuaGZ+4zHdwNp+6dNw1nWkmZ9YRl1dlO/
	8OiWOGfHiwTRfe7B/o4VZG0eSHv2qP9nNZ8ma0q7wy4cRLnA+saZ0lzinzHsDLWQ1pLXow/SUfu7V
	+jcyUysCE/6WBjryP5y7RoqxgyIpjk2moVD/ODCJHA+9bQV0uDB5QDFcXuGKlnptIysxIePtdkpsK
	GpR86LZqyZ5eibPcOhXdSur2Y9ohGy6exYKLIqVnuJbFgUIoo7gq3FBYJX/2RkiSp9NF/fMKUEGpD
	mu/JbyyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLTA-00000008ik6-1FG9;
	Thu, 29 Oct 2026 08:26:44 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLSV-00000008icr-2XoV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 08:26:42 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2eb14c60a7cso2216985ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 01:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793262360; x=1793867160; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSAI1Taz7XPgEgkZ0/+WnfXZLsVVAFKEoUaZ094DMNk=;
        b=m8NqNvVjZ6f4aEXVlf8l/sG/t8JWyDYifdbgFWVEC9pQpcM4ekPqlPYAU48F6+9qHD
         6/aYXrCtok1w/sAd6IKF2PVduodiR5nl9BBDxlYTCJ5DFvy3oqD25jlHL+BtNfJVsJRP
         2JB2hyOparoAZQ7fPhcgxhodw5oc5sNbBJfiza8N+RRnE2R0JiaCeJpWEXsKlTg1ZMOl
         bw5dhzhVQH9Utv4qCIZZ6sICG7IadigGuMV/lO14HUsEIWc1pSp6tUhM1YaYhSsopI8b
         fILkgiyjZK32f3eNe7NqEOH2+IMq+BqOL/MHqdi2GzBGfVDIPbtV1/aXwkjTH7VeJIe+
         fcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793262360; x=1793867160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSAI1Taz7XPgEgkZ0/+WnfXZLsVVAFKEoUaZ094DMNk=;
        b=g2aqT/l1OpJVC9C3WOjowWXkfqR6qfkIz+TKhVJJKwDNxBsi9hGHAnZtr4uBnb9BJU
         QnFGSOVLEcxCKhRW7iUSAc1co1esCNXgL80P57zylUsei7BxRZbTN+8XDHK2yR58nshj
         +FvRixEIadthyYBUNnMQwjl6bLWJh1Vc0PH1QkbwBvYswGimbnix5Hv0XeXG6GcLm4TY
         BpFIdgBA8e3Vs3xvKyw9xieSUC6oaoYQgvdPCWd0KLjAb2YmvjZuCn1a0Y6UIERBaxyh
         JJnM1l/BO/X0lgLqW3AvP/EB41XXi8H5tYPb2CKTFkMVyicWvP8ZH5gO2rLKv8RIImu8
         hdmA==
X-Forwarded-Encrypted: i=1; AKwUvBxaz1HQ8QXKr3C1xpPhlutGmEvqaO0+xBDe8eFi7VwyHHmZxAc3GuPi41FYpT/Xd9yUhYWeqfFE3UMDI1XhNm9m@lists.infradead.org
X-Gm-Message-State: AFq9FYKjy/cLnABPsU5umk0WyXzjjeVcYa2pcE402BoKc6pY6U+hPjDK
	+teqwy44yqAP4bUO9GJ8Mzg4lZz3f7KoUMUFcVEZr3WxdEg6o6Rvc7kP
X-Gm-Gg: AYBFou0Kh+fS+NDusNXIzxm82EUVjdPF0gjQLLokZo/76hlOT4G2MxZ7xeST0JtVDjV
	Q3crLSqN3avpFfsgIiEANlY41+AoaFkxzZZN0QFdXshExJ78z9yHMYwijODGqv45M595G8nw+2d
	VleiC3yv8vp7AaZzmb1jDASsEl3fEeUpZd41iHgIim74wQSNKMwvfqX8NlMSUb59TdpOCO1rd9L
	HBGLpjVUrIkDDdUfeMvhi0iVjSnojqI3RPdqwMxEcFzuCpLj3CWbxL1uKAkmPdHzEn1RPy0/Nie
	DuFo4BgVq4Gd0vn0cNI//7bQQusQfrv6ClsxJTgILBCl/kAtsQx9leXimkvwEcOfInZyzEhDz24
	GPRgbALT6KH+VBrhUFE5nVn65S2ScMGiOrdbWJsz5jEzttm5uTnCSxzl5soUnX0hjURyLaqDdRV
	0KRUgMPoPbMNeFp0ui4o/whzhiYxyqjLAcS19PrYjsltQR13wPPi0w/3XR5CKhtwFnkxv/o5D6y
	aRXGhsXtKOxNO/nPXdzx/05Q4sI5nd1fr7/xLDITC1/h7gFrfIFPpZh7OcL0gpGqYSAFtqyX7fC
	aCZX25tR8Y5gqzk5TfNxtSpMRVQWGmSR
X-Received: by 2002:a17:903:32ce:b0:2e9:4175:306b with SMTP id d9443c01a7336-2eb00052bc8mr67641045ad.1.1793262360067;
        Thu, 29 Oct 2026 01:26:00 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b7a216sm30031585ad.16.2026.10.29.01.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:25:59 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Amin Gattout <amin.gattout@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Coia Prant <coiaprant@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
Subject: [PATCH v2 0/2] arm64: dts: rockchip: Add ArmSoM Sige7s support
Date: Thu, 29 Oct 2026 16:25:19 +0800
Message-ID: <20261029082541.469999-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_012603_981639_EFB76F90 
X-CRM114-Status: GOOD (  15.78  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support for the ArmSoM Sige7s, an RK3588S-based single-board computer.
ArmSoM confirmed that it purchased the CoolPi 4B hardware design and made
no hardware modifications for the Sige7s.

Keep a distinct model and compatible so Linux identifies the board under
its marketed name, including when a kernel-provided DTB replaces the
firmware-provided DTB. Retain coolpi,pi-4b as a fallback compatible.

Following Quentin's suggestion, the Sige7s DTS now includes the CoolPi 4B
DTS directly and overrides only model and compatible. The existing CoolPi
DTS is unchanged, and the common DTSI extraction patch has been dropped.
The series now consists of a binding patch and a board DTS patch.

The v1 series was boot-tested on an ArmSoM Sige7s v1.0 board, which booted
successfully into userspace. This series retains the existing hardware
support provided by the CoolPi 4B device tree.

Validation for v2:
- Build-tested both DTBs with arm64 defconfig and W=1.
- Ran dt_binding_check for arm/rockchip.yaml.
- Validated both DTBs against the processed schema set.
- Checked the new DTS with dt-check-style --mode=strict.

Based on next-20261028.
v1: https://lore.kernel.org/r/20261022125339.82746-1-liujianfeng1994@gmail.com/

AI assistance: Codex prepared the v2 changes from the v1 patches and
mailing-list feedback, revised the commit messages and cover letter,
and ran the build and schema checks.

Changes in v2:
- Drop the common DTSI extraction patch and reduce the series to two patches.
- Include the CoolPi DTS directly in the Sige7s DTS, as suggested by Quentin.
- Clarify the unchanged hardware design and the reason for a separate identity.
- Add a background comment to the Sige7s DTS.
- Rebase onto next-20261028.

Jianfeng Liu (2):
  dt-bindings: arm: rockchip: Add ArmSoM Sige7s
  arm64: dts: rockchip: Add ArmSoM Sige7s board

 .../devicetree/bindings/arm/rockchip.yaml        |  6 ++++++
 arch/arm64/boot/dts/rockchip/Makefile            |  1 +
 .../boot/dts/rockchip/rk3588s-armsom-sige7s.dts  | 16 ++++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts

---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
branch: sige7s-next-20261028

-- 
2.47.3


