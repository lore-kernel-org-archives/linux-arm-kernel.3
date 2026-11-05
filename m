Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9DB606D83E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 21:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OhASVPab;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DOBBefG2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RhSdthgY4lzWyxqScK60PBXNBhT02yTKoURJd/H/bvo=; b=OhASVPabwUmTMx
	dr8d8F8eGux+NOtDrGCGg/7L52Q5ySR+reEybppNSiMxkfIbMRBjXqp5P0+VNSGZzx1LcRkqrJaQk
	TtEt5DLb0TOV9eojEIpWzyeQtyjnExwGRRuWYTtxyKQQEnAzDBaXUPH9BByayrvP194qWK9euYf/F
	tLYpDDrCGm5XusSunn68Rzo7r1qXKdwjEncae86JE14yPUg0sP5Wt7sWTQlMO/gZtapBcfuIfo+FQ
	0tImB0z/J3UpQtIHke7mw1y55s3Ox58iof19tFGi1slNwL2B4VdIfGYfUTa32sxFTm3hZruzJqf7l
	TblgXd9zgcyFXEluj/Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4gX-0000000AgLE-17eR;
	Thu, 05 Nov 2026 21:07:49 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4gR-0000000AgDe-0DB5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 21:07:45 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso183925a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 13:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912861; x=1794517661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RhSdthgY4lzWyxqScK60PBXNBhT02yTKoURJd/H/bvo=;
        b=DOBBefG2LMqbUoIMDtHtG4B65QeF/b6nvgULevZ1OodAlQ5PEJhqSmLUEATs9FbYjY
         4Sz3WtpYSKM2ftW3asCZj+JY9O3+JLhx99XYEShJjALwIQT47plZ8gK+auztOJmmgpYM
         w4WdB/MP5Wbz8tBeA3tXX2pEZJD+S2J0niLBQa2jVdVDT/JGzZS7QZCuf+4MfOY9TUNo
         yHq8tVqFufBK/De5aOsArUtKaA6EjFYXAOk3/P/1w4XVJcAbfmc5bkaal8U0Ae3M880p
         lNrP8mHsoLUcQN1nNeKeLJiRkiohgsX56iWZw/wCk2+o9mWVlgQ3MYTd1zQYr7atPRfU
         UQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912861; x=1794517661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RhSdthgY4lzWyxqScK60PBXNBhT02yTKoURJd/H/bvo=;
        b=vjRaDo4pG2I2WiBATTuX755dEoYuzXaZUr535OtsjWcMMA94ei96yWGOmjsGIXAI+q
         Em7yG0e/x7mpBiRWd3nFZ+boYJmW92eznK4cW263MyhoEWOz+h9uTq3pa4LzazSaBofg
         gJzTjGsL0xdxi68iaLEheqwmzG4TH3cVTFUnj6XL+c33wOro3QCPp8JZ0sjjHYulEZ0r
         hYQmUjIdRzepyDnGLYcXNq8zqWppBZaAZVoq3K+WD9bXqFQuof9xK78n3YeSb2ZH157i
         JrRnNfG4ClpLDVmiwSCRVcp9+pzsclxRn8/pQTnrqbDZh4gchTcLSjCQmsXz+sDxdrs2
         TrnA==
X-Gm-Message-State: APuU4Z826NPU43YLiZUwkHf/MoGNGICoVRL1uOn314mAatru13rFUJ8a
	3Z4pArs0ryjp20WnxahHrbIAFxVosLROjYCpmUky3aBZoPSIct4vBJva
X-Gm-Gg: AYBFou3N/zfCC99Hgiptfu4Ipcmm/pHP7UE8U//FWJ/BM/cTRTIGaNNbJxZQmkYYWPr
	W7JwpknmctlFcaRf9MwUBzqrD9HbXufd313tNw08b1kYr2VnVLkea/lLD2KH+zsEEJbRJNszv+I
	WOfkezYLsmx2GGHrtK169MI3OhOw6b63Kd23FkOmaB1KBHl8uieOVxJkYmjNgN2gc7pBKmaMy96
	cyC/p+OXEM6b0fSGYKM3Q19Tt40T/ZhDiI/8O5tSzxRE2ILNMS9wHXcr/EcPQSOkDzIA0WnzQuZ
	I8KmSYTFqI/iyuFriCPv4u0tkoCwhjQZmlu0TZ89fKxu7X661wUZeOH23jEDv5IYsWfT17p3QN1
	EYVojHflThCDyPURokeNW6O+khslppZwQhDJ4n1ZfH1Q54xZWghbaZaO7+PSl1ilBvoHWjeIGpN
	sz6n6TGtcNGWI54ouQWff/vKNxeXjEE54CWtvyvGHNbxqiI+j69RPXuBMJ7/G6tazCbQwtUpB7F
	ta7T/zEhrNATiNuUf6Pagz+OiW85x716i6t7hvn7+5oaqD4QzdaHWVmyrF/kNKKmxetYBD3nEiH
	IOQBO6HRbd0a8LteCAdv0eCcJpjzJonwQysP0MKQ2lBB6w9gUA==
X-Received: by 2002:a05:6402:1d55:b0:6b3:d0a0:3a2d with SMTP id 4fb4d7f45d1cf-6b5975296a1mr338144a12.1.1793912860655;
        Thu, 05 Nov 2026 13:07:40 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac6d032sm1966949a12.25.2026.11.05.13.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:07:40 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Letuchiy <asalde.le1@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT6895
Date: Fri,  6 Nov 2026 00:06:01 +0300
Message-ID: <20261105210622.523747-4-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105210622.523747-1-asalde.le1@gmail.com>
References: <20261105210622.523747-1-asalde.le1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_130743_212904_7BD4A343 
X-CRM114-Status: GOOD (  10.16  )
X-Spam-Score: -1.9 (-)
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

Add a compatible string for the watchdog of the MediaTek MT6895
(Dimensity 8100) SoC, which uses mediatek,mt6589-wdt as its fallback.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index f9b725592c27..cac7d9ae98dd 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -38,6 +38,7 @@ properties:
               - mediatek,mt6572-wdt
               - mediatek,mt6582-wdt
               - mediatek,mt6797-wdt
+              - mediatek,mt6895-wdt
               - mediatek,mt7622-wdt
               - mediatek,mt7623-wdt
               - mediatek,mt7629-wdt
-- 
2.56.0


