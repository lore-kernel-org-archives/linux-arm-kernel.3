Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C63BC44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 12:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SE7mp59TodeFGT34+BTwZfGe40WMQlWd51Y0x2uRde0=; b=wVynffZMQvxrCwG7LLab2vzqW5
	uhoe7ChgOq62gAm54WxZ4cxyHLRdXQpV7x1PrJOqiGCO9CcT3ScE5r63U2vU8+DydtaaKOArCweVf
	144lImYE8PPZ/QyJPU3fdBA1YqR9grg/SYBanB9nqDCsiEvE+LGmjgsnYQZ0+WnXa+lwOwF8K4HO2
	YBLXy13z2GHjAUWEeNHJCBb6W3x5ffMkk/3PkEMTOkk3PnAMRRqdlsjQt5FLJmsIoNFxG1uyiNc+T
	nMTSs4qyGtMxb2xMpdcfVtdWe0wTUUctRAlLZo1k0D5O1ecx2PwLRRcuopA1tufjQhgEo2eG1nLIc
	fzO7z2yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmR6-00000006dKB-36Gv;
	Mon, 20 Jul 2026 11:45:28 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmR2-00000006dJW-1Xy1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 11:45:27 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAC3JD9LCl5qTJeIAA--.52134S2;
	Mon, 20 Jul 2026 19:45:15 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2] coresight: dummy: add missing MODULE_DEVICE_TABLE()
Date: Mon, 20 Jul 2026 19:45:14 +0800
Message-ID: <20260720114514.51656-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAC3JD9LCl5qTJeIAA--.52134S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar15uFW8XF1DAF13Kw43Awb_yoW8JFyUpF
	4UK3y3Aa45Kr45Aa17J3W8ZF4UG3ZFyayj934Utw4UuasFyr1DuFn5Kw1FgFn7Gr45Gw17
	Kr40vw1jqFZ8JaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWI
	evJa73UjIFyTuYvjfUonmRUUUUU
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_044524_775869_25A02A3E 
X-CRM114-Status: UNSURE (   8.00  )
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

The CoreSight dummy driver has an OF match table wired into its platform
driver, but does not export the table to module metadata. A modular build
therefore lacks OF aliases for automatic loading.

Export dummy_match with MODULE_DEVICE_TABLE().

Fixes: 9d3ba0b6c056 ("Coresight: Add coresight dummy driver")
Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260704121621.48544-1-pengpeng@iscas.ac.cn/
- add the requested Fixes tag
- carry Jie Gan's conditional Reviewed-by after making that change
- rebase onto v7.2-rc4

 drivers/hwtracing/coresight/coresight-dummy.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
index c176a2f57300..04880d38feb7 100644
--- a/drivers/hwtracing/coresight/coresight-dummy.c
+++ b/drivers/hwtracing/coresight/coresight-dummy.c
@@ -212,6 +212,7 @@ static const struct of_device_id dummy_match[] = {
 	{.compatible = "arm,coresight-dummy-sink"},
 	{},
 };
+MODULE_DEVICE_TABLE(of, dummy_match);
 
 static struct platform_driver dummy_driver = {
 	.probe	= dummy_probe,


