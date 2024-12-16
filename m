Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5C6E77184
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 21:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DRJiV63LRq8fV+tehc1tAI/LgilDFILxKmmMTE8EzxM=; b=i6UQbBQLYPmmDRFOyWDNfgABHQ
	8FyAM+3zH1T1Zg1d0kzggsLarRBBmAbanitDuOdWv1ymcD4idydBu0gHlEwg5ENdAXXgaIKd4sMi7
	7UnyY1mcNb4dqxjv7Fipax9xAaJdoD/4jPwghHBhVixW62yanK01Vx7jHM0mHIv0PKjvlqk3kY6rM
	TtYPSjdVctHepgS4mHIAcIwxS4MSqGnld09oYBaygbBgKXm3ms8bqkEXNnQxLCeXaMMtAyFWaDmox
	UfX5++ux7GY00jy8oH11TDkrij1NdZcJsM6RZKQ4UL/LaLLmUQU28DRyQv0Y9doprHxfCxKVaQ0aX
	J4CVXU7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNIso-0000000BSlI-1sUW;
	Mon, 16 Dec 2024 21:44:06 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNIri-0000000BSZX-0mZ3;
	Mon, 16 Dec 2024 21:42:59 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3a8aed87a0dso16075275ab.3;
        Mon, 16 Dec 2024 13:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734385376; x=1734990176; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DRJiV63LRq8fV+tehc1tAI/LgilDFILxKmmMTE8EzxM=;
        b=ipDMPxCrOXwjO54lg/4xLfEBqxktmeQvOwLVlfJRSHQXzsHZ8Y7tZ6SsipyyF4T+B2
         Z+tJwB3/qJfsz/dEItSF9ebzBkMVYKH6GlsRz4ncCJfVi/+NDCEQnawR5eccBrqX/L7I
         ZNqCYTwBa9wDXx4dkw/KuhD40uXQz+xd8E/K+bMUmuCxgkzStHMWpxGGzacs7SiD2xjY
         S1uIpySGl9R9YOudaGc9RXrQkDT0vjwgS6bg8+M1MwGqSdf12gVjfo+7RAC7vWEimkzF
         OPb+QEF7h/Rvb3pg/OexCO81Dh83x777q+hNS6PtRrVyhMX8+cB1g3sm/egi7AigrifJ
         aBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734385376; x=1734990176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRJiV63LRq8fV+tehc1tAI/LgilDFILxKmmMTE8EzxM=;
        b=M2KOGZVKKZaKbXjaRRrN4Uszpk32wwnm3jSadHEhRoclyBNP2GPe+jt9HNUhX/pbLj
         Epj1aOeL2oO9E91xgrkV/5MYB73YsCV9Tck2mfjluD1Sy1Opls9msAMAOHJUClK9zoLa
         EdLVzjnLGli2QJRzvnLPcmTNxN1A2Jq3omF8SMPQPtA0uf/wlPay5C8BpXQoGIqyNpz/
         m2/fX0gRKnuvAYniuQWXdPUdDmmnh5wnr3ukUgaY0IUe3cM0LzX/kNvoHbdC0n+s1pkY
         qOrt65O8QrzMZwFTKLp2JLUFjvvQTw2bTMO9HHDgSaFv6NTkiHv9NIWYbmZIEUHEOIwm
         ePww==
X-Forwarded-Encrypted: i=1; AJvYcCVOf4S5RkGBqY2yzTxVWA7P3sMEq1cG9cDr/xTMgKNBKE+mrqUelBBbo3do3Jz6j/6INFZwlMFFelzaRRg9sn2S@lists.infradead.org, AJvYcCXF1e00q3Jfz5HId+QOdLGaJQ3q1N+nSNY+ecuqp73YBaLjBpSicN4RwZgjLF0PO4/tWL/qComHpGWvX/U4K8Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YzG3ZVExkPGb2dQ1LvhvQZvQIyWK8/YT4xR5Jr02kYGTPRDVf+p
	hNKy3caYAKq7notB3kiUxcEr/HrT1f0LVanlQ4PjMSKskzTauqbx
X-Gm-Gg: ASbGncv5Al6k7EHeCbBWLyoIRdxx7c2xkt1b84sZxz/2gpg6u3dQCN/DU4VUreLT4qB
	eoCo3tB+QnkBYQNmN05XyDFQc7psh+XwFSyEA68pPYphpo/uaQFLDKeZ0rYmJSGXvogv0x7Zhgx
	YgT/JaHItDV0L9o+ZvKFZu2NHhghChV/80lj/Owlhyfgp4uZNYFJSWCSBkYsxw86fxBrXCZ/Pyn
	2jO3OrNqBtwfGNHkrhcCcYyeQ/O5AO3uaQREZsER/pl1p3TpetRX673VHZhMYiQvinmkx0OCxrr
	AYVbi3zf/VPYvG1Dpabt5Rjn8PA=
X-Google-Smtp-Source: AGHT+IFDidsqDmLm+P6RSEJBRFZE5QlyQnlF1Kd+ADUltzI0Z6Ahn4amtFa5gyQLV/DCYzsUMkU4uw==
X-Received: by 2002:a05:6e02:1a07:b0:3ab:4bea:df97 with SMTP id e9e14a558f8ab-3affbbb656fmr162024405ab.23.1734385376356;
        Mon, 16 Dec 2024 13:42:56 -0800 (PST)
Received: from localhost.localdomain (65-128-205-244.mpls.qwest.net. [65.128.205.244])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e5e32a342asm1426777173.89.2024.12.16.13.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 13:42:55 -0800 (PST)
From: Shimrra Shai <shimrrashai@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	Shimrra Shai <shimrrashai@gmail.com>
Subject: [PATCH v4 0/2] arm64: dts: rockchip: Add Firefly ITX-3588J Board
Date: Mon, 16 Dec 2024 15:41:50 -0600
Message-ID: <20241216214152.58387-1-shimrrashai@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_134258_222348_650B74E3 
X-CRM114-Status: GOOD (  11.03  )
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

Draft 4 for the device trees for this board. I hope this one finally
addresses all outstanding style and organization issues. Note that the
technical functionality limitations from the preceding versions remain.

Changes since draft 3:
 * Removed the rockchip-pca9555.h header and used the pin numbers directly
   in the .dts.
 * Removed the display-subsystem node in the .dts. No other board seems to
   have one like the one that was there and it was causing warnings.
 * Removed extraneous property "rk806_dvs1_pwrdn" on the PMIC subnode on
   SPI2.
 * Removed an extraneous property "rockchip,skip-scan-in-resume" on the
   PCIe node pcie2x1l0.

Shimrra

---
Shimrra Shai (2):
  dt-bindings: arm: rockchip: Add Firefly ITX-3588J board
  arm64: dts: rockchip: add DTs for Firefly ITX-3588J and its Core-3588J
    SoM

 .../devicetree/bindings/arm/rockchip.yaml     |   7 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rockchip/rk3588-firefly-core-3588j.dtsi   | 447 +++++++++++
 .../dts/rockchip/rk3588-firefly-itx-3588j.dts | 705 ++++++++++++++++++
 4 files changed, 1160 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-firefly-core-3588j.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts

-- 
2.45.2


