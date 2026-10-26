Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0669B606CFA9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UHtedGVq;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b6dDOc7k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=TRb4tYcOuZPVhYjPWbt4D3gJvCANnKN9gzX1O8Pld2Y=; b=UHtedGVqVPle/rxOiNlegW/fmb
	tA6MSpgli19D45HJgBdppVdVp8c/wYnN2BFw/v2NWafvY7008kza1przEQtLMXNGfylU/nMvv8V9K
	XhdJdQP1F/e7iXGRdsMFbKlZETeWjxsYMVEY5gYIen4EcapV36f5j31YDUP+vhXjKsBm6ciBnhVxm
	Ox5M3nDxg5cg5RBP8OIyK5njCXdGZzjcNQ4Jvhztm5D4DsOATGHg6FMVcVL5DeltXa6wF0aJU9gE0
	T0E/05IlJt8qK3Q/JYWdMdjGhArDJKauWGvQS/19V57bxvm/S98JcV8QpV3yok2SIpIT61bxWoTip
	kwA2NXvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSt-000000029y4-2pxT;
	Mon, 26 Oct 2026 09:58:03 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSk-000000029bY-0Xsc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:57:55 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso854395a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 02:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008673; x=1793613473; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TRb4tYcOuZPVhYjPWbt4D3gJvCANnKN9gzX1O8Pld2Y=;
        b=b6dDOc7kREcWdcvpJY0R97fFY+QbQ0MEdXHHsygiZLTfG0PDykWe/YMXrC5ELAo5GD
         jc7gbdjzNmcKFFNuooNGnRfRg8YJuRHYuD7rsFtk6emi7Qd/uM+RwiRc3eBbHS9PS3Ik
         5vIco/MQHq1n1GCyiZPp7RkBhEJk0XJV3Jy33PAoffbz/QM6tX8dF4CoFbPSg69x3s5N
         J/oo4H58e4rER8xgN75RAPFXZjUIdqOLRs8h5Sf4RpdaAZgZkoJ+AX2Jqyt+aW/XNxeW
         vaVCQbAvIFMJllypIsLNRtP+aS1/XxiZNIc3YgAaxIVfB2rYzhCM76EEgZ+c245M35U7
         KM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008673; x=1793613473;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TRb4tYcOuZPVhYjPWbt4D3gJvCANnKN9gzX1O8Pld2Y=;
        b=TnKjUzVgse4QRxhabTIvN8wkaFysb3qTD4sPY8yVdps3TavE/LyF2XjlZ+k9PIM0fF
         vkgaYLt7UBjDAWGuoXMVFu5J0kjC0HESX7nW8YRw6VAKhmhUP+pFqMxK6ulv/ybc+E7h
         L3G5hlPT3O5T/WVdn5/gZutu34R7Dpm0d3tNBl25xOeqTAHesFzF4HQ+Q+SbpPg0dgtA
         rPqivXqAjl9Xe2/O8Lgv8xgy5yDfqEoCTQ4IrqmRNpmXMpoojavWgNfQac8BuyX+XcyN
         VKN91KyHDgyM0vOrzNUTX8H/2QVrgT+VzkEjltMRIfAZDrFUrfdjXCMBNGPYf0ssbGDt
         fZyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLUc3PuzS/WCTVV4SLTwsH+0+9iTrAhZSb7e91CNNr2BNMOMmzkZ5RJjXkMu5IByvgzlGtB/aEgeF9HnX8UR8c@lists.infradead.org
X-Gm-Message-State: AFq9FYIc/bP3L6xT89ThN2twjeEiLhNu6ChMw16smaJnZ/fzdxYpXMcU
	lif+ZKv4qKEil1QG4ijrodC/uWLLugsJsIfR0rzFKHR6b2aHr5nf7sv+
X-Gm-Gg: AYBFou0N8cLlJRZvOq2qvIuvLBhMyMG39uwhxR4YB6QJGo25zHk2zG53cYk64OY1o48
	+zRvryfUoU6quA3Cl6RENh9aNdIw0v62z9UcHDxAlm/tMdqNhdHXr3+Flp7shTSMMTjLHLkUx9s
	HJuR8T4J2mSIuqxpk5iIbFz2iY/KL99vkJblb7k+2Do8qm0kaD5R8AfnmhLREDNuy/Q6AdsCesA
	P9VowaDvftlSRgkGRM1YBT6wvSjcWn00U0uGzd60XuMhn6b6Ug+HHOJHuWIYxon0N87GrYUbAk1
	CwrCpCvpy/2FG+Kzq52U8xdN4FlkH/D/0TwbDp+tTombflmLJSDZv/BP0bsYReDJ1JhFKCKis8t
	nguyLrwjFihyqjmIS4v+SEh1pgEzmlCEKYWtUtTHJHfG2TWGaKYxRjJ+KQRzF7p0x23ABtuAjlH
	qoZgM4EInNKyIiPEl9pSsUbHoDB70wBRsvu7B3Q+akcxfsQ4DgnRVV9RxbpffSCdWErZUjT7m5a
	fmfhAr+M5t4iCMCiDawE9n0OV/DRTe5zcrasVjgeVniZufTrybcTqB4nNjb7PsaUg2y4v8AMpiG
	gt/Dp4rGko98lNIHgoMs7VPH5WYOcW4=
X-Received: by 2002:a05:6300:6bc9:b0:3e2:59b5:a6a3 with SMTP id adf61e73a8af0-3e7a1b97c06mr4376109637.0.1793008672624;
        Mon, 26 Oct 2026 02:57:52 -0700 (PDT)
Received: from [127.0.1.1] (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36bf0f4dcsm1095577b3a.44.2026.10.26.02.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:52 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Subject: [PATCH net v6 0/4] net: ethernet: mtk_wed: misc fixes
Date: Mon, 26 Oct 2026 17:57:27 +0800
Message-Id: <20261026-wedfix-v6-0-a52f6b15d2fc@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHQUlJIzE
 vPSU3UzU4B8JSMDIzNDA0ML3fLUlLTMCt1EMwNLA1NDUwMTcyMloOKColSgMNigaKW81BKlWIh
 gcWlSVmpyCcgIpdpaAELEUQZvAAAA
X-Change-ID: 20261018-wedfix-a60905150472
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Sashiko <sashiko-bot@kernel.org>, Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793008668; l=2955;
 i=hujy652@gmail.com; s=20261026; h=from:subject:message-id;
 bh=549qJPyhyqlBNx06uotz1gnmv+Qgyf4W7lO1nGNCwHk=;
 b=s6R3dKe4amKcP5NVpaUVkILmnGN7AjJuw87IEHxjMsgOZ4RpuDVhDNjo6RwpCw1Nd9be1Olqg
 dFeUk96NAcuCyw/2hqTkfxI7BpUwpPLsEq0U1p4SG/c/MXdoXkslwoX
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=uXjqvnRsKEfHEyUr63sOg4fEJIDs4AmiW/rB1cWarXg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_025754_196519_8ACFEE54 
X-CRM114-Status: GOOD (  13.77  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Ths patch series includes some fixes for issues that were discovered
by Sashiko and one original patch fixing issue I encountered.

Patch 1,2,3 fix issues that were found by Sashiko.
Patch 1 was compiled test only.
Patch 2,3,4 were tested on a mt7986.

Patch 1 fixes tx wdma ring reset for WED v3.
Patch 2 fixes the reset condition for rx wdma.
Patch 3 fixes rx ring and tx wdma ring not being freed up
Patch 4 fixes WED on non-DBDC mt7986.

---
Changes in v6:
- Update cover letter to address the platform that the patches were
  tested on.
- Update message of patch 2 to clarify what's the issue.
- Update patch 3 to rely on ring descriptor instead of an extra flag.
- Squashed patch 5 into patch 4.
- Lin to v5: https://lore.kernel.org/all/20261016-wedfix-v5-0-8b02e78fd34f@gmail.com/

Changes in v5:
- Add cover letter.
- Add patch 3 to address Sashiko review on rx ring and tx wdma ring not
  being freed up.
- Add patch 5 to address Sashiko review on error handling.
- Link to review: https://lore.kernel.org/all/179000700034.2160803.10594281691384015089@kernel.org/

Changes in v4:
- Add patch 2 to address Sashiko review on rx wdma reset condition.
- Link to review: https://lore.kernel.org/all/20260730090030.201100-1-pabeni@redhat.com/

Changes in v3:
- Add patch 1 to address Sashiko review on WED v3 tx wdma ring reset.
- Link to review: https://lore.kernel.org/netdev/20260706101044.161059-1-pabeni@redhat.com/

Changes in v2:
- Address issues raisied by Sashiko in patch 4
- Link to review: https://lore.kernel.org/all/20260706101044.161059-1-pabeni@redhat.com/
- Add comment to explain the special case
- Link to v1: https://lore.kernel.org/all/20260630144831.1109-1-hujy652@gmail.com/
---

To: Felix Fietkau <nbd@nbd.name>
To: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Sujuan Chen <sujuan.chen@mediatek.com>
To: Rex Lu <rex.lu@mediatek.com>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

---
Zhi-Jun You (4):
      net: ethernet: mtk_wed: skip ring reset in wdma_tx_ring_setup for WED v3
      net: ethernet: mtk_wed: fix reset condition for rx wdma
      net: ethernet: mtk_wed: free up rings during detach
      net: ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986

 drivers/net/ethernet/mediatek/mtk_wed.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)
---
base-commit: 7076f684d5132e6a6145e1da2fa74771ecd052e5
change-id: 20261018-wedfix-a60905150472

Best regards,
--  
Zhi-Jun You <hujy652@gmail.com>


