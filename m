Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E01606A614
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 10:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Twc4Wkyy;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eaOMq/qs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jn3WWUSpxlxzquDqb3HP/nQ4UVG0PTGaWTA+bx/jhoY=; b=Twc4Wkyy/1YbBR
	RXUZhqG/DX5Sl9+DIYcwWXdOAR84Nya5/C8z/wiW+0PEbiOeWc5L3M/H3TFQibTk4prENBqHr52l6
	7xN7h6q1oi18UxmAiMLe6VjhwRAlzqMWKJNBMnjLMS6Mg7nkBokBYxPwBGqHoHoTmnr19YU1P3gfB
	ciP2kkEYuBsJ8AdofZfO3yQzqWkUpcSDXRw7RKpp0UIbqcMNwz4wu9UPAw5qV+hPI8WEp6c3VBfcc
	+vxniXIUPg0B6WJSYVjUVZ2E+BrtqIKyZdMQXbJgeI5BBPCjssh9fWDp8zt+qp51qzGYdh6y1HVyX
	5cIf0L3Pt9O4lDZwnO5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjwX-0000000BPbA-3PQQ;
	Fri, 30 Oct 2026 10:34:41 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjwM-0000000BPT5-2wyt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 10:34:32 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-369f33df08eso1184175eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 03:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793356469; x=1793961269; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jn3WWUSpxlxzquDqb3HP/nQ4UVG0PTGaWTA+bx/jhoY=;
        b=eaOMq/qs32qAPr6XDDrGegIY0f12pTJ7koFX1xSDouLUloR/r+E7I+uiGwJAyyIUvb
         9Xpc4reeAjeVzyQbPqzh2Z4AYan/qR2/zveEPAcvoM+PZFHmCBnXcwpCtx7DyOFQpjuC
         ItIJfL01LyI+ykk8kNSHS37cofx9I4FMWNOUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793356469; x=1793961269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jn3WWUSpxlxzquDqb3HP/nQ4UVG0PTGaWTA+bx/jhoY=;
        b=UFBCZE7rPoH20jptwUI8J47CrmZb+ZaQn4j3agatMdMCTrTvve4iuPIxsrTl+Y8OCE
         D6Xaa/POLgT0ONt1xZ4UgKTqBLdgsocrCY0oF/gbjC4cyALeN98/rCsIMOLyCLiGLwFW
         FeTdc1LoltKsxF1uK4qWkvv783VhDcxRdgO1fYiVuFtqtyC338Rdtpaws54MmDXtwkLc
         RlhbKToc8Cx9SaNqgSBhOdsmkaGIbfxOgf1aqv22f1Y1pj+ujn1EwDjOnZwcR9ugm5d2
         WuxXvvf0e2qsz5cMNbYtmJnpHCxY3pHbDea1kkBU1baKGlD67alqf4HygWVDVMA+HDKi
         U2Mw==
X-Forwarded-Encrypted: i=1; AKwUvBxflz6GquZCsWT0UST+afipOOYA8Rql/gnyO6SHdmS/NIgFh6z9Epvys7N2nyQC39Ck7lNqotgAIb9SZ3WHdZMq@lists.infradead.org
X-Gm-Message-State: AFq9FYJZewVKIAyCW0w08nQzR31cQmQmxcjHvYX2hO4PjEDfhdto4FJl
	C7G+l3Uvei6ccJR5N7Fgz0jkXftAvW2tBfd2G03w5ac9Z0xKOjP6JwEhcCJZexCDLA==
X-Gm-Gg: AYBFou3gGUk8RIpbWH7OsyVR6jIRVBgcJ67xdp5xk3W0UdH1+URCZhuI6r0RoJ3QOM4
	rteWEtrq1JlTQYoB5C0DCJOdXwMSUVAj5QjPE4lOxTg5I++oJxNz+4AweobkKYrHXv2ZU0Z0ZLD
	YRlLH3EAOh6zftCo2MLYkioO+HFZ9bSYra5HFxTHtNESq8gap14HbtnvXCBzqlYH04zJ9v7SmdN
	a/nQcECLNhjn3CZ/k5SV9Z8Af3u/mxiushXHwvmX5StcM7KM00MykHEtDrvdFYIivuROI0ED2Tv
	abtfjEAl10bOvwRX66sGIXn8hkvdwVRsOyLHa3DJpcdfC6XnSstTBfW6LZG9nc8sW0Q5Xiak9Zt
	RPwjA0kryy8sqOXIpoljMGQNR5UK7kvPcxM1Eg3IrG65pGStro/w3Cq9NellBxMF/5Sltn3LC/0
	vNOtUfOfAFpVADhpFFeiePqGtx/0Wg2giz+OWdbCwxA/VyppMJ2TRbTgeRuYQdKnz7HBh4x3yyE
	W+B1JWcFBMoqWvsK2fOOVb15gBT+WCj+i/GWf6aT+jzLbxGMDJ2CdOW590I5yRHcKwOl9qFy6hU
	6jGMNnYKq3yEoXAW70dyHrqx1Bc/YfHYwHIWbwvCTHb5fY3377OdoBPjFfxopzJ8JhNfuIPPZfe
	Uvdj/p/fsEiGT
X-Received: by 2002:a05:7301:6194:10b0:369:f937:9a7a with SMTP id 5a478bee46e88-36a42437876mr3100348eec.34.1793356469205;
        Fri, 30 Oct 2026 03:34:29 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:6ef0:e162:ed32:a99f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a61a0csm7471774eec.22.2026.10.30.03.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:34:28 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8186-corsola-voltorb: Add MT6319 ramp-delay
Date: Fri, 30 Oct 2026 18:34:17 +0800
Message-ID: <20261030103418.2355854-3-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
In-Reply-To: <20261030103418.2355854-1-wenst@chromium.org>
References: <20261030103418.2355854-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_033430_744539_6CC220A9 
X-CRM114-Status: GOOD (  11.81  )
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

On Voltorb and Squirtle, the MT6319 buck1 regulator supplying the big
CPU cluster is missing the regulator-ramp-delay property. Without the
slew rate specified, voltage increases may not have settled before
switching the big CPU cluster to higher operating points, risking
undervoltage crashes.

Firmware configures the MT6319 slew rate on these designs to 6250 uV/us,
with the value provided by MediaTek. Add regulator-ramp-delay = <6250>
to mt6319_buck1.

Fixes: 321ad586e607 ("arm64: dts: mediatek: Add MT8186 Voltorb Chromebooks")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Patch created with LLM. Values were translated from raw register values
by MediaTek.
---
 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
index 0250b4eeadd4..2ec343f49da3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
@@ -84,6 +84,7 @@ mt6319_buck1: vbuck1 {
 					regulator-min-microvolt = <600000>;
 					regulator-max-microvolt = <1193750>;
 					regulator-enable-ramp-delay = <256>;
+					regulator-ramp-delay = <6250>;
 					regulator-allowed-modes = <0 1 2>;
 					regulator-always-on;
 			};
-- 
2.56.0.317.g454f8302e1-goog


