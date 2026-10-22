Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AA7606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 16:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dbwqT8nO;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r531I8yX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lo4FCreUTiir8SKV7eM8msqoq5RBMwL2rKg855Qwhvg=; b=dbwqT8nOSUTqJwGSymUja45cBi
	/t0D8z+hHn08pS+PZQM/NKnUwboC3qJb9BeG47mnMcW+a2zl/vkFrqoHQX2DdNkhip84A4/ZxN+8a
	r6mTADeV43poFmfN6ogSaWrum/JT5UCZaB8ibxBcFyHwhEe5tmA9j2H7dbUBLqeMnYh0xJs/bd4Ot
	wmN3+RtfOW1ryVvuMWd9gQAo00NN3naLkcEH9Am4lTVmmYW1QO+llFQS0Pm0+bAyD4k8W+pXm2bOu
	61ldr6SDMaF2R4CLR9IORCmjyFtwzN68eMIzoktWpLs43Tns10JPPUhsEZRgG0jQ+hToquQSm2ENY
	u+5TYOdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvDD-0000000ESGe-3GOa;
	Thu, 22 Oct 2026 16:00:15 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvDB-0000000ESG7-0Xkw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 16:00:14 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cd61a2dfd7aso508002a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 09:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792684810; x=1793289610; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lo4FCreUTiir8SKV7eM8msqoq5RBMwL2rKg855Qwhvg=;
        b=r531I8yXE7FShQvBZ0Cymj0Ve11l0/ieV0KJB9L9wAC2vTCcNYtOD83IURmV0bNiDu
         wzUgvE3abM449bQP1rqfM0ZpnGhrrq3SOWa/mRLLkNE+i3uEtL5oB3XRNx75PtbBFD+C
         WHDGuxmL7zkQP5bdpeqxsbSPz8thW9J3cBZR8zk+FJFAoMJOfBWsIsYtI1skLpYKj8Me
         T4wyh8EuGZ6qG1h1HMsZHDClBCna6uF7AlQJuyBIz6y9f3B79zKpnMP0swEcwK6YGZj3
         mTEqQOfhysMKeRtdymnLPetfaKg9SNmerPvT+ZsJRt/uQmerwy03zd52ro1dU/VAK6LF
         jlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792684810; x=1793289610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lo4FCreUTiir8SKV7eM8msqoq5RBMwL2rKg855Qwhvg=;
        b=0KyqhZtzOESp38QDGvjJEhY+mAo7NkVKtjl2or3yC/xR9iWhDgavz17an+sM/A3n3R
         6UKwr60sHdky5EHV72ldJDNdyk3H+FPKwNGwT5Lb5I3lxM441meQ6cpE9DlS9qiXcZ30
         NfNsWQyCPSL07vavoJjORjgDnpkTTqiDc87rSzZOtAdQe0xQBLnts5XRcjtYlWcHglm6
         eSCwgfAplM8qUIjigU+l0tLoDKe5LGAxh+8eRA8d2zUuqQjrSZ/wbUABQmV/ev98fKI9
         su8bc7OcOA/EPWBIyB7X5+GSn6RM+LqKurN0+cTdTHxER5nmHKGU681ivRu7LJBd5JoU
         18Bw==
X-Forwarded-Encrypted: i=1; AKwUvBw7wa4+wawlI55myT8tnyw1/Q/XBDL2zizg72BKW9AH8jeIqjED9rpN6JNaQQXLKjfDMWLWrf44GXPMV+ghI97M@lists.infradead.org
X-Gm-Message-State: AFq9FYK8qfLWLM2JsLgp5WNUQRyCkWghOSOo7n+TiylM4DvBm57NZY2a
	bMH8JzQru0/Uzk1481SgwIpXvuAhpF5DkXvB5vth660TitdGtU/iYuk=
X-Gm-Gg: AYBFou1pasR+ZHBCIXNi44+caD9+99NpLvV6B0DCdhXhVBS9C4PZhOUIQHAD8RjeJLS
	78YcRZesgl/+wgfaqkGjqaSuZAipiWsVJVGVe2OYp87NmSzaO1jIBB8VeYti/HcwLX148vzAeTD
	nxG02X9pjljvTiKYPOcD+lJI7WkYGvnDbrsyyywU2pX4EJdKXqFy9slk12XwiixHSowMs1JOWaZ
	NFVvfxgLflJe66MUgVIyO50bEmwDr1LjBi252YT3KNrj06qwUJBInVzTroq7ZEMgogcO4nI4Oaa
	bsgd8SsYmnlWbAPRg7y0J9fR18DVKCO1aNyQUQ+GG+TUDHNmYTwfVCNiB8faS3E2GqATzT7vBsP
	6RlfFFi2vY+5KyJZZIHHkIzaGpUcDoJNNWIagNSkKICiR9NPOx4S9PiVaxtqpIWD61X5on/xEZx
	IKVSr7bPCutJ8N8QMHzU6TLqSZ/XDK8YFZWPMRWgPRq92K6B2gDdgTd0DVbvvNwvm8DvDpWu/F2
	UC6K8RQbYSypioZeCWbllm2irsaS4hxr5sXsa5IsCLTGklvanptvyIyuiFpy+qGxCfgKiZAOrMX
	vyX51A3YK5G0nAyW
X-Received: by 2002:a05:6a21:7e84:b0:3e2:8f28:461c with SMTP id adf61e73a8af0-3e28f2850d7mr3429241637.60.1792684810211;
        Thu, 22 Oct 2026 09:00:10 -0700 (PDT)
Received: from localhost.localdomain ([2406:3003:2002:639c:c9:b354:e289:b472])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6b85d56c4sm1369348a12.16.2026.10.22.09.00.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 22 Oct 2026 09:00:09 -0700 (PDT)
From: Yige Jiang <yigejiang86@gmail.com>
To: netdev@vger.kernel.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ma Ke <make24@iscas.ac.cn>
Subject: [PATCH net] net: lpc_eth: release the PHY device node reference
Date: Thu, 22 Oct 2026 23:59:55 +0800
Message-ID: <rc-review-20261022-ai13-13-8a866c920a94@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_090013_210870_DC65E1A5 
X-CRM114-Status: GOOD (  15.38  )
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

lpc_eth_drv_probe() obtains a reference to phy-handle and stores it in
pldat->phy_node for lpc_mii_probe(). Neither PHY lookup nor connecting
the PHY consumes that node reference. The probe error paths and driver
removal discard the stored pointer without releasing the reference.

Put the node at err_out_dma_unmap, which is reached by both failure
paths after the phandle lookup, and on remove after unregistering the
network device and MII bus. Both puts run before free_netdev(), since
pldat is stored in the netdev private area. Earlier probe failures do
not pass the new error-path put.

The PHY device reference discussed in the linked review is a different
reference. This patch only fixes the node reference, which was also
mentioned in that discussion; it does not repeat the proposed PHY
device cleanup.

LLM assistance was used for static ownership analysis and drafting of
this change and its changelog. The review traced get/put pairs, error
paths and teardown ordering. No runtime reproducer or hardware test
is available.

Fixes: 3503bf024b3e ("net: lpc_eth: parse phy nodes from device tree")
Link: https://patchwork.kernel.org/patch/14502432/
Assisted-by: LLM
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on net/main (305deb54c6c2).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
Both allyesconfig and allmodconfig completed kernel and module builds
on the unmodified baseline and with this patch. Unchanged objects were
reused for the patched builds. No new warnings were found compared
with the baseline, and the changed driver produced no warnings.
Both configurations used CONFIG_WERROR=n and DEBUG_INFO_NONE=y;
W=1 diagnostics remained enabled. CONFIG_LPC_ENET was y and m,
respectively. The unmodified WERROR=y baseline reproduces the earlier
arm64 syscall-table override-init failure.
No LPC32xx hardware, runtime or fault-injection test was performed.

 drivers/net/ethernet/nxp/lpc_eth.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/nxp/lpc_eth.c b/drivers/net/ethernet/nxp/lpc_eth.c
index 8b9a3e3bba30fd95258a9f58699af4a8f82ea04c..69098845baac0e4d1fbbb062c2a767acef7d266a 100644
--- a/drivers/net/ethernet/nxp/lpc_eth.c
+++ b/drivers/net/ethernet/nxp/lpc_eth.c
@@ -1397,6 +1397,7 @@ static int lpc_eth_drv_probe(struct platform_device *pdev)
 err_out_unregister_netdev:
 	unregister_netdev(ndev);
 err_out_dma_unmap:
+	of_node_put(pldat->phy_node);
 	if (!use_iram_for_net(dev) ||
 	    pldat->dma_buff_size > lpc32xx_return_iram(NULL, NULL))
 		dma_free_coherent(dev, pldat->dma_buff_size,
@@ -1435,6 +1436,7 @@ static void lpc_eth_drv_remove(struct platform_device *pdev)
 	mdiobus_free(pldat->mii_bus);
 	clk_disable_unprepare(pldat->clk);
 	clk_put(pldat->clk);
+	of_node_put(pldat->phy_node);
 	free_netdev(ndev);
 }
 

base-commit: 305deb54c6c287e586bed92da2375ae1220e8dde

