Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3898606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 12:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yoAU0pXH;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e/YGxQMV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hAf8XmQfH8PWn7lymtqjp6h8RME9h4xbTbTpyoS4dss=; b=yoAU0pXHVbhxTUbaKOqeRG2m88
	HS7VsRHtZOBTPqDvlw1iBjVDNgNae01HN29ELfW8KvUEEyPWByOi/hwQ3kuh1MSWfTtjW9aTeKB08
	pg+X2Ru9xxg67N0VubWtPpwZMLrVFvjTDLpO27zyYajaRFCVBFCVJkYbjXVuP2MdjFrb5qCFDSNzG
	8Z1/uoFas0YeQh5zURHFXC4HHQwGqmSbB9srqk56JP6qf/LornJXNNf7e7Qdisg+X4Scgya9cb0Il
	kouX8i6ynuVTiO50NohVI55ciDfc0fQbOmidsGPhphGq3suRRx5E2fJyZbbbNyKYGpsqrm611/r/Z
	23XM1Crw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsGh-0000000E6AQ-1tyh;
	Thu, 22 Oct 2026 12:51:39 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsGZ-0000000E66s-2JqW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 12:51:33 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso4062985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 05:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673489; x=1793278289; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hAf8XmQfH8PWn7lymtqjp6h8RME9h4xbTbTpyoS4dss=;
        b=e/YGxQMV5z8c9eQOYUJMLwAmrqjh9tZqvIbgZk2GBoYLXltEFrl/OsO3mL1Gse/vyp
         iGz6viehzsEGA3sLop6MVLKqiPiJJlfaLA9St9wj2dZxrdZMITCPWeR+DsEcArwA9JzM
         n5+UCa5KZ+Q0lBlfkcCXxwVccD85GroHMjL4glr9rHl++/nx2Whg/FeVtP+olupRRCOU
         nMKGYANcAH7yU1Qy70EfCyRGswmiz97knaBO3VFakGgaq8FnQRekqmtSmT8C6zEFQTSl
         FI7Ex6ttpz7esznlauo957zCvXPJ5Amy2UYa/B9vGxDSxYnj7wbzFyxQlSOC+GP5ghY7
         1Qrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673489; x=1793278289;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hAf8XmQfH8PWn7lymtqjp6h8RME9h4xbTbTpyoS4dss=;
        b=jVkZHvrourqJOKGWy/H8qMdUkPE2vlT0gammFejLQxdvYjm6F6qeGZC6wl+8APnvjz
         8aqQp47RD3XlQqmhk+1meFFqFyhT4QOlJHE/6WiF2HYa+SEwT68F6iNYhYmApCjGTz4r
         RUgYnzOvBGT6yP65nZOCp5Sjb57TDHGt91tKo4Jn5X7y5ZJ7oQYGAibtaCHkTTthObXU
         RGmLGv0focg66P4P+WktUa3kG5h02//uOR6MDIY/d+/0IrF8lt6nU29aYgz8JuW6LzRz
         vCIqIfsxmXHpzxPVJ8KPz6FqJouu7mn0VgUlINsrS/Y2I+BSRCJs7gYX1U77HklRfMFh
         pqHQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/vcAh31gbywmldgzSSQrNJZd2qfH/EAkSC09D3Yj7+V1yp/IvJvJqoBg+sV5KklAoUEkh0qQBPb6Y2GadW+he@lists.infradead.org
X-Gm-Message-State: AFq9FYKCuZvqoqkwaLsiqEmvXcqiZ0SIVYyDXV1FPJbWb95EG4DXQRz2
	/wXH6mhOZV07LYUGwD4KECQfQ+T3R/GMBs86hmgoLwSSOYwjavDjY6WB+MrnRx0z
X-Gm-Gg: AYBFou0R2HxlJv6Qj8CqXMNYKNd5GbgAsRl36gDe2/ll2VpeBKunEC3XbptGOymwtps
	yu4e9J2cprU9XuxbFBx+W3W5NsxBjU1DdaGlGx8Yd4bMw8sl+uWVmuTiuAYjEWK0AEE7lxMkBtB
	9OuAf9i1UVCZOckFGN4Ix7gfVaCxPJ9T17KGOv4uW1xtLKMt4sYa5JIYFz5isFqUPD8SgLlfXSl
	RaftRCKHQus/ZfBYcAZ0yrDA7EOi/ASP0nnWEXrzBLNDbBA9lHuNKMXHBaCdf1rR3LJI12wysX2
	3s4rWRdFmNrw/UwExgIlOXg1UTjCAqZ3L+Ry8GC7ED6s2LAQvDeFbWZb4TAl/dG4pHUD5kecF63
	5WfquuyRJmgqshDJ/xtc8ymmLnJ75BpExAC6AMLZEnNy1Az+7nP7yAYYuSkCG/8LGG+EL3QZLvh
	05CoB5Mx+7+CefVocjS7ZnCVMj1JsIhFlIvUpjzVqCQ3gSpfQ8zCST6cUmEijaim7VwoDkUnGiq
	WQU/X2VzbKlendkhMcqnlxD8Yn27Pzw6Acy20/u7iTEuVE5ys2MkPumc/MM44pU7c+iFUbUW4se
	yB6kPFs1Z3/OKhFEEc5hDh8adBZWiZYa8lcxpwTba6Jy1B6YG9XcgIM=
X-Received: by 2002:a05:600c:3ba0:b0:4a1:7d9b:d4ae with SMTP id 5b1f17b1804b1-4a1fdb078ebmr127894895e9.5.1792673488922;
        Thu, 22 Oct 2026 05:51:28 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0f243sm64112995e9.5.2026.10.22.05.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:51:28 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 0/5] arm64: dts: freescale: Share the Toradex NAU8822
 BTL overlay
Date: Thu, 22 Oct 2026 14:51:04 +0200
Message-Id: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALgG2moC/x2NQQ6DIBREr9Kw7m/g2yh01Xs0LhC+lUTBgCUa4
 92LLt9M5s3OEkVHib1uO4uUXXLBF8D7jZlB+y+Bs4UZcqwFRwFuWsHrn5SI0C0jWFJYYyW6vpG
 srOZIvVsv46ctPLi0hLhdB1mc6eXiijeQKVrnT6WcZvDBg9ETRQ2hNKPeEkTSdoMsgJeKm7oyq
 NSzfxeltrQ+TJhYexzHH0xT9a3IAAAA
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_055131_637672_EC3DF0D8 
X-CRM114-Status: GOOD (  10.74  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The NAU8822 audio codec on the Toradex Verdin Development Board and
Apalis Evaluation Board V1.2 can combine its two loudspeaker outputs
into a Bridge Tied Load (BTL) output. The overlay selecting this mode
only sets a property on the codec node, which both boards label
nau8822_1a independent of the module.

Instead of adding identical overlays for every module, rename the
merged Verdin iMX8M Mini overlay to imx-tdx-nau8822-btl.dtso and combine it
with the Verdin iMX8M Plus, Verdin iMX95, Lino iMX91, Lino iMX93 and
Apalis iMX8 device trees. The combined Verdin iMX8M Mini DTB keeps its
name.

To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Changes in v2:
- Split the BTL patch out of the Verdin iMX8M Plus overlay series, whose
  display overlays are deferred
- Share one overlay instead of adding an iMX8M Plus copy (Frank)
- Also replace the Verdin iMX95 and Apalis iMX8 BTL overlays posted in
  https://lore.kernel.org/r/20260922-v1-imx95-overlays-v1-1-694100afb4bc@toradex.com
  https://lore.kernel.org/r/20261001-v1-apalis-colibri-imx8-dtsos-v1-1-21881dc324c1@toradex.com
- Add Lino iMX91/iMX93 combinations
- Link to v1: https://lore.kernel.org/r/20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com

---
Ernest Van Hoecke (5):
      arm64: dts: freescale: imx8mm-verdin: Share the NAU8822 BTL overlay
      arm64: dts: freescale: imx8mp-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx8-apalis: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx95-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx9{1,3}-lino: Add NAU8822 Bridge Tied Load

 arch/arm64/boot/dts/freescale/Makefile                 | 18 ++++++++++++++++--
 ...n-dev-nau8822-btl.dtso => imx-tdx-nau8822-btl.dtso} |  5 +++--
 2 files changed, 19 insertions(+), 4 deletions(-)
---
base-commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9
change-id: 20261021-imx-nau8822-btl-de926231bf78

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>


