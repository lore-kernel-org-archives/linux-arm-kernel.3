Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9CBC36011
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 19:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/UtZagbG3T/uK5TqNzNdEuqBMJsjG+CKy+jLJwbOUaU=; b=L1KMKKudIMoXusflxdkatQqIay
	depyUkPYqDZW/+a3C4Tj+X1jAFVoPfm8DW6N0wbbJKnU3AuRZoKYndShyrrdPYInzT+XrEsWE+DGq
	J2erycXKnEl6cSyifQtnMqFCS+Jak1JlL7H/dWvY40d4aCgp/8mXFiKOLWFsMu29vZ9f6fH7zpPSt
	UOlFQJHC+ZkbP0OgqI17UBRyqR3QY8MyT0IAEd208ivOWV9vJyngYaqtu504Z9yqwJLQshU13JnDl
	BfPUO429NNvniQH4a6NEvdVrlIS0TXwgmYdxpAG4dhUeCdLI7VOrndCVIDy0y8kj1B/bg1oRMYeWN
	eRQTspNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzKhf-00000001Dpr-2LII;
	Mon, 31 Mar 2025 19:21:47 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzKUB-00000001CAh-2zXT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 19:07:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=/UtZagbG3T/uK5
	TqNzNdEuqBMJsjG+CKy+jLJwbOUaU=; b=UWPYzrW/TKlfbpcAeo26FYIndGtsXb
	IzefAXRRC8INxMwHItZzCa4KcvkBOy8zLLXeQ9h9qYsXFcmCw45Mi9FmPlpDJYTF
	1k9RtnKoz/MyWEYvoSlaCxBqRLYXUAGXQkzONKd6kTWELCL2DDWLxiylCoriGIzi
	uZ2VFH6YMyfiIU7OidruuNBWnK2R5LSe/Bw+tJ6RGQ0FD6T5rmJsnBWlEmbHpPKE
	7miOahJqFQlbucqgGgG3wR5seTMs7tZcFtiuGNnS7kOY3SFhFqCb1D+M1HzscZnp
	W6Sa9Oh4APqImTHY9kl0/MeOd1QBqyNN+k/mVwxfglFYiVpyKLcEe1Jw==
Received: (qmail 1349266 invoked from network); 31 Mar 2025 21:07:43 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Mar 2025 21:07:43 +0200
X-UD-Smtp-Session: l3s3148p1@3Kl2IqgxROEgAQnoAEJMAK1XZKOIHRkS
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Subject: [PATCH] MAINTAINERS: delete email for Shiraz Hashim
Date: Mon, 31 Mar 2025 21:06:42 +0200
Message-ID: <20250331190731.5094-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_120752_654705_4AF276D5 
X-CRM114-Status: UNSURE (   8.63  )
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

The email address bounced. I couldn't find a newer one in recent git
history (last activity 9 years ago), so delete this email entry.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9bb1db9979f1..32f15c2ce531 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22627,7 +22627,6 @@ F:	drivers/accessibility/speakup/
 
 SPEAR PLATFORM/CLOCK/PINCTRL SUPPORT
 M:	Viresh Kumar <vireshk@kernel.org>
-M:	Shiraz Hashim <shiraz.linux.kernel@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	soc@lists.linux.dev
 S:	Maintained
-- 
2.47.2


