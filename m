Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA44CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 23:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Date:From:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=chX5+4LVo+BT9/6liCDMzJGUd4v7o9vOEW+SNH6M1Ys=; b=mdjEpk6xmveQ9Z8pSwYSH474cT
	fNe+cLarhfH13gl8GeTz9mIpNzFIk9gv37Dv0QrIBagRdvklx+XF7nYSRLWAdw+13dYj5thPvEmno
	mp55v9p7KBLm4j2kURqvE/+rVj/rA9eIl3iVBSfCMoVnS/RrlXAW7T1mFcG/qk51fG1IMLsWr1COg
	8Bl2PuCgnn+08LL8actpJ8Wto3U2n6+p+sh5gCwP3Qch/HNkOgCJGxF6Dv5Sqr8EvaGmY0MyjNEAC
	LAs1L2jO9uwlclBtshvajCmz198pAjuwvGwlmaHjPj7DkkhFrzZQ7wQ19RYKMnG7CbbHEvLB/Lv1V
	pNBqNxZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXoZl-0000000AA5W-0ymf;
	Thu, 11 Jun 2026 23:12:41 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXoZi-0000000AA4O-3N2a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 23:12:39 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c85a297d2d2so224797a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 16:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781219557; x=1781824357; darn=lists.infradead.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chX5+4LVo+BT9/6liCDMzJGUd4v7o9vOEW+SNH6M1Ys=;
        b=RSNutEzo+JUr8EnrHXtl/KgVETVadqheAWn/0eG9ZuqefOADjyifGY777vw7ktjRjZ
         YyClunceQrMqcXTgbOQCWdrLBI81W413vAkueyJznM3ya3GAj8/Qb3V8I81lNEmtZSAb
         30EbJlvig6i3PPOku3HH8olYOoir3OpSsV3RXvHU3A4z0cFBBElhxlNpBVQEv9XC64EW
         aHLyDrPWcdzYIwpeCrGCYIkcqyWiS9wnxKytwQ8Z49nzZcnQzUJ2n9jekurJ2Nr9SSPX
         tFTclnnl8clTQVzjyGQltxs3oir4oee85gra2bwipP1yAKtwc/+AxyP/GyD6uqr0jB3q
         zY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781219557; x=1781824357;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=chX5+4LVo+BT9/6liCDMzJGUd4v7o9vOEW+SNH6M1Ys=;
        b=h58RiBo0czvaZ4kSchz34Fa6RC6kZiib9v4ef9UC/7192Dr3cQZMXToPaEhhgiQUyN
         yuLQr5B9IRy/7+3LkMTXa+FmxFsh2x+1JMtIRR6bfU7fXz5wytk62TWtcld3GkhdSwGz
         bkHTeMCEVcdALmYtkd0vPxBHkel1XKDByYF3QY3cr6Yj+WS0q3CVyXSMgV0LuaLauRRl
         e2PM1xn0GdG3uzJFv7RIDBXu7oViDAK8zY8Jqk8DhsFJHWMaoygyemth2L4bf5p9nPu7
         luNFgSOnGjoiVYkTU1q+eifnHlFWcFFo49q8LMIxtZ8wZ5+m1H/kH77+zYc0vWYXf4Py
         EzFQ==
X-Forwarded-Encrypted: i=1; AFNElJ9vbb+saeAJuLL+7966wvZjsYaV0AKjUcBNJYjTH1amCBLmVfq803ib6Rp7h6pV7N5qL7iCzvoYGvll845q63aQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwpZhSE++X9lcDqyBBNq29th6G1/UNRH7FcvNiDRkjI8P2asP/Z
	MzjmKaEIOZP1SYUZB2hVwdmMe56iQ3dI38Th+tK9x3kNpg9hhTXwe6KgayUn7YMPsYM=
X-Gm-Gg: Acq92OElk0Sk0xg349sY5MKPA0qoDR4CePhRzbBCsOTND2sw9awf7FbpOZJ+rtssfYT
	MUdLiK5eEUzNtH2T0IwDkpduZC9FGHskHmUci5H5XhBMQ5oYiTUOCZykoFHGVbmmY/nxgmlYXeh
	hNql2pllPTDGvGYn5QdO/lwsFsrOoojb7J6h2/C9BAIxlf7I8TggW0X/zlLTgqBmDFav2CmNZzG
	ZRXwx/NpDLVMZVmp3U5oCwCy7XNJxzb/VlJrlJk0Yu34LYOdNgYboPe6HZYm7K5OcM8x4IiRCcx
	OxodtTREbBKkuxd9SeP/Hj40lz9xrjx/toLKpHiaO8Xy5bpqRE86UXCsrEdVDhSKQbKzG+/OI9R
	9eLsb8moY02+oqfPuJ9xqZ3Ml5s6IBKy1G5x9y56oM7SaZP4l+orVk8dPp9Vl/89/xZ9hF6Gx4C
	jho4/STqyKfywTTKBs
X-Received: by 2002:a05:6a00:802:b0:842:4bb9:5fe0 with SMTP id d2e1a72fcca58-8434cc0ae30mr152666b3a.10.1781219557320;
        Thu, 11 Jun 2026 16:12:37 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afd100esm199571b3a.34.2026.06.11.16.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 16:12:36 -0700 (PDT)
Message-ID: <6a2b40e4.4dd82583.3a5c46.e52f@mx.google.com>
From: "Wayen.Yan" <win847@gmail.com>
Date: Fri, 12 Jun 2026 07:08:13 +0800
Subject: [PATCH] net: airoha: Fix variable shadowing in
 airoha_ppe_flush_sram_entries()
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_161238_836089_414422C0 
X-CRM114-Status: UNSURE (   9.63  )
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

In airoha_ppe_flush_sram_entries(), the inner "int err" declaration
shadows the outer "err" variable. When airoha_ppe_foe_commit_sram_entry()
fails and the loop breaks, the function returns the outer err which is
always 0, silently swallowing the error.

Remove the inner declaration so the assignment writes to the outer
variable and errors are properly propagated.

Fixes: 620d7b91aadb ("net: airoha: ppe: Flush PPE SRAM table during PPE setup")
Signed-off-by: Wayen.Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 5c9dff6..2b849d4 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -1333,8 +1333,6 @@ static int airoha_ppe_flush_sram_entries(struct airoha_ppe *ppe)
 	int i, err = 0;
 
 	for (i = 0; i < sram_num_entries; i++) {
-		int err;
-
 		memset(&hwe[i], 0, sizeof(*hwe));
 		err = airoha_ppe_foe_commit_sram_entry(ppe, i);
 		if (err)
-- 
2.51.0



