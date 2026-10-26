Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B7B606A8D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tfr8jYYH;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UFVscEaR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Tpv5iqYSXjbesKglviGtVx3I0y7aYG/NoQbMyIgswYI=; b=tfr8jYYHZbR6GD
	7ChzXgP6qdwFZOYjWNKznvaOYIJLjzdtMw7Qv9Ue44kTCHKKXFDjd5VNd+O20/4Bl/FSvXz92+eRJ
	sSjH52YwXTZrU09M7ka7jQtr1p0UREaP+rfIQ8AL+jYIlu8BZJJapz6+r3hjgEyn+ETwSXXtrfy5O
	I3x5hIDpJbH/h/1+qPfqDDb2sKUl4n5+qziWf6qg5h+5CVmqj8nt86PZ2E7baCfIvRnVvwTPUR7sA
	eDcNFwNhi4Ea67+OnDIeoUo8WNEKO2Nzm1S2oh0qLQW93hRhHkJ7JbFZtt1omhVtGLNuvU9Fyo0fB
	N+sRi/yRpVvGVmGYeJVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSi-000000029Y6-1DdT;
	Mon, 26 Oct 2026 09:57:52 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSZ-000000029M0-0TMP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:57:44 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so22895675e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 02:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008661; x=1793613461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Tpv5iqYSXjbesKglviGtVx3I0y7aYG/NoQbMyIgswYI=;
        b=UFVscEaRTKYRwfOiY48jT1/P5SO+0SkTQfi2OrBuVjGflDTcZt20S14J1yqQmZXEzj
         LsyyDkrHOtDFgmi/NK021QhOYMtvRBH0aCGw9dp3dJc/xfNHCtuCV8q46qU2WuUDgOJX
         5DZ0uPsGdlA5QgU1N2pYK/N2MrbcrSMsn0mjfVG/tkcjFjFKWs6TT1kKlPu1KsD+N+EG
         JMG+z4PmMGnJGMuraPCnyl9BWP4T5wb4rn9KfYGaQct7XDxiNhg97kxI88Q6Y2hJHR8n
         WI0fuyKHA8wUK/XaVXWQ3YXsVr49umSi4RrTxztSG1XSDjKfKGv7fSBdCT5+qhbcx2yZ
         T4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008661; x=1793613461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Tpv5iqYSXjbesKglviGtVx3I0y7aYG/NoQbMyIgswYI=;
        b=LBAr17H07FMPUWXWpKXWMrY7jJ2V/UcXZtEZ2Xnu8VpyN2co3sTlqx+E0kdcdTqQXM
         A+GmsBMYZBROw+SBqK40cARPHqND+yZ97Ku3YR2XTy4wMWUr/6LEyQ38iMPZFEvpzbU0
         ZFud0ajrjb/o8MRlPXQIMTeBj4cUEbDmriaswF1m65O6nhkw93qesUr7LaPQ4aXS5be+
         0S8Xqp+Vtsr0my0g5ISAlN15FQ6QlDM45aV4Z0TXCcWYtNy2HwDIV/tuTKogD2WhZS5j
         8OUVhhjSDt02e2DHN7T/IjBp75uVsVFDcHLX805T83UWKLkcY8nZmIwgVAkGrCG6EH0F
         YfBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwciZIq2//YmaTxbgFlt7tmDCkuomDifgTy1cJljFe3wnkYRkNft2kzoIJBAqCLF4+tD25vCLHtwrcjVQHZKyz3@lists.infradead.org
X-Gm-Message-State: AFq9FYLOK3YQaHQDMRoqvKrMnPT+wxDNFk+rfY6FhV/8KuFA8ssS5UUf
	hBvKe6WF8K6KDniteNLShjYR7nIEpjgG6IFspjZOVv4bNN3rjE3Tmu4X
X-Gm-Gg: AYBFou2ZpCVVJaLHd9vvxMWMhD1LgeyeIJVunJBcWuYWwAvmdogDDt80fVg7Xw4rlEl
	ia7skGRESIq5VIbw2ir3WGIGd7h3HPS1ncuHVlpah2mKUo+3GF1/34tV22jThpflCcqUteN1CRs
	JVs7DLZn7w6H0GsuIdEQxWXACgrgqrR+e5HNnKQ/a6RE3iDAjTT9+HwK691pGsp6VbWyOcXiLvt
	HJx+xLxJO4ESk1OmpwohDfkr+ELyOrnMTzgfFR2e5kB4n7X03AGye/r3i1BYRf4U7Zsezfi9Jun
	OZhSR2nce43zcIqTZw4eGM4GwL4xJvqg4irMgNxItkJk8dm1GRSJCFPR+Ig+piANClG5rftyUEF
	0H4x5rrYk2CdyPWBdaNthuB8tFDVYRqdH9D3yYRXGDuSWT3I3l14LD2lTGUtT71CuXLbYkXpYEB
	4CUTu0mWcHiKB5W6XsK9Ajsw2aTAgW3H78qdRUCi+qNdKV8XwO84RdEFW4xQx/ZctlHTA7zDIpT
	4oHZo7B1GSJivOOwACPjSojQU4ANBATp0WRyHu/iymNTb3zG+il31/Osx5Uwam7jgbPQ4HrV39+
	jyYtxPKDMSUr53+buJA8ZUwMv6hPgE/5Jkino4m+vOq19m4btC4FUghNgSwO6FBylboTxjEQUrl
	xO9I7fqs=
X-Received: by 2002:a05:600c:4e87:b0:4a1:a2c0:7b73 with SMTP id 5b1f17b1804b1-4a35acaa6c3mr112485855e9.30.1793008661422;
        Mon, 26 Oct 2026 02:57:41 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:40 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] arm64: dts: airoha: en7581: add watchdog node
Date: Mon, 26 Oct 2026 10:57:11 +0100
Message-ID: <20261026095727.31708-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_025743_211923_FBC4C1DB 
X-CRM114-Status: GOOD (  11.63  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add watchdog node to catch stall and correctly reboot the system.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index 58bd8b318910..3a4a4fb0eba9 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -484,6 +484,14 @@ uart1: serial@1fbf0000 {
 			clock-frequency = <1843200>;
 		};
 
+		watchdog@1fbf0100 {
+			compatible = "airoha,en7581-wdt";
+			reg = <0x0 0x1fbf0100 0x0 0x38>;
+
+			clocks = <&scuclk EN7523_CLK_BUS>;
+			clock-names = "bus";
+		};
+
 		system-controller@1fbf0200 {
 			compatible = "airoha,en7581-gpio-sysctl", "syscon",
 				     "simple-mfd";
-- 
2.55.0


