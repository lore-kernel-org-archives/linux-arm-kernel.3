Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940B1606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 19:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DT/c+6lp;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DQORMlZS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=; b=DT/c+6lpR+CMvY
	m6knQi5XsmK+Brc44z2rmteIAJdCorx7fk7+Llf4i0uHotjc5CXdkpyzL5gro4sgBqDUUeIkbAxrr
	IEhz1NwXLGmwCBMRw96e8zzwk0k/7/MMQ6vWQc5Pf4rEkPrZxvCny6zdxqttEciLo9/UIGEdowtlo
	prAZp4TWSlUE1qqKO8bQQiMIkkpMwct7Q6PC0pu8dbpss+uDHj0840bL81v8/Oq6DOHGhSLDrUlq5
	sySm4Y7NruZsR9m2FLaWsF/uVLD6mBr79HRMawpPaOZHyIYOKpRQgX/YdOFKQ0ohGJ6KKCbdZisne
	dxxfCPffiuNz0PneU45A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3Ov-0000000AP6J-3K9V;
	Thu, 05 Nov 2026 19:45:33 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3Ol-0000000AP1f-43pm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 19:45:32 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so21444255e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 11:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793907922; x=1794512722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=DQORMlZSP/fQx1KmWAO40ucY/cKhnvnNfvpkk5uryOs3gOPz7dBgBnwt2FdAu38e80
         NsRNWNlaXwuDs6PPF5Z5UMngto45D4tg/htCCIV+4wSGNRbaW9nYIvULpU3jZKflHaWu
         0SmMNgJDJlnRSg8G0592SNbZPHtR5wIJFv6cmjiYXGQe/i1vuwYtJhxERKVJXhVPMsWc
         LlSuZJhtTI+jXrVedgFj9WbVf62duXKHhJBjJhAasfqIoHj2nY1FnTGtPDw/aXYaQIDL
         DrATBDLO8cDXUc7JwUNiE9Dp0LXBiL71GWFSqjIEHrcumTPtmRZsxRg/HMTFSX/Hg2Em
         lZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907922; x=1794512722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=CjK2ScmUxJeVcEv8iMpYx5HkGwhPCjX/LIp5XMGfm+qDuoXJS+QoOpHA+/gFO/EBlg
         d9f1Qwv8ZYH7YnEnB+I4IkmHo31KMDLKHEPhxBL/68lIMkTsNGttoEaLULxTVqe7VIEO
         oz4gi4msEwXihnVddbL7/ZpsajsKz1EO0ZmvQrde7pCNS/nv+Y2hUS9+IXA8X8drkMdY
         XCredPyvWFtjWSqasjORzwaAkz5nQMUddu32dwDWLL/UolIf160o8Y0VAKBxedRzh9ar
         QtFU8ldLXXdgs+SubsxmQKs9yp/f402AsXeWcFN+RR03L4fiGZP3laLJO798PhWY1Sjy
         /ZHA==
X-Forwarded-Encrypted: i=1; AKwUvBydzAy5EQ4I+49vmP8zc1zZslo7Rwer97q1jyusjZkp9davbgTo2f3waJvoDDJQ+yz5cAj/Lgz/3crqvDsoLgQq@lists.infradead.org
X-Gm-Message-State: APuU4Z8Hojm5P/1/Tm4QwqsBf5EvZMuVPM46hVzfQo3fjDt+fiuk0W+i
	ZsQA4CUlC88Z9WOmKwQ47CgtA6eg9exzZfUxoToPSHlTdur3YNoRt2dL
X-Gm-Gg: AYBFou2A/5X9X4JJoCIP232CbOzPzbQ88qW5VOc0c0vMm1Pzcs5pyGlT9lHY2VJ3WXO
	5he3pEq/h0UITQ8QqvPAmq7EglExzRUcFVqXzKSVkvj7erWQbzvHHUbNI7/rnPCecY/S1ljA+6W
	dSM+6k5WJZojr1VzhrVymq9V3WgUpTIlpKAKDkOs5sPlfYDmyzgIrY+njjwlsaaAcWy6T0VyHdr
	xcynkRqZGyIDvieZXZTj5rcSDRK+raYwXm95DYHHETiOBFiHkFaExxNzdG4gU6F2thzguGYOPtO
	wypKNnctfRlkPjDqhl+WXRICVDpmhIyh32oFWq4tZyppUzMYPWkI0MSxbUQ59CQrsuFD/eqJXXl
	A8r4vtGqBj9j38xIxm/jwEquXN4ioY0qFA6b4ttxf3EkBI845yMqa8jtU5cguEZqmE5tvKZJmeu
	4lLEYNU/8lnbBrGGF9mw0mDNCknVQgbqNLVyCIHdN24Vq8iMnpgrhw/XW5aq9EVIZaMcdtN173C
	MrtbVUW8/ibe/dJbzOILsDe0FRPKFeD/9iqMrmprvBslfw6BKEeiFILaTy4Ra7NfIdBW5o8wdm5
	vaas6DmR2Mr8EqwyCL0Nzjd4
X-Received: by 2002:a05:600c:5285:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4b6db4a9a2emr3123275e9.2.1793907921887;
        Thu, 05 Nov 2026 11:45:21 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6df5eaabbsm4204265e9.2.2026.11.05.11.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:45:21 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
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
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 2/8] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Thu,  5 Nov 2026 20:41:33 +0100
Message-ID: <20261105194426.1113050-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105194426.1113050-1-l.scorcia@gmail.com>
References: <20261105194426.1113050-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_114524_027367_0B80C0B2 
X-CRM114-Status: GOOD (  10.37  )
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

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 140a862ecfbe..ff720588128b 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -31,6 +31,7 @@ properties:
           - mediatek,mt6357-keys
           - mediatek,mt6358-keys
           - mediatek,mt6359-keys
+          - mediatek,mt6392-keys
           - mediatek,mt6397-keys
       - items:
           - enum:
-- 
2.43.0


