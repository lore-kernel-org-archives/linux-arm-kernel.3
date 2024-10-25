Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16520D149EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 20:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q2im7bplI6+ld2nl/ZOGzfS9UgtHuRxkRimQVbodUE4=; b=IHWjAg/qsOMwQXv6wkZTIRTDoK
	z1AH9p/OXyFOSeHJ52Kd7Ks4vijUKsLz540DduXD8uhv2ceXOxTJ6C2dLvUkH63YQfxQOWl4O8vw6
	jbgZy6Lo9nVsv58klq+OxLKVTABhZ2zj3yf5DRYBDKo5VP4wmAlJnvGAfCTfzDKNw+EtYoLaBoPBl
	by28TkV53rI/g5sePvbezVWLACo+BCvm1x2YVZqQdHYF4IoCbchh+IGfLQV3XhpxSwmj1zsrVNmNu
	5VxidlKdwU87qIABmZj1bvffsoLRV0jU90laEs8ZVhcQhs84gFMRohvTWyFOIcQbgurOTrktJ64yD
	47WV8NNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4QeU-000000054kf-24H8;
	Fri, 25 Oct 2024 20:11:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4QH1-000000052Hn-3a07;
	Fri, 25 Oct 2024 19:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=q2im7bplI6+ld2nl/ZOGzfS9UgtHuRxkRimQVbodUE4=; b=SDQ9pPRacGZHNAH4liLgzBbAKg
	+SzRq7B2L/UYPfETOIO9YykcvS5s36UkQZh2fZgnC9AnDvycs7u+X0W/IJh+Ma++eRGsHTqxiU/Vx
	uOwQLtMGT/uLesdgo6yqBWvIS6w08bjp6mtyKYsPkBGzoVPnFp9wwbZunUoeoDzzM3Ibb8Dw1cKpj
	ZbgAKxgQzU/fwMUeFuWiD3MQBlbuClExSW/bNkPNYh/mBuIGRbPmxRTyF26BezooNNQdLhryPO42V
	D0zrxsjD8PHHVtjDW9I3HprGNL1gbyVroR8uKpumiuWOAZ9vDM6gTiTlLEHgFpCQvzQu/YhIhLT1y
	iPb7wpNA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4QGH-000000093Vd-2uld;
	Fri, 25 Oct 2024 19:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729885576;
	bh=f8c7443BrlIy7kGWqHO1w3bVU9UBo745msa/mryqajY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f2p8AAeeEWHrq78LD1YvK3uDCGFvRD3XFQmXKcObGF+E9KS4NKAU55wZFkuX7KD6v
	 08WsSx1fR4bA7bYVkjHF9iAgpMqBaZRhNG+c4J0cZKGUkuUrIjEV/HzCihMoDQLkzO
	 8JkoXhdUtKZv36mPwTf8icc6mTFuvNSyjmzlpAZoFfraSdUh5HJ4IfrXWhtTfebpdV
	 XBbBVOZZwueWF6BfQ0G6m1k+u/onX9n+dvPFIjEeKrpSdN5kLg3BuxK3P5VEy5CUV8
	 5ZBq1nc7OBkHovb7uD48LPxmmYHp+22q9MfKrySgpCRZIT8OrqQKgfNuWfxlZ/s5ew
	 PdNdMwd1V1Ogw==
Received: from [192.168.1.54] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B3AD217E3756;
	Fri, 25 Oct 2024 21:46:14 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 25 Oct 2024 15:45:39 -0400
Subject: [PATCH RFC v2 4/5] selftest: gpio: Add wait flag to
 gpio-mockup-cdev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241025-kselftest-gpio-set-get-config-v2-4-040d748840bb@collabora.com>
References: <20241025-kselftest-gpio-set-get-config-v2-0-040d748840bb@collabora.com>
In-Reply-To: <20241025-kselftest-gpio-set-get-config-v2-0-040d748840bb@collabora.com>
To: Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bamvor Jian Zhang <bamv2005@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: kernel@collabora.com, linux-mediatek@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 kernelci@lists.linux.dev, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_204626_853278_A3534FFC 
X-CRM114-Status: GOOD (  15.53  )
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

Add a -w flag to the gpio-mockup-cdev utility that causes the program to
wait until a signal is received before exiting, even when its behavior
is to retrieve the GPIO value of the line. This allows using this
utility to keep a GPIO line configured even when in input mode, which
will be relied on in other tests.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 tools/testing/selftests/gpio/gpio-mockup-cdev.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/gpio/gpio-mockup-cdev.c b/tools/testing/selftests/gpio/gpio-mockup-cdev.c
index d1640f44f8ac2a6fda7a5f75605f83fcaa165dc0..f674dcafa60a02cb1739f3cfae8963dc09efba74 100644
--- a/tools/testing/selftests/gpio/gpio-mockup-cdev.c
+++ b/tools/testing/selftests/gpio/gpio-mockup-cdev.c
@@ -15,6 +15,7 @@
 #include <unistd.h>
 #include <sys/ioctl.h>
 #include <linux/gpio.h>
+#include <stdbool.h>
 
 #define CONSUMER	"gpio-mockup-cdev"
 
@@ -95,6 +96,7 @@ static void usage(char *prog)
 	printf("               (default is to leave bias unchanged):\n");
 	printf("        -l: set line active low (default is active high)\n");
 	printf("        -s: set line value (default is to get line value)\n");
+	printf("        -w: wait even in get mode\n");
 	printf("        -u: uAPI version to use (default is 2)\n");
 	exit(-1);
 }
@@ -120,13 +122,14 @@ int main(int argc, char *argv[])
 	unsigned int offset, val = 0, abiv;
 	uint32_t flags_v1;
 	uint64_t flags_v2;
+	bool wait = false;
 
 	abiv = 2;
 	ret = 0;
 	flags_v1 = GPIOHANDLE_REQUEST_INPUT;
 	flags_v2 = GPIO_V2_LINE_FLAG_INPUT;
 
-	while ((opt = getopt(argc, argv, "lb:s:u:")) != -1) {
+	while ((opt = getopt(argc, argv, "lb:s:u:w")) != -1) {
 		switch (opt) {
 		case 'l':
 			flags_v1 |= GPIOHANDLE_REQUEST_ACTIVE_LOW;
@@ -150,10 +153,14 @@ int main(int argc, char *argv[])
 			flags_v1 |= GPIOHANDLE_REQUEST_OUTPUT;
 			flags_v2 &= ~GPIO_V2_LINE_FLAG_INPUT;
 			flags_v2 |= GPIO_V2_LINE_FLAG_OUTPUT;
+			wait = true;
 			break;
 		case 'u':
 			abiv = atoi(optarg);
 			break;
+		case 'w':
+			wait = true;
+			break;
 		default:
 			usage(argv[0]);
 		}
@@ -183,9 +190,10 @@ int main(int argc, char *argv[])
 		return lfd;
 	}
 
-	if (flags_v2 & GPIO_V2_LINE_FLAG_OUTPUT) {
+	if (wait)
 		wait_signal();
-	} else {
+
+	if (flags_v2 & GPIO_V2_LINE_FLAG_INPUT) {
 		if (abiv == 1)
 			ret = get_value_v1(lfd);
 		else

-- 
2.47.0


