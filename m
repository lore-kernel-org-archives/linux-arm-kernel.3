Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB44606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 11:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F0h7ArN6;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yun00kPE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Vt/79XA/yWxO2ogj1KSk8egFEeSfwKKUg9yTYHPXecQ=; b=F0h7ArN6VynSIEg+srwOuSqhjq
	iQKhMR23LHKK4rmvmcAea6+E414lNXwLBp2MOwI9PwDMhnrlfT/5iRaL/UcoVrJtpRTyF++CZi6Z4
	e7Ki4ZOKJaXwHhY4dODhVXXu2nmEZasM9z5VEo0DEXR6NrjiTNA2J6pqit6iefzS48XlhTKs7dHyb
	AmgQVlugp8XTBLb3017Kkwiqy/3DpXBrNC2udPk5abJRcCIKk4Rbhk1GURG6SWWLbqchcB8CGfUmN
	SPIlMWK9QMSQtJV4qteFT/HuJmghVtz+psYWjw60/DBNcIFGa8RwyYrj0SbZOKkIszGnsLMO0TeL5
	r0EdWgIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJFm-00000002QV6-1sfl;
	Mon, 26 Oct 2026 11:52:38 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJFk-00000002QUB-0alO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 11:52:37 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8a06210b29fso1053326b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 04:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793015555; x=1793620355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vt/79XA/yWxO2ogj1KSk8egFEeSfwKKUg9yTYHPXecQ=;
        b=Yun00kPEvHu6rMpC9R0F6N2uZb1/EiX3Hc7P2+LrjUrcoL7QuWj5Qg9i76RlnvC/M0
         WUY/8x78+Xfn5sj4FeW3uLLlf9K7TmpNGDfIPx4E3YvBjrx4PEe/s4Dr0a8iL/m/SzC1
         QkrQ5+sb2Pj43EGWVNjAmZMnIwS+sAV3sDa4gW42k/l6CU2wVCjSTw1LTgR07bksVKS+
         YcV2aizo1EIVttduPj1WDZf+xjdnwVoyQt5bGQdFOuzaubIo1RpzWmN8EpCy8PqPJ9Pm
         J5Op9hpfjIoQ3Ou9xPm5yeJGSonfyGvPAHHhxtHZWRRhANps6PiSpwMhzfisVBPWUb6k
         8R3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015555; x=1793620355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vt/79XA/yWxO2ogj1KSk8egFEeSfwKKUg9yTYHPXecQ=;
        b=bQioyO+qbzjqTY63pahKrsJHrcFm0JuNjU8k9d6jVThucFYWvvGhKWg1e6Qxog4QqK
         4i455mk8PvSQ+Cp3CZGvFEtK1zxDtsP/EwMFoGy4M0OD23lKuYRr+KrSvmYMq88w90oN
         r8xBs6vKhR3E0S1IVbZwsI1xUwfLozjMDuoJyx4A3DMM+ko3RtXFwwNtd0OARQcD9on0
         LYsCuStImCFiu3oDBGhATEmUsx17OcfTI01yGqZXsKjH+vIO1S74zjSTNrFJPCXYxf85
         Vj7aw5qZv2AvWocHKvIWvSF6V6mJWpmyZNu5ZCdxdV7XnNy7kGXixVSKrg0/iIW9ulWo
         O1tw==
X-Forwarded-Encrypted: i=1; AKwUvBxBMK65PvuzweoI2OuMmGoFevy1DCTIRfQslAlPWR2bJLjVXglyVHDGYFzb9RhP798VXwIak9/kPUZjZ5PWp6QC@lists.infradead.org
X-Gm-Message-State: AFq9FYK1MKnpucBktsU02xJRc6bow7cqcr732L+Gv+0fH6+5Z6WVyNFM
	FA71Mho5E78l3xGfmz+bCmfMnuZzgKkAheof4FkSTQLGRGZRzzumLOFZ
X-Gm-Gg: AYBFou2nH7fONRiNRwvLlSNWZbXU3BwTxyj8Tr3moFxa0BugQvKgeeILmwJFLdi5i63
	vAXow3tAccxIFxEs6nprSo8/noWn16f3VTQQO/BgXoCLD5TmYaHxQvR5H1W4KkEv9SC46uzj0vM
	pozMRB9F4n8XSo8Nbp+JEi7VXeM9uchxSZ5mI0rpbWSu6m+BxmupIfCSe5THxkewwVTeb5mcjtG
	tNi+V/i31Kx8L2F7NVERYnnR8emV/iLKvpO0tA9Odpq78Kf/cQiHTlZbRU2UtApfPYO+/asG1U5
	GjZEcf3dJutFT+UkPVRs1DwGJ8etHuPuvpvquyMlghNUwU7kvP+BS3R7ZQsEuD5yEx/AZuSzrT4
	emWka8D6QVwVRob+lzDPQjPx+gPuTTldnu7XlwBbEpTC0AH4neThYv8VmD4DNlAN7h+EHEtD9aG
	Tvl5P6xKJixZ84vL73KCB79GaGNO6kJv4mGm73TF0W3JuoBn8cHmYenDQbBuZQSGKGizlJSHYIU
	sR+puf8AIJ2ebDVtfQukafDWyCxayUE5fsz6NtPnvZzy2BUJuAQAw==
X-Received: by 2002:a05:6a00:1808:b0:87d:ee98:606 with SMTP id d2e1a72fcca58-8a367f0eb74mr4959061b3a.23.1793015554801;
        Mon, 26 Oct 2026 04:52:34 -0700 (PDT)
Received: from lgs.. ([101.76.249.61])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36ada2805sm1233497b3a.12.2026.10.26.04.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:52:34 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Gregory Fong <gregory.0xf0@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] gpio: brcmstb: fix UAF after IRQ domain setup failure
Date: Mon, 26 Oct 2026 19:52:26 +0800
Message-ID: <20261026115227.41779-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_045236_178908_720E9BAE 
X-CRM114-Status: GOOD (  10.66  )
X-Spam-Score: -1.8 (-)
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
	FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When devm_request_irq() fails in brcmstb_gpio_irq_setup(), the error
path removes the IRQ domain but leaves priv->irq_domain non-NULL.

The probe error path subsequently calls brcmstb_gpio_remove(), which
checks priv->irq_domain and attempts to access the already-freed
domain through irq_find_mapping(). It also attempts to remove the
domain again, resulting in a use-after-free and potentially further
memory corruption.

Set priv->irq_domain to NULL after removing it so that the common
cleanup path skips the already-freed IRQ domain.

This issue was found by our static analysis tool under development.

Fixes: 0ba31dc201de ("gpio: brcmstb: consolidate interrupt domains")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpio/gpio-brcmstb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 44ca798cf832..3b1aaea63951 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -513,6 +513,7 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
 
 out_free_domain:
 	irq_domain_remove(priv->irq_domain);
+	priv->irq_domain = NULL;
 
 	return err;
 }
-- 
2.43.0


