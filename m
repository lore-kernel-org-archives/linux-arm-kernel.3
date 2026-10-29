Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F27606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DD3EgM0P;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VTMDB1F7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Iop087FFjXWDSpJh+IBQzbRhDiBtg08vWO4Z3TycLbY=; b=DD3EgM0Pmdv6PlGa7olQE7chrN
	RSZo88wEVC1IKPkR1FWzwwWrt1mYw/XD+Zr7tOrDXlU8qTZmNJSU3IH/b+cGQ/jeUVvQxilNXktKj
	hIxXMoUfdKDhvESwTTvEhMddGhpUyskIOTyY88x62iZfNPkVUmET5ITyNi6EPHhKFADzw0BpD0CvO
	VPOUzibZfFUGjnRnGDQfqJEoDTx5I13FXv1g9vE3w6csbJ8ka9pxBmAzNJt552cO2dE/9Y1fGqTq2
	LpG6vNRyGqr6wwzOB38mMqJ9jgztoc/CJRnCQAmvF9bERcTs0kabJFT+slWLoAIr6O7Q+52UjUKP3
	RCbd8+Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPuJ-00000009Hzo-0rlP;
	Thu, 29 Oct 2026 13:11:03 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPuG-00000009Hxg-3Faw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:11:02 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-15ea896ddc8so3119258c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 06:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793279459; x=1793884259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iop087FFjXWDSpJh+IBQzbRhDiBtg08vWO4Z3TycLbY=;
        b=VTMDB1F7FeG8BqIqYDkhgq6TNZs31bPLtY0+uLqDyR41uI3SXSu9vk75G22PfcsE1i
         K6l7+OeSBRBQmReYsWMqPhGbW0q1RVCaupI03HQHELc1KSB+6RCrlRDdsIyc5WCF47ro
         ya6/h5L2kJo3kKdv2dNlKjreHDUuRXaOwiG54OwxugcIw/nlm59gvF0wGnh1iR3QWQ7r
         +f7fHscpmZ/S8bf1MrZ1EXyS897NiNRJ0FKcS14Y94GH/DzOWPBgkTKOprleaMYAaWlX
         yjqYdIhARDQjRRp6YiUWtViyWuPwq2+/IM4DDsTx4x9oKw6BGhNuvlmVsJ2bio6f0SKB
         ioDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279459; x=1793884259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iop087FFjXWDSpJh+IBQzbRhDiBtg08vWO4Z3TycLbY=;
        b=ySDkVV8UUGu7g/HDHtHV0opVHO2GF8aXE8rRXsop+fTvCW7bIQjPpZbrmr9QV6B4c+
         jbq9R3Xp/SMfAjg3hdH85I+hFx2iuX1SDbtShRpqQZ/YBbp7nvt4+W+I8I2LZSbK+R1H
         7J7y1njoXtcKM45Kj4O5+68cYaMOG/PoEpJ7dZ1RbId5QQlL7+kHJz3ey0Nj9aZI3MuJ
         nUHYv46fBipUustWHRa+WJwvDnHPRpM5olNzzonVn0l2brQS08ioZuxYh6itloTH/36Z
         5iCp0UeKqypn379PCa7sw82HNC7vx0OBjjAwDL5XOmo6WoTvBQuavNrp8siahRMQJeSh
         5Dqg==
X-Forwarded-Encrypted: i=1; AKwUvByKPVfYiro1mBL+b+5sQzUooUPGUxY32Qei/Fcm6HM1izkrMgFePsofMDc31ONpK++QXMaKdg633Y/IB3STtP9Q@lists.infradead.org
X-Gm-Message-State: AFq9FYJ1lUjt+NghZYOGzAjBe2vtosLuqUOwJebkxPZH8M25+0pdfy3O
	RPFISmezkAbR8RyvAAUqPuR0SUBZfQ4GbuDswPZBcR3kgJTuw+cHmcWG
X-Gm-Gg: AYBFou2MfEUNh3nEVMBKAleiJjAw2smBgNjX9TcihrUo3iAzyXy/amQVRvULPoft2F5
	8uxqQ4GNM0Ps4ZtmiV+9BbaIEjnX2bP4X/9dWB6LOol2VfE3Ho1KQOFra58h6JpSKCzOZUwV1Hu
	cc9Ngt79rplgBBIjvfhBuNDTlvptNfb3h9eD/546mj5416o4Ofo2aAxrFfYrTG0nsosM+ELUm4d
	FJzME7M9QT/hNae58d1HtZoPKTSrUqwo0kk9G3mFhEhttWNNhDTH6TffWZwRTBppa4bX6xsX9Up
	qsPIOQc5jVWuIyiG2bAlp4tSqXF0Nwpw+JdB4Rnrz/LHyh5ctmjl6JV1Qqjfs7jLsKVQWOdL5aw
	3OLt5P+Np/pQzdNFF8LR1DcACQYL7ynlH2mRRsldOvDd8DIrD0UpDamDEjyB5ejZpcWyGaztCgz
	O4CKXBrPCgiE3i6GtyTed+aSe7rP4uSaMUsuxiW5AQSt9OOm6RO8ZR1HJ2n0u1Xc0ULhVLp85u+
	wt3M6kq5frN+JCalpYedL8r8TFZ+0jNXeUoodTFpIHJDjjD6pK0HVmwUKnDMIdoFhgNO1nb4ALl
	sjB/0BGx8QTpLISMDMswrSDb7/l94NG9kv+/5WIsfcKu+Qg5ofw=
X-Received: by 2002:a05:7022:ed01:b0:141:5281:8a41 with SMTP id a92af1059eb24-1a6ce01cfb4mr7112570c88.9.1793279458889;
        Thu, 29 Oct 2026 06:10:58 -0700 (PDT)
Received: from localhost.localdomain ([103.178.205.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a76037e2b5sm22072457c88.21.2026.10.29.06.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:10:58 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: linux-pci@vger.kernel.org
Cc: jingoohan1@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] PCI: exynos: Handle PHY initialization errors
Date: Thu, 29 Oct 2026 13:10:06 +0000
Message-ID: <20261029131006.2744-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_061100_835712_6F6438DE 
X-CRM114-Status: GOOD (  10.66  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Check the return values of phy_init() and phy_power_on() to
avoid continuing PCIe host initialization when PHY setup fails.

If phy_power_on() fails, call phy_exit() to release the PHY
resources initialized by phy_init() before returning the error.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/pci/controller/dwc/pci-exynos.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index e3c05ade381b..5ad07c0be8e5 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -225,13 +225,21 @@ static int exynos_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct exynos_pcie *ep = to_exynos_pcie(pci);
+	int ret;
 
 	pp->bridge->ops = &exynos_pci_ops;
 
 	exynos_pcie_assert_core_reset(ep);
 
-	phy_init(ep->phy);
-	phy_power_on(ep->phy);
+	ret = phy_init(ep->phy);
+	if (ret)
+		return ret;
+
+	ret = phy_power_on(ep->phy);
+	if (ret) {
+		phy_exit(ep->phy);
+		return ret;
+	}
 
 	exynos_pcie_deassert_core_reset(ep);
 	exynos_pcie_enable_irq_pulse(ep);
-- 
2.55.0


