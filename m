Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6876860A5BCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 10:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z7PN8+JU;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dL9+QwmV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=M7JJASl+nuTr5h0hwNfOIsigjQbehWTAWvZV7+ghWJc=; b=z7PN8+JUX8ULuJX8tGcwJsS3Ix
	iltdyBZyCBF2OCNcOMDHOFxeDHw9ccJtweuMG32K2nRlGxgwUG4xHQvC/RbCP0b3dSTlM1vYG+4YY
	Lv5Yziatr97ZsFxtQZzBFrFvpfCrz45PFREudxci47Qz4TXcjqNDHNWPGyReSpud73+G0XcJx56BP
	T01e8pzy/gGp0WbxR7PaFDCZFeuwJyUDv1+j7i5WeAhZpVCo8v3MmfI8X57fJvf16uNN5PULoHdzn
	W9j7ttgf1F7ep0waX1mQD0/kgk85wAqQ4UEJZlqGMfjLLWDAHTTR7YcHTxBlXNc/cnvF8+lJbRLfw
	XuEaQktA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjwL-0000000BPSb-134K;
	Fri, 30 Oct 2026 10:34:29 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjwI-0000000BPRT-2llc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 10:34:27 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-3550c917fd3so808299eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 03:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793356465; x=1793961265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M7JJASl+nuTr5h0hwNfOIsigjQbehWTAWvZV7+ghWJc=;
        b=dL9+QwmVqLpIAqzmSHwe7Z12xWuZCquqlqNYDAj4Me5LHYEuHLy4KY67oafAfY0yxO
         ylqMgxtimmMthwSzBX0l+62lK5QNIYXptLDvyr9zu1dLXyzMFwSzMDMLv0ygYkre7d+q
         5sjqxPg9Q14jrvZKs9uJYigpaaeiQnt7I8f+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793356465; x=1793961265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M7JJASl+nuTr5h0hwNfOIsigjQbehWTAWvZV7+ghWJc=;
        b=zauvHRx4Uq07A9Cnn59oD41IG8A+5zF906FigD2ArtoR5rKlPKhExeLwnW26JfJ7Jj
         jhuDNooaRLCMYJuMyrL0Gg4vEsc1FbhNWfUAwpHPnsy3yZGoGTpMG7rpN1eWYyoYO6iH
         2TJrouOWwQbUIZOLH/6KrRTYLN4kdExfyX3d+8nb63lA6IioEz4PT5ZuqcNTInfSjYx3
         gkhbN1BsL0it7NrDxXCcBJy0FtOnvrrd8oXeAwxVtZAeNpAx1WJQFQJV8U83nMXz544C
         fbnT7zgdnIWcKqT5fFfZI3TeX3B6IorxYdidyTE+Thd9d1TS5t1/c/qTbu+Ocevgew17
         3WXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhZ5d4KR31YNGZSjJWSXp8duWQn0kxK3SZI7wmWfSnSozIWUFR1u/c19aoM4eGRt24OzRCJl/DKcOdloe5cZsr@lists.infradead.org
X-Gm-Message-State: AFq9FYJsHx49b0Yfq3eIIOoARfAF7/wXb0qDlXx24ti1mX4nNr47q9vh
	PPrcONmPoUb/jqgiF4kWvSA4dF70iFLGG++lAZCbFd3qvT2PHgWNnAl5mAsrj76MRrsImArpvi0
	JKMA=
X-Gm-Gg: AYBFou1Gwu/tUbEYYqcH1D000n/gCvxEKAtq2mcEKxVYpjRuo8iimrelC8DXF/bDEOm
	7tN9gkoSy+n6qtGD/iuEaUp7hs5W8K+I2sIwQpmRqMTVaqf4fdJe/7QXQYQuP5Cdf2ET9wT4uZ7
	APBDaa64ugMbo3gE/ZTV43XB5B/PttyatALaOfqxG8ia/JTJfsDSqUwh0aUWwVaFX7NOJC0b4Rh
	jRd324IREaOr/MOclB6lEsyZmvgYY/ZEGK+Wl4TeeQwxkeJJYHj1LlWhuaziL8P6nC+B+kPbG9B
	g/GraJbcn8o9PYzKdbhww2+XjLcOe/3eYTVITI8KMOlkzb5ke6h5JBkhVUhrAmb6yHkPJKPSlVh
	FV2wBQ/LKXEgXekuwoxmcxOMjPXzTAorVICu32fggBT/4doGVvAGE/z5VTnli6FT/wEKPM9KWMP
	lhYKnN0sY81lXyNyaiVjSGDXdEV8SRHZe5/qPubIsRm2gQD1AxelT1KNNIqeaFOWkjWFZmWGqoo
	KqWHYH/BMzUubcLU9TaAijbKX1BUp2n+UjI+gt2eAkWVQKtvVAq/bKEsLDVmxp6AB2jXgnEavg7
	Ik1/u9N2TOmYM9ErBo6jmnpxpsui4a5Ib1O+l2Km3pwy79KQJINCVaFmLWJKF6uFhmFe0T3EyM6
	th1xLLY0mLFQf
X-Received: by 2002:a05:7300:cd90:b0:34b:4b99:24ab with SMTP id 5a478bee46e88-36a42454b8emr4378368eec.22.1793356465021;
        Fri, 30 Oct 2026 03:34:25 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:6ef0:e162:ed32:a99f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a61a0csm7471774eec.22.2026.10.30.03.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:34:24 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: mediatek: mt8192-asurada: Add ramp-delay for MT6315 regulators
Date: Fri, 30 Oct 2026 18:34:15 +0800
Message-ID: <20261030103418.2355854-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_033426_752290_5EC62D4C 
X-CRM114-Status: GOOD (  10.60  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Asurada, the MT6315 buck regulators (Vbcpu, Vlcpu, and Vgpu) are
missing the regulator-ramp-delay property. Without the slew rate
specified, voltage increases may not have settled before switching CPU
or GPU to higher operating points, risking undervoltage crashes.

Add regulator-ramp-delay properties matching the slew rates configured
by firmware, with values provided by MediaTek: 8000 uV/us for Vbcpu, and
4500 uV/us for Vlcpu and Vgpu.

Fixes: 3183cb62b033 ("arm64: dts: mediatek: asurada: Add SPMI regulators")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Patch created with LLM. Values were translated from raw register values
by MediaTek.
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index d1993b80f9ce..43286241cd22 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -1812,6 +1812,7 @@ mt6315_6_vbuck1: vbuck1 {
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
 				regulator-enable-ramp-delay = <256>;
+				regulator-ramp-delay = <8000>;
 				regulator-allowed-modes = <0 1 2>;
 				regulator-always-on;
 			};
@@ -1821,6 +1822,7 @@ mt6315_6_vbuck3: vbuck3 {
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
 				regulator-enable-ramp-delay = <256>;
+				regulator-ramp-delay = <4500>;
 				regulator-allowed-modes = <0 1 2>;
 				regulator-always-on;
 			};
@@ -1841,6 +1843,7 @@ mt6315_7_vbuck1: vbuck1 {
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <800000>;
 				regulator-enable-ramp-delay = <256>;
+				regulator-ramp-delay = <4500>;
 				regulator-allowed-modes = <0 1 2>;
 				regulator-coupled-with = <&mt6359_vsram_others_ldo_reg>;
 				regulator-coupled-max-spread = <10000>;
-- 
2.56.0.317.g454f8302e1-goog


