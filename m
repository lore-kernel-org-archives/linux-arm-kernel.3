Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D76606E42F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 19:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DeMkud0j;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RXCKX55f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fdpjdk832N9BwoCOr6cdI+ScZVBChe7jU8b/pMSH0Po=; b=DeMkud0j+B0lsb
	Xb3nrG0vg6SnVZFVtBXoxNx3U9X9Z/iiDAyGkSzVok6U0Z9z69P9dHnNI2VqtmNbPYtDFHKP1GKoo
	rb0o4nCh5uP8BAWgNn5qrep3e56d+NNsYRS5EyNJGCnjDh0FRoVLOESY2mJBqC5Jc8RwgHlNwpgV1
	RjdIoAA5v+EYPsRJNVuBmCaZPLWDYsbi+mg/uE7O2AJQ1r3nV8E7455kfQvvVyI4R45wdLGlGc8yp
	9zTtHrBwqEcmUPj4WjG/Www3R39ArezQaQCTyTlpjf3HTmwbnZ4Dz40ASuzk5CizupF7DqxC+7OQx
	KACxTi7NEdFbH2jTgoTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3Ob-0000000AOwW-0FYn;
	Thu, 05 Nov 2026 19:45:13 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3OW-0000000AOtu-1yxx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 19:45:12 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so14591305e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 11:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793907906; x=1794512706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fdpjdk832N9BwoCOr6cdI+ScZVBChe7jU8b/pMSH0Po=;
        b=RXCKX55fxR89mxjUUjtlwVimIaqLsfPc9/TZ2L+79c0sVhbHIm8js0Q57cUGN3lyLm
         /8L3ia8Ym8yEN6bj0ku4ELLjzTXjc9IXA2gAPnC3stMbzECG14scoUdWxdSrokC0r9jO
         jI/5xj1HF9nZ/RaNz7ZvaJ/xJebEJE0z8OxJq42PfbalteWj2B0gWtRasOVrFFNDuHNb
         1LuZF9X1RexJkHI8K8h6Ta4urU+4vVA8zfcOad9zbmzYh7ial63zEVZ7VrimuO5GWcy5
         QLPuB3HLSKA7oFBYQ/X3LwDmz0zGmxhX4I7wiM/TJa2YaNlayW4UKXmxnuuSDrSUBJHk
         87TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907906; x=1794512706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fdpjdk832N9BwoCOr6cdI+ScZVBChe7jU8b/pMSH0Po=;
        b=KYZPA2EK13LP6mTMddNS5YbR0cTM741ktkk0T1WlyBo5rwBCoA0ufIrUMKagcNAxbq
         1hUD6g78Y8xrDwmwaLpKNeVPHWHEtpx/dqH4ANcLt9VEUILtBjNC+srrU1uHAtpnvPfE
         HrIqln0StbEHv1vcReDnb6LK1jC293GKJTWJ0ZOthTMKfM0VT1PcgaUmtt9BhKP1uBN7
         LvL4VzwNoOBggN1QyepqH06R1pj7vkpjbYvmxPWbZACkFcrO5bEhmcLTnfo8FA/FvBBW
         iSF/TdsSd1yDK/hOT1hBzsK2RabUhuaFR0j2eeEzNeHcr2Cnb5iwx25WTwAXHW6qI1KE
         /2sg==
X-Forwarded-Encrypted: i=1; AKwUvBx41VDlPvnJy4PwwS4KoEttG31P2A4n7buMutxs9tFTbyRoHu4JRMdHjLVtorrlkgUq94yj9Wqm+d9O1EHXLaC3@lists.infradead.org
X-Gm-Message-State: APuU4Z+O9EqbEf7aaaJFekeJehk6qMEOafYii18S3UHrlZDFFxyLuVoY
	vAosNqMvkWSAVGu5Ro4nbPsv8ITeyrBN4SsIIwKzd1G5o5uyipP8oKvC
X-Gm-Gg: AYBFou3A41w+xe70h/tbWLqSmXo8smWUdsLGEvQmxXlwH4lvkuywCL12l2ixVay/Ap6
	Yc/csDnhZYPo7hl/ZArxzUgMTYYguZXkRqsme1NVRetUwrk6uMisndDFKrK/efYV5VdkvSItrk5
	gwUb3tQt89+R1TxYI14SlWetmX+jEsi2zf/BNgn6KLjhfS55lua9T5RH/scQZu9e1HNVLpMdjYc
	3+JgnDt88YaXSrhKaVaHSQmlxugv0rCRf7zAXJB/7prTNKc85P7UhvfjhWVl2Cw+QxAOPOgNA8B
	9K5/EfQG4/tJBUlfZLVkSVYdHhnhhxeV4toj5CKUY0FS+w0oydmNU852+sLvKUBnArDkXHxws/u
	SVXmGjeKfhLiaQvu+Yj91OSPjqP8c0Eb10J6ZCnEONJv25cGgp4jD9Yc1I1pfZ8gfG14ApGtNfy
	NzQDzCAPf0fGxvjjtLrBWQKRdhRCOYUtaGbSFVyo8UO0OK7jrHxrZ/kEnt07LSHhtKEJO+xcesq
	vaplKrY/PUrhFH0Cs0fLhpepdyvcm2z223Vqt2L15wup1wn9K3A1eIBauwWEvXcKIZsoqMpfYfE
	yB/0jXCw5l5e/z8IEsJAOuw6
X-Received: by 2002:a05:600c:34d5:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4b6db1c5e0emr3268735e9.2.1793907906381;
        Thu, 05 Nov 2026 11:45:06 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6df5eaabbsm4204265e9.2.2026.11.05.11.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:45:05 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 1/8] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Thu,  5 Nov 2026 20:41:32 +0100
Message-ID: <20261105194426.1113050-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105194426.1113050-1-l.scorcia@gmail.com>
References: <20261105194426.1113050-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_114508_627803_200286E4 
X-CRM114-Status: GOOD (  10.36  )
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

Describe the MT6392 PMIC and its RTC and regulator devices. This device
is mostly based on MT6323 with some similarities to MT6397 and is usually
found on boards using the MT8516/MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 055625362951..8ecc44a88a14 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -39,6 +39,7 @@ properties:
           - mediatek,mt6328
           - mediatek,mt6358
           - mediatek,mt6359
+          - mediatek,mt6392
           - mediatek,mt6397
       - items:
           - enum:
@@ -75,6 +76,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6359-rtc
@@ -111,6 +116,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
-- 
2.43.0


