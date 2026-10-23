Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E62606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 10:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tDEFQfkB;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Nvb2pt8u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HgzAQ6yNXJm+/JMG+P/joeDeoINHIroQeqY0i4kBEKE=; b=tDEFQfkBIOa59v
	7FpU5GSUw9pNAInkrkTww6EdawL9UGwh8CgEH5hOvOn+td1YwQz+LIxySOmoZJ5S54ISuqsBdN9AC
	dQjlaepkQ9ZAZNwPMu5w0dMSnagLniUTHak+1w9I81zuEwSFzdG/EAH3L3GlLUfmK1nmoiecWVX8Y
	EhYBFaHSohoAxGZmUmHk90GPaS5mFbYfhoc0hCrZmByiHXk1T0yldhd5MbHCPvEAT0qpSMDdAM1ZK
	r+uP06Tzn/LjCJvD8Nh/QRNGLLyICnGtDK6a3GVMP5+NcxlLNx6ikpbYpmyaJNIrth2nzmpwI41NN
	h0EbSN5LEUuEQPy+6TlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCG1-0000000G7Vl-47nQ;
	Fri, 23 Oct 2026 10:12:17 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCFz-0000000G7TM-0DmI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 10:12:16 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so8059405e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 03:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792750332; x=1793355132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HgzAQ6yNXJm+/JMG+P/joeDeoINHIroQeqY0i4kBEKE=;
        b=Nvb2pt8uBAMyjLbawzL6MkTLeal4PiUkWBN6kJpNYea4ut+LePXGtek6XMyGvv4EhC
         w1HvCKGD4t28zqjtdjJUUcLhF9IeZixdxJ8pCZYG0A8O5nfBK8v65/TO5xFjXc5tG7Op
         L2g1KVpAoT/VeGmWlLwPME81ZyskQ73saOAR9H264k34SBQFHPr3yh5+AVmE+SM4oHSo
         HiFTQK2P/w6soH9pnYVQvQkxQ/j2LHQx8VT4MGCvfa9ee9TDVEM7Rvc8ZHWWqIpZeboN
         ABfL0yuMvr+pBk4dPkTcHDtaF2DCy3IhCIDyPNR7XssMpNT0UffnGh4MhEHisyVFhulu
         n9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750332; x=1793355132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HgzAQ6yNXJm+/JMG+P/joeDeoINHIroQeqY0i4kBEKE=;
        b=02HSf0eMutofUMweNc/cI48DAu0vhtEAiq0MuQs9Ce822PKbpYT6nrNaQKRkt2KgZm
         h/LaOdt6c0dOi65X1VbdVi+Z6mbjS1qToNb/XTx/m9YHtM1/pokJhIalpzV2uMLSy8u/
         9VnqpLMOV4gaD9zyIdl+3EUnJY1DTahkn46PEU/N2xYMKmGJeq0fjPgWwJDLrGMEbMBW
         qu+CtPN0DqKlyEPxfSwuHtGJe4UOuH+oG61Mfu2aDJfxJHjFbAIZdJVXW/oIspg2T89B
         /QD+AZuMHHc+nHMux8+Vp4gLVZy6NOHM3eLsxFVlG/ZSxu9k6F3ePQKF4aNjIV3rFMOX
         xZJA==
X-Forwarded-Encrypted: i=1; AKwUvBykrPU0bJXvBjscyicY1miMVD7SOHYhoOUycnz68BEPwJEHTdfYZl1y2aen1cQbXZe6xQy/nWV8WEGw1Tm176Pe@lists.infradead.org
X-Gm-Message-State: AFq9FYJ+tEfGiszX6vEOip2MUo8Di2qJNahfSBROJJIvbbMUWi8F6hnZ
	8DlMDzbCeOFqlTSehg6htKm51p3zgnfzq6CUxF+MYLjliS/JG8mx/jAPBBJ4YA3EnRY=
X-Gm-Gg: AYBFou06X5Xnx8k2gpc3LXUpseWEjQD1M6FBb/pynduixe9G5RFexjOk4IOXkOAdvOe
	NvxxnbCYdXQ+tt/eO1OBuFXSQDy/UwvUsP0yQOHKC3R1pNX165Wlg7ZNDhIgIv/gJ9H2MGde4n1
	DwWa+d5BO6mkM3O+sAr6hou8axhIEVSXLfWefj/829DTGmy1cEYK/OTayb5H5K75BzgiuQGdS2X
	E0N26tmQJhO4KGaa4JJnpsbUwd+5c0/qktx9O9qsQer5r1y+AHA+DkJJ1Pjk+AXCF5fHC+r4LcD
	3Ja0XrJNEwxzDe3Kt8l7IfuPeX+kjgBsULNAikPH40gO8CAxFmZl9rZ7c8VxHXHLq6zkrjO8pXk
	hi8kiUPdf4/aHQdeEtSufmZN6pJ0ovu2YIK+BgdjJ+U4PI4GFHolXiu2rW22a05nzzlw05qHtBF
	x7f+6GzFYWCZY+kDWw3/6oJZbO9rQ7tCNUhUkJWcGDneCA0tFf8//4T1dZE5noUs4TVsH4tY9xu
	C3KAnzXzE5in8b43HluRU++0vE1SE/nPtixJEjJTZoiY0PeLj97jTc=
X-Received: by 2002:a05:600c:4e8a:b0:4a1:d675:b031 with SMTP id 5b1f17b1804b1-4a211eeea21mr27725575e9.6.1792750332157;
        Fri, 23 Oct 2026 03:12:12 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21047b2absm62807825e9.13.2026.10.23.03.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:12:11 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH RFC 1/4] pwm: rp1: Export helper to read fan tachometer RPM
Date: Fri, 23 Oct 2026 12:15:54 +0200
Message-ID: <a565aa38de650596daf04f3bc21a724e21c826f9.1792748690.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1792748690.git.andrea.porta@suse.com>
References: <cover.1792748690.git.andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_031215_111318_83B11E80 
X-CRM114-Status: GOOD (  19.70  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On the Raspberry Pi RP1 southbridge, the internal PWM controller hardware
block houses a register associated with fan tachometer monitoring. The
tachometer pulses are measured by firmware running on the RP1 Cortex-M
core, which periodically writes the calculated RPM values directly into
dedicated MMIO registers within the PWM block.

Because the Linux PWM framework currently does not provide an abstraction
or API to report hardware-calculated tachometer readings to consumer
drivers, a direct accessor is needed by the companion hwmon fan driver
to read these values.

Add and export rp1_pwm_read_tachometer() to allow consumer drivers to
retrieve the fan speed from the PWM MMIO registers. To prevent polluting
the global kernel symbol namespace and restrict access to intended
consumers, export the function under the 'RP1_PWM' symbol namespace.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/pwm/pwm-rp1.c                     | 27 +++++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-pwm-rp1.h | 10 +++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 include/soc/bcm2835/raspberrypi-pwm-rp1.h

diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
index d4b13fba8d236..79d65f332dd30 100644
--- a/drivers/pwm/pwm-rp1.c
+++ b/drivers/pwm/pwm-rp1.c
@@ -49,6 +49,7 @@
 #include <linux/pwm.h>
 #include <linux/units.h>
 #include <linux/spinlock.h>
+#include <soc/bcm2835/raspberrypi-pwm-rp1.h>
 
 #define RP1_PWM_GLB_CTRL			0x000
 #define RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(chan)	BIT(chan)
@@ -286,6 +287,32 @@ static const struct pwm_ops rp1_pwm_ops = {
 	.write_waveform = rp1_pwm_write_waveform,
 };
 
+int rp1_pwm_read_tachometer(struct device *dev)
+{
+	struct pwm_chip *chip;
+	struct rp1_pwm *rp1;
+
+	if (!dev)
+		return -EINVAL;
+
+	if (!of_device_is_compatible(dev_of_node(dev), "raspberrypi,rp1-pwm"))
+		return -EINVAL;
+
+	chip = dev_get_drvdata(dev);
+	if (!chip)
+		return -ENODEV;
+
+	rp1 = pwmchip_get_drvdata(chip);
+	if (!rp1)
+		return -ENODEV;
+
+	if (!rp1->clk_enabled)
+		return -EBUSY;
+
+	return (int)readl(rp1->base + RP1_PWM_PHASE(2));
+}
+EXPORT_SYMBOL_NS_GPL(rp1_pwm_read_tachometer, "RP1_PWM");
+
 static int rp1_pwm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
diff --git a/include/soc/bcm2835/raspberrypi-pwm-rp1.h b/include/soc/bcm2835/raspberrypi-pwm-rp1.h
new file mode 100644
index 0000000000000..3be0892da667e
--- /dev/null
+++ b/include/soc/bcm2835/raspberrypi-pwm-rp1.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __SOC_RASPBERRY_PWM_RP1_H__
+#define __SOC_RASPBERRY_PWM_RP1_H__
+
+#include <linux/device.h>
+
+int rp1_pwm_read_tachometer(struct device *dev);
+
+#endif /* __SOC_RASPBERRY_PWM_RP1_H__ */
-- 
2.35.3


