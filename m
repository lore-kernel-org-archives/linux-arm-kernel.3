Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A8BC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 20:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JaOoKXT3Y9f1LpI2jFHn6H2wS4bnhm1a37EU+be2Jqo=; b=ztRkl6TUSfe6CftwY7GfFcevti
	Hdvgo/avFBjJ9X3liyhM7rhcx7EV920DIQh/L/lMN14SwmJov/jJZD5qs9k6VmXzjtE1+vtGqiEMx
	4OyhijJ8y10FX//l5Ja6pMkSObT8QFcN8s4Np/AczVBsY2EdazEMD7Fqn2aRY5NAmI595uCl/W51O
	AtjQ7cq5cYLejINpLLC4U7967MxHodZCCCAhmmoPrmnbetj/LP0sAvgQSCrkKicgD6fFs854v2Mfm
	Qxn0m/aAzlrh+uA5bN44/EOXxO6YH+wtT0tzZ6mcf3QaUNJqs0kuIsgZPX5kYm2Ku2yJDJsr2tPWB
	AQOJg/2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4P6K-0000000Cp5f-20MV;
	Wed, 09 Sep 2026 20:41:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4P6J-0000000Cp59-17Fx
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 20:40:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=JaOoKXT3Y9f1LpI2jFHn6H2wS4bnhm1a37EU+be2Jqo=; b=L1/k205fxVeTb0yJNUCBgLR7NB
	ubdL9nEtbSmtDIW9y86Byxi7TE8zDGGuZB0C2KCC+Okd3OtbHhOo1CD8A2yHjgH6Yai2q/1cZE6Sg
	tf7jybaJMg24B3P8ZpTgwB7PIk4VJAsJ08bmz/wNgltDHk6p1PSSmJ+IN0zUPl1thFkBbl3AqH+xm
	5wY2Htru17zvdeNIN+RUCkkSH3uwh5FNiR/u2w/5FU7qQUbLBm8cKp6zut2n9wY/qMTtatC6F8J9b
	XWVxVF9FyfxTuoREY7Yxn4d/JPoy2tMRy+grgnkuLCN8SjOsGMxr/zJ7MU7WP0hsTvOUFF+gDaZ2K
	0WAUWVVA==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4P6A-00000001egx-0OnJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 20:40:57 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso54290515e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 13:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788986447; x=1789591247; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JaOoKXT3Y9f1LpI2jFHn6H2wS4bnhm1a37EU+be2Jqo=;
        b=ehGA7KIoL/YQBdmN5LxJ3gXcuT6ByawiFl1rfa34z9CzfUb3GlZyNLYJ/A6ouYGibD
         OHjYWvqnezB5Dyh8s89QfexbCdhwhe3QhRUcWGqkx0/LMi81HcSh5Qqho3sEjnAzY9Zy
         TdvI98glLeZ0zzgEX1IuVZfdUOpjIyE9We1Spg0iBZgFqdfyqkZTvtKiGMabWdkBNm9t
         Jcz8Q588svmztQQgOw67lUoEZLbLRBP2h3Q4+iEBKgsuQNbXC5oFDPGvBCJ6sT5OoKBz
         dE+7Tl21STFBuey+VEcghqFV3PaOhmAbdRVq3feZbsPzeuSoix2iv/Kn5AL/Jh+h1XJk
         ExbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986447; x=1789591247;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JaOoKXT3Y9f1LpI2jFHn6H2wS4bnhm1a37EU+be2Jqo=;
        b=dR/hLsq4wEkEAjGlt/0W43XYhx1pvqF150w5NnvJixfWAyG/r4EHYsvfk7M1XLy327
         ReQqezFw4H2HO2qJJUPPeomBbYBDpPSOI9OKoPyFqMx1woAjKSqq0+3BOurzF7Noan9t
         W6WxhtY3DYEmxgKPcp7uRZc4AZaAcrsDNmeaEfMgVMbN0XghdXLDTU0LD/ShWoUq0YYh
         CZUXgdARYIFrkF1HSn7TqSiQBvjfj/lo2y9opcvwr9/LLT5DJyfxvk73GBWjJGuaVOuU
         b76xB8rmD0Q0N9amp3/Hb0vE0szA0jHGXD1OVvGr/8asPvcEcma9oaBHcUo319BXWmua
         7D8g==
X-Forwarded-Encrypted: i=1; AKwUvBz+xeQRQVjrJ9iIY8VQzxhSgjRRa1aJ3VigyT15w6amECQHH/nfRmCV5r0kniwpUDGvgRt/FP7HX4UgJ7cD98NY@lists.infradead.org
X-Gm-Message-State: AFuF++kYcZ60yEHKCMmvp7oZDodvCmV0fl6/ZnGKf+Ttgm/ZxZN9H0Ss
	nxj25bLEf1oqZFCERTNJWxLaMVHdijI6NzUxARUlbI5SWs0qukwbJqjI
X-Gm-Gg: AYBFou0T33DMh29tqaWIk7pKAgN/e3VqdCFvaizFirNDMZDZn8+4lOH7qge5tzQwZWO
	DvSMyGEBEkSF6mL0XOjO00qJ7WzsO4vKHn5UiXGmwWq2KMYXMGi1B7ZoXPuInp7ks2l4xCng+3/
	qY1fJVtwLaBszwnNcJfaMCd+pND772UEloSnTVlFGZXU1BVQDlI/vVvz6P76F31jxH4SNwPGpok
	+UUPRHpjrW7Ku8Pw81qibz0/QVT2omseTqHcvj6hDIfY83wtDy4lSRydfyUwyIxM0dLpDda9oUd
	YSufb45F66UibTHBW8uTMlkXpOobCnI/gv8+ROFbuofCFOKnqULm6Jnjpga8QPYXZz3kdx+wxNP
	+UYR78XvnDDiRyrKLJrm1lsv9hB61nFg1PmgMUJNmN8WEjVohTyv2egzmEPxjhOsAR1POR0TNvc
	yfKpReYDzHsgkO6qqzxVpPnNkRVNE+enTjWW/8V2AW2KfgJDZ5H/rAlhQp3Cq0mxMgBKbzBHxAY
	LAB9NAkX4882Ib4txRWm0C+JTNStiUnLi0+h2E/2ZN33FQv0WcmUfda9JtuRmy5gC04U97Bo6KE
	zdyZ1MS+HBtxR9fgsmcwzgjzQksu1J37KCDvV3P0++mZpV/D3uDn1DAzTtR1jOykZErIlxBqurf
	4bvTgQhY1UNp5Awrf
X-Received: by 2002:a05:600c:4f43:b0:49c:fc6c:be0b with SMTP id 5b1f17b1804b1-49cffd457a4mr279515695e9.17.1788986446464;
        Wed, 09 Sep 2026 13:40:46 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c437besm17171315e9.11.2026.09.09.13.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:40:46 -0700 (PDT)
From: =?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Subject: [PATCH] ASoC: SOF: Bound the panic filename print to its array size
Date: Wed,  9 Sep 2026 23:40:41 +0300
Message-ID: <20260909204042.46656-1-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_214051_444230_6EF6315E 
X-CRM114-Status: GOOD (  10.47  )
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

struct sof_ipc_panic_info carries the panic location as a fixed 32 byte
array, and include/sound/sof/trace.h documents that the "filename array
will not include null terminator if fully filled".

sof_print_oops_and_stack() prints it with an unbounded %s, so firmware
that fills all 32 bytes leaves printk() with no terminator to stop at
within the array. It continues into the adjacent linenum field and, if
that holds no zero byte either, past the end of the structure into the
caller's stack frame, since every IPC3 dbg_dump callback passes a stack
allocated struct sof_ipc_panic_info.

Use %.*s with SOF_TRACE_FILENAME_SIZE so the print honours the
documented bound.

Fixes: c16211d6226d ("ASoC: SOF: Add Sound Open Firmware driver core")
Signed-off-by: Ștefan Ghețu <stefanghetu9@gmail.com>
---
 sound/soc/sof/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 2d394389c945..9b0850e87bf6 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -152,7 +152,8 @@ void sof_print_oops_and_stack(struct snd_sof_dev *sdev, const char *level,
 	dev_printk(level, sdev->dev, "trace point: %#010x\n", tracep_code);
 
 out:
-	dev_printk(level, sdev->dev, "panic at %s:%d\n", panic_info->filename,
+	dev_printk(level, sdev->dev, "panic at %.*s:%d\n",
+		   SOF_TRACE_FILENAME_SIZE, panic_info->filename,
 		   panic_info->linenum);
 	sof_oops(sdev, level, oops);
 	sof_stack(sdev, level, oops, stack, stack_words);
-- 
2.53.0


