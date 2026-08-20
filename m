Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53540C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 02:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjkfvGMvJw1FE2fvBwBzFGecspy99tgI6x/rz+n4M8Q=; b=yVsqHhufulvttWO4bSDr1C8gkw
	br+P73IqIoAJkycSJ5jt/VeDUP1wI2T68HD/HQY1xjWpFdaiJ2jLwXvGXf3nsMqLv7rMuCcjpheGq
	ylZQYx60p98HPMjHeIv+eFAXfHg14MTtIciu2G9babtDWrTPlAjJPqfgsFmWaEvmZIiKDmxFHbzxS
	8ey/UhqytvDao2rpk4/oN/bNRCqW4ieM3y7NYpc0Lmb+Gb5LtWYyyl06XWRjfVufq7cZw7gc4xeOb
	Ycdr2D2gg8bNwebUXTro+BbyUUxC9g+VAmxZwVKeTTiL4RLAtY5S/pYajOocAw+0/1Xew5NIdf7lV
	Oz649vCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwsra-0000000Alhu-3JdS;
	Thu, 20 Aug 2026 02:50:42 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwsrX-0000000AlhJ-0Otg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 02:50:41 +0000
X-UUID: e9f33b5c9c4111f19a56ed5b684f684d-20260820
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:51f5c2dd-67d3-44e6-9043-06f46c550df8,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:831da513895da081be4ee00ad86f8656,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0|15|50,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e9f33b5c9c4111f19a56ed5b684f684d-20260820
X-User: lijun01@kylinos.cn
Received: from [172.30.70.202] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1319968779; Thu, 20 Aug 2026 10:50:33 +0800
Message-ID: <a72abd09-df0b-43e1-87d9-9f5b6590ecaa@kylinos.cn>
Date: Thu, 20 Aug 2026 10:50:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: arm_scmi: pm: use SIMPLE_DEV_PM_OPS for pm
 struct
Content-Language: en-US
To: Kohei Enju <kohei@enjuk.jp>
Cc: sudeep.holla@kernel.org, cristian.marussi@arm.com,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260819061530.2391788-1-lijun01@kylinos.cn>
 <aoVgAv8iNxPmWsUw@x1>
From: lijun <lijun01@kylinos.cn>
In-Reply-To: <aoVgAv8iNxPmWsUw@x1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_195039_456879_5504155A 
X-CRM114-Status: GOOD (  10.95  )
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

These are the patches where I first discovered this issue
after execute s4, the spi error,
[ 1104.754246][ 4] [    T1] tpm_tis_spi spi-SMO0768:00: SPI transfer failed: -110
[ 1104.761503][ 4] [    T1] spi_master spi1: failed to transfer one message from queue
[ 1104.769201][ 4] [    T1] spi_master spi1: noqueue transfer failed
[ 1104.776344][ 4] [    T1] tpm_tis_spi spi-SMO0768:00: SPI transfer failed: -110
[ 1104.783609][ 4] [    T1] spi_master spi1: failed to transfer one message from queue
[ 1104.791308][ 4] [    T1] spi_master spi1: noqueue transfer failed
[ 1104.797446][ 4] [    T1] gttadd tpm_chip_start1 ret = -110
and in s4 the loongson_spi_resume&suspend are not
called at all. use SIMPLE_DEV_PM_OPS() add .freeze .poweroff
.thaw .restore, after s4 the spi communication is normal.

Signed-off-by: Li Jun<lijun01@kylinos.cn>
---
  drivers/spi/spi-loongson-core.c | 6 ++----
  1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-loongson-core.c b/drivers/spi/spi-loongson-core.c
index 30b6a7176ce9..34982c8d85a4 100644
--- a/drivers/spi/spi-loongson-core.c
+++ b/drivers/spi/spi-loongson-core.c
@@ -269,10 +269,8 @@ static int loongson_spi_resume(struct device *dev)
  	return 0;
  }
  
-const struct dev_pm_ops loongson_spi_dev_pm_ops = {
-	.suspend = loongson_spi_suspend,
-	.resume = loongson_spi_resume,
-};
+SIMPLE_DEV_PM_OPS(loongson_spi_dev_pm_ops, loongson_spi_suspend, loongson_spi_resume);
+
  EXPORT_SYMBOL_NS_GPL(loongson_spi_dev_pm_ops, "SPI_LOONGSON_CORE");
  
  MODULE_DESCRIPTION("Loongson SPI core driver");


[  249.388986][ 7] [T12151] loongson-spi-pci 0000:00:16.0: PM: calling pci_pm_poweroff+0x0/0x134 @ 12151, parent: pci0000:00
[  249.388992][ 7] [T12151] gttadd loongson_spi_suspend0.0
[  249.388993][ 7] [T12148] pcieport 0000:00:0d.0: PM: pci_pm_poweroff+0x0/0x134 returned 0 after 1 usecs

[  241.681971][ 2] [T12058] loongson-spi PRP0001:00: PM: calling acpi_subsys_freeze+0x0/0x34 @ 12058, parent: pci0000:00
[  241.681974][ 2] [T12058] gttadd loongson_spi_suspend0.0
[  241.681976][ 2] [T12058] loongson-spi PRP0001:00: PM: acpi_subsys_freeze+0x0/0x34 returned 0 after 2 usecs

[  244.535396][ 5] [T12082] loongson-spi-pci 0000:00:16.0: PM: calling pci_pm_thaw+0x0/0xd4 @ 12082, parent: pci0000:00
[  244.535399][ 6] [T12082] gttadd loongson_spi_resume0.0
[  244.535408][ 3] [T12082] loongson-spi-pci 0000:00:16.0: PM: pci_pm_thaw+0x0/0xd4 returned 0 after 8 usecs

[  245.213317][ 4] [ T2766] loongson-spi-pci 0000:00:16.0: PM: calling pci_pm_restore+0x0/0x12c @ 2766, parent: pci0000:00
[  245.213321][ 4] [ T2766] gttadd loongson_spi_resume0.0
[  245.213327][ 7] [ T2766] loongson-spi-pci 0000:00:16.0: PM: pci_pm_restore+0x0/0x12c returned 0 after 6 usecs


2026/8/19 15:55, Kohei Enju :
> On 08/19 14:15, Li Jun wrote:
>> use SIMPLE_DEV_PM_OPS for scmi_dev_pm_ops,and add the value of
>> .freeze .thaw .poweroff .restore.if these address are null, may cause
>> error in s4.
> Could you elaborate on the S4 error you observed?
>
> Also, the concerns raised by Sashiko look valid to me.

