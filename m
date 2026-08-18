Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3150BC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 13:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Subject:From:
	Message-ID:Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Asc17psHKNAaSbNMycO1gd0Irfg/HEZLdr8szashNPw=; b=snWb9D/5LRVNCWCFJRP9YZ4vfy
	rkTnj9u686KNaclrL847fBH3V7JO+sWcerLobLMciHjUBvxnAdDOuIxHV/EIPYcsQ4QwKFNcsf3mb
	w4GM26OVGV5E+KT5qW/PeuPacKWGJrRk//bdPZDPG2YCzL1yWbVw+vm9V6/xykDsuczJBwcLjBHoP
	1lyVpNU3s9tuDGuLrR9ytieiYdcXf6Zh3zEDDZ3fUTxN9gEmP8Kps50GIp/OP3dvcUpoHQp5mXQvG
	JorJ0Qk6RUleoAngbhGmgEZnrSCKUJgUgMSSr2k3bhf6sRs/5hTs6plJE9ocnAGBT1uEVv5720A/F
	QwIk+TLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJVz-000000080P7-0gox;
	Tue, 18 Aug 2026 13:06:03 +0000
Received: from out203-205-221-221.mail.qq.com ([203.205.221.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJVw-000000080NF-0ziI;
	Tue, 18 Aug 2026 13:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787058353; bh=Asc17psHKNAaSbNMycO1gd0Irfg/HEZLdr8szashNPw=;
	h=From:Subject:To:Date;
	b=gE1uzqCDY44EC3qXSlRjW3t0ZY2d/Z8qjL5Wu4bQVwzl0BSrKhreCQnvLD/HIPxIC
	 Kf/Rs38MbdNokY+wydyhJs5MN0YOftYq4R9GMSNpnSkf2JoK/W0ZworBW2M7+S/a3t
	 HHUZhqp8M0jDMaP9MvVGWk/uYrUrF86nYDOXXfRc=
Received: from [127.0.1.1] ([5.195.0.150])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 1721C6D8; Tue, 18 Aug 2026 21:05:50 +0800
X-QQ-mid: xmsmtpt1787058350t92l880bm
Message-ID: <tencent_DD16C0EEDFEF4ACAFAB5A23EC8235D462707@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3JuTFiJHSXhG2jjRqHVE0lhZ6fR30r8eFb7fhrQgkuPImiL+Qtb/B
	 NM88BKMuz/8v4tH+QUMd279UbaBpmn46OEmHiaZeSlfl1WsCqtRDu0sMbg3GB6GdbZvdbKS9NzSD
	 jjTVzWhszt3cSrOb7QXZ4AXiF2ZKAMA3G3shfUvhK34GpmjoyvsXjjpHKOoKmsOChmDP8RV3kb2k
	 nKXp1LwevqXaXeLshellpMc3CxrrAXqN24DRqPp3wLlcL6Zu36ueYGAyniny9TxBzoRT04D5vcyS
	 7AnByDk77D+fJsCnGNv1EllfI4rbsuYm0v2Ink3DmuxOA/cKflbjtKI0f1csRbtQ29rr0QKE1gfC
	 fAKekd3P5fRDLoCTCUrZ+w2quQexQ6aKQwjPiLz8NsiH3WHSlO+6sfOBv60hdWJziOG7HfBa40GA
	 kDXqeiilfdxmiSru02V8aT3zcyd2E4LpdgsZKwRh4s/2QKeX74rHQTY4k5et/pEarRy2aPf/Cu4V
	 4sCQq+D3nTRoNIZQztwxRNeDWD5+oNIlqpPc5HA0IQwqfjd3dVp/0Zdzs0rFC1KlbLoPnm+GI2R4
	 mYjT/W6DEZ6w/MBMKnUE4GIimhXscSAw9mrZW+OKju6s90xQW4RNBkbxXXwh7+yjtXsDtv0aIMZZ
	 5sxuLI0rl4cxLUaPIvL5HqHckiO2mYuIZrPiKvUVoOU0GhrDokEC7NV7Raa1shi8GXjDRKb5P/3b
	 g8UCUAoSZd01fk+McPhY+LZfC63NiMjYNPMBF3TYT/nw7MwIvBrnhnJICRLRMRCjKdHDNdd5ByQD
	 1ptwrpmo5e19yS5iEI5OYQ7yHJZIRFI1q3uhq3XFEeRodZMXtKDnmJ1hR/PniiLTM7qMHENFD6Hl
	 fHDVLjJz3radqFmMCGpWt65WNIaSfd40amc7xTbkiIXSVsfM1Mn04BWlaMZfYwgYh/ZDojPLiWTr
	 /zSegCgF8MDdTwLzAkEBZf8bMmwc6UhLJ8nYaumuyMYN9v7Dl6aywNhPeoV6E4Wcp/aDRBX8915B
	 RUnm2E7/Bo8d3DzgHP1ef6tV5cGvvNeo56VKdIZw==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Jiawen Liu <1298662399@qq.com>
Subject: [PATCH] spi: rockchip-sfc: disable runtime PM in remove
To: Mark Brown <broonie@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 18 Aug 2026 17:05:50 +0400
X-OQ-MSGID: <178705835086.291840.15105782669010201958@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_060600_585566_88984484 
X-CRM114-Status: UNSURE (   6.42  )
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

rockchip_sfc_probe enables runtime PM and leaves the device active with
a usage count held by pm_runtime_get_noresume(). The remove callback
only disables the clocks and does not disable runtime PM, leaving the
device in an inconsistent state and leaking the runtime PM reference.
Add the missing runtime PM teardown in rockchip_sfc_remove to balance
the probe's enable and get_noresume calls.

Signed-off-by: jiawen <1298662399@qq.com>
---
diff --git a/drivers/spi/spi-rockchip-sfc.c b/drivers/spi/spi-rockchip-sfc.c
--- a/drivers/spi/spi-rockchip-sfc.c
+++ b/drivers/spi/spi-rockchip-sfc.c
@@ -743,6 +743,11 @@
 	struct spi_controller *host = sfc->host;
 
 	spi_unregister_controller(host);
+	pm_runtime_get_sync(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	dma_unmap_single(&pdev->dev, sfc->dma_buffer, sfc->max_iosize,
 			 DMA_BIDIRECTIONAL);
 	free_pages((unsigned long)sfc->buffer, get_order(sfc->max_iosize));


