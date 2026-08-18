Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E63EC5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 13:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:Subject:From:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EnE8Ac80Xeo0YvrWYWO15hMp/yHf4W3nmKkYtcbFD/c=; b=MVsfAnC0DUO4xr6ntI36hB8Ouw
	sbRnAM6Zm3rTSxacumDVnRNCUjz8bxfN3OXtjjmgrDf6zHMtkDMDAvAn6gij/VBx/ABlqj9xOqBEs
	5cH4Gt3WXEn3KUf6tJllbYXoV7Enw97HhLhIqW5TEz+/LN/13QStsyDz18i6V6mUvWtUYHG+M285u
	rVli1XNTeNSVtqk6ZGksn8TDCsKhmfGZX0Y6f0tB0/jdgXx47oMkhpNVrhq3FQjDEjvUWsf+GHKT8
	uPMgZCN98CFP38jgV5LZ4vM0x9k9BqaKADliU7oXqZgfO5RlfK2QDWrSMmLv+ton5JdEt9dnjmcgl
	CS+moGxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJjE-000000081x6-0CrL;
	Tue, 18 Aug 2026 13:19:44 +0000
Received: from out203-205-221-192.mail.qq.com ([203.205.221.192])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJjB-000000081wl-2K5j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 13:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787059179; bh=EnE8Ac80Xeo0YvrWYWO15hMp/yHf4W3nmKkYtcbFD/c=;
	h=From:Subject:To:Cc:Date;
	b=jjPVkooNK06YQy0y7BPHfvu8U0ne6XfYE+jqIRj6tizpgfTTU/ZT/a6bNXCOlP/26
	 WCwnOQMvydCaL2hbo7+By1eZ5t1EMEo0ffDH6rUvUIhdwtGY4ENVw6WUTtdxSwaiZp
	 ocawPQtu/8j6jlMfbRifFgA/T0q/swL3V5vn3lBs=
Received: from [127.0.1.1] ([5.195.0.150])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 1721C6D8; Tue, 18 Aug 2026 21:05:50 +0800
X-QQ-mid: xmsmtpt1787059086trq17d73e
Message-ID: <tencent_405FF24AB67AAAA26BC85ADD092710C0BB07@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9X2uROP3QJmhslvlrFV3Golkzi8hDQC5JSUnIFRZvFEtlTKN0uff
	 fwGAX66sk+/bbEuY9nihtoVDIwg/tDaJhEtiWgo+tSBG+OQPpDINDA8xgdwMSPyi6IA1K62XAVU7
	 5xNZgeowHG7ThZFJlOyPoaBa3qgzq2Qm48/Kz0o1U3Eis6RK3QBuPBHOrP68dg2l6PK7Vyuh021u
	 wcBTspGMIhDmzVDzhqbfx469+hmQiBMqRiiDCYVTlExQYcVTDyV9R8ebv8d8mCIY01Jj7k+JXRTp
	 +ttl9bZmugcRhiPtN3D6p1Pk0xTbry9uMSOdIt31lqhr1m8WJnqyNpuyxhXA7/cTmXYfszuRZaVe
	 feArIgP43WyxO404ADfM3pZE26jnyw4pDngRDGw3unu/xz0tgj8q/gXPESoUwbCnlKb664Ah/j9a
	 kravXFZUaEoxMha9kg6P7b1C2o0BU+9gfQkESKUWpXiJvlcwWgvl3oKkcdHZZuB4ac+9JGdTyxrw
	 zrlrpQwg34Gw7UF77PML0WDHCmsi3quKUw2Dvv0RHCgtIi2yLsWJdxlSAI5oAC1quwZdRAXUNF2g
	 nUSIYPgbCzjMHtt0U5vWYmPoWHK6Q0wBmgxhP0wGF37Rd06T9MVdCkSPmaBQjpZiNAM7CiCFOWJx
	 QXYO7At16K/P8nPdM3bUItAtpdSvS7ofWVg32Z7v9zJuBz3YuZDskctld19VyUtsW+KJTaQNfYqi
	 +NWy74azsfeNditfQQBfyN2bP699/AylwVYTdfNehPUCB0dB+zJLsC7j0BtdFa4fEeqQd3n5mXIf
	 fp8GsZypT2YuDk0o/KrIJaOMelzIlFQ3gqgVfflualv5SnfiSbjdVYRHJLW6/VtllKz1TDl3STBy
	 vvFPgyHZwvjmq7aK7j71+P3etgjbmeVU9EYq0e0/55WLZpY29507Qh31yDXvbLbSol9JqwG3/JPZ
	 EGSFManxfBoxt8zG/grL++6czZRFHB9ygnYqXSdFfzzYw8sSIylyf57PEdsvsfmp3vWJp5LbmmK3
	 bn+ddeMARkl17idbqgEtw8cUlHOpY=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Jiawen Liu <1298662399@qq.com>
Subject: [PATCH] memory: exynos5422-dmc: handle clock enable failures
To: Lukasz Luba <lukasz.luba@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Date: Tue, 18 Aug 2026 17:19:36 +0400
X-OQ-MSGID: <178705917686.291840.2383875087169763088@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_061941_908899_9A6BCE72 
X-CRM114-Status: UNSURE (   6.67  )
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

Check clock-enable failures during probe.

If a later clock cannot be enabled, unwind clocks already enabled on
that path before returning the error.

Signed-off-by: jiawen <1298662399@qq.com>
---
diff --git a/drivers/memory/samsung/exynos5422-dmc.c b/drivers/memory/samsung/exynos5422-dmc.c
--- a/drivers/memory/samsung/exynos5422-dmc.c
+++ b/drivers/memory/samsung/exynos5422-dmc.c
@@ -1297,8 +1297,15 @@
 	if (ret)
 		return ret;
 
-	clk_prepare_enable(dmc->fout_bpll);
-	clk_prepare_enable(dmc->mout_bpll);
+	ret = clk_prepare_enable(dmc->fout_bpll);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(dmc->mout_bpll);
+	if (ret) {
+		clk_disable_unprepare(dmc->fout_bpll);
+		return ret;
+	}
 
 	/*
 	 * Some bootloaders do not set clock routes correctly.


