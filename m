Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905A8CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5mpUIW6+CyzXZCjIETW1X/eFRIiBeTonduLxFWGZK/o=; b=47FdC1fhQ4zIxI48MlzygtHshT
	OKy257xz1F9PZRpGTDNCXtXHSJ8wie5YJHT3D2uXnkkzU3MRvte0Gw/LxN5HcRR+MdPsBSCRH4lCv
	lmifNLSksPKOGZe8AtI/Y803ukRNRsUqtpkTW5/0sokmtdJehwtbHHgIqXJgh6/gg/La1w3L6zSVE
	TX3IqEa0LWjFgIwtf7v1fCAQ2LZOrNty3daWHI1XxqWkL7BnvGDD9y87PLlZCsJfvIxflgjZp70Gw
	oEed2GteKPzj+0V5npGzogISvrnrPFRgT0U1mUwRH2S6U82KJv+/OKgun61kcwbTNvJeSea6PlquO
	nj2HTPwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIcg-0000000C2Xr-19DV;
	Tue, 04 Nov 2025 15:07:02 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIcd-0000000C2XM-1Ltc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:07:00 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-640b4a52950so2878622a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 07:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762268817; x=1762873617; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5mpUIW6+CyzXZCjIETW1X/eFRIiBeTonduLxFWGZK/o=;
        b=T+kmMkguZu4qwNIpSUn+zmdzUIOwkzkDC+zCt8NSWCI7m9U6YXU0TOXn2MGlZRRhHw
         TEIlU46s4bF8a481Lxy6dCZuQb3zOmZKCSiU8lmp0XI9+eqhtbavYwzV/Lf0nmQ0s7Z8
         RQ6l8htN/8TrpS4E/Nf3Q65He62dMU6DdIQ7gTa+eyBd65K5O3Yuuae4ssz3r7tHZ2Pg
         K+wiOtoToEZmiID/L5yGA0vGocvEj+z+zVUtkZw6QUJjev5uj7CHgrJ9LvktiaOOEl/n
         1eDWAno0hx2ggvtwtYFRSC9z+qVtLCXOLG/CO0zSP/ohQx/Hwv8LIG7l7FXkMaIzRI0J
         AL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762268817; x=1762873617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mpUIW6+CyzXZCjIETW1X/eFRIiBeTonduLxFWGZK/o=;
        b=kQS0pCixuBje+1TrPVVm42QaH9LY6GXdxJpVaceZ0YDE2eEafh1rE/sGakHkNH00DC
         ObZlE47GuNiXIICLI5Gtsihg4PCKFH3MeerFnyNqT2ErM3vGYmelB4M/LeWyP75jLsfV
         Q4pG2WAXIp7yJn6769GxxTcRw1asVO645C/vhZb5wh9O3u2hQyB2sDoEKtxYInspM65a
         izNEGzEeR5A/Rx6qgtEbolCqgaHSmwSgKs81C4ntLEz3MJXklCsigxGTpXvYR1lOUUEJ
         33ubnAQ4CT5KLcXsdq+0i3ZYR0BJVhLmzdyYwNU1LPbV4I+weBh7PSM6HaRv977XbXGE
         x9wg==
X-Forwarded-Encrypted: i=1; AJvYcCXlHUcoa+q1REJB5irhXg/ByYsYjXhNZbgv/AtMQ8Apv27V70I2RFom3cRSctOBPXbeTp/TzCh4DASDdN2RDoFh@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5adJCOqyCLL6j9Gaf7+T4AzJ0K78suOSswWpdTkFGHHpJfD8y
	5IE8LyywhJVCNIk6x1SqTD3vVscJGtj9jeeLnzHSsyP9ZSEazGkBaALk
X-Gm-Gg: ASbGncvdxmpzDg7iFXdXgS77vyfujgD5mqp4kDRVp7YO8/h3t1CTTUhRHBk3/p3957W
	90ABnPQLiptQRsGj5iy4ZpgTQFCJVb6jXygON6nJ8SLTp8TJQ2s2y6aeDSWfg7AoTf4MkjQQfnh
	PYcuPbk84sV7oXCQ+o0Lxnkl8DWBBK8EuOy1CTkxudJKYiy103Eha6K16CM4EK2UVmis9QLkzjS
	PGC+GQEnpdt/bKagXePWtyJ3TrO6tErAtnpVrIcLXQXCy9Xn8+QEKigQAxwBGRVxO84XZx0LA+q
	xv2QdJaRRlzHaF8mpIO4DUg5MAhmHiEzsOJW6I35i4bVBOaZRmUv+o5Nxh3VIkp6y3V8EGfe0oH
	Nc2K2AHESYaODKx72o0GwJe7fEND1dGsXeKVoX1OYwn2mEFItUWWo1ZuntmgJqkJzw3jEjDrRvf
	bXB6JHPhp5tJu6AauSf1nvkL6IAw==
X-Google-Smtp-Source: AGHT+IHpPTJa2+j0h+Cs4K2bC2PC8wb2EuNR51cOnJgsXf5x4woRyQv45qLS4utiEScOeGGzpAw/cg==
X-Received: by 2002:a05:6402:50c8:b0:63c:4537:75c0 with SMTP id 4fb4d7f45d1cf-640770823a5mr12779586a12.38.1762268817213;
        Tue, 04 Nov 2025 07:06:57 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6805da3sm2342014a12.15.2025.11.04.07.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 07:06:55 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Switch to using AIPSTZ5 on i.MX8MP
Date: Tue,  4 Nov 2025 07:06:09 -0800
Message-ID: <20251104150612.1874-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_070659_394074_CA9C7FAE 
X-CRM114-Status: GOOD (  14.53  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

This series is a combination of the previously dropped patches from [1]
and the config-related patch from [2]. This enables the usage of AIPSTZ5
on i.MX8MP-based platforms.

[1]: https://lore.kernel.org/lkml/20250610160152.1113930-1-laurentiumihalcea111@gmail.com/
[2]: https://lore.kernel.org/lkml/20250707234628.164151-1-laurentiumihalcea111@gmail.com/

---
Changes in v2:

* squash patch 3 into patch 4.
* rewrite commit message of patch 1 to state that this driver is used
  for the IMX8MP-EVK board.
* rewrite commit message of patch 2 to (hopefully) better describe
  why we need this change.
* link to v1: https://lore.kernel.org/lkml/20250821105634.1893-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (3):
  arm64: defconfig: enable i.MX AIPSTZ driver
  arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
  arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'

 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h | 33 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     | 16 ++++++---
 arch/arm64/configs/defconfig                  |  1 +
 3 files changed, 46 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h

-- 
2.43.0


