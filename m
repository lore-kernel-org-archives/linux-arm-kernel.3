Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E574C6076FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 16:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YOGTsKYz;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wOre1/GN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KTg+Lt8n8cyfd+bzP669ss9gAVOsDYk15W0k0texwBs=; b=YOGTsKYzgsFsE6
	hbeXCJ721hBV52ypVJZR8dO6GQtY6LnyIra0PzDWzPraFj0zChDorNcU26pg+hhzyuSSGYzJvKBjk
	66RWBjyY3YcIOKZpRV3DSL2iS8j3ua90CC69m/958ocR3X8K2jrdzRDSzzVSlFRJRFjDDVr73vF32
	TIbvOGQVkZ19jS+LFagVqGpNRGr7T1/Bolx/h91mCON3x5lqa2fhdM5gUgSaGWzZvaoOfFtodeR8x
	O4S3TE4Pdx6rKrAixhOCGEAAoMaQdM3CiqzqiaMKeLiG8ozHZWx87yMtjxh1cMJvGV5a/nqfd8pgk
	ATjP24x16F/AuZWaAzmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvEv-0000000HKs1-3Oxy;
	Mon, 02 Nov 2026 16:50:33 +0000
Received: from mail-oo2-x02.google.com ([2607:f8b0:4864:31::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvEs-0000000HKod-0dLa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 16:50:31 +0000
Received: by mail-oo2-x02.google.com with SMTP id 46e09a7af769-84abe8ecec8so1367021a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 08:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638229; x=1794243029; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTg+Lt8n8cyfd+bzP669ss9gAVOsDYk15W0k0texwBs=;
        b=wOre1/GNIwYmY/zboCvDmLiVZ+Fw8shKL0J9QfK8cWCP0zZ2gLy6+1Syiz4TZcdPIr
         ze8DkHEiGaHW0laLQPReW4IUjFyPBhgGBT2GGlDW818u/KbF3aBC1R2VHAvfWVwWTzO4
         6k38Z04NEQy+5E+z+xKMTSveo2d1L6ZiqEliRF424S979IVgwY71Mmy14RrtRqOMyNHx
         4pjuO3fa0xhQjchdDyu62aL5jqifLarMJzOC/l++hjFY0r7jcIO6OGJ4eYFcogxhrggp
         7MnXaTPgvwOX2EFYVsy5flHC/SdAjBxP3uC4A/TooNoQGazgrDkhtxSjZvuKpaJAv5hg
         rHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638229; x=1794243029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KTg+Lt8n8cyfd+bzP669ss9gAVOsDYk15W0k0texwBs=;
        b=N5AAKGBaWATp3i3LUx7z4F/tyTJOzMDVEdn+UB3bDehkDfE/GfUj0txFdhRYN6zfZg
         991WWI/vSlqEWUPDXkqGg9ulOFZR/aTIMN5H+EhhN5MqURupgHPrTt724yl+v+IC46wq
         pK3/WILjUYBJOXLE43A6UxhiAIBNgCxTIU0mgQ6M+5bZMaw8EEJSVGNWwubcaUng57gL
         5b94VUivxNtOgmmrtWO08SdCJcif40N7d0H+bOEOtlpAKZGbGJEMeAO0uZNprJGTZaeN
         6y8Hz4KS9qYxXCbs407M3gEiGv1WkhyqxJeNnCQT3eomgyqnCsNGjxZjO/g/ekWAvnzy
         j7nA==
X-Forwarded-Encrypted: i=1; AKwUvByUZm/2a/NoRhkqZ8MmCURZxsdI0s9fojFqT0gx/pIrNu1xfUAWCR3EPTJVafp15/eWEVwV5g4+nlRWefdvivtR@lists.infradead.org
X-Gm-Message-State: AFq9FYIX5a/s49nlBPS4YvKRSVygjyhhEWRuAnJEN7perXeoGe/1sUPa
	/u+FiAjKM2IqHyPwIbOlmOyEaK1IX+4JlzZrHt8g9u/99INtgLSLVE8D
X-Gm-Gg: AYBFou2jZuNJVUB44m2XC6EktHBkAd58O4RbFvW0hUi9w82AGlyN0Pq9sypMbpF7+OO
	mfwRLGw4s/+aUIvL9xyKR53MtJLgSdz4lnEs4qkmiSa5tlcO2rDcYvaj1xZ4AkEvKAEuN+ss7OO
	jm7drTvG5xnFDS8lKpO3JTgv1qsapC7zvkmjk3LRSMFcoXzRsf3AVks/wh4tb9aINQqh4v5FqCS
	VKNvdWuwg2a7rda4Z2Kxc1M++us7tLklma3njhdhuQYingluDCJxJblja3VwP/cq9ssB+6t/Jsa
	sv2NYK9U5XJzDiQ99aoCV92yIhXaoHoD2O7E0H2iDab/C9u3ejwj7s7kAiltZqQzvMtyQtOF3SH
	3Qp0Ml2G07JM5a3LnqE2oQX39a9qu5PZdRhbX3oIai3VfzVDeIwQEvoxRUJEDLhnmXWHBt0xvZO
	fust7KcHQrh2Pcym8JLwTCLuux8oSfcScO8YgEiksYjz/p4qwzL59xxG3PVZV1RKPRLcqh+mtu0
	jmARCu3wFc2s1GfvT7c5pM3XVL9inf47y/q1SsCEwxPSgHEssd9jMK9NpcjltNNp7wSVenUdg4i
	R8UvLi9T1uT2pvRiNfv+OGoGbOoFf7BanAbPlARSgEOJId+EUpnuPiLt+NPNX+ILh3ucmW5g/mj
	0TrLrajKYOEUzDm5JpGs=
X-Received: by 2002:a05:6830:4487:b0:843:b6f8:de3f with SMTP id 46e09a7af769-85d365529d5mr7247305a34.18.1793638229426;
        Mon, 02 Nov 2026 08:50:29 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354985cdsm9936779a34.10.2026.11.02.08.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:50:28 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 02 Nov 2026 10:50:21 -0600
Subject: [PATCH v2 1/2] dt-bindings: mfd: mediatek: mt6397: describe the
 RTC's 32 kHz output
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-1-19ca72815374@gmail.com>
References: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com>
In-Reply-To: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793638226; l=1237;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=3CyHV7hxEQyK84ACcArH+5qoJrY2fIpfuKy4fIAGdtU=;
 b=0Wf1b+8NmB4OEOpczcJRUHMeGyBxsbhLHqpUCilWHGZgwVqtkqscNpMc02ashPTcWUbtr4lgH
 WpE9hQMgNpfD6tqblyH80VYcqOYLALDE/Fh5XCg6akXUTVKecaowEVt
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_085030_203171_72C4142E 
X-CRM114-Status: GOOD (  10.85  )
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

The MT6397 RTC drives its 32 kHz clock out of the PMIC, where boards
use it as the sleep clock of a Wi-Fi/Bluetooth combo chip. The output
is off unless something turns it on.

Let the RTC node provide it as a clock.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 055625362951..3bfe1ad60d2d 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -84,6 +84,11 @@ properties:
 
       start-year: true
 
+      "#clock-cells":
+        description:
+          The 32 kHz clock the RTC drives out to other chips.
+        const: 0
+
       nvmem-layout:
         $ref: /schemas/nvmem/layouts/nvmem-layout.yaml
         description:
@@ -694,5 +699,6 @@ examples:
 
         rtc {
             compatible = "mediatek,mt6397-rtc";
+            #clock-cells = <0>;
         };
     };

-- 
2.55.0


