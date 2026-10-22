Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA96606B7CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 18:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OSpW44mY;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EqSFYy1Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5W7z1rOfIZVI61tKSTk21lKhK4AufBt6SAL9admKOgU=; b=OSpW44mY6AsT5d
	K3Jlzcl+c2XcM5oHypbxMvkFixVkvfP0xnrqzs0BrysoJtPixA4LPcixH3iI1P6cnkgvwzpaiBaXJ
	KxSefgKFf9eHhoDoif2aWsiIpO6RQUg+04QzkKRKHPorIGZtS2c3SJX80Fg/M8hl3CgKhflbIUlwf
	wTjvmnJQ2+c1ickMXxS1KESiWCx033iTqvhDelV8Fb58aL5wHc1PESnVk/TYSp0im1Jb/2zM1s+52
	DmdGVQhLZltocKqSmGU1C+qQVBxu/loQ1QhzK4Ytoe8XROAS8DCkFJct3PjOb2VV6e3iNZBrIPZZw
	EVnzWPLfLk0FznulS0Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZZ-0000000Ei0x-3f45;
	Thu, 22 Oct 2026 18:31:29 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZQ-0000000Ehpj-3Ovl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 18:31:22 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49d05d51553so862625e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 11:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792693879; x=1793298679; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5W7z1rOfIZVI61tKSTk21lKhK4AufBt6SAL9admKOgU=;
        b=EqSFYy1Qnv6RdgACkV3QKU/tcXRd1aJZUHJOrXzMrJEv/5daqLvzRAh2WWvQq9qLei
         w6lW2WF8Z087tkZkzZKJGh3nxppMUhmH797GlKJh5io7HkK/Ma72UCvzcOxRm8vVBidM
         xuYzzEH0BzrnRxzagg03HvPqSDazJJGZMnMonEy1J7VkMV5LDsVCCZvHwYo3rbi+Y6Wj
         MGNRQ+lqdG5h3/UwH0CZ/aU3wKQBFEH4uPYvKt4QVF1zuOpi1dVAFnFYUUOGiILuooCr
         waVqCvLgYSnVfJ4NRdFdEfkVOsuQxzvxexatQcUBXEYCFRBPyVRHxdl6/zXs0k0OeZcy
         6/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693879; x=1793298679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5W7z1rOfIZVI61tKSTk21lKhK4AufBt6SAL9admKOgU=;
        b=Pw1vTsG70IBR/mKSwf1ItZI6tDD/Ocwo1gbpSFjz4Ze+xREXKq/tz/zf2ZXBQl3Bzl
         Sip8mBeZBhmAZLI3cx8qO+fQml8kqGC6V6JVk3cEsw602O8uIWV0jcXbQgLJmExjQXDk
         fhPMJp2q7pkfp8rUheBhO0va7M+2Sc5jYhXhPp+PbImZmMciJtK09iEPPp3t9kS/TJBO
         zNgeGdo7yP3thxUd6gJR5Lwl+qrJM9cQv+y/qyy0+gF/ji07x5vexrZRhSVPq5f7it03
         E57/NRqjQoPFjPeia4YWTtvNLzaQ6vGFz2e2OesrXmabHNNGrvhGbkmod4869ADYCRxN
         LojA==
X-Gm-Message-State: AFq9FYKva9N+SQ/XOb2Y2mhff+VLO1yEH+NZ2YS4+cwRdpCvlgXiAUBy
	ulv09vFFeRZ19v9ay2A5eTQux/OKBKpQETaEnQBZnj/7Yvi7Oh3SGJSKFP1KfGqIA0M=
X-Gm-Gg: AYBFou2yBCz83jfceqayNX78Hh8q4v8m1zTub5RDE+M9CovO0w7qUmv8uQgoTtgPNwK
	yqErp47R2rur9NLkf3AFIBjlx8FhKAG9u9jDd1R+2kmFAAd/svmZ4+RqSKriJG1J38QNR/UST1r
	yBVA5/0SmJchSqH9nXjIchYIC4igd5Mln/yJ3Bf9L7TtR360+1AxhRURkDQrnB3SZy/1FBj6O6Z
	7lPrgto9z1LVSGsKJibT9PGkv0zrBF1HRU5toQauUOkIywhWtaPF/yYBol79YVzSVUNWLKQdNbu
	LfdBuBxc8UZo0qlS8vI0EbQLrMy+BwGf0hPdjFx4zGhuF3WZetD8ulV+Ev0HVZobuJ2jpIv6H0w
	EnyjeozKDR9SLYOU7RZKb1PXl728RyryLXcK1tKO6ssuDLyQUFOhEcUKSuZqN9WDhM4f/wIPjYo
	BzzNOWAPJBWmiOMcFyCSL9KiGigLjBEfp0mBeJqfEr2dqqMVmVrsPYi1bibWwgMytyYlVEAPPL6
	FA+DqYwQumbYW/I1A9h7ec+z6Z0qwqi7t/KkzceBcFI32uTHItXDshyDFRoRZPpGIrUfzvaIGL8
	DlB66QrAf6vIrj3kI3CeUPujx//CoYQ+ywxvvGyfcGyPMUSe8T4iaf8+7m4OxN0=
X-Received: by 2002:a05:600c:6094:b0:4a1:93fd:8f8 with SMTP id 5b1f17b1804b1-4a1fd89daa9mr116976045e9.4.1792693878853;
        Thu, 22 Oct 2026 11:31:18 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21143094fsm4556975e9.1.2026.10.22.11.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:31:18 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 20:30:28 +0200
Subject: [PATCH 2/4] arm64: dts: amlogic: s7d: fix the GIC CPU interface
 region size
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-upstream-s7-s7d-gicc-size-v1-2-8285053cf4ee@baylibre.com>
References: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
In-Reply-To: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_113120_929849_E1783ABC 
X-CRM114-Status: GOOD (  13.64  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The CPU interface of the GIC-400 spans 8 KiB, but the S7D device tree
describes only its first 256 bytes. The GIC driver then disables the
split priority drop and deactivation mode, which needs the GICC_DIR
register in the second 4 KiB page, and warns at boot that the range is
too small.

Describe the whole 8 KiB region, as the other Amlogic SoCs with a
GIC-400 at the same address do.

Fixes: 1a30661c20de ("arm64: dts: add support for S7D based Amlogic BM202")
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
index 5593ff9e07eb..059a1bf37584 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
@@ -85,7 +85,7 @@ gic: interrupt-controller@fff01000 {
 			#address-cells = <0>;
 			interrupt-controller;
 			reg = <0x0 0xfff01000 0 0x1000>,
-			      <0x0 0xfff02000 0 0x0100>;
+			      <0x0 0xfff02000 0 0x2000>;
 			interrupts = <GIC_PPI 9 0xf04>;
 		};
 

-- 
2.56.0


