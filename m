Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DC6C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 11:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DY5hg0oG2n14IkGfO3z7zsyaI7BrSzLCYgqaOw77aLA=; b=c0lfcTN9KsncUbcqhb8koqXQXn
	DZzpI/JrduSuqldjxAju8Tww+OCnM9S4C94LUA/TDTQEN3k5KA+JKtS1jHmCeGXN2h2uu9ZHMuz3Y
	bMTbUNorpjaWt6wjCBL9TNFzWUDH/asIC8ARPtlNT8wi6NfAUAtmfy9E6kgsKe0TrBJ0pPGNEngGl
	oZbdqKhSZPad3+XJStG7H26twwLU/5rJFJiCnuDwD7GaAFkCItYK9iisPPGB1fyWpvNonf+Km1TV2
	IbrKucp/LTt2jBd2Uobmprx/XGDXhr4c+776xaCRvBQdiqUGKbhWXyDmp9ygpBPwNGKfW6JXPvGVy
	KaTT4wRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AlL-0000000BF1Y-0Phy;
	Thu, 17 Sep 2026 11:58:47 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7AlH-0000000BF0x-3ycF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 11:58:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=DY
	5hg0oG2n14IkGfO3z7zsyaI7BrSzLCYgqaOw77aLA=; b=GV0ViWIlR1KZyhjXDX
	eiajrRA7mZJ5YbImyhZfBV+Z+HkmapaALqOa1bRQk3JPmdBIrhCcuG2jvIRmYEv4
	fT80QRY930isyhI7wxfuUZmVV+GESy62egDlAAFEzSTHrW/hkH09rs9oW+yTszHR
	LW6mIn8ChgDJtuBX1DgXvbP24=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAH7aTa1atqD7D0BA--.50575S2;
	Thu, 17 Sep 2026 19:58:19 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Quchaosheng <quchaosheng000406@163.com>
Subject: [PATCH 1/2] hwmon: vexpress: point the DT binding reference at the schema
Date: Thu, 17 Sep 2026 19:58:17 +0800
Message-ID: <20260917115818.540344-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAH7aTa1atqD7D0BA--.50575S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr4fGrW3Wr13Zry7Cry5XFb_yoWkCrgEkF
	W0qF4vk3yUAFWSgFyUAFWrCrn7Xr4Skr4xCrn7Wrs0y34jqa9xGFykX343Aw1xurW7uw15
	WrWfJrWDJ3ZFgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRMsjjDUUUUU==
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC5Bsxpmqr1du6BwAA3a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_045844_373099_B7649D5F 
X-CRM114-Status: UNSURE (   9.82  )
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

Documentation/hwmon/vexpress.rst points at
Documentation/devicetree/bindings/hwmon/vexpress.txt for the device tree
binding of the arm,vexpress-volt, -amp, -temp, -power and -energy sensors.

That file only restates the compatibles and the label property, which the
arm/vexpress-config.yaml schema describes now. Point the reference there.

Assisted-by: LLM
Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
---
 Documentation/hwmon/vexpress.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/vexpress.rst b/Documentation/hwmon/vexpress.rst
index 7fc99f75b3b1..84b2a33e2d40 100644
--- a/Documentation/hwmon/vexpress.rst
+++ b/Documentation/hwmon/vexpress.rst
@@ -38,4 +38,4 @@ via a custom interface, abstracted by the "vexpress_config" API.
 
 As these devices are non-discoverable, they must be described in a Device
 Tree passed to the kernel. Details of the DT binding for them can be found
-in Documentation/devicetree/bindings/hwmon/vexpress.txt.
+in Documentation/devicetree/bindings/arm/vexpress-config.yaml.
-- 
2.43.0


