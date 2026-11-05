Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4291A606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 00:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GzR5QuXV;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=J2+gircp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5MfiJva0/xirl8FRrP4VnTwbPtQthSWfsgrznic1PW4=; b=GzR5QuXVydw1hO
	jfO5AOGMPm2Prc/pwm2jdeWVn6DdLEQVLlF/aG4eJ1dv38QoXpfhw1Q5bbKLGOFNbmVQv/ZPOyvvR
	PmyXaPK/f58gnc1FgMZWx4uUVM8zimxQpsEWpQVPvFcnIMsQ7mteRECFI5HfzWi39y+t91r9v2Hn4
	migjgs0XhI/C3GNINuvRhX9SYFQdemyQUS1nD5meBjUss0QW+JMX8LIwLverhEi1T5yUgmqJu8F+d
	GU/DAZ8aRbP260RuKwom6BlrFVKMAnuILsyHCVA04WggrlALcAY2UjXfj2pkqDXpZjzhT8cwPBMoT
	uc1mgu01tV5VvY54Kq6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOl6g-00000007Kbo-06If;
	Thu, 05 Nov 2026 00:13:30 +0000
Received: from sender6-op-o12.zoho.com ([165.173.180.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOl6b-00000007KY1-2QuT;
	Thu, 05 Nov 2026 00:13:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793837593; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gurDVg4V4MKsadFymtJ57Ev0pnXMQXXNYW3ANli0W75NRY0HMaFa+B0Tce6NIRxkADIywP6u0jU3jOHxq64oLbSCx74XtQISw6uj5CBsQYDMuW/sHPZfy60ALsCMcQ6FGoviUoOn0l7CuRVFjmzOhCMcHwnn4Z8o1UZizyVZkhw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793837593; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5MfiJva0/xirl8FRrP4VnTwbPtQthSWfsgrznic1PW4=; 
	b=bGioRSTdTZM3j0432MVEZg5FG4EdpwsbU5/LfQFRttnbi6iUCFB8J01JfyTqj9ZAw86/sdQNPj/naxIzABJ76A8zV9pzFJnrQg2OdICJNcuUEh4u6QZZPKJfcivpp6tHykP9hB3fNswAocSSVCUJ9LGRmfQTzwcxmggRhHlNiiA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: a=rsa-sha256; b=J2+gircpt3PgzMMd50ML7WYpzET1fGn0/kg5xEPmDZVzL0iMwjgcT7mCk8BmIEgLRC/8yBhWeWvkTp9QaN0ahS+T3uD4h3N6jYFmuS3k2Y5W22QIZj063MErbB3Aj6OKoZufxBMCyKzF9ifPZwzn8M95+HT3bnQg0+We41LcKSs=; c=relaxed/relaxed; s=zmail; d=ziyao.cc; v=1; bh=5MfiJva0/xirl8FRrP4VnTwbPtQthSWfsgrznic1PW4=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793837593399851.6803336597001;
	Wed, 4 Nov 2026 16:13:13 -0800 (PST)
From: Yao Zi <me@ziyao.cc>
To: Ulf Hansson <ulfh@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Yao Zi <me@ziyao.cc>,
	Sergey Shtylyov <s.shtylyov@auroraos.dev>,
	Midgy BALON <midgy971@gmail.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Frank Zhang <rmxpzlb@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Kevin Hilman <khilman@linaro.org>,
	Caesar Wang <wxt@rock-chips.com>,
	Elaine Zhang <zhangqing@rock-chips.com>
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] pmdomain: rockchip: Only put clocks that have been successfully obtained
Date: Thu,  5 Nov 2026 00:12:56 +0000
Message-ID: <20261105001257.1368266-2-me@ziyao.cc>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105001257.1368266-1-me@ziyao.cc>
References: <20261105001257.1368266-1-me@ziyao.cc>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_161325_701745_9AF53DEE 
X-CRM114-Status: GOOD (  10.14  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since pd->num_clks represents the number of clocks described in
devicetree, invoking clk_bulk_put() with it will put invalid pointers
when some clocks cannot be obtained, triggering a warning in CCF like,

  WARNING: drivers/clk/clk.c:4844 at __clk_put+0xf8/0x12c, CPU#0: swapper/0/1
  Call trace:
    __clk_put+0xf8/0x12c (P)
    clk_put+0x10/0x20
    clk_bulk_put+0x38/0x60
    rockchip_pm_add_one_domain+0x2b0/0x468
    rockchip_pm_domain_probe+0xd4/0x2f0
    platform_probe+0x80/0xac
    ...

Invoke clk_bulk_put() with the counter used in the loop of obtaining
clocks instead.

Fixes: d8b384777066 ("pmdomain: rockchip: fix clock leak on domain probe failure")
Signed-off-by: Yao Zi <me@ziyao.cc>
Cc: stable@vger.kernel.org
---
 drivers/pmdomain/rockchip/pm-domains.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index db3879846db6..34c862e56aad 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -931,7 +931,7 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 err_unprepare_clocks:
 	clk_bulk_unprepare(pd->num_clks, pd->clks);
 err_put_clocks:
-	clk_bulk_put(pd->num_clks, pd->clks);
+	clk_bulk_put(i, pd->clks);
 	return error;
 }
 
-- 
2.56.0


