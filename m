Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD762C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 21:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UEFRrppcFHZATwPoos54W9hcQwwdollH5Hvdy1WxMYo=; b=R9BsasBmpeir+lojNx+xiym4BH
	NK/7n1IRZth2XOorhrXqBqyfmNzfEnIPLd37HmQ3bPo31EDYlgWJl5Of4zTlFLJgA1aih8My29Sil
	qx9aVGv27CDcnmwKEK95qVsShM3/g3biS/hEJP9yq3ThJsX2QjXE8ujzMnKe2x6QSKsUXfJVHsgr9
	3ahmk7ytNZtO5mFES77/CkWzlgc380d6pOH6JQ1BJrnBp6h/mttHDuKJmHO0ClGpBiTbv6xXYzfGl
	lzVvlq1TExPdk8ELNIavDDDSOL0wOVMnkHfMoaR1IsDHuaFIK3XvUrpz+QNd+EidbVG6ntM9uJCbU
	/MUaMvEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYX9A-00000000r6U-1M7z;
	Sun, 06 Jul 2025 21:43:40 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYX6o-00000000qlX-40Xv;
	Sun, 06 Jul 2025 21:41:16 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-73c17c770a7so3127786b3a.2;
        Sun, 06 Jul 2025 14:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751838073; x=1752442873; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UEFRrppcFHZATwPoos54W9hcQwwdollH5Hvdy1WxMYo=;
        b=VN6pdE6NsMB5HTj+pOhQfLSDp0Tt8UKJNQ9xMprNn7Aw6bmE/W8Xc7qpf+tUtt//U0
         F+yo+UWflV/dSXJYaPzAI8B6NB/iSfaXSdnrxwX8RpxOtzn0l/MWtkm9DIjE099puUOs
         SjEPjgLng/9ecyrBeb2I6Pm18uzxIV70LAZin01Gy3sl2cAYLz+g99cHF16t5UTDPiMS
         qamX1kTJ+iy3OjPE/EAVdqXE8NHLLu9Zh6NIXSMQHnL82GJ60Ue9YuLnB2p5OnXgZb6F
         iuajF5PU+ozDi9hTRSG2UcDMM6d+9QEhN8IhJ9MI1cYoe9J/2GJ3WOMqd4hvoFhzeT0v
         AsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751838073; x=1752442873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UEFRrppcFHZATwPoos54W9hcQwwdollH5Hvdy1WxMYo=;
        b=mbTs9Xh68Cp2ZrcPmkhUDr9MUznGsbEcurkX/mWlC5BLvxkFor/cJ0BxZevPaF5zCy
         3UgO/irR/q84gVo7bEk0bTaR5l/hCK55uxRsrMc/YWFJEt9ILnAs5xPMTtdke6OzqFwB
         W04k3M44exJE26Z24ZKXv3Ruu2gOksdGwOoUyQaLiYaqKld0jjP45sM3Fi5o9gNEtn9L
         WRhHqtVHk3S4BxKXx4CZEQm3gHqqO22qZw6QnQ5T3pTuXnpqxQ4M7w8fXptXqgUXfb03
         JPEwquatetR74W4m5/uoyo3hW02TAWSQ+su0sPC65zhiZDmZGV4as0kQP9C8VBkBac6B
         ntvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZI/RkgoJqv5KV4xP6rQZ3ztpfCzJB+ogSSSfwD5orR5lMlbEl1SHWs9zYuttyJ9qiDKT2LAwFxI4y4+pj9NsC@lists.infradead.org, AJvYcCWEZR6VpiX9duDsA9NNHHlcS+d8FZUbV6/vio4Pjivaq9KhykCrhquiAXnjCE1/+Qdzhn3ZD9yW6wUxRtDkUko=@lists.infradead.org
X-Gm-Message-State: AOJu0YzcDnaeoGuEHG63OKFzXJ/QEkkLwcmAw0mksn/gc3ABF87BVAjY
	lkZ+mTyhgtZnsGiuThTfLv7T8jhAgi02EgF0UMugIgzSNmz85H+IFOb0
X-Gm-Gg: ASbGncsaTMBDH2x3UKjB9MRHnaKMx5xY5/vQYYeHbYEGy2vZW8w+hvBDlfiQyvtcPRl
	YVS/MKytQbcWg9689E0QMeCg5KjqEvCQqj6Ktk89LCFeJSfpD8Wh81jmCpxvYRgsgzo4HME+X5l
	6GfcqwnAHDLNlM0wYZwuG5eukBqnlFspWfGABwc+/c6c5cmNdb49rKt4j1AFVq81sORIOkOV+wx
	Riqg6ERMBQFrbtW+ZBazU3rY78clGAh5PhDRqFwf34pNJqHujjEWmifTpogrxXwMZ4+cte++M0s
	1fieVbK0a8LxpeEyVNPgdzoz1V1g8tFpymXUxdhwXdI=
X-Google-Smtp-Source: AGHT+IGwKdpyijxHBEuxiWpktwVPqOdmEARgRAnlFV+5B6kzie1HeDmU+tDrXvf31ZBdmm2Ca65x7w==
X-Received: by 2002:a05:6a00:2354:b0:73f:f816:dd78 with SMTP id d2e1a72fcca58-74ce8ab166amr15315143b3a.15.1751838073517;
        Sun, 06 Jul 2025 14:41:13 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74cfad75020sm4126416b3a.109.2025.07.06.14.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 14:41:13 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	yangshiji66@qq.com,
	ansuelsmth@gmail.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 0/6] wifi: rt2x00: add OF bindings + cleanup
Date: Sun,  6 Jul 2025 14:41:05 -0700
Message-ID: <20250706214111.45687-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_144114_999321_99067EAF 
X-CRM114-Status: UNSURE (   7.52  )
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

It doesn't even compile. Added OF bindings, documentation, and other
stuff to hopefully this doesn't happen again.

Rosen Penev (6):
  wifi: rt2x00: fix compilation
  wifi: rt2x00: remove mod_name from platform_driver
  wifi: rt2800soc: allow loading from OF
  wifi: rt2x00: soc: move and modernize probe
  dt-bindings: net: wireless: rt2800: add
  MIPS: dts: ralink: mt7628a: add wifi binding

 .../bindings/net/wireless/ralink,rt2800.yaml  |  49 +++++++++
 arch/mips/boot/dts/ralink/mt7620a.dtsi        |  10 ++
 drivers/net/wireless/ralink/rt2x00/Kconfig    |   2 +-
 .../net/wireless/ralink/rt2x00/rt2800soc.c    |  75 ++++++++++++-
 .../net/wireless/ralink/rt2x00/rt2x00soc.c    | 104 ------------------
 .../net/wireless/ralink/rt2x00/rt2x00soc.h    |   2 +-
 6 files changed, 133 insertions(+), 109 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml

-- 
2.50.0


