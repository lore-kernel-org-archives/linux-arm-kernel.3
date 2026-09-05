Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53059C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 13:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dZ3ak0MZQGVE/7EAGjEDrOFT1fT6lEwINHAvDHJa5sc=; b=1PlzfAaEt7tiE+tZpVuvy8V7E2
	8uqyP0h7OTdLavPQvZ3fKGKEx4+re06M2rhOt8TjypoO/fjYrGdrH1N/9IOA7gedVD1vKf6onUCbU
	Wpdk1SQnF0oCGvWoFTd/0PsdfTUqMLcGGpE6jDYR/7s2zDW7NEZBo5vMXBZYAoTCM0GAopoNs67oX
	SmX0PFfz5nGBXve9hc4rzQ/Qj8K7zQZSvrkaWLz0c/dKlKO4FPROVYJwCdmGQ/0+BL4uk/huZt5ps
	NGylUFXH1+auKrKr+paeky/c89kbLapjjt2vME1lqiJnVSUZaCji1NxOohv0L8De/omBZqSElz5uF
	JVhKabKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qgC-000000047Ms-2JUZ;
	Sat, 05 Sep 2026 13:43:36 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qg9-000000047M8-3trM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 13:43:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=dZ
	3ak0MZQGVE/7EAGjEDrOFT1fT6lEwINHAvDHJa5sc=; b=nmnRJw3YPaD7dPT+R1
	LQMy17GJvcOHzY/2FSBW73zHGsViv7BxIjaMwt0AC7wZobr7fEtAmF5EsBGwIBdm
	DyRmLyMfNzhRBTuFlyN0pFLc78eLvVQDYQRQ1j+lXwlCj8k/md/8nRllv7UJwfJM
	c89VghPFcwOz2hD/Mrk/p75/A=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wCnVTl3HJxqo0uOAw--.16301S2;
	Sat, 05 Sep 2026 21:43:20 +0800 (CST)
From: "hpp.iscas" <hppiscas@163.com>
To: Will Deacon <will@kernel.org>
Cc: "hpp.iscas" <hppiscas@163.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bhaskara Budiredla <bbudiredla@marvell.com>
Subject: [PATCH] perf/marvell: cn10k_tad: Publish the OF module alias
Date: Sat,  5 Sep 2026 21:43:17 +0800
Message-ID: <20260905134317.67317-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID: _____wCnVTl3HJxqo0uOAw--.16301S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr47tr4UKr1rtw1UJr4fKrg_yoWfuFg_ur
	13XF40g3s5Kr1Dtw1jyr4rCryfKr17uFWDXrWvgrnYq34xXFnxArsFyrWxA3s0gr4jyFWD
	ZrWUWFyjqrW3GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjbdbUUUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxRjmr2qcHHg9nwAA3k
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_064334_415260_47B57EF4 
X-CRM114-Status: UNSURE (   6.04  )
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

The TAD PMU platform driver has ACPI and OF match tables, but only=0D
the ACPI table is published. A Device Tree platform device emits an=0D
OF modalias, so the ACPI alias does not select this module for it.=0D
=0D
Publish the OF table inside CONFIG_OF and retain ACPI support.=0D
=0D
Fixes: 036a7584bede ("drivers: perf: Add LLC-TAD perf counter support")=0D
Signed-off-by: hpp.iscas <hppiscas@163.com>=0D
---=0D
 drivers/perf/marvell_cn10k_tad_pmu.c | 1 +=0D
 1 file changed, 1 insertion(+)=0D
=0D
diff --git a/drivers/perf/marvell_cn10k_tad_pmu.c b/drivers/perf/marvell_cn=
10k_tad_pmu.c=0D
index 54909d0..301be4d 100644=0D
--- a/drivers/perf/marvell_cn10k_tad_pmu.c=0D
+++ b/drivers/perf/marvell_cn10k_tad_pmu.c=0D
@@ -424,6 +424,7 @@ static const struct of_device_id tad_pmu_of_match[] =3D=
 {=0D
 	{ .compatible =3D "marvell,cn10k-tad-pmu", .data =3D &tad_pmu_data },=0D
 	{},=0D
 };=0D
+MODULE_DEVICE_TABLE(of, tad_pmu_of_match);=0D
 #endif=0D
 =0D
 #ifdef CONFIG_ACPI=0D


