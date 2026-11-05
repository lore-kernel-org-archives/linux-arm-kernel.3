Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAD4606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 00:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OGWkQE/q;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=OWNzIXAr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=EE+ZxZ11bOn6PDgXUu7s+7JAKoOJklP/SEl1SyhfFOs=; b=OGWkQE/q2FY0X630izqNbMGg8n
	u+eyrik80u7NcxoiOScgtnku0rH4s1b9aKa1gD7MQxsZkAfDn1n/4YcT86hP2Uf22zoP+3W3TLcVO
	3AO54JT2Y6gmb4o+ZNUAQGAo1FPD9o1ZeBmWcV2TNj86QzmQRn/AZcqBScgOgCgb1oVANQHb97OxV
	hBzGk5hHd+4XFo1gdGuTNqQCyuvQX7t1ps4P7qXdmEbXW7Bu2lET8B6KpeqdDJGvgLQgOtrZzJpGV
	xE+VCohUgxGRCtZxI7WD6C3qsSfyUpHm4535XCK8Cx5zGilwPAr03LLeEjYLtx0WE0qmqfBmEexrb
	TtJ/bsVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOl6d-00000007KZH-2tjn;
	Thu, 05 Nov 2026 00:13:27 +0000
Received: from sender6-op-o15.zoho.com ([165.173.180.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOl6b-00000007KY0-0WfU;
	Thu, 05 Nov 2026 00:13:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793837589; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KN6sJivP+ulewEprS0Ie5syuGH1Wisk/n9PDxZp3/0D+HuWfsQ+UdoULduj4Or60hkChJ4jrJOEropVNNBzfZpxCijGZAyucwDML0eZh58EXVfPC+3tw5MIrrPmJt7N0k/JOiYvnNdJrambtDKGNqSO/lxMi+RTHWYn/NIU5HNE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793837589; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EE+ZxZ11bOn6PDgXUu7s+7JAKoOJklP/SEl1SyhfFOs=; 
	b=VcRckM0to6DXtFFuX9fen0DQUoBRwSv1Hcroup4AUutZTG4UwuJTbK+EFC78PpExRb3vmTf6C26chREGkzw09rrexN1lVPUT5L1Dv9jSQGstjgx31Ywtk/mcwhZB50WOSLoXlQyTlARu6+N4KCzp8EuqQn2xB/paJ6J7Tol9z2M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: a=rsa-sha256; b=OWNzIXAr6AUirRbubqzv6Wg+bry4GBLXkUfFnLbI3J1bw1l6pkrMLdBZt6Gc7KpYe3wDSQdzwc95IA0Z8cbWD9+yqsr4SdHEZsoPpXGwGEgJ4DUxsYBF1OJHfbu0ttegLppY/z2VnJfeUNMQQsS4E8U60m+mDVTO4KKKNX2m9hA=; c=relaxed/relaxed; s=zmail; d=ziyao.cc; v=1; bh=EE+ZxZ11bOn6PDgXUu7s+7JAKoOJklP/SEl1SyhfFOs=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793837589017224.5474271944463;
	Wed, 4 Nov 2026 16:13:09 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Error and deferred probe fixes to Rockchip PM domain driver
Date: Thu,  5 Nov 2026 00:12:55 +0000
Message-ID: <20261105001257.1368266-1-me@ziyao.cc>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_161325_215181_1B547CCA 
X-CRM114-Status: UNSURE (   6.78  )
X-CRM114-Notice: Please train this message.
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These issues were found after I upgraded a RK3528 board to v7.3 kernel.
Here's a configuration that I used to reproduce both of these two
problems[1].

Thanks for your time and review.

[1]: https://gist.github.com/ziyao233/a5ee8862d1baf21ad756cf4e959e14c3

Yao Zi (2):
  pmdomain: rockchip: Only put clocks that have been successfully
    obtained
  pmdomain: rockchip: Don't log when of_clk_get() fails with
    -EPROBE_DEFER

 drivers/pmdomain/rockchip/pm-domains.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

-- 
2.56.0


