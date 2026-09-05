Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02504C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 13:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gg7yGPoxmOER5IO+qS0nz0EXCl4ZbJfKsrGtP/+PZC4=; b=mCOumBV5S2M9Gu699sqIBcv8kb
	pD3Dz4BZlMd8l+x5jKBi+8H/vMgct+9IfjdgKPYBIDtRu2qGZC3cDpf7qzmkPd3Y8wyubrLFJdEOy
	JG3h3RWqp3KUvy1ncmjRT61snW22WeZh/SCWCNelk4M3BYmIHNjDC7S6BBpjlisdLPMLoigDeGqFD
	LAbY8/kI9+Er2WI+SPy8prwn3OCSKdLZUZcSVtEs/+IOMKaF/xz8lY9fpTI1wWDHZuDpMB9mQs6sw
	5huh0unlayyz8R83cl5U6UM4R1QSJ6mnz8IjgoCTbm39zywGfDLQV8K+ZeDdbUyFNEyLnvAGM1Izg
	P1wOYmEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qbn-0000000477k-3Sa8;
	Sat, 05 Sep 2026 13:39:03 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qbl-0000000477N-0Ytu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 13:39:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=gg
	7yGPoxmOER5IO+qS0nz0EXCl4ZbJfKsrGtP/+PZC4=; b=TICd8S/Hf6akrFKnns
	Qzg9Hn3X+BW4if5c3xiO5prSgs19MEXmnHwxLkgVEGtseZOftFi2B50Ly+48XhtD
	0PHv4PvNLLsKmlwVC7hf7umxRL9p7RgoY2GOEHPbKsfBuowPlL4I2ZbpImIMnz11
	tRGU/7X5ltsjqh7epUOIogUTM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgBH5ABXG5xqgnQWOw--.14941S2;
	Sat, 05 Sep 2026 21:38:31 +0800 (CST)
From: "hpp.iscas" <hppiscas@163.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: "hpp.iscas" <hppiscas@163.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jie Gan <quic_jiegan@quicinc.com>
Subject: [PATCH] coresight: ctcu: Publish the OF module alias
Date: Sat,  5 Sep 2026 21:38:29 +0800
Message-ID: <20260905133829.65890-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID: PSgvCgBH5ABXG5xqgnQWOw--.14941S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKrW7Jry8JrW7uFWfXF43KFg_yoWDuFX_Aw
	1vqF9rZry8GrZFkF1UJwnxCr1fGrZ3urs5Xr10qrZavr9Fvw1fAr4kKrW7Aa18CrWvvF97
	KF4DWr15u3y5tjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRBHq3UUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxRedZmqcG1ct1gAA3o
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_063901_650007_AA28ADE4 
X-CRM114-Status: UNSURE (   6.19  )
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

The CTCU platform driver binds qcom,sa8775p-ctcu devices through=0D
ctcu_match and can be built as a module. Its OF match table is not=0D
published for module autoloading.=0D
=0D
Publish the table. This leaves the TMC dependency, probe and power=0D
management callbacks unchanged.=0D
=0D
Fixes: f78d206f3d73 ("Coresight: Add Coresight TMC Control Unit driver")=0D
Signed-off-by: hpp.iscas <hppiscas@163.com>=0D
---=0D
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 1 +=0D
 1 file changed, 1 insertion(+)=0D
=0D
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hw=
tracing/coresight/coresight-ctcu-core.c=0D
index 9043cad..a7caa5b 100644=0D
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c=0D
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c=0D
@@ -295,6 +295,7 @@ static const struct of_device_id ctcu_match[] =3D {=0D
 	{.compatible =3D "qcom,sa8775p-ctcu", .data =3D &sa8775p_cfgs},=0D
 	{}=0D
 };=0D
+MODULE_DEVICE_TABLE(of, ctcu_match);=0D
 =0D
 static struct platform_driver ctcu_driver =3D {=0D
 	.probe          =3D ctcu_platform_probe,=0D


