Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91449606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 15:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=43c2y8NE;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aUVw8jMy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=erN66TjR/0pf7tS1JYwxo++1dYUqF4lntP5Gin4HQDk=; b=43c2y8NEtJwDY3cTaJRNCnMjM4
	m+85gMgqq+/6t1pn9Td+7Ungg4qEzLJrD6UetZQYTLhv0wk1qAyN56iAr6Hw5nMXk3lla25nOcign
	tQeVv5m/sjW1mRTpGa1cKyVqR+cqSKdWAo6LNhcUMbtZYFA+nKjcVSzaG1hKdCslvhU41qN99MW63
	lN24iZywc6u45wAM53DiBlsO7ji2BI3GTWJM0r8RjS9xRhOeEwGIqme5I/E1hPCEl71lW5RKMvdb0
	YUGtYUlqf/WNzEYqQ34UDdp3B7iBKa24z2x3rl2ETTIRjPuhJSRPtAnC2zQwkRQfuHPWWpXIXb/+V
	lbqcHWcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBuh-0000000A4Qk-1Xnc;
	Tue, 20 Oct 2026 15:38:07 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBuS-0000000A4L3-0PqG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 15:37:57 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-35c76e9614aso6228882eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 08:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510671; x=1793115471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=erN66TjR/0pf7tS1JYwxo++1dYUqF4lntP5Gin4HQDk=;
        b=aUVw8jMyihrD1SD4TOKPx++fcwU6L0Wn+cL8pXY3XBx4OKax3neO1ge7vL6Xeg8dBd
         YYqva3J6Dx74IuJ7IJf3wQCserwnmuqJxY/ss9uN05Rq5eno20fytw5H9/xIUGCqSPaM
         ZCj59SKkQV040ULXgIECAu0bBFGMao+UuS2Ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510671; x=1793115471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=erN66TjR/0pf7tS1JYwxo++1dYUqF4lntP5Gin4HQDk=;
        b=Z6MtOrgH4leDHQC1l/JTKe78g78MyTjOdxtZNth7Hg8YIGBQkIq93ej7JQ68rd47rW
         Iv2OVkQlxq0wbwsyDuZRezosHTF7pe60Kix7rOGZrNCEtKPNz+4hQavUUFiLLDFR53XC
         mp19IYAcSQkbFeNBjn7KHBC+y78stYrsrIuozfVS3j4nkP28cvpcT4S6K9Y7T2etLiTN
         aQAMJV+Y0Vj/ocRNtqhRc8ptpZY5H3KKguuD1vpxJjUWH0UYOCI9dGj+AsObBcVvyeDO
         ISAgRD4ev6mo2FgWPWRBVB4BL2KJOu3f74HIr5zhz3bF/WO+pSfBg2zZ14wqiu2TixZ1
         adag==
X-Forwarded-Encrypted: i=1; AKwUvBy1zR6SdOn6KNFOwhpVn2z1hpxIXAWT/1qE0e4oMPV8hJlhCmo60OJF/9F9y8JBoLFjNrl2SJzttmhR46K/9j/6@lists.infradead.org
X-Gm-Message-State: AFq9FYIhxOpzEnx9RXA+Ww9f6d6+5uEIN285EqTcCuxb0jYS7swxy7EI
	sH4VIGIvUC4MeOTCMW/Hj1L/2ospciPFt335SPdHK/hVqAZISKU4z7/7wUmuuE08lQ==
X-Gm-Gg: AYBFou2+GG4WT+Wa/Ks7/Iefhnu/FgsVYCoATLforz52nwgbUeren5WQUocmAd2z3b+
	7Pkot8S9aWrB8ghFQcISy4qzT+/2tuSww+aOE4tx9mGKHHIPwVD8bS/r0HyQN8Sw1x+WY8wE2t8
	mpp0A85nV/1qrHEMZtv+LjJQJEvHUd5rW+3pG6v2zTpcXPgLPHJ+3irZmOtwtpcnZ9nVIPA4UMd
	yfl5A6eX+VxikR+JGyJ1cp0WNsxM1bowypMUYdC5GZefNOfY+hJs4NZFbZQTAG5jV4yVHF0CWay
	6dCH93ImctjjcD/xo2f65POffKkX7TBaqiOohOQK2tdC6Su+v7lOwjHFyCEnqJwUKYGd6292U6L
	XIxL8xsoNh4aZov8BYfDnSCQZv/k8An4A5GmmMf+r4gWwtqX7ibOQ2VBop67l/YVDEHocWAt9Va
	Q5QcgogJlIPrrqysk7YIwBLAp0nduaGZXtBWJdVuqy+Q0iNv+J7GFRIhHIrXoeey68IYl5O71a9
	Ry4OYviSh1rsoCJRrOlsmxkdNt5DU+TS2q2dOIWIa3+pYzM0r4eMjpoZxU=
X-Received: by 2002:a05:693c:8353:b0:35a:22a4:132 with SMTP id 5a478bee46e88-361a284641fmr14607802eec.34.1792510669987;
        Tue, 20 Oct 2026 08:37:49 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:49 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	Nicolas Schier <nsc@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Devicetree@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Will Deacon <will@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 7/7] arm64: dts: qcom: sc7180: Add sc7180-trogdor.its FIT image script
Date: Tue, 20 Oct 2026 08:35:25 -0700
Message-ID: <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261020153652.2907186-1-dianders@chromium.org>
References: <20261020153652.2907186-1-dianders@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_083752_159743_0420F77A 
X-CRM114-Status: GOOD (  18.18  )
X-Spam-Score: -2.4 (--)
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add an Image Tree Source (`sc7180-trogdor.its`) describing the FIT
image for SC7180 Trogdor family boards using `Image-framed.lz4` and
LZ4-compressed board DTBs (`*.dtb.lz4`), allowing the Trogdor FIT image
to be built with:

  make FIT_ITS=qcom/sc7180-trogdor.its image.fit

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
As mentioned in the cover letter, there is no desperate need to land
this. The FIT image created here is pretty much the same as what the
downstream build scripts for ChromeOS programmatically
produce. Switching over to this would have a few benefits:
* It makes it easy to use fdtfactor on the trogdor kernel image.
* It would set the path for future Chromebooks, and on those
  Chromebooks maybe we could use the "description" of the
  configurations to help the bootloader so we didn't need the awkward
  piles of "compatible" strings that we have.
* It could potentially be useful to people in the community putting
  upstream kernels on sc7180-trogdor devices.

This all being said, there's nothing terribly critical here, so if
it's controversial or people hate it then it's fine not to land it.

 arch/arm64/boot/dts/qcom/sc7180-trogdor.its | 728 ++++++++++++++++++++
 1 file changed, 728 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor.its

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.its b/arch/arm64/boot/dts/qcom/sc7180-trogdor.its
new file mode 100644
index 000000000000..310c286706f1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.its
@@ -0,0 +1,728 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/dts-v1/;
+
+/ {
+	description = "Chrome OS kernel image with one or more FDT blobs";
+	#address-cells = <1>;
+
+	images {
+		kernel-1 {
+			description = "Linux kernel";
+			data = /incbin/("arch/arm64/boot/Image-framed.lz4");
+			type = "kernel_noload";
+			arch = "arm64";
+			os = "linux";
+			compression = "lz4";
+			load = <0>;
+			entry = <0>;
+		};
+		fdt-1 {
+			description = "sc7180-trogdor-coachz-r1-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-2 {
+			description = "sc7180-trogdor-coachz-r1.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-3 {
+			description = "sc7180-trogdor-coachz-r3-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-4 {
+			description = "sc7180-trogdor-coachz-r3.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-5 {
+			description = "sc7180-trogdor-homestar-r2.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-6 {
+			description = "sc7180-trogdor-homestar-r3.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-7 {
+			description = "sc7180-trogdor-homestar-r4.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-8 {
+			description = "sc7180-trogdor-kingoftown.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-9 {
+			description = "sc7180-trogdor-lazor-limozeen-nots-r10.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-10 {
+			description = "sc7180-trogdor-lazor-limozeen-nots-r4.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-11 {
+			description = "sc7180-trogdor-lazor-limozeen-nots-r5.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-12 {
+			description = "sc7180-trogdor-lazor-limozeen-nots-r9.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-13 {
+			description = "sc7180-trogdor-lazor-limozeen-r10.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-14 {
+			description = "sc7180-trogdor-lazor-limozeen-r4.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-15 {
+			description = "sc7180-trogdor-lazor-limozeen-r9.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-16 {
+			description = "sc7180-trogdor-lazor-r1-kb.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-17 {
+			description = "sc7180-trogdor-lazor-r1-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-18 {
+			description = "sc7180-trogdor-lazor-r1.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-19 {
+			description = "sc7180-trogdor-lazor-r10-kb.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-20 {
+			description = "sc7180-trogdor-lazor-r10-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-21 {
+			description = "sc7180-trogdor-lazor-r10.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-22 {
+			description = "sc7180-trogdor-lazor-r3-kb.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-23 {
+			description = "sc7180-trogdor-lazor-r3-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-24 {
+			description = "sc7180-trogdor-lazor-r3.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-25 {
+			description = "sc7180-trogdor-lazor-r9-kb.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-26 {
+			description = "sc7180-trogdor-lazor-r9-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-27 {
+			description = "sc7180-trogdor-lazor-r9.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-28 {
+			description = "sc7180-trogdor-pazquel-lte-parade.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-29 {
+			description = "sc7180-trogdor-pazquel-lte-ti.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-30 {
+			description = "sc7180-trogdor-pazquel-parade.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-31 {
+			description = "sc7180-trogdor-pazquel-ti.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-32 {
+			description = "sc7180-trogdor-pazquel360-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-33 {
+			description = "sc7180-trogdor-pazquel360-wifi.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-34 {
+			description = "sc7180-trogdor-pompom-r1-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-35 {
+			description = "sc7180-trogdor-pompom-r1.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-36 {
+			description = "sc7180-trogdor-pompom-r2-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-37 {
+			description = "sc7180-trogdor-pompom-r2.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-38 {
+			description = "sc7180-trogdor-pompom-r3-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-39 {
+			description = "sc7180-trogdor-pompom-r3.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-40 {
+			description = "sc7180-trogdor-quackingstick-r0-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-41 {
+			description = "sc7180-trogdor-quackingstick-r0.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-42 {
+			description = "sc7180-trogdor-r1-lte.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-43 {
+			description = "sc7180-trogdor-r1.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-44 {
+			description = "sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-45 {
+			description = "sc7180-trogdor-wormdingler-rev1-boe.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-46 {
+			description = "sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-47 {
+			description = "sc7180-trogdor-wormdingler-rev1-inx.dtb.lz4";
+			data = /incbin/("arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb.lz4");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "lz4";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+	};
+
+	configurations {
+		conf-1 {
+			description = "sc7180-trogdor-coachz-r1-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-1";
+		};
+		conf-2 {
+			description = "sc7180-trogdor-coachz-r1";
+			kernel = "kernel-1";
+			fdt = "fdt-2";
+		};
+		conf-3 {
+			description = "sc7180-trogdor-coachz-r3-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-3";
+		};
+		conf-4 {
+			description = "sc7180-trogdor-coachz-r3";
+			kernel = "kernel-1";
+			fdt = "fdt-4";
+		};
+		conf-5 {
+			description = "sc7180-trogdor-homestar-r2";
+			kernel = "kernel-1";
+			fdt = "fdt-5";
+		};
+		conf-6 {
+			description = "sc7180-trogdor-homestar-r3";
+			kernel = "kernel-1";
+			fdt = "fdt-6";
+		};
+		conf-7 {
+			description = "sc7180-trogdor-homestar-r4";
+			kernel = "kernel-1";
+			fdt = "fdt-7";
+		};
+		conf-8 {
+			description = "sc7180-trogdor-kingoftown";
+			kernel = "kernel-1";
+			fdt = "fdt-8";
+		};
+		conf-9 {
+			description = "sc7180-trogdor-lazor-limozeen-nots-r10";
+			kernel = "kernel-1";
+			fdt = "fdt-9";
+		};
+		conf-10 {
+			description = "sc7180-trogdor-lazor-limozeen-nots-r4";
+			kernel = "kernel-1";
+			fdt = "fdt-10";
+		};
+		conf-11 {
+			description = "sc7180-trogdor-lazor-limozeen-nots-r5";
+			kernel = "kernel-1";
+			fdt = "fdt-11";
+		};
+		conf-12 {
+			description = "sc7180-trogdor-lazor-limozeen-nots-r9";
+			kernel = "kernel-1";
+			fdt = "fdt-12";
+		};
+		conf-13 {
+			description = "sc7180-trogdor-lazor-limozeen-r10";
+			kernel = "kernel-1";
+			fdt = "fdt-13";
+		};
+		conf-14 {
+			description = "sc7180-trogdor-lazor-limozeen-r4";
+			kernel = "kernel-1";
+			fdt = "fdt-14";
+		};
+		conf-15 {
+			description = "sc7180-trogdor-lazor-limozeen-r9";
+			kernel = "kernel-1";
+			fdt = "fdt-15";
+		};
+		conf-16 {
+			description = "sc7180-trogdor-lazor-r1-kb";
+			kernel = "kernel-1";
+			fdt = "fdt-16";
+		};
+		conf-17 {
+			description = "sc7180-trogdor-lazor-r1-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-17";
+		};
+		conf-18 {
+			description = "sc7180-trogdor-lazor-r1";
+			kernel = "kernel-1";
+			fdt = "fdt-18";
+		};
+		conf-19 {
+			description = "sc7180-trogdor-lazor-r10-kb";
+			kernel = "kernel-1";
+			fdt = "fdt-19";
+		};
+		conf-20 {
+			description = "sc7180-trogdor-lazor-r10-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-20";
+		};
+		conf-21 {
+			description = "sc7180-trogdor-lazor-r10";
+			kernel = "kernel-1";
+			fdt = "fdt-21";
+		};
+		conf-22 {
+			description = "sc7180-trogdor-lazor-r3-kb";
+			kernel = "kernel-1";
+			fdt = "fdt-22";
+		};
+		conf-23 {
+			description = "sc7180-trogdor-lazor-r3-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-23";
+		};
+		conf-24 {
+			description = "sc7180-trogdor-lazor-r3";
+			kernel = "kernel-1";
+			fdt = "fdt-24";
+		};
+		conf-25 {
+			description = "sc7180-trogdor-lazor-r9-kb";
+			kernel = "kernel-1";
+			fdt = "fdt-25";
+		};
+		conf-26 {
+			description = "sc7180-trogdor-lazor-r9-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-26";
+		};
+		conf-27 {
+			description = "sc7180-trogdor-lazor-r9";
+			kernel = "kernel-1";
+			fdt = "fdt-27";
+		};
+		conf-28 {
+			description = "sc7180-trogdor-pazquel-lte-parade";
+			kernel = "kernel-1";
+			fdt = "fdt-28";
+		};
+		conf-29 {
+			description = "sc7180-trogdor-pazquel-lte-ti";
+			kernel = "kernel-1";
+			fdt = "fdt-29";
+		};
+		conf-30 {
+			description = "sc7180-trogdor-pazquel-parade";
+			kernel = "kernel-1";
+			fdt = "fdt-30";
+		};
+		conf-31 {
+			description = "sc7180-trogdor-pazquel-ti";
+			kernel = "kernel-1";
+			fdt = "fdt-31";
+		};
+		conf-32 {
+			description = "sc7180-trogdor-pazquel360-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-32";
+		};
+		conf-33 {
+			description = "sc7180-trogdor-pazquel360-wifi";
+			kernel = "kernel-1";
+			fdt = "fdt-33";
+		};
+		conf-34 {
+			description = "sc7180-trogdor-pompom-r1-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-34";
+		};
+		conf-35 {
+			description = "sc7180-trogdor-pompom-r1";
+			kernel = "kernel-1";
+			fdt = "fdt-35";
+		};
+		conf-36 {
+			description = "sc7180-trogdor-pompom-r2-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-36";
+		};
+		conf-37 {
+			description = "sc7180-trogdor-pompom-r2";
+			kernel = "kernel-1";
+			fdt = "fdt-37";
+		};
+		conf-38 {
+			description = "sc7180-trogdor-pompom-r3-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-38";
+		};
+		conf-39 {
+			description = "sc7180-trogdor-pompom-r3";
+			kernel = "kernel-1";
+			fdt = "fdt-39";
+		};
+		conf-40 {
+			description = "sc7180-trogdor-quackingstick-r0-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-40";
+		};
+		conf-41 {
+			description = "sc7180-trogdor-quackingstick-r0";
+			kernel = "kernel-1";
+			fdt = "fdt-41";
+		};
+		conf-42 {
+			description = "sc7180-trogdor-r1-lte";
+			kernel = "kernel-1";
+			fdt = "fdt-42";
+		};
+		conf-43 {
+			description = "sc7180-trogdor-r1";
+			kernel = "kernel-1";
+			fdt = "fdt-43";
+		};
+		conf-44 {
+			description = "sc7180-trogdor-wormdingler-rev1-boe-rt5682s";
+			kernel = "kernel-1";
+			fdt = "fdt-44";
+		};
+		conf-45 {
+			description = "sc7180-trogdor-wormdingler-rev1-boe";
+			kernel = "kernel-1";
+			fdt = "fdt-45";
+		};
+		conf-46 {
+			description = "sc7180-trogdor-wormdingler-rev1-inx-rt5682s";
+			kernel = "kernel-1";
+			fdt = "fdt-46";
+		};
+		conf-47 {
+			description = "sc7180-trogdor-wormdingler-rev1-inx";
+			kernel = "kernel-1";
+			fdt = "fdt-47";
+		};
+	};
+};
-- 
2.56.0.212.g129ede20d9-goog


