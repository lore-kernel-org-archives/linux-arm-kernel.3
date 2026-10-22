Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EB9606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 05:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ekwV23me;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lzvnmwV6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7Krj8OjITAThRkCGGSj2U5wCQS4PajnQVLbEtv8Y+ws=; b=ekwV23meJT1FF4fEWjDdm4eQUs
	lBRnFnME9r3BmOR1cHPrBxkmz0qMqXw204m/0+H7fStsPs1afipJsJSpjAY6VcXD6ej+KHPjO5NsL
	/8IKUX3O9T0hIvtm2/77hv6tnGr5v6u5sX8GpFh2eEArKd9hBWiHI+/3trH8HJ77MKPx8Bv8MVfGN
	+UxtTKb0qDHnq/yYNHBijvCyi6exQsiKDGGtqjJ/z7GuV7bcvxH6OCIadg6/ArqMeNZu20pUZL0cO
	73NV+x+nVIuy8Ym/4Ah1X6rJnY5BHt3wkcyOZ6ikyPYe+jRAfNg+AdK8BvolvBMXjjFWrqxGDQUXp
	ID4+lekA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJliq-0000000DQJT-1c7T;
	Thu, 22 Oct 2026 05:52:16 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlin-0000000DQIz-45SZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 05:52:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso11883385e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 22:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792648332; x=1793253132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Krj8OjITAThRkCGGSj2U5wCQS4PajnQVLbEtv8Y+ws=;
        b=lzvnmwV69/qUhG3p+DpaR53eH7mxFUCtTDJ3629zotkexTl27n9hAzLJrAmasimjvW
         s0PTVAqCirq5wjI10vSwOstzAG6c0LA/D/WIlhV6+k334E9RuTimP7zXXl52HKolfaTz
         8NBdl7Wzhe6vDnKY0p0LaWZUHFXfgWVltKCHFni6Bbo5yifwGguBeJfHNBW6ZEFrPo5l
         lEjM5IGdmO4IIWe90OBQhhLNktlds/lgqrihzWK56Bu8XknBEXeUOGkU+AfdFuKBPKCH
         WsjMtf39zGRPB7C0XvivfBfiw4jfjqt+JAUMFn1phodQMY47Tflk1HUMmnFgm8GqaTXY
         12oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792648332; x=1793253132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Krj8OjITAThRkCGGSj2U5wCQS4PajnQVLbEtv8Y+ws=;
        b=bPiX562q9ABe8YcfU9iQPbcYdQrZ+gma4eYVVUd0IpmsF2z5bv2LccjpSsDOUej5Gj
         OoTprZpE7iwa/jVH7Fpr6FNtZ1NLwMH9bYoW1Z2FfshVTkXbqwIeaSiP0px0lCs1HUr2
         HyVD6FkZVq5qhGeX2ov20JInVot76LZYpX/w5NB391WUeAoUr5HAX0o7HDRj2QGxL1z7
         kSc7hYCJ+WJ1B7zowWIOWS7/IyywH69tqQiOjjG1bvpHzU9VWxQi2P6B+pRKIhbWAPEq
         Go87whNNGdc6t8QdB0zF5IYKkIAHDKJ72/bce4AfUd9Q99wmp9i3RGJez2PVE088c3nt
         RYmw==
X-Forwarded-Encrypted: i=1; AKwUvBwXN96HAnQYCk8UxJRjwcphR4l46PpzZzz6SqevBgybQvp3Y5l8+e2nPNxc4i/qREJT+tQcLk388nmWMcKYnzE/@lists.infradead.org
X-Gm-Message-State: AFq9FYKNtP8xfmBeJZCM/oXKIL8/TaMHK+vq/ZY700eTnKbEN9hqtqN6
	5ZHJ5Jxj6gpJjODLZWzgqM7r4VNBD3bmixkH5YvL2zNSZwWl1jnDOhqA5lD1ZryP
X-Gm-Gg: AYBFou0n/K+bEb6EfvaFqFFztBTa0UOSpD4Wf9hMwsCFr7vce2yirsgZJ+hj+MVSv/y
	mpZ2/Mk35a2Eb2+0UylEHVkckxiwl21TCPj9SnJ9A6jjNy2T/Y39rLckEnWln7+zP4QseZPqFNF
	hYYQ39Nn2ZrHIO8XsyxtnPuFL7Ku107UPLcJG6BjnE+m7bMF49ZSarcYtZzyOOe+EA9zaSogYuy
	lpS4eLYAcf8DZOV0139rPmgXlQ9q/LMjJcFLJSEmtuMk180fBeKmTgeelm0LTyXreru83CLdIQX
	yB8xcGL5Y/nIpvRA++H+deblqJB0g4ACA8paswLxXrMbyFDGFoVeuFtF6aE13PYjRCRS+Jj3frT
	KPEygI2dmtuNbsDaqpATGaRaZpgHzwHkKpOdgcNg+yqdCNLWUF8ceh1MR9TZV5HwkeD53/kMOfg
	Tw9cFs0kvaKSrisrGvnTwLkXYXKGxWlb1QONgtDkqvgPtDAYKEJ5yQqPhvjN0a5buYjs7Tvgo7k
	70P2Xa3dtsm/Igdz+RU7ajGBH5bpuvlECeEnNYkc3jVobrfwcVETx7s+93Cl65nX0EY6VzmJGO9
	P6ruFqLgqBeNDBO8rWBWGXVYjjKAA0r16spQvXmKGdIvBHyqqJZ6zYinUTcaV9zgWNLA8PrT0Zn
	wXxa+vn1qntPmrMsk3DAVC3jmof9C3k/vbMmKOfcu5Ko4QrBebYVITIHGXtuTchAGx2wCg49R4q
	U4YRwk
X-Received: by 2002:a05:600c:6748:b0:4a2:1a:a122 with SMTP id 5b1f17b1804b1-4a2001aa387mr72903845e9.9.1792648331473;
        Wed, 21 Oct 2026 22:52:11 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-a0a3-b57b-feb7-50dc.ipv6.o2.cz. [2a00:1028:8388:a84e:a0a3:b57b:feb7:50dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm41312875e9.0.2026.10.21.22.52.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:52:10 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v2 0/2] ARM: dts: samsung: Add support for Hardkernel ODROID-U2
Date: Thu, 22 Oct 2026 07:52:06 +0200
Message-ID: <20261022055208.17746-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_225214_076331_10A63735 
X-CRM114-Status: GOOD (  16.27  )
X-Spam-Score: -2.1 (--)
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

This series adds the Hardkernel ODROID-U2, the predecessor of the
ODROID-U3, based on the Samsung Exynos4412 Prime SoC.

v2 is reworked: as with other closely related boards, such as the
ODROID-X2 and the ODROID-X, the ODROID-U2 device tree now includes the
ODROID-U3 one and describes only the differences: the micro-USB port
is peripheral only, as there is no VBUS supply switch, there is no
expansion header with SPI, and the 3.5 mm jack is headphone only, with
an on-board digital microphone instead.

Ethernet, microSD, USB peripheral mode, the LED, the fan cooling
device, headphone playback and recording from the digital microphone
were tested on an ODROID-U2 with v1 on Linux 6.12. With v2, everything
except audio was checked again on Linux 6.18; the DTB is the same as in
v1, except for the cs-gpios property of the disabled spi_1 node. The
eMMC was not tested, as no eMMC module was available.

Changes in v2:
- Include the ODROID-U3 device tree instead of duplicating it, which
  also resolves the style issues reported by Henrik
- Add Reviewed-by from Henrik to the dt-bindings patch
- Link to v1: https://lore.kernel.org/all/20261018124459.3026-1-pepe.schlehofer@gmail.com/

Josef Schlehofer (2):
  dt-bindings: arm: samsung: Add Hardkernel ODROID-U2
  ARM: dts: samsung: Add Hardkernel ODROID-U2

 .../bindings/arm/samsung/samsung-boards.yaml  |  1 +
 arch/arm/boot/dts/samsung/Makefile            |  1 +
 .../dts/samsung/exynos4412-odroid-common.dtsi |  6 +--
 .../boot/dts/samsung/exynos4412-odroidu2.dts  | 42 +++++++++++++++++++
 4 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts


base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.54.0 (Apple Git-157)


