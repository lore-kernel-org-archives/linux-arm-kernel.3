Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31A6606AA41
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 16:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=USr+thPs;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XoCPCSAz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pA88NLv/TBiOG5702LaEvC3C13NKIBA4nDe3RPxHldU=; b=USr+thPsI37jJe
	hAZ0Fr/xvKvDpgC0aTpXSOYsLvvF7OF9bkxuWUkV5qgZkcKuYr3cpx0Je+9pMWQU2cLKodHAh9Baj
	Gqk2Twmm4v6Thafcw+Qiy/ei/s8L79nF+y7OhiqsTxiRXc9qfN+q9CvIvo0kvb7Fui8loQgUPkWtL
	KcjiUNz4aVkzeR/AZ+4QgoWM84ZVYgW8sknT+ETiV3di880quqDT2GUgi7+sly0HaJUIUClbnmc70
	oCPPnW9GsiGSvJkzGCeQtQ9vXNFCZ0PvDvz+8ANI5Ban1THYWkDjSjJiKvTEKZr7+gZVvCd+SvDFW
	1AndchYeA9hebCpDzcfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6Aj-00000007UVM-0rHS;
	Wed, 28 Oct 2026 16:06:41 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6Aa-00000007UOP-0LFn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 16:06:33 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so9124415e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203590; x=1793808390; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pA88NLv/TBiOG5702LaEvC3C13NKIBA4nDe3RPxHldU=;
        b=XoCPCSAz+8og6pxR1GKxjwn1h8LxeKOlCTki6LNqsnz8sRr2bGNYGLgrIVdfbSLcqX
         ca7zcf4UeHlx4U4x4rcnUrNqnq2Waz6nyS+rQ0EWWBh900HatTJfYThXPuh7A34p2uaY
         y2UKBuNrgvijMoe195uZZqUqgHbjeYI1FqKPyDaq/mTBp/67hXyN4KV+ySlRYnzJi8oW
         XCfCyYBdFgB95E/FlN/MbYk9xjMnlRC6Q7XC3D9n6vPrP/2WRNlq2pN3v89liwuiqcMc
         O0pQJS3lJ783e5/mjYWlcM0nmDtKAJtRBhTxQ39j8/raMXHgr5JaSgQP+tqD6a90ZHfp
         fNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203590; x=1793808390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pA88NLv/TBiOG5702LaEvC3C13NKIBA4nDe3RPxHldU=;
        b=zJY2CZV7Be94jgVvglQKnyp+N2qUoQqnwnWUnrYIRqfoKVGiA+IQLlO98YIWf6Xecb
         d0SV6uxwaCfvXb8jSINHJwKxu0qNLLtkWG5SnsOgRQQMKXQn4mvwa2s2eaatcihJj5Sb
         Joyn1uZEi+VTcuhRSywwu88rZsh2PacYoYtUWsSjGHgrUqc3kdwmB5tITlBZpf+JAvE+
         G6DwggMMYVmjQpFpKqj32XjgPYO7UmPCMC96iEwSwhM30gM4lrG21h2zt2N5dyhGV/Tp
         LZBKmzfQcVjjZ+NupjhyNXRwpGcJkrNM7UFEWFoyVb4RhWz1p9LwvjA5aAXnaWgc1ja0
         Li1Q==
X-Forwarded-Encrypted: i=1; AKwUvBz5L8nydb6frp73Npp7KIqv1Rl9dLr1O2U/jEQa2LmyZ0NsK9XxrxYR4BoMLhwObFWyns2ca2Zxr/DVeoQdQMJs@lists.infradead.org
X-Gm-Message-State: AFq9FYKw4/qWHAlypzWBoQs9q5VG22QmIE1o/TnLLLfsp8m7had3F64N
	AA6n9wufsNkPfLn1v3QdvPhiF7PguV2EOr25PihAX86w6cV2xamvv2nmbBqGtt1J2Sk=
X-Gm-Gg: AYBFou3aQ0mw7WkmiZ6lcgOcjAr3u/1QoFVvub1wCsQPeWABukBHoLxvUlFErrf1sx4
	1hiB0dq+rG10zRRHnh6BRbp9pfCG1FOSF/woR12kG0mzqVBF4aESLJ1nRU/67uuZEKR1OBVw7AU
	hOv8Z3Y9uJaOr06BadkeUdvrxtU+2MqtbMmn4M1rWM76VOU93iiN30ceVRWF+qLiyH52fHdWQzN
	mKd2JHIX1gEt1iuDcBEVtEYuRpG8mu9kQtX7NmCulxZ9sEwvqSiAkJlTShg5r5FqwmhjsACs1nH
	6Hwpxvylu2nfHe2wqYwNaJcVRy9ZaD29U/BNdSvbuf/T9qiN4PwVMMVOaWTzJHt6skYFwqOCqjg
	PLeiMs3QEfVQetprkzJG/lPqjfeMXMavqaMflaab1P050PIQrBtp88Xz8iaIE4asZv6KbxT4d5L
	ONbqori15ML7fxEqlvhKINmUF/9a7xDoVbpZFUSdDhuOA3OJbTv4fKaL17EQOdj0Zw8SQiXcnT5
	t14LulzNkjnhE6JbqgFAxCRdoXktigEu8dOUgJ5HnWAYgytgG8Ly895ct/uSGtBHmkle7hrB2Jy
	s2t6VX4ZWQHdilZNyjhAKnfrJc8+VW1x82bYB/XDU0rUAW7ZFkae8Dymqov5GGO0FiT1sXoY8ig
	vJeM0wwB3LPx7udxfNOvP6ograg==
X-Received: by 2002:a05:600d:8496:20b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4a96677324cmr41899385e9.16.1793203589613;
        Wed, 28 Oct 2026 09:06:29 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:29 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 17:06:06 +0100
Subject: [PATCH v2 5/9] ARM: dts: omap: dm816x: Correct speed for sysclk5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-5-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=905;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=PhDr6kpoBVqdoNYvmZIO1sO7TmGrj5fxqBZLDfq+g74=;
 b=Ve5ogxnAtZbereXXv0mgHSa0OWS6nuHnMRIs7juPg0Xxqcdyy48+rKoPrzs7fTTee5kOME2TL
 uMCbLUMJEGsDSU0zMp4yL/ovJSLbJeyb30romwpOuisL69qnsLoYj5d
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_090632_198787_1413447F 
X-CRM114-Status: GOOD (  14.06  )
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

From: Andrew Goodbody <andrew.goodbody@linaro.org>

The default code for setting up the clocks results in sysclk5 running at
1.6GHz whereas it is expected to run at half that ie 813MHz. Force the
divider to be /2 to achieve the 813MHz speed.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi b/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
index 76ebc6c3c3e5..cb990773b098 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
@@ -144,7 +144,7 @@ sysclk5_ck: sysclk5_ck@310 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
 		clocks = <&sysclk4_ck>;
-		ti,max-div = <1>;
+		ti,dividers = <2>;
 		reg = <0x0310>;
 	};
 

-- 
2.56.0


