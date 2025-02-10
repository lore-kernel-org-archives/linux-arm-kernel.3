Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5569C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 14:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eUjZ6nL8w17oREQOvkvYBXo6SX9OZgpgfq7fRKD2fXc=; b=Fa3gJyHdZGzBkvnFGttUB9sh2x
	SJ5sJy1mD0fV+dGLl/u3e7ngRh+ZKVjP1cF1jjd8/oxMzXJui6yK1lUjRqp6tMomeqIcTACxBzqja
	MPk+hi4s21jXRi+RoVufMPk1caefzDAy/tqC73rejrz93XQOhvxnEV8Uw320clEGnGS87BJ+B4n5A
	D+7pORDjguQLqJBL+o3ooOvKKWTNuLoGAaPxMMpSywKcI6h446j0njp/RdL/KoGs9DRnE4UevRbFh
	rVj9hhn2ZQtgBiJAXiaYk8zQgIL4bw9Fo4WU1x8i1StRPSWD8H+r6wHOKPYck5/oiWgKPaQ3wtSS+
	cIdqx+2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thVEU-00000000D68-1xa8;
	Mon, 10 Feb 2025 14:57:58 +0000
Received: from mail.botevgrad.com ([84.22.5.30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thVD5-00000000Cpi-0E5Z;
	Mon, 10 Feb 2025 14:56:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6FC226018ED00;
	Mon, 10 Feb 2025 16:56:25 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=devture.com; s=dkim;
	t=1739199388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eUjZ6nL8w17oREQOvkvYBXo6SX9OZgpgfq7fRKD2fXc=;
	b=I2YfSUjIvFE6ccoGMTV1CoWbZTd8yX1YkdJVoW5eGKl4A8K8hRp7UNnJf0XZ/5EJ/uIX6E
	XcNOJJOFA82LYBJuA9AsFFUlLRJywrBnZsCL0Ox0KZS/rIdgR0ok0ztb46KToJ0aWQ+YW9
	yYWp6K+G0WZruJ8As+5uMoU+r7LHAKeClGacIHiiiuoAeOXyuai52PqmTVnNh3vQzSc4+r
	Hgqt2sJIDByucK57ExmM1b2XRYoF2Vy1FnKafZEYfNMs4f1ehsvqxyxvjfx41nUa99awm6
	KO0Vi8A2uY4RDd34KFVy1iI7NYxU1ffRTabQYGbvfruMjj25tb1kFrX8nsMerg==
Message-ID: <18be5ba2-6dc4-4766-9944-59cb46c8dfaf@devture.com>
Date: Mon, 10 Feb 2025 16:56:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Slavi Pantaleev <slavi@devture.com>
Subject: 6 Ghz frequencies always listed as disabled in newer kernels with
 Mediatek MT7921K (RZ608)
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Deren Wu
 <deren.wu@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_065631_252122_E9D21EDD 
X-CRM114-Status: UNSURE (   3.78  )
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

Hello!

This is in regard to Bugzilla Bug 218731 - Tri-band AMD RZ608 (MediaTek 
MT7921K) has 6GHz band disabled in kernel 6.7+ despite working in <=6.6

URL: https://bugzilla.kernel.org/show_bug.cgi?id=218731

I'm in Bulgaria and `iw reg get` reports this:

```
global
country BG: DFS-ETSI
         (2400 - 2483 @ 40), (N/A, 20), (N/A)
         (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
         (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
         (5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
         (5725 - 5875 @ 80), (N/A, 13), (N/A)
         (5945 - 6425 @ 160), (N/A, 23), (N/A), NO-OUTDOOR
         (57000 - 66000 @ 2160), (N/A, 40), (N/A)
```

For testing purposes, I've also tried switching to another regulatory 
domain (`US`, `DE`, `SE`, `NL`) via `iw reg set ..`.

Regardless of the regulatory domain, `iw list | grep -A 15 Frequencies` 
always reports the 6 Ghz frequencies as disabled on newer kernels.

As the original bug reporter has discovered, the regression begins to 
appear in kernel 6.7.0 while it isn't present in 6.6.30.
I've done a bisection and the results are like this:

1. [bad] mainline (954a209f431c06b62718a49b403bd4c549f0d6fb)
2. [good] v6.6.30
3. [bad] v6.7.12
4. [good] v6.6
5. [bad] edd8e84ae9514e93368f56c3715b11af52df6c3b
6. [bad] 89ed67ef126c4160349c1b96fdb775ea6170ac90
7. [good] b827ac419721a106ae2fccaa40576b0594edad92
8. [bad] d1a02ed66fe62aa2edd77bd54e270ebc33bd12ff
9. [good] 3abbd0699b678fc48e0100704338cff9180fe4bb
10. [good] 5a423552e0d9bb882f22cb0bf85f520ca2692706
11. [bad] 56a7bb12c78ffa1b02e154b1d779ed2a1555fa3c
12. [good] a3c2dd96487f1dd734c9443a3472c8dafa689813
13. [bad] 089482a06b74a40d45773b1871182e8f04be026b
14. [good] fce9c967820a72f600abbf061d7077861685a14d
15. [good] c948b5da6bbec742b433138e3e3f9537a85af2e5
16. [good] 9585316a2aaf773a67846bdc8bbdd4df1e9622fa
17. [good] 51ba0e3a15eb1643116a93674e230e11b9499592
18. [bad] 09382d8f8641bc12fffc41a93eb9b37be0e653c0
19. [good] 4fc8df50fd41c2762d893211487be0ecb24c6a05

09382d8f8641bc12fffc41a93eb9b37be0e653c0 is reported as the first bad 
commit.

URL: 
https://kernel.googlesource.com/pub/scm/linux/kernel/git/stable/linux/+/09382d8f8641bc12fffc41a93eb9b37be0e653c0

Regards


