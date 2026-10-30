Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB09606ED98
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 10:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tzx3BhCD;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fn/ij/Ne
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1aNoVlnvFcsOYz3yDk1hH8WlV460c2AuvXHcDZPvdOA=; b=Tzx3BhCDjXq5nh
	zdKwmSRTtBQm0ts/AnHZ3+ZhfuCQucYM0ZccG6XSelpvYZGX7XsPSo+1+2aenC32a2w4OWrOUlhiI
	eZvuF9lgSkbEsGGeB+RqL0VDyB3HnoPfGiq05GZaStQMbQsQzMCJq2+BBuWpBESu0SoitP9jNn6Fh
	gWBk+LIjj6PALC5veoLtyxfVRw4w4Gu3mRpLLNoLLb6+J9ekItDGzvtDiXs5FtetPdyhXU2lvY9EX
	LJKpTp/z3ljECErHO2Xe7+izm9SIWJuCacSVBUhBup0duEtNg5YvaH6UbzP1wpAKaXRvDWJR4gFBi
	X12+EHusHpm9TCDGU07Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjwR-0000000BPWg-2Nle;
	Fri, 30 Oct 2026 10:34:35 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjwK-0000000BPRy-2ncJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 10:34:30 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-35c76e9614aso887550eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 03:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793356467; x=1793961267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1aNoVlnvFcsOYz3yDk1hH8WlV460c2AuvXHcDZPvdOA=;
        b=fn/ij/Ne0MrdGqfOgmLTFDhUh3m/Z87UMhanvM7TVfiVn/ER6Pv/Dv0Qp1pZzKxceb
         ATO8VlZwAli1SQMMovnRHhpwae/JyprcT7OdIB84RKZkfO6rgEvQScPHRDdgNBNrtUTW
         GCWse9VA7aEizV7H//BU3AvP2Cb5Y+ZmyjBFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793356467; x=1793961267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1aNoVlnvFcsOYz3yDk1hH8WlV460c2AuvXHcDZPvdOA=;
        b=vCxrVDOOJo6byQlu9d08bPYRId+wxC3JwBsYevFNOAeZUzYeUS1F5s4I2ZTMQvDT8t
         oo9Yg0npOryWA1PuTuW+ZGQ6gbCA4tFUxCx5F26up/2GAklYJ7KlFh0Flr6WIAxELdVv
         31/5B3sA5+bCE1UyNYCJD1sDmUIxop/KNC86ZhHOFdp0sCXfDDPkUxIahkqbhTLizTC6
         ac+oMnOnuv63Lc8vyEOV+wYRYUk45Wg2cy2KxcN+Ue1nk9gQZ9CbRD74oYvHlgavRgWA
         etouU55t3uxacroib6LtB47NW11HxezpEP45Tav9Sln81jodVulksdYnEP4xIdG5aKN5
         xjIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxISP1CNCJmImeiwojGjk8/XlaWUvCisW/6hvN8BK5JXkQTaAl3l8LWeDVsb856VUX/9v4bsDBn/PY/8+OpDvvz@lists.infradead.org
X-Gm-Message-State: AFq9FYKtb89Dr+yQC80rYBak2aKpeP4oPeuzmVC5QP5WDVEH0FboBw7/
	mXDhfsfeOPlWwz0Yma+llVEtTjL2mQhxIbx4BRwM2i6SKRWEZOwX3tIhoUUllTkYFw==
X-Gm-Gg: AYBFou31Ib1MW/reRIrlewlykcp7CNfdWBHveMTWJg29V68AZ9iXNS5vAmbRzvOpStt
	YGlbMTmkbSJANv1YBw1vAF2Ew5JCUwwf9txJfg54qPZp/bhcvZX/ZjgLftmUSTuRRU1vzR9VDye
	s7DuKL48HaMKB+XX8izQuCy71lmi0Adr6Wf/7sarvH5b79RLJ3G7wUTHgS3lgeRyZzKuVjh2lS2
	TxgkXZLCZz8ZofsA7n8kRo5RRqINgP/2w4pZdECxzZY38vtcekmqSmTpUvCQ+zFtRWVZKyaGNoW
	d1o7spOTaXYiTV9QrPhG19IQfH8WFu1mC9ZBeQPCSIliJ1zMO5BV8j+rkjItOxwDcG4UEzVArfe
	WzE1utkeC/WMZJTcLuobSmbUvdX6LYUbe6H76L3Q+PlQ/8h82wuh3k6Pm0ZEfYTdID1Ny72Nqoj
	VT7oilB8XRcu3QxkU87MZFAfSKZ2Su3HrJQmUV3nFslFSi684TsxLZLDRh1G2hUh76x08rGIqtl
	IlddyzmKUkduvY2RSDToNx6jjSTc/im+r2u1JGkrsed8ayPAyxJFEmqBcWZzd2Ly2ZG1LWkhFtj
	nSEiJHLA+Gi3QlXGM1kTiZI1crajZpOrLp33fD7ZtAoZclP9Y4+3zX6mJ7rnn3DhoSUHT01DIwr
	mdkyugaBMDh7vKbzOOVek4eFW1k7GLGaljw==
X-Received: by 2002:a05:7300:559e:b0:36a:1846:5c77 with SMTP id 5a478bee46e88-36a42204585mr3068442eec.3.1793356467068;
        Fri, 30 Oct 2026 03:34:27 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:6ef0:e162:ed32:a99f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a61a0csm7471774eec.22.2026.10.30.03.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:34:26 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8195-cherry: Fix ramp-delay for Vgpu
Date: Fri, 30 Oct 2026 18:34:16 +0800
Message-ID: <20261030103418.2355854-2-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
In-Reply-To: <20261030103418.2355854-1-wenst@chromium.org>
References: <20261030103418.2355854-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_033428_705995_71F3950E 
X-CRM114-Status: GOOD (  14.83  )
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

On Cherry, the MT6315 PMIC at USID 0x7 powering Vgpu has its slew rate
configured by firmware to 4500 uV/us, rather than the 6250 uV/us
currently specified in the device tree.

Since regulator-ramp-delay is specified in uV/us, specifying a higher
slew rate than what the PMIC actually uses results in an underestimated
voltage ramp time, risking GPU undervoltage when switching to higher
operating points.

Update regulator-ramp-delay on mt6315_7_vbuck1 to 4500 to match the
configured slew rate provided by MediaTek. (Vbcpu on USID 0x6 is
configured to 6250 uV/us and needs no change.)

Fixes: 260c04d425eb ("arm64: dts: mediatek: cherry: Enable MT6315 regulators on SPMI bus")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Patch created with LLM. Values were translated from raw register values
by MediaTek.
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index f23a0c7aa87e..81628d8a4b0e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1596,7 +1596,7 @@ mt6315_7_vbuck1: vbuck1 {
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
 				regulator-enable-ramp-delay = <256>;
-				regulator-ramp-delay = <6250>;
+				regulator-ramp-delay = <4500>;
 				regulator-allowed-modes = <0 1 2>;
 			};
 		};
-- 
2.56.0.317.g454f8302e1-goog


