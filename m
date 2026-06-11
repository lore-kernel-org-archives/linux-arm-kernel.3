Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BA7CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 20:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zd41XiatIhmkg77GVQHRQLalQhR4rQLqWbEQKAVQlyk=; b=g0fGHPQKU3rRL94SNQBeR6q0M7
	OJItClIrC4o+SyNlEaIJDBikROT7wwS3jdWWd6J4w4SQtfv0Q4yACMqD+wQ3wCQR8ZFsAGR7hFMVc
	lor4vgTldSypBqni8U2Y/Or7hpnSdnkdtfnYTHC/kRMinFwiQXTxz1htp7bYBRPd3QASM5kwDcPEp
	WIthQeCodSsRK9KM4I7ruxs/6bDjddmyxzmFSl0si4cW0K/ldrVTLTJPR3lh47EdpzTmcVwuo1dK1
	6C2NGZpT+70Ha6caoHtsz9WgIgq4byDJaPzNmSKkV/iUqg4CpbJjgaASq5DTa7g9Vfk5L54ESMkez
	VP6T4dTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlcA-00000009zIT-219Z;
	Thu, 11 Jun 2026 20:02:58 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlc7-00000009zHe-2pzF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 20:02:57 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-69e8aa31e9fso138111eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 13:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208174; x=1781812974; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zd41XiatIhmkg77GVQHRQLalQhR4rQLqWbEQKAVQlyk=;
        b=FFvCDmk2kIpoKOObsrcMRhXiU9zX+iW1u9bX5AbZavFFl00e/GkPhfWneb2/54vyuI
         +oJagIlRFXfVYd3WGbGYGdFhL8IwqkIGuLJFFuRyUileN+DHd4jZkpkkWGv7ao4fiUbF
         knvOMY/BGXhCmdbJpc3+lwX6k1AI0upmC6bNMcn36ARrcUzauvkD5+sFCNvEgFLZ0aG0
         JfsWt8OBiI4RkJMByDE2zBWgjZHfM9rc64T/WRwhNUcopIFLkxUkdGFDq57JwL4mpvZQ
         MzzEylDO5cT5+ZObqjtVTMfcY/sqeAmYtI9+LSuFXBSCqq0q0EXqa6EF+UXeSLTDFa1A
         4boA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208174; x=1781812974;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zd41XiatIhmkg77GVQHRQLalQhR4rQLqWbEQKAVQlyk=;
        b=l3uyvVJS8cuOwmcj922vLEFtj5a5tV6FdHIWvAuIDqdlbTVOwAIvc0tmSv4w2Hrzto
         11JalEB3Yp+2jhn7Kss7JnChpZHpTXyHg/oK+tNRwQ4ZP0fvAxONOpKqWJUs6uakLLxi
         ymPqqxW7pXVFF2tO34YziulhcCA4icMOTR210MF9iaeSK3wA5nX8OGH8/M/AmAMh5v54
         khn4cjYqQhrsK7R6L7MLZ3FHoAGyoLv8herXAGmNZac8Zis61P4NMY86/jiLKLTIniiF
         N61CAkIZ9EOQf/bL3gq7yrLgbF9f639lInJNT1vIIihzm5ZDAGMbjT2NsFCX49qAbVgs
         JchA==
X-Forwarded-Encrypted: i=1; AFNElJ+yRvHgp0OJJO4kFepJZLMz6jrSzgV6fwp8uu0OFCXV++FSOepCAoOpu8Vihx0ai8NNt891xZgaGx1RzatuDr20@lists.infradead.org
X-Gm-Message-State: AOJu0Yykx8epbvyJe00eHQdztjKYVO8XADvC3mY7OF1ooHYfclcOEEO7
	Vj3+oBQwZvwRIJIvk0TnSrAFLTUZ2bMXnzZJT5Tb2OUs2ESiblGEQ0Z1
X-Gm-Gg: Acq92OFXZoiQP45Z9UTdcqra9BvDHniyh21L+FYJ/7/Za0UlKOSORqLL3raPsLG7F6J
	NGzNO43Niea2QLqt01Wxiyp3ku+XnkpzubA8sDXBBxlxrEW6OuEkHmIrSecEEdic3/KK27WVjR4
	tuirSZfJS1HbZm25nKUYlrWYqNDGvzSoYc6C2jl5u1I71uJZDlHWQnzjYqgbiyMipT+Sl/nQwdc
	IxTGk3+NF8JV7IKkU9vCuAfBU2Y8klCLCBT9VMdGitRmwYpA5iSe5xoeMDFF1oz4dyIPqVdRLzw
	PBVulwjvUpOYg8XaTr8d4W93FUTUsTRwluR1CNj+Ffk63U4MD6220uk+Umsr6Hbue1fYnbj62cx
	4YbrJbcB9m7scvXO7huhYK3eqtDc2hXajZSCLo04K23DPJELToFrCWunkRlLlqlb06S/qa5xKDH
	e8LGTyTS9f
X-Received: by 2002:a05:6820:4b96:b0:69d:e5f6:cef5 with SMTP id 006d021491bc7-69ecb060dcemr2957697eaf.55.1781208173971;
        Thu, 11 Jun 2026 13:02:53 -0700 (PDT)
Received: from geday ([2804:7f2:800b:f09::dead:c001])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d30105fd9csm3244376d6.10.2026.06.11.13.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:02:53 -0700 (PDT)
Date: Thu, 11 Jun 2026 17:02:42 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geraldo Nascimento <geraldogabriel@gmail.com>
Subject: [PATCH v6 0/3] PCI: rockchip: 5.0 GT/s speed discouraged by Rockchip
Message-ID: <cover.1781207474.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_130255_711765_C991A6C0 
X-CRM114-Status: GOOD (  10.43  )
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

Dragan Simic already had warned me of potential issues with 5.0 GT/s
speed operation in Rockchip PCIe. However, in recent interactions
with Shawn Lin from Rockchip it came to my attention there's grave
danger in the unknown errata regarding 5.0 GT/s operational speed
of their PCIe core, including data loss.

Drop all code related to 5.0 GT/s operational speed from this driver.

Endpoint Mode driver was not tested.

---
Changes in v6:
- Squashed patches 3 & 4 together as suggested by Mani
- More formal warning message as suggested by Dragan
- Set the 2.5 GT/s bit regardless of if link-speed is set to 2
- Link to v5: https://lore.kernel.org/all/cover.1772239598.git.geraldogabriel@gmail.com/T/

Changes in v5:
- Changed commit order to not break builds and adjusted copy pasted
  commit message. (thanks Charalampos!)
- Reintroduced behavior to force 2.5 GT/s in case there's something
  non-default in the DT. (thanks Dragan!)
- Link to v4: https://lore.kernel.org/linux-rockchip/cover.1772169998.git.geraldogabriel@gmail.com/T/

Changes in v4:
- Incorporate suggestion by Bjorn and refined by Dragan to drop the
  "catastrophic" code
- Link to v3: https://lore.kernel.org/linux-rockchip/cover.1772057799.git.geraldogabriel@gmail.com/T/

Changes in v3:
- Clarify warning message even though Rockchip won't disclose details
- Drop DT changes as they were applied as subset by Heiko
- Link to v2: https://lore.kernel.org/all/cover.1763415705.git.geraldogabriel@gmail.com/T/

Changes in v2:
- hard limit to 2.5 GT/s, not just warn
- add Reported-by: and Reviewed-by: Dragan Simic
- remove redundant declaration of max-link-speed from helios64 dts
- fix Link: of helios64 patch
- simplify RC mode comment
- Link to v1: https://lore.kernel.org/all/aRhR79u5BPtRRFw3@geday/T/

---

Geraldo Nascimento (3):
  PCI: rockchip-ep: do not attempt 5.0 GT/s retraining
  PCI: rockchip-host: do not attempt 5.0 GT/s retraining
  PCI: rockchip: drive at 2.5 GT/s, error other speeds

 drivers/pci/controller/pcie-rockchip-ep.c   | 13 -------------
 drivers/pci/controller/pcie-rockchip-host.c | 20 --------------------
 drivers/pci/controller/pcie-rockchip.c      | 16 +++++++++-------
 drivers/pci/controller/pcie-rockchip.h      |  3 ---
 4 files changed, 9 insertions(+), 43 deletions(-)

-- 
2.54.0


