Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F9C6074670
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 16:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kX99AWGE;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BOjuAOUR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zM3VpGqk066yvlDhCbkoqjg4/pybiKa+o08CKjiTZQA=; b=kX99AWGEpJX4avSU4GzxmYDCmD
	n8Bo9xNrdnqLU0f0wKeg9ZPBYy7vef2HB96+Njyw0HKYIfTyJ0adzNtYj4VV7zxED90YFk3p+q/gY
	5rglTvuyA4w1lffYN74oochlJ2EkKBBbXaxUV3ddMYeTG3qsF2P77TyZ4deu8X1mlXoBZ2e1Ofgu/
	zYXpVCBmZKHsK+5jhPs8vJR5Pi3/TQdXy3xxxEZTc90jkSCgeHDNtrYjB1y1ofqCm0hwvyyKxEYEJ
	Y9msWYbnXAJyUynJFb2BQCND9n9ZaanVjEygqx2kv61H6ZInf3NRp4XOBiwAUCpGSCk6VwkI7u7Xs
	kxpJXdNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvEt-0000000HKpa-2XgM;
	Mon, 02 Nov 2026 16:50:31 +0000
Received: from mail-oo2-x02.google.com ([2607:f8b0:4864:31::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvEr-0000000HKo6-0NRf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 16:50:30 +0000
Received: by mail-oo2-x02.google.com with SMTP id 46e09a7af769-84abe8ecec8so1367001a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 08:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638228; x=1794243028; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zM3VpGqk066yvlDhCbkoqjg4/pybiKa+o08CKjiTZQA=;
        b=BOjuAOURJZ0DCeB9YMO2yv8Cbys4JWvpyjPbGVYrwgTfWNXgXPgweaQG+vqs+WN6ag
         AheYaEAmozlva7S2Au+7cAuc57NbqA9M/TFSbQQf7rqTngqhtKWDYWiVt8ql8FdWbOPl
         1JQIvK2LSv7mlU9nsO7vezifpHdKGAq8+tYGsi9G6lrCwuFdu+jImtiIzRs9Nza9wgnY
         6rAUj9J7RDNM8N3gF25B9tAeAQ2uDzjv1svpnsek6ADoT0PWQ4srWh6QbjgaV2odGaJM
         mkwxYSkP+jmPaLPE+/sTUunDQ5loHA4XFe/D3+b4GmAGEzGLo6r4j16PtsfnKLAMRv9C
         t0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638228; x=1794243028;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zM3VpGqk066yvlDhCbkoqjg4/pybiKa+o08CKjiTZQA=;
        b=nzIeoOycj755nyCccTdSixX3MRf5h4nKyU/hRyb8hc8Z+ZdqEKr9oc9R5c0+IfSkHF
         ER+im33Fsmzh2QofIaz3iLILTjQMX+myEiT6kzbg8TKYjdbw9UYrxeOeQgmp4caFxzJp
         BZl3TMJjItxYVWFqx6qwtAP3l2eXhbWLCIc9UQvcPRw8WTNUL/bKj/NqAGZdy80/RmTY
         PxFQXYG4n73SMVyotPFSlrBh2zb5iOT0srlrHcYb2FPooowvyaGmiZy/eLqahFnYQ/MD
         ocxXDmHhLDa4r8nsxBckNFvgxl7EpR/70eOGFSZvPezPb4ozMBg49pb3ZjU4YCdkYiYa
         XUXg==
X-Forwarded-Encrypted: i=1; AKwUvBwqNVnuMINyb7IWvXg3f36CHT76loReUjotlvOQrz7J9zCrC3M6ZDz6XnyFeRRUPHSHrCgoJHcGpVX1v8vwXzR6@lists.infradead.org
X-Gm-Message-State: AFq9FYKSQcnk5iYYvImpfPfcKvAr7DKQWWg5BX23mhd8sLTBLUZZ5Agg
	QxxWNoDHsn2eMNLcO3H1xGsBGX0w7m+AqqBClYvAmxl8bdXvKa86In+J
X-Gm-Gg: AYBFou00WEABL+ZTJBU1aICx2rx2fuzO7zTFPtOrE28qkwENs1pDgAzgazYyod6Ys18
	SRnjotf2Wp4SYg1VaC/nT/bDDTN8y5nSxFAh2SPNCZK7lRRhDgP9Ss2IJ/JfASo4J0cA/To8C0z
	OIwZ3/yUjUpAeIk4hUxUxVzCLvyXGz5lSErnKeCMaCH5G9BfK62qBR0TSYxk+GSkGYHPWg8LkEH
	88PcG++/9wRPbs0G94VjEeGUH4dWKYgLRVTSYmA6fPrrkXgZzFacD4reHFuWRGSFwa5aFee0PUF
	4DBip50WHqQEHe5IxU0X3Z+vH+bH9eL6pqbwRWGvNo6dcdvsoe0/U4UZCNwuLoWEeGW94ojIz4k
	2EqzRK6m5QGiPYXsV/fA5TbAS0eQV+WYkFXR3hhnNjg67kiW0FtO1tZ9jDYCmPsC3neOYqw0Izb
	OMbks5Il0kKmJSiMnuts6sAW5rWF87sk+kPlx5XU2uxmhVvxNCtUwLsTcX0LNlq+rBfE7MrnnLT
	mBvXd52V2PbBSY1U4DJOVy8qc5BbzcQ26LBvLx7xMnzPRkyFHBCdrTnWZWuNSjG8ZaLNm0Iv6ru
	wMm11TMBUyPcS1yGkuSwWx5SRWvlp/hAZWSfjgjxubQWTgVtwdk9Dbpxx/1c9YlXx/ZGXXX8Pgn
	Uc8M5Hcmb9oXqAl+v/IM=
X-Received: by 2002:a05:6830:4105:b0:7df:5fc:3fd5 with SMTP id 46e09a7af769-85d362dff0bmr7694825a34.1.1793638227841;
        Mon, 02 Nov 2026 08:50:27 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354985cdsm9936779a34.10.2026.11.02.08.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:50:27 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH v2 0/2] rtc: mt6397: provide the RTC's 32 kHz output as a
 clock
Date: Mon, 02 Nov 2026 10:50:20 -0600
Message-Id: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/43NSw6CMBAA0Ks0s2ZMP1I+K+9hWNRSYKIF0haiE
 u5uxAu4fZu3QXSBXISabRDcSpGmEWomMwZ2MGPvkFqoGUguteDyjOEWFodxcW9c5piCM57GHn3
 SqiowJItK3pEbYYXutFKlgozBHFxHz+O5NhmDgWKawutoV/HV3yC4+HNYBXKsirzsVNkWPFeX3
 ht6nOzkodn3/QO0HV2M2gAAAA==
X-Change-ID: 20261024-rbrue-suez-upstreaming-mt6397-rtc-32k-0a1c16f63383
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793638226; l=2364;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=ZOmLqEV8DHWh2DzcDPWX0yn3ibXvLVXOQgGwZxT1ZLU=;
 b=EYIi/kP66XwXIMwPN4Sc/iR0MoBldI6Gl1SwMDFNh6FS6aWjtblle3rpmua61fZlG25Jv2kBd
 XNlFeUApXDTAnJpLQ4whIOSoDkCLs66sO0N9UcNyu4N9A7PTHVFlJuw
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_085029_146738_0BCC80B7 
X-CRM114-Status: GOOD (  16.13  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MT6397 RTC drives a 32 kHz clock out of the PMIC, which boards use as
the sleep clock of a Wi-Fi/Bluetooth combo chip. RTC_CON.F32KOB gates it,
and mainline never touches that bit, so the chip only works if the
bootloader happened to turn the output on.

On the Amazon Fire HD 10 (2017), which can boot through U-Boot instead of
the vendor's LK, nothing sets it in the former - the bit is set at every
boot, and the MT6630 combo chip's Wi-Fi and Bluetooth never come up.
Letting the RTC provide the output as a clock lets the chip's
mmc-pwrseq-simple enable it. With the clock wired up both came up on that
board in two boots out of two, and in none of three without it.

The driver registers the clock only when the RTC node has #clock-cells,
so no existing board changes. The MT6323 shares the MT6397's driver data
and gets it too; every MediaTek PMIC RTC whose registers I could read has
F32KOB at bit 5 of RTC_CON, but for the MT6323 that is inferred from the
shared driver data rather than read from a datasheet.

Both patches apply on top of the RTC nvmem layout pair, new in
v7.4-rc1. That pair went through both rtc and mfd, so I'd suggest these
two go through rtc only, with Lee's ack on patch 1, if that works for
everyone.

The board's devicetree that uses the clock is not upstream yet and follows
separately.

This series was developed with the help of an LLM.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Changes in v2:
- rtc: check for #clock-cells before reading the driver data, which is
  NULL when the PMIC has no RTC node, as on mt8173-evb (Sashiko)
- dt-bindings: add Krzysztof's Reviewed-by
- Link to v1: https://lore.kernel.org/r/20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com

---
Ryan Brue (2):
      dt-bindings: mfd: mediatek: mt6397: describe the RTC's 32 kHz output
      rtc: mt6397: provide the 32 kHz output as a clock

 .../devicetree/bindings/mfd/mediatek,mt6397.yaml   |  6 ++
 drivers/rtc/rtc-mt6397.c                           | 85 ++++++++++++++++++++++
 include/linux/mfd/mt6397/rtc.h                     |  6 ++
 3 files changed, 97 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261024-rbrue-suez-upstreaming-mt6397-rtc-32k-0a1c16f63383

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


