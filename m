Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A18C35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 15:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xgBZ5CUSGzZQMXrNQ7iMZPeg3VKPPTQI8tLphlbuft8=; b=Zil2OL96MCc0YS
	IMZHj8IOJj1efp7MjnqNBXbji6HxDE8CfrskOyRm/Eud4iX000lJ8wYU88K3cptXG+Xny2S7f0A2G
	s8t1So2f2mWsNrWySHqm9HIOzCsP76kA/gnDQK0dK+WE14reGYCScVVcdVzMt7ci3P95KiQMGQal1
	MQnIDNeWnQje2PmegKL2HWYVJn8MfZj3EYLS8j5q8laCa0nErv2xlOlBSyU24WtKqNYJZIVl7LpKY
	B0Gi4Z5XVUs5CgcIq0mjrBPhTkgx6E0+KTr/VCLe0pNSjaxqjytB6OPygbc+dBG7qJRa1+SNzIxsr
	B9qwrg1KcqQ50lCoFk/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvHoi-0000000CXlp-1Sy8;
	Thu, 20 Mar 2025 15:28:20 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvHkz-0000000CX14-3ElM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 15:24:31 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22548a28d0cso24795235ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 08:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742484269; x=1743089069; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xgBZ5CUSGzZQMXrNQ7iMZPeg3VKPPTQI8tLphlbuft8=;
        b=YZ1OXgkX7fD+wupgVmr3NBd6iZARCh7rU9ObAn9P+wQ3Lls0Zrnf53AfuuplXWvYB3
         SckplXcq7efVQ6Ez6dOM/f00oGhCA7l/eHU8sYVgqV6RNVyGyz6FlGExbazHTGC9FV7f
         5qck29c/zBGbb3Ii9qk8/Axdf+eMtOFscbXvPvjCAHSJv7ttq7n0911zNML+7QcB+z4Q
         DYmKaCxw6frCXuYv2eyl52+Wndv1jXw8MoXFpg3wNsduHlHXF6MGNVVW4walfefpVXBl
         l+incDhieRgDtLd1/r0l9jwil7AT+te4/MS0H228w64hG/GV0ghMObFVev5QPlVm078m
         ekDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742484269; x=1743089069;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xgBZ5CUSGzZQMXrNQ7iMZPeg3VKPPTQI8tLphlbuft8=;
        b=mfXdsybx1FY2qPb6bjjSHYn8ajchB/PKcveusvSWRR2lISFidEDhvpXEc4dpfzJe5z
         RmocdMsORgPu0j25vkmPnX9PPvUE/g5ONycFEO9T4XKhiPYT19N0ibedlmLGAPWaHJyt
         KY/vzSHe011lKeFay4xn3CTXS/sB3XFTDV5qODhWcM7znev30vgMV+NaI2t7ojCWhtyM
         0vWyKrJcBAauEvE+6J3H2liCkVxvcVrj1WTva1LCFUw8+gfymCdNnlOj/dgmfKqpyVEC
         nInetH4KEC+rBocGpWCWz/cAQnGikGen/jjqEcNly8BSlO1h29HMvGuQyrJ39kJ5YbJe
         uclA==
X-Forwarded-Encrypted: i=1; AJvYcCWy4BMh1UX60sKhs+Ebc/3KlIzkrXiRv4F0l2XJ7XngvgkKM9AgmdRVocK+CVA2JduygC0C35izZyT90rO76YQf@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhxht7iAQbIBr8sUWq+i9AxVqJAPCDCr7Xq8ukixP6/VcEds/0
	aQhM9LN9LlzUS2nURxAHp95xkF7y+qdUaxHypkx/GTsoG8CCTp5Y
X-Gm-Gg: ASbGncv97XjCT4nf2ub1GzWEgxbwe1RIAzT0rVQdqciWUCD87ix6VHlamkqfAsrBuUM
	9FQdzTqG/VVRrrSBifAjHm6tI9GlkNBTmnmDD+spW9mjb/H7K+0MVZHrPnRbOaLGMtqZAaVb1lf
	otsw7cJIbDuqkl2yOL1vRW0TYl3lRTa4wz1h7bVx2ovkAQT3OfVBTsMJMq+/G7+ATL792PaWJ/L
	6sbjUmzVy+FDZRvH3Xz65us1909TkldyhCL1VID+c3KQ7HoH9Ik4M4bZs7YKkIBMsws/kVTRheH
	Xv9Nf5m0eE/iGRYr+JwBtBuD68ZpZFd7FGh/C78i0SezNiTFe2zOFU8POK5NQP7YvpgrJ3ZSL2K
	GoF+pbGEJMAbq2Yr8P/1AwQ==
X-Google-Smtp-Source: AGHT+IE8wgx82LSpjOoMcp7xMjse6vZ9j5z6ddnJQvCI/Fs2gOi8QJmpGG9UFax94XWc9AkTdIPv9w==
X-Received: by 2002:a17:903:2346:b0:223:5ace:eccf with SMTP id d9443c01a7336-2265ee0aedbmr64395195ad.25.1742484268680;
        Thu, 20 Mar 2025 08:24:28 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4a8fsm136905515ad.234.2025.03.20.08.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 08:24:28 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v5 00/10] ARM: dts: aspeed: catalina: Update DTS to support
 Catalina PVT hardware
Date: Thu, 20 Mar 2025 23:21:50 +0800
Message-Id: <20250320-potin-catalina-dts-update-20250102-v5-0-e161be6583a7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI4y3GcC/43NQW7CMBCF4asgrzvIY09wzKr3qFiMHQcsQRLFb
 lSEcvc6SKURqyz/0eh7D5HCGEMSx91DjGGKKfZdiepjJ/yFu3OA2JQWSqpKolQw9Dl24DnzNXY
 MTU7wPTScA7xeLJKTBybXOBYFGsbQxp/nyNep9CWm3I/35+aEy/WP11v4CQHBSWe4UtrbQ/15v
 nG87n1/Ews/qRWJ20hVSDSqQjRtMGzfSb0maROpF5JsjYbIqTa8k/RPaiU3kQQSjNfkatRWIq3
 JeZ5/AdkRxPXNAQAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742484265; l=2078;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=cJ4PKBqJ1ZUnV8+yUZvNXJkgGfWoCnqYjpX/+o7T94w=;
 b=S29qvnFmgZIP8YDEgxdV9L8SWhKqk1HlSw3tWuB6SnfHRj8puN3OAuw4BqZ/y3CK9surBXICF
 qdFlkjwYr7QCHpzI9QI0C9x31DQb1Oc5lQS4+R35VLGiGuL+5jJF3Ar
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_082429_813341_CA774A2D 
X-CRM114-Status: UNSURE (   9.71  )
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

Update the DTS file for the Catalina platform based on the PVT hardware
changes.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Changes in v5:
- Revise CBC FRU eeprom i2c bus and address
- Add MCTP support for backend NIC monitoring via PLDM over MCTP
- Link to v4: https://lore.kernel.org/r/20250320-potin-catalina-dts-update-20250102-v4-0-7c34b8139014@gmail.com

Changes in v4:
- Split a single commit into multiple smaller commits to reduce complexity.
- Add `multi-master` into i2c12 & i2c13  
- Link to v3: https://lore.kernel.org/r/20250114-potin-catalina-dts-update-20250102-v3-1-14981744b2fe@gmail.com

Changes in v3:
- Remove delta_brick nodes due to compatible string not supported
- Link to v2: https://lore.kernel.org/r/20250113-potin-catalina-dts-update-20250102-v2-1-1725117fe7a9@gmail.com

Changes in v2:
- Add delta_brick nodes to support PDB brick board
- Link to v1: https://lore.kernel.org/r/20250103-potin-catalina-dts-update-20250102-v1-1-b0b7a523c968@gmail.com

---
Potin Lai (10):
      ARM: dts: aspeed: catalina: Add IO Mezz board thermal sensor nodes
      ARM: dts: aspeed: catalina: Add Front IO board remote thermal sensor
      ARM: dts: aspeed: catalina: Add MP5990 power sensor node
      ARM: dts: aspeed: catalina: Add fan controller support
      ARM: dts: aspeed: catalina: Add second source fan controller support
      ARM: dts: aspeed: catalina: Add second source HSC node support
      ARM: dts: aspeed: catalina: Remove INA238 and INA230 nodes
      ARM: dts: aspeed: catalina: Enable multi-master on additional I2C buses
      ARM: dts: aspeed: catalina: Update CBC FRU EEPROM I2C bus and address
      ARM: dts: aspeed: catalina: Enable MCTP support for NIC management

 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 197 +++++++++++++++------
 1 file changed, 144 insertions(+), 53 deletions(-)
---
base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1
change-id: 20250102-potin-catalina-dts-update-20250102-914b06a4bdba

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>


