Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA51C79FAF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 17:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nU4oGOpJwp3Q/MANXI0zxfwIDFbVnVE/U6jKEshkPTQ=; b=vPfJ/D8poWYbvh
	hZCl/blFVr6Ki2DNTvchL5msDJR2xs/xFIQ6ZGGnRFMuC/JOCEXWBkCQfhRNymmzWOaYa0zzdTabA
	2NWB21YANLap/jbtbeTITBB8dCVh75vUelVQs1T1CSPBAIH2Q+wHBIDO0HbAPqVjxVOrvQN+gCjiJ
	jMtAOeXxLKluLs4I2wuekwCcuunRmpAcWdOs+vBRQb5ltoOPyw2WePyNNpgEcUbmjuHPtT+ODUg6B
	ZRlHDbfdKzSNdiVTsw2bkJowcoeopWXpbpUmCNui5GmjGDLNOILjRUI+OSAf9wVSQ2wt4ATdssrrC
	16Jd2m9x4GEPfZc0AgTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoLy-0000000BpYX-42Yc;
	Mon, 05 Jan 2026 17:26:50 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoLs-0000000BpWN-14V3;
	Mon, 05 Jan 2026 17:26:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1767634000; bh=nU4oGOpJwp3Q/MANXI0zxfwIDFbVnVE/U6jKEshkPTQ=;
	h=From:Date:Subject:To:Cc;
	b=FvfsHsgjjMok7g0wdaxJ9e26TZWMkZWWImjdEuONf8pMaFX2e84HddLDK7BnoV3N+
	 oWwngTh4FHeYd3m5iHY2HCulqARfeWaTKqFlj7JM4b9kH2mL78VMIkgErVA9fXv6TC
	 rAG4OnbrouOnQkOmkr1vCvUoaccyCO14O82C1S9s=
Received: from junjungu-PC.localdomain ([223.167.147.103])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 6A5AA8BC; Tue, 06 Jan 2026 01:26:37 +0800
X-QQ-mid: xmsmtpt1767633997t6s5n9yjy
Message-ID: <tencent_68F699431A877005CF0887CF888B440BF808@qq.com>
X-QQ-XMAILINFO: MILSKRzDrLPbipQjZXgCF41Di+higtsdGDhYaZyj9r6A76I/R9AdyJqn7gHMCN
	 8ekuy+uDxBxCse10UPI9nekJ2iVcFfN4/h4jGxzHmo6C5QJV7xJWOzesYbC87jcQqlP4gEjxihGg
	 A4L84Chzt+EkyrayrLmL65ELRhhZeDjM84xictkcpM7l3i7PemebMiWwf8m3JFcEVn7ZS2nS0h4p
	 GsKxyH13tZo7N9ahN1D6B3wpnvQKfPgp+1QGfay4M0pzs/CrbpuOC0z4bqAmScw44SRj0HxWYmp0
	 DQpkruEZY3eEq3Bb43yqbTwe3MNMhyOUbSJtoWmJyg3Mi2deB7wIDGDcNq6bYfAo+fRxrsRCQasv
	 TnqvuPYJ+yZoTvozzQ9IqyvpvPzf6rT5ANzjdvW3O5aCSsdBKuL/PtordknM0PDKs4booaq7JUex
	 ixNeG7B4ZP/fyNPjz3WV2o3L7TZw94SWmkZmEdn8b6+N+fEcSs3t4Wn6lf3h/0B/lahJdgLeHLYy
	 XH8U364f9lk8Cl+S+EcftGeNx/gF3X2Rjqa8L6n+7zP5XSP2q864DaSYfIc5dLzmPucgpCeocF4a
	 9gHtsd/plPH0zQhg1PGel6bzvMkrgg9ZChh6zFCj10CDt5k9Of1EkTtDrGJ2qic69LL2NBOCqCki
	 Z7O1w4XzN1Aoi2Ar2IRccug/Vu8TVt1kJWn8L7rQQWhGF+mR+eaOMPzur4NgP6oMp3bv7/QX57nK
	 2RwCm6fPbKqb583F5ZGuZynBexz8SvNe4FqjKYpufs10ib9pyRD17DDRK/RCDbw9pIQwxPF8/dHW
	 9YBi2gmIRx5DTPgVEhGKV5le+ZJ96XwH15NyViiSAZryDLLViVIGByyvvYfX5Y2OasHdY0VvhgJK
	 +2sEP0GDHNdoQPZw8lYteuopXHqQTIC0frXW8Jk3/ELcaLZADAz/kzGh4Fooxw/FxZ94NBVI2uhJ
	 0DuawoCJiyp91C+cbeBVDLwkITDyALJgdWF2xVRWRjXK0hH+OglDuFUAVtM5BssKQAESpBrWoZkw
	 vwMHRDgzKYj9IQvSXS8NdzA6e81nbwOuyLA9TMqdzzTWkmp7WXyVoOLhNQ873TR1jquXyufwgHi/
	 OiZ1Ayb6gqZ7u7fuLyvQXr4+CLqZtT1bOdK1h8dDWRkjfFbF3a1Dgo19mVF13mOtlyzUMqF4PUYs
	 OWlewVVOeN+9T5KQ==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Felix Gu <gu_0233@qq.com>
Date: Tue, 06 Jan 2026 01:26:29 +0800
Subject: [PATCH v2] cpufreq: mediatek-hw: Fix resource leaks in init
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260106-mediatek-cpufreq-hw-v2-1-6d46b87ae1df@qq.com>
X-B4-Tracking: v=1; b=H4sIAET0W2kC/32NSw7CMAwFr1J5jVESSPmsuAfqwiQOtVB/SSmgq
 ncn9AAsZ6Q3b4bEUTjBuZgh8iRJujaD2RTgamrvjOIzg1GmVFpZbNgLjfxA1z9D5AHrF5KhQNY
 dzcES5GUfOch7rV6rzLWksYuf9WTSP/u/N2nUWJ7I73e+pJsOl2HYuq6BalmWL0QWYFGzAAAA
X-Change-ID: 20260105-mediatek-cpufreq-hw-a2afa5c8275a
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Felix Gu <gu_0233@qq.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767633997; l=2978;
 i=gu_0233@qq.com; h=from:subject:message-id;
 bh=nr1nUJZ861Pt93C2gXY/TX35ljdTJDdRAv39IBJWbTk=;
 b=O48yMN5V+xG5FJIt6McPAIfjKwFDTCpBUZbwwXXVQijE2CcE5TBwYWlxzaS6mAav1oxBCIZJx
 Dgo5By3I4yaBeIlz4ydYQe7CivtssBFIKElkqjreHYAW9420Vh6VRf0
X-Developer-Key: i=gu_0233@qq.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_092646_264529_C6EA1145 
X-CRM114-Status: GOOD (  14.30  )
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

In mtk_cpu_resources_init(), if mtk_cpu_create_freq_table() fails, the
function returns directly without releasing the resources.

Similarly, in mtk_cpufreq_hw_cpu_init(), if the driver returns -ENODEV,
 it fails to clean up. Fix this by calling mtk_cpufreq_hw_cpu_exit()
to properly release resources.

Signed-off-by: Felix Gu <gu_0233@qq.com>
---
Changes in v2:
- Move mtk_cpufreq_hw_cpu_exit() before mtk_cpufreq_hw_cpu_init() to fix compilation.
- Link to v1: https://lore.kernel.org/lkml/tencent_0B346CE1589FE10E0110418896F129323709@qq.com/
---
 drivers/cpufreq/mediatek-cpufreq-hw.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
index ae4500ab4891..3e74c32bb273 100644
--- a/drivers/cpufreq/mediatek-cpufreq-hw.c
+++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
@@ -278,18 +278,32 @@ static int mtk_cpu_resources_init(struct platform_device *pdev,
 	ret = mtk_cpu_create_freq_table(pdev, data);
 	if (ret) {
 		dev_info(dev, "Domain-%d failed to create freq table\n", index);
-		return ret;
+		goto unmap_base;
 	}
 
 	policy->freq_table = data->table;
 	policy->driver_data = data;
 
 	return 0;
+unmap_base:
+	iounmap(base);
 release_region:
 	release_mem_region(res->start, resource_size(res));
 	return ret;
 }
 
+static void mtk_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
+{
+	struct mtk_cpufreq_domain *data = policy->driver_data;
+	struct resource *res = data->res;
+	void __iomem *base = data->base;
+
+	/* HW should be in paused state now */
+	writel_relaxed(0x0, data->reg_bases[REG_FREQ_ENABLE]);
+	iounmap(base);
+	release_mem_region(res->start, resource_size(res));
+}
+
 static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 {
 	struct platform_device *pdev = cpufreq_get_driver_data();
@@ -322,6 +336,8 @@ static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 		if (!(sig & CPUFREQ_HW_STATUS)) {
 			pr_info("cpufreq hardware of CPU%d is not enabled\n",
 				policy->cpu);
+			/* call mtk_cpufreq_hw_cpu_exit to cleanup the resource */
+			mtk_cpufreq_hw_cpu_exit(policy);
 			return -ENODEV;
 		}
 
@@ -331,17 +347,6 @@ static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static void mtk_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
-{
-	struct mtk_cpufreq_domain *data = policy->driver_data;
-	struct resource *res = data->res;
-	void __iomem *base = data->base;
-
-	/* HW should be in paused state now */
-	writel_relaxed(0x0, data->reg_bases[REG_FREQ_ENABLE]);
-	iounmap(base);
-	release_mem_region(res->start, resource_size(res));
-}
 
 static void mtk_cpufreq_register_em(struct cpufreq_policy *policy)
 {

---
base-commit: 52ae6ea5bd7c7286dcba463b6323b640b22af833
change-id: 20260105-mediatek-cpufreq-hw-a2afa5c8275a

Best regards,
-- 
Felix Gu <gu_0233@qq.com>


