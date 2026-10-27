Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BAB606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 09:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sG6LFEOR;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ga2vX6wI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6hl/Nai93S8NAs/Tww+fCBXzZpo040uYm7bnamGWTrs=; b=sG6LFEORr0blrt6PmF6R+I0INH
	WcOTV6StIRdXel0YOP+DIhrn7T1e4U/lRdwu69xPkxT4LxpD5UgWVlzBu7hdViIhRFXyJd5iavIoU
	E3Nwq2hFcQPrWbdWvHlKXcIriGjpywXICKtTCdIE8yN1IcBLhBlKSfOZOBjfDI6DUVCA+OtfZXQij
	ErDHZm9LiI+hE/EKKTpAszc8S1toiTFoqQ1zzj4ONhjjjXa4dtvX4RNG+B1w/SghqmdH2Ff1vK5Wr
	6EAzrSKKff1U0ZBHSw4qELh0pzSpJum1ddRFMwhNurVQSligtJ4YEhOxUclFyz4IuElA/E0A2j5JK
	YND4PYSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdjW-00000004CWk-0l2B;
	Tue, 27 Oct 2026 09:44:42 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdjT-00000004CWA-3DBo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 09:44:40 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso11450098eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 02:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793094279; x=1793699079; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6hl/Nai93S8NAs/Tww+fCBXzZpo040uYm7bnamGWTrs=;
        b=Ga2vX6wIk6EUHaQxxQ/j9dHa6OOphpyJNT7unDGt7WK87T5UWvWvGKq79e8oTaaJgX
         h/nWcYzm6tU+4fxtbejrRN7Yp4yRbhf3yMwpCkMtFftvBxVFpSkZ/gKXJMhCUwn//MWC
         jH7s6wCtiTPuLxUn5zYbB4/hDH7LwNfcPLYl0fPyZQ3ZdXMPmBUErkUSEAfDxOR5szMm
         AKe5PFJPjRzLlwXIWlVjo4+ziPYxap9l2KJrxeKD2mY+Md1uzNRfOFuXf/Vgp+r6GsfH
         rU7P+voGXQ0QzoFkN8dDGWWW7Ff15+A6ADN7efbfkvFGIz7a78bbewY86N7WiNlrtfS8
         /K1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793094279; x=1793699079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6hl/Nai93S8NAs/Tww+fCBXzZpo040uYm7bnamGWTrs=;
        b=yghiQtfmCO6XQbhnyUeNc3n4Cx6PxZS7QNbxbGrxwv4kgi4ETRnZFObJ1MBflhAHvy
         Lxbo1NVYy1gzrBZBqyJprMHWqGxn1gKXQXGxY33wChXwKLPGa95oxUNqzECYQT2DcMDS
         ycrcE7aBEy2unTacSnpT9hlyPUguV4rHJQJs0EGUT3QMU1lVCNuiNFWDjFbTfwojnPsa
         93CaRzlU85pEvQvZnAfwTZnYW0FX3zgqgKmuGeDsfr1+83JTfZCY/fiWhI5orMfjf2YZ
         KAF/xHZ7p/mdr3vsnnF2ChQOPeLbCWbu7BsxxnlozaQf6ctQ89Bf8oF1E5q+gWXP9bvm
         2anQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNqHikEAOQ9zLrSgY8JDB849hVdVbUyFOelwmaBJTb1KkzIlNjib0d8b3R9PLfuMRItkmMosNCpD11IsnOqafZ@lists.infradead.org
X-Gm-Message-State: AFq9FYJfvTeMzbtXd00RG5t7LkC/OOiA+/er19QDffZr+k4z06c6uQu+
	Zi2SMtqpa4yfifIGfI/rjaW5VR21ZQR+xru9Md2my/fZbBU9RXbf6fX4
X-Gm-Gg: AYBFou1RgIuCTycMYXKG/q4s2Psf79pVa1hpgIYTRsBZz8t6dBrKhqKyevJVIZe5bQt
	1+qvADXMuOvRXicYGumEw51NB8RHMj+jKZsnWUEnI1grxmv8WBEbjzRFFJu0wsAHdhXZOuVlnJq
	+V0V3eNRWal/KuykEoRPLwYygLAnYhH/dyLbq/Sp20RBJDsxQ/LnasyKfqhrQQH82WLIwNgQ4iJ
	pTzUoYosPViHnPUZrJSFHjgKUvIZO0KHUmVfUlZXygZKtmWVwk5PcUtcnS3yrdq8mqdFQ0TbDTe
	8pjUZTTeSpfIezU9e9Y2U297dUU6Uhb07gyz8etCjoAJRtENI3FzzdeoQdX1fDdYQNeaIT78Fxv
	fskIBwtHdfTluPOFnR5dJArq5orjsgjSFMqORw5iboRTdNK15uk164WhoDtGl9oz7u/Og30hO13
	gB46Ra6c7JqF+Gxf3Vn2lT/F717phHKF+HV5IhHdOvEY9wM2hyFGVyFyQHVMr7A9oEeLzsQFNUg
	q07tC7HQfBuVnj7EGYLZhWzxNIZ9TSAVqxecx/r7EP03dF4n8+oMg6vdbfpNzo3hywIilWCTCIy
	FmkB6zr45w==
X-Received: by 2002:a05:7301:7d01:b0:366:c497:610c with SMTP id 5a478bee46e88-369e8610133mr12065401eec.33.1793094278730;
        Tue, 27 Oct 2026 02:44:38 -0700 (PDT)
Received: from Zoro.lan ([2409:4090:2022:b00e:72eb:d31b:8aa6:1b54])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm60252926eec.23.2026.10.27.02.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:44:38 -0700 (PDT)
From: Vishal Satle <vishalsatleit24@gmail.com>
To: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Rob Herring <robh@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Vishal Satle <vishalsatleit24@gmail.com>
Subject: [PATCH] PCI: mobiveil: Fix device_node leak in ls_g4_pcie_probe()
Date: Tue, 27 Oct 2026 15:14:27 +0530
Message-ID: <20261027094427.143733-1-vishalsatleit24@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_024439_805975_B694E7AA 
X-CRM114-Status: GOOD (  12.53  )
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

ls_g4_pcie_probe() calls of_parse_phandle() to verify the presence of
the "msi-parent" device node. of_parse_phandle() increments the reference
count of the returned device_node.

Because the return value was evaluated directly as a boolean condition,
the acquired reference was never released, leaking the MSI controller node
reference count on probe.

Assign the resolved node to a local variable and call of_node_put() once
the existence check is complete.

Cc: stable@vger.kernel.org

Signed-off-by: Vishal Satle <vishalsatleit24@gmail.com>
---
 drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c b/drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c
index 4919b27ea..5b1862fe0 100644
--- a/drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c
+++ b/drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c
@@ -199,12 +199,15 @@ static int __init ls_g4_pcie_probe(struct platform_device *pdev)
 	struct mobiveil_pcie *mv_pci;
 	struct ls_g4_pcie *pcie;
 	struct device_node *np = dev->of_node;
+	struct device_node *msi_node;
 	int ret;
 
-	if (!of_parse_phandle(np, "msi-parent", 0)) {
+	msi_node = of_parse_phandle(np, "msi-parent", 0);
+	if (!msi_node) {
 		dev_err(dev, "Failed to find msi-parent\n");
 		return -EINVAL;
 	}
+	of_node_put(msi_node);
 
 	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
 	if (!bridge)
-- 
2.53.0


