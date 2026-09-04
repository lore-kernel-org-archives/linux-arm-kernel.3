Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D27C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1exL3htqf+GpZcCvUWENBQmRfzXhNWdoVzfZaiBanSc=; b=z2rl4O7l1PaMTAr/TuLF8y9TnT
	k4aDv/alngnyBjPU3xdcWwc9ElXv0uROt2xnjtszomsGHyScJUAD0wQej02sXKozaDeG81OANWrVF
	gEbaqwdWLcEuWwypEte8080ZU7grXXTj5EcAAaqTICiF8MtxSsoJj918WmBhLzbX4OBZpE8lpC9AX
	qPbxdJ6RIhgTxDqKSdYYCZs48jOTYG2qsBxjsY3PhAMcai0xxM4ENGH4qj9qGCR3/JkX68NDrH8U+
	lacL7a6s0SO6DOBbqrlV1LIoMlfLoCwpiDiFGb6o6+s0R99EU9n5JdIidg68rOdZP3aOv0E5rJVIm
	A/xsUG9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PX9-00000001Qbo-1wXH;
	Fri, 04 Sep 2026 08:44:27 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PX5-00000001QW6-2Ckx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:44:25 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-39682983a0fso802231a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 01:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511463; x=1789116263; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1exL3htqf+GpZcCvUWENBQmRfzXhNWdoVzfZaiBanSc=;
        b=kcQukRcEMBRMkNVgcMtAz4/ezIAjxRuwRVh5NubJsy6iL6potfjg/+9DrDzIRA5+T/
         9qJLNprXG5za37oWjPkUbBUf5apF1mwL61ZHEX6o6QdMfDs5Zx8Bqti2gn/9D9qtuHa0
         iqoeIx1A1FN9Wy+rAqtAa7DkTvJsSxFqcGI8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511463; x=1789116263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1exL3htqf+GpZcCvUWENBQmRfzXhNWdoVzfZaiBanSc=;
        b=s35eOkU4Vi0jak2+nTrw4CiYgNfgvHk4onS12zOsiA+BLUXQJlKAoAEz31JinaZU18
         7Vmu9HFYecu1brY4tFOYjGdZQOJ74fJSu55rRek2TrVYg2ow97kn7s6CciWK9gi2d8dB
         g0ps+vvFUblcKorx8PeaOXxcMHPZc7f2Ur5fticPOQN2MVoT+VDw5HKa3hOP2swFIG++
         8y8Cl8xsahA8bcE/lO7Xzj2KGlT3CYFP2Jm57rIQaUiFv7xcMh5WL8fhoWNubWF6bS28
         XitK5QBwnl2DkaNCcNomwMoBkwgVw4Y89WbV7gaXg/dJF+FtNBaGUQuoV7NSM8e4m4ut
         wwMA==
X-Forwarded-Encrypted: i=1; AKwUvBz+YCMGLiH2T8tb+13S4v7nSR2kYnvg+fDRcNaP/YXIqENONvzbcTpCM+MUO9xwFKT035jUvM2PqtyyULtrBcAU@lists.infradead.org
X-Gm-Message-State: AFuF++mVYSrnw9QVlEf7nvXKylRLABBCKcJuEPFQWwznCWxc8eJLvfGH
	GfEK0CheG2Ec6REJ/iiLZ3HuJAh+m7ozn71qOPaZ8IlFonxXJQQ2bxP3jDuSnc0Mgg==
X-Gm-Gg: AYBFou3NRNqDoqg1FLW3W1nuZtbXCL3FkDdes/i3gQLXTAjqskzpBsMUjRQQDFi0O0G
	wCeehdVb5uaLXzQosdVZ1AxaAiUziDZ7bZMvFVKf/a+u2m+7sM37TaxAAnJLOEOPMsNE+xhI3Dv
	ZUPBqZ9yrwRn51tlOqnrehr+dTfdbjX8jTHCiazB6c0owqpaq+KPUBrQ0VRTelnjF4+q2RfHmNS
	Cp2oh+rSEO6czHS8FeNJVD2Qd86UnY66qYaWBziuhiuoIT/zeQ+9u7GlBCoD+AmThaG4+o0iFCq
	nO30b2h4CnFvrEV8OB+HHKnVYLAVi8rFtmIBxkX5TAB4D/S+b3yQrEKGAbqSaSvlw8Ea+e5EWmk
	4s8F/5GogadioLEsKpUY2HjY0DIkw86fxKKYgYb8eBQaWD/BG33YxgbF3vJFXtvUknGMQpqHrNT
	dchYcJzGs0wt699EbWnSzkYRK76NHWpznG1WoqAwcE3ixvpG/Ww222ml2w9EsIVH9+JGSE7pE4V
	GKeaDfsVyUWmuNWkk9RoxgpKbY5AHbKlUp010jC7592
X-Received: by 2002:a17:90a:d646:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39b26214798mr7405740a91.20.1788511462630;
        Fri, 04 Sep 2026 01:44:22 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:44:22 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v8 12/16] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Fri,  4 Sep 2026 16:41:51 +0800
Message-ID: <20260904084158.1341550-13-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014423_589620_BAE9CAAC 
X-CRM114-Status: GOOD (  16.38  )
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

A USB hub can have multiple ports, and this driver needs to
differentiate which port is being matched to. The USB hub driver now
associates the "port" node with the usb_port device, so here we can
use the remote "port" node to check for a match. Then fall back to
the remote device node for the other connection types.

Also rewrite the existing "remote == dev_of_node(dev)" with
device_match_of_node() for consistency.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- Dropped blank line between __free() variable declaration and
  subsequent use of the variable in conditional

Changes since v3:
- Drop redundant device node validity check; device_match_of_node()
  does it internally

Changes since v2:
- Use device_match_of_node()
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index de9848a9a9f1..43b2328a6661 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -175,9 +175,16 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
 	 * parent matches the OF node of 'dev'.
 	 */
 	for_each_endpoint_of_node(ctx->of_node, endpoint) {
+		/* USB port devices are tied to the port nodes. */
+		struct device_node *remote_port __free(device_node) =
+				of_graph_get_remote_port(endpoint);
+		if (device_match_of_node(dev, remote_port))
+			return PWRSEQ_MATCH_OK;
+
+		/* Try the remote port parent for other types. */
 		struct device_node *remote __free(device_node) =
 				of_graph_get_remote_port_parent(endpoint);
-		if (remote && (remote == dev_of_node(dev)))
+		if (device_match_of_node(dev, remote))
 			return PWRSEQ_MATCH_OK;
 	}
 
-- 
2.55.0.979.g7e5102b832-goog


