Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F72F60A6F6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 18:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qkNnqrh+;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FpbHQUiY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=slG8drN2CZNWeeyGQikzZ1nNKkPrs1g4paTzj1uD1x8=; b=qkNnqrh+OxdXFDwOGpWDWft0yw
	Bd9naM//NDijn7XIoasL1dCEVe3txlYePEyKDrzQVftnEnor4o+PoNRRIijjT4RBgIEvYbDK+7dOk
	QhCdOIdER2dhmh9anRh2e+hT8hy6dsMWB0N7hytO2dSD9wdOfHTR9TQKrJyG/+tcp4hHLNx+eKFF8
	NkwnRRUcKApIQd7GIVlJfw71VkydPBpo5bX2Os5BHgT67OI8+XEAla2KOk653TDRVeWNiztsAcaUE
	rMnPHrkKuPjTUQm7+W1P/RSSMrTPfF/p11OYVCEsCqI7M7Pz9ZN9ZChA4QF814lL8j0A+9Hwe8VQQ
	GR8GN1hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZY-0000000EhxY-0p2k;
	Thu, 22 Oct 2026 18:31:28 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZO-0000000Ehnk-19uB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 18:31:19 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48c4be28b82so74172f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 11:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792693876; x=1793298676; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=slG8drN2CZNWeeyGQikzZ1nNKkPrs1g4paTzj1uD1x8=;
        b=FpbHQUiYvVLE0viChxKuaCgCDKxVtpgxBUou2CT0PPHk5hMXyqUsD2N++a3jxFMsFR
         eY9nnrzal2UzgGm5q1nS25DqVfZDKnfOje3PwSJ6g7wU1Z/lqIYkEclh00iGNHxDb8UW
         PAecG37uKvVo1yEwnM6MnN34o0bycno/PbCm1woCIdpNRe9Xlx6Dbs5+g+GZ2a5N6Trg
         TBjUqOb7LGSzUBS2mMvBBtxcF3RNymygVHRyA7Ae9v9rEW/jb2TOaQOaZ8TGYVaLRTZj
         L5fjkBEaeGQlHylnBE69N5l3S8eEP3G686XaY6f8Q4ldE9D0gVDnVIZp2W6lZ/wGTGmX
         kPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693876; x=1793298676;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=slG8drN2CZNWeeyGQikzZ1nNKkPrs1g4paTzj1uD1x8=;
        b=c+bXJMI+PKUG4Lgzg1Eg5KCsfcv1kWcUhJbK6foi22sVtUvY/83IaOZi3IzQsdItH2
         qqzjsrAr5qVI/mguW9oYdeCUvPLD9Tj8xBYAuAc3QjY40HBoJlHAYKTV7ytVs7C1SC6b
         VsdoLACTAnVnKjTn884G5eDO3SllqYmR37vT548N3y+1c8/PCODNQ2IeBz2I7QJfNZgI
         m9DDT46B0UtNaB6ci+KGo940SP23SGXL4dMPPAAwhO70d1rSMsMd5nX324EIVkOJI9EQ
         u4XGu4+drmDpcezHna6iHyCYLfu9J3wvU/WGeOmSWm5iS5i5SybDTSSFPxLYPF68AJ5p
         t67g==
X-Gm-Message-State: AFq9FYLd84hS4C9eATtP6ylkOB2q+TFQLo3dOrMg8pPuCWVXc9BxEB+y
	T8O/kqEKUUiSp6or4WNVARJnwMX3j8B7BnQ5+d8l9L8yQXjGgw8IysZ3yXivY/W0kCI=
X-Gm-Gg: AYBFou0Ql0WraeXDiX71OaPBO408PTaNMUtzjaFcIALv2ULK8voq5mPDXDs9O9+O3Bq
	HtzH8bfkbB7Jm+co1f3N44vbQ4gG97h9mAo7k9mTNv2F6cvkiWrfWowTtpSzWJeQtSGhIl5hSm3
	uc2REGBBqYDQgo3NU/tjlw+3qhJTkIk2348v1cKNuhfvjN3K0zIv/Afek+IGGqzehFevQlXu7XL
	QxMR9037EN/O0Mw0BGUuDhW4X7sn54BCR99m066M7wB1aoTBYMl5dN50MmbK0alMCfrpcduIqFW
	g51KdSkGt6+cKle0w0QcnttfOMYwZbiajHIRxMtQJoWMdnbcDDtV6nHaFAI268O8QFHTGVIJDKJ
	jm6p0+S6QLVie5mN/DOlMi0ig+bbVfG0EweuXcT84SGsCK0xQlh8w+7+NAEOngAYMAZ7FfiS551
	oxJ5AZZndJOjDNbEhmBAWGQnl7GJxrphQpfqIXcjuwlFoTU+bX4VHh2hl8c1MjIxUIPo16pcpX/
	vFYvRx+3AX8rlEOllZr9lDLbothM23nWxwb55d4Hkoi8kq4ntehx/PLTD++EwkapQcvJ1gKReqF
	51WIDgspOmr0HV5VleLT6XRrWQaWprj/N++kByrwIg==
X-Received: by 2002:a05:600c:3b17:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a1fdd31aebmr127571525e9.16.1792693876294;
        Thu, 22 Oct 2026 11:31:16 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21143094fsm4556975e9.1.2026.10.22.11.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:31:15 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 0/4] Fix and complete the GIC description of Amlogic S7 and
 S7D
Date: Thu, 22 Oct 2026 20:30:26 +0200
Message-Id: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDQAyF4VeRrBvQUafoqxQXTia1EbwwUSkV3
 93Rwtl8i/PvoByEFepkh8CbqExjRPZIgD7t2DGKjwaTGpulxuA66xK4HVCfcR47IUKVH6N3VUH
 OltbnFuJ/DvyW791+NX/r6nqm5QrCcZxFFhwhfQAAAA==
X-Change-ID: 20261022-upstream-s7-s7d-gicc-size-db94cb656d36
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_113118_340715_AA12202A 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The S7 and S7D device trees describe only the first 256 bytes of the
GIC-400 CPU interface, which spans 8 KiB, and leave out its virtual
interface control (GICH) and virtual CPU interface (GICV) regions.

With the short CPU interface, the GIC driver disables the split priority
drop and deactivation mode and warns at boot (patches 1 and 2). Without
GICH and GICV, it cannot hand the GIC over to KVM (patches 3 and 4). It
needs the split mode for that too, so KVM gets its in-kernel vGIC only
with the whole series.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Carlo Caione (4):
      arm64: dts: amlogic: s7: fix the GIC CPU interface region size
      arm64: dts: amlogic: s7d: fix the GIC CPU interface region size
      arm64: dts: amlogic: s7: describe the GIC virtualization regions
      arm64: dts: amlogic: s7d: describe the GIC virtualization regions

 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi  | 4 +++-
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)
---
base-commit: 8610d31587e139380db9cb8708f4263833b482d0
change-id: 20261022-upstream-s7-s7d-gicc-size-db94cb656d36

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>


