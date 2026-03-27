Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDDB10AB832
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 00:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jF3VGWtFl5+5o0uq4BkVs4561ebEJfqMmvq/lQMWgIo=; b=DY4HwAJLX06XjckDO44tBSXs9l
	nV8TkcbBXvIEHYOJU2+23nk3BCwvZuEkbkgf5r1R1VyRagKZQKu4R02eXBZ0SXuq5+9qIe4YEq0+z
	qBKhDyBsjc66xbG/3kJQ7oeArs6rDlo5KRPQLK7YvFpgVU1M9xOjc42bLva/7+18JCuo5Ji9iBiJO
	w0MaYF13QFgN0Xcg40ZTpHAwRrivfd7p2sa7T11CWRyRdFAvdqZbfej4RIrSRS6uKe9Ddt69ArZU1
	s1ihpRik/WXjPpn0sM+c2ylNOO3SOheq/6C/dwpzkJKhUbdmO35vV9++2zWFUl21fULcgP3Jvmi2i
	ILFYphDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5uob-00000006QLn-1s6A;
	Fri, 27 Mar 2026 00:12:41 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5uoY-00000006QLR-2uso
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 00:12:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774570351; bh=jF3VGWtFl5+5o0uq4BkVs4561ebEJfqMmvq/lQMWgIo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mL0VJltyFIuTAuDiXbq0SFZZtwXZHycgE0zQd8Pdni5gtRYlgRrFs9iSWsjYNIDLU
	 ZahxIJ3swxFCe87FTCNeYIsqADKSVTn6R0wWFabTzgvXmuuIbclLK8pWh1Fj/ub4vr
	 F8P0rOdwNduvAkO37xvewIeztKUaL2YOLszylhWM=
Received: from June.localdomain ([123.121.145.35])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id 31B3D40A; Fri, 27 Mar 2026 08:12:27 +0800
X-QQ-mid: xmsmtpt1774570347t0b1u0f4c
Message-ID: <tencent_FED49CF5331CC0C7910618883332A08E2606@qq.com>
X-QQ-XMAILINFO: NOcEdvLhLw8TC3ZRP/Ms0StBJXSMyXt0mU2UswUKCWUlYxFjktxm4PCFaA1xS/
	 EyzMCbbnf0yAdffRpg0L3tinYG7P33cxMV7HET/P46r2gumZSJli6l+weTKjXu4Xz05bnuUZjiq0
	 pmeNp96t6ySl+iel6n/kLFUQ4jB/oHXJUdtkfa/4GsK1oSi3mE9NcU0/7Sm8GouX218nqxeCKNAe
	 LwiiNRm1iCtCBsLAz/96ynLKP6QvZ52ne2DDmdgcYgi9GkisNL5EWjuxwkA4c5TsawyE1bNa3DO7
	 BF7XbJPNNVsa06JylxRz4kLskpVXqmPs09Vwxn6iaK3eANR3IN5vmGDXzw2dA/9nx4UVIfov0F9+
	 3FD3ZLQom/kbFJOxCJfcD4ehTLaPG8nbmWOf982IWvOn24PKa5+3owmU1y4w3Pp5eVulVOIKMu+6
	 zVwphqDXppwIFAD9JKisnxWxKJ4+5Uq23hUJ2U3ZkSX05uxIxwqgEf87bC+SEHkaomIac4p9/3Lg
	 Jdd6Z5lXAueJyRSQIdrsOYeGy8aTMf61MnSrNMD1y8QJKlKOblGFejXIGN8oaRqLMgvCqOFYr2F6
	 bGmGgmB6z92I/MWqt+cdi5K0oJl00zBWs2XD1kucFkDnSUD6P2iwgpjMd2Wym5mMlLu1yXkHXK1t
	 AjaDRV3xkdT+duBWUk6CYiEZTHnHqh4Rox1fC6OWWh7gxV5vGXGKfK+ygKFdaGL7bQHhpo8OsNrh
	 ILo4L/k6l6CuNO/Un5shA//IrgSSL9zzT+RnjY+ZSWgfEnKoae1MaeBHmgzDi/x9BfGneqNimrwb
	 OhMBwcNZZ0TX5XskB89pFRAXzg0hm643TXzLnfu02X7O/reQluAWrKdhpBh6A+Nadf0L9IbxRBSi
	 WZDXm7B5wMHfT0pyXkm8jnvYn4f/aCcEkXwplDrHpumfbOjAd0WoOsHzgZqu6YwwTJpSIRSHlZ+y
	 bn/YtDozYt7Ua0ncRNxltyxIGiWiRxbsBIdkxiv/qeGhyD8dTE6x+RpXiFCF1H85SAkSvMx6+pkh
	 MbR+YM2tq39v/Tkg0aQM7b1OV2cDEx3JJo5eTeKpOo2liS2EZfZt4Db4lsRjzANEK2TNxpbQ==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Wang Jun <1742789905@qq.com>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn,
	25125283@bjtu.edu.cn,
	23120469@bjtu.edu.cn,
	Wang Jun <1742789905@qq.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] soc: fsl: qe: panic on ioremap() failure in qe_reset()
Date: Fri, 27 Mar 2026 08:12:25 +0800
X-OQ-MSGID: <20260327001225.23192-1-1742789905@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <780c1ba3-6639-478e-896f-e35ec059b58c@kernel.org>
References: <780c1ba3-6639-478e-896f-e35ec059b58c@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_171239_062291_E5EED054 
X-CRM114-Status: GOOD (  12.58  )
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

When ioremap() fails in qe_reset(), the global pointer qe_immr remains
NULL, leading to a subsequent NULL pointer dereference when the pointer
is accessed. Since this happens early in the boot process, a failure to
map a few bytes of I/O memory indicates a fatal error from which the
system cannot recover.

Follow the same pattern as qe_sdma_init() and panic immediately when
ioremap() fails. This avoids a silent NULL pointer dereference later
and makes the error explicit.

Fixes: 986585385131 ("[POWERPC] Add QUICC Engine (QE) infrastructure")
Cc: stable@vger.kernel.org
Signed-off-by: Wang Jun <1742789905@qq.com>
---
 drivers/soc/fsl/qe/qe.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
index 70b6eddb867b..9f6223043ee3 100644
--- a/drivers/soc/fsl/qe/qe.c
+++ b/drivers/soc/fsl/qe/qe.c
@@ -86,8 +86,12 @@ static phys_addr_t get_qe_base(void)
 
 void qe_reset(void)
 {
-	if (qe_immr == NULL)
+	if (qe_immr == NULL) {
 		qe_immr = ioremap(get_qe_base(), QE_IMMAP_SIZE);
+		if (qe_immr == NULL) {
+			panic("QE:ioremap failed!");
+		}
+	}
 
 	qe_snums_init();
 
-- 
2.43.0


