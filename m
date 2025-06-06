Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94715C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 19:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tlazCEab9PCIfCSPMgFb4BeOPrc+WPM3MHVdbOBtAeE=; b=TsHIQ8N8wFjCA1nvyKxbYrMgQ0
	mJTyVqlLyFJQUqSg3HzkAedBQGtGEAOV+S1EAGMQkCjuGKpd2byVk/5tFYxDD1gPpItCXwL2PJJ8Y
	vI/7dt7TKne5u3aCbIZfm0eWKK6p5Scqx/3PAY803Ui9XaxU5ns0j8OYomtbltUzXVqz0nX6z4rL9
	LWOFFloXKp89VYeWcF+iptFWNP2ASHn39SGhkrOP/Jn0WUVcR00SySHbmgGfIXDbToRIWVbkAjcsT
	MIVPaI75ELpHYAT0SZdbEpvSFZZvog5wUy/gHmtmdRUlrTO2mxyOrF4N+6vWsToRIUO7D+qO3Rod8
	WhBsMURw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNcgN-00000000sKp-1RYk;
	Fri, 06 Jun 2025 19:24:51 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNceE-00000000s4w-3UYi;
	Fri, 06 Jun 2025 19:22:39 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a0ac853894so2167845f8f.3;
        Fri, 06 Jun 2025 12:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749237757; x=1749842557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tlazCEab9PCIfCSPMgFb4BeOPrc+WPM3MHVdbOBtAeE=;
        b=AVB9FEPzP8q8TMYFrJ1WT1FEeqNiJAUfcywAcbjJQEXZ/FOu8ATOkvaBgOIlB5w8qm
         mfVrbcjW3ezdtHVtQYfMIT9ceEgFrYYtdXxn8TLkR8eig0IruNVh+ZAQV73DOQbZxfUo
         N2laqyJ3AZVAVAlpK9eNH8+qarTm82KXt1urSOHN9xBJyoQHx2dOCy8nCjRpfsbnskmn
         RDNZc2W/bAprCZRR7XhvfuuVPAMFOzZbIyZ/xELq6tZkPGSMikqhgZHa16pAnlKMMIcg
         fvLrOr5r9Is7XOByHIjoPiL6Xg6WRs53HLHoOa5nnOG6CjaAin9U9TlzVyXIv3J5+DTY
         247w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749237757; x=1749842557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tlazCEab9PCIfCSPMgFb4BeOPrc+WPM3MHVdbOBtAeE=;
        b=sWyEGOtaFyOOwq5RwZdK7hvjIGgm5EhGop9oVTbouq/41RtDsvrf9dg5dsqeN0ruUa
         HInGi8rYFiiwrodSqh2KgGAk4VYQR5OBg3bRvuXGf9G1CKTJOpnMgMxPaDgVnXNamADH
         MHwwiIh5l0P7IaF6l7e86U7huRdWFRh8U90xinjvNPWmzVG43WplrMHGk//D0u28fnY9
         OIe7GJMF9UpS+mb9VqixZFTzlz8DpzBdn2e99xTVdbxUvVF/7uegTs4X4tS3++9JuVL2
         PPNrQANTX663CZYoS368flNFkMjy5Yb9+305KSLWb5WUxfwjoQRJ9zvdvuLFs26tCZ/k
         ucMA==
X-Forwarded-Encrypted: i=1; AJvYcCURJp7mdqyvpLqApLJKxkDbhXkHomllWniJ9r0tMkj/vWw7qUWgXRFn4lFUAqCasDOwM7M9glLGyXpul7W5DweE@lists.infradead.org, AJvYcCWMSWFrl5hdAIPAnzfHthSLNeB19X6Ny6EH82whHA0CG9BNGM62biOLQlVBdgSiqiUiVlTJEvketcGl@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4VQtvX2vWCS81OI/pGBnccIIpQBd9J5R8WkvPSzw7TkUn0Cyg
	PRpe6Gvndu8X+OrHP/pfcnXIpIlNaCKBrQRKJGRNoAy1QninX0MtrAQ5wAVpwg==
X-Gm-Gg: ASbGnct3DG1pbusryM3GOBXv6iTHManMZnaAhyRhMkzl/6bWtL/Nl6HFTAs8+a32Ygo
	TFwY8x8l9evYu4rA+jRah7YG+4TGwyzHGimg0rCSlzFDgbkLv8BP9Wka3JYScewxcPO6X3oZcoL
	LwRxWF01aYzLza+Y4tCl8f8yASX4YoNSNnirnBaBLJxu6if4BDJxfvZHXR8EpkBkHfK5J3uXT0u
	iywJCm3HWMe3t1jJbhjGywFR56nmOarB2ZTdcrvmdixqlU3q8Zbz04ntnfoSJ6ivPZ90/fsywNh
	aS6NQBAqZ+eg5lcbeA/mDVR3K3cizgpKZi+Ra2ClnKjD7mX4wpNIW3KPBF/0CgzFlS34CDuHybO
	/BMkYrkYMGOdh40nv+F/n
X-Google-Smtp-Source: AGHT+IEw/6dmOwp3prbi2DO3yB49zmc9WP0nbK2kCidb002uvYU077DaQ9rddciHPvHuj++HjpiSYQ==
X-Received: by 2002:a05:6000:2082:b0:3a3:4baa:3f3d with SMTP id ffacd0b85a97d-3a5319b69d2mr4142128f8f.6.1749237756611;
        Fri, 06 Jun 2025 12:22:36 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-452730b9b27sm30951595e9.23.2025.06.06.12.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 12:22:35 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] phy: airoha: add support for AN7583 PCIe PHY driver
Date: Fri,  6 Jun 2025 21:22:01 +0200
Message-ID: <20250606192208.26465-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_122238_870050_303FEAA6 
X-CRM114-Status: GOOD (  11.70  )
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

This small series move the current Airoha EN7581 PCIe PHY driver
to a dedicated directory and introduce support for Airoha AN7583 PCIe PHY.

It's not possible to reuse the EN7581 code as the register changed between
the 2 SoC and also the setup method changed (different calibration logic)

Moving the PHY in a dedicated directory is also needed for other series
current pending that will add USB PHY support.

Also a dedicated schema is added as the register names is entirely
different compared to EN7581.

Christian Marangi (4):
  phy: move Airoha PCIe PHY driver to dedicated directory
  phy: airoha: add EN7581 tag to PCIe PHY driver
  dt-bindings: phy: airoha: Document support for AN7583 PCIe PHY
  phy: airoha: add support for AN7583 PCIe PHY driver

 .../bindings/phy/airoha,an7583-pcie-phy.yaml  |   72 ++
 MAINTAINERS                                   |   14 +-
 drivers/phy/Kconfig                           |   11 +-
 drivers/phy/Makefile                          |    4 +-
 drivers/phy/airoha/Kconfig                    |   23 +
 drivers/phy/airoha/Makefile                   |    3 +
 .../phy/airoha/phy-airoha-an7583-pcie-regs.h  |  550 +++++++++
 drivers/phy/airoha/phy-airoha-an7583-pcie.c   | 1069 +++++++++++++++++
 .../phy-airoha-en7581-pcie-regs.h}            |    0
 .../phy-airoha-en7581-pcie.c}                 |    6 +-
 10 files changed, 1734 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 create mode 100644 drivers/phy/airoha/phy-airoha-an7583-pcie-regs.h
 create mode 100644 drivers/phy/airoha/phy-airoha-an7583-pcie.c
 rename drivers/phy/{phy-airoha-pcie-regs.h => airoha/phy-airoha-en7581-pcie-regs.h} (100%)
 rename drivers/phy/{phy-airoha-pcie.c => airoha/phy-airoha-en7581-pcie.c} (99%)

-- 
2.48.1


