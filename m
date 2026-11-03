Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711F5606A335
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 07:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uV8WTcKR;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hQ0oszHL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=it6m8qrTkEtz+4nXGTr5C/zZdhn9ou1DiPXIBD5lLbQ=; b=uV8WTcKRaQGOYc
	2JYz0FYGy2y/eYrMvU81fEkhaR2UYQoOm9ifP9CIwmp7EGYzNynrufo6SSgcoLAn6b1+QQMTEelLl
	RjxoMo181v7tfvehNZ1wS8eJhUqO6Czn6sHDjMOhwmH7gzj3ZdMf5YRHhC/NZIAI32TFRTbvQSa/h
	dqPri1xFGbl641TKK9PI9+pPnkLTmqSZpfxFO/FTPQWMKJoQwt5P7op0a5s4Z/7fEgJnDOPCHKROs
	rcxotC4QZUPIokuzcT1XVo5lDwxx0tdpbb8ZBlZxapYOoIzUSgy+fVYm16Xx6wBXM1sWWlClu2YeB
	P4Oe+snDDhceVkXpMt/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO982-00000001LVz-2311;
	Tue, 03 Nov 2026 07:40:22 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO97z-00000001LUq-0xZh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 07:40:21 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so2406283a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 23:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691618; x=1794296418; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=it6m8qrTkEtz+4nXGTr5C/zZdhn9ou1DiPXIBD5lLbQ=;
        b=hQ0oszHLUAPpbgBGc7MupgWlASo/pNVZheQuW7EU45K5BbJwRin+hP+To3ArWgvPn+
         pJ1PrvFE3BDBMVTmNFb3MIKspgj86kdncm6uk/+0fMULNBj07fibSXZq1fAFVX3vAdvF
         tW8T/WS2gfTOUv4zJ58cDdmOwsM9CPrCnOvgAksCm8TpbDlF+u0q+va20A79Dbn0+4BM
         22voNfJSdXaDEva7Sji3JFfNjOi3bvlMR/ScwbypyFV1LX5m8W7+GcuubnLVUTXPhSgs
         tiKABx4AVzPV6pTARCM3FrLxZ+4VldjHczlr3aLhpMkx/O6b36ZvH+vf4YF2M8We1jKx
         cQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691618; x=1794296418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=it6m8qrTkEtz+4nXGTr5C/zZdhn9ou1DiPXIBD5lLbQ=;
        b=La+ISibE5yRU3XvCNPaO7tGgdb6GoMXMEwoNzHEJwVQH2xC+mV6wrUYXYMpG7h3UaN
         29M6fMgbCQtGJxfEiVkPJ/mWUy/nwYg3azdlNtqHktYK6lDN4tQ/feUlrcVDOFNm7mFQ
         QcwqzdGND0REnLiV3hBTJGjDOEMWof2r6vYN3VoKfVhcbjMB/7cbdu0nDxbyKZ0f9Dtv
         HUz8lSRhsGm9RhFhz0ULHmafzKc3fIXsv7ErvOZyv34Xz/6z63uyLwqmgWSRpBK81H/e
         jm8N0z1gYmHjJcfkiE3GIx5uSvq3G93yauCqqVKxReWhKyBEpjuGvGwq3t5haUy9BNU3
         7dwA==
X-Forwarded-Encrypted: i=1; AKwUvBwgnwJ5Mo3FJHkdf5DUtkRMh++JL6UB9/9F7y/Jyx3kXEwhNXmYb4yXCJ78bwq9hb5uyNWriG1ZCpSKtGfocQLB@lists.infradead.org
X-Gm-Message-State: APuU4Z9usAIWWtTggY27CDVly2EoDtMabSeesnl7L4rD3eI0F9IiWyGF
	/38kQA4R6Uv+wV0iYP5El+9y+kTnR1OrY7uw4jomPucUMyBuJg7pF99Y
X-Gm-Gg: AYBFou3Ra0kBp7OuB8xPoJr/FWsmbGThZNsY7GyGbnLykqIZfyVKlAHXOYoRiLb2xev
	KQmz4SwtXs0RdEePks8UP8zFmVGAM13bpbwhezJUV2Z/pSj5o0tGHYTc/SfNs1cXpJDgSwIg0BB
	sqqQXbvHy+wTtBTKevAUk70l88tnSrCMeqyaJ6B08Mg6p2IKdODT7zyegTR3tJZ8mWmKSI12AKB
	t7MkWslMYNTZm8PpgMapHbdWlMKEq+UKePuqyWGOA3XFMjorRishGvopwOdJVMzlG8ASbV5YPwm
	jWdO/mo9Yqagx9i/7GrItNf1dbkz5YVMqrEMlmPP8A3Ur6LQ41BGEvJ/KH++Up+IRllxFlnJ90j
	5udA3lM4t7JpawG5zfwPiYr+NB/hA8tzFXWkkV5CFoEs7QZRrZ0SNGtfkxgZiYU5KY4by8MzLTw
	z951a/PGlkyncI4SRdA1rTG1cU7b3H5/flFLExZSXBd6u2SOUXMX3KTC3xCJEuqwK7kxspZYV7+
	9xpwR2+KaXb3nrZ1ZnQL3YoxbF6Z+QA2S9uWXg/i0SKPZw15UfKW8XbOYLcfYZYT7c4BXMuCPXW
	zXMAAPOZD6CAmrcyKpbOal9fWbFO/e5j4mWHnl/olCsdUpXpQhfpx02cZBy6s+MN5F5zd23UZ8w
	/GzXvNdP0TQ/QWx3de0fT2nTbtlZ1YezN30YCXGTBrrD5XJwCI8/JQu3MqF42n7xSauZbZn9hSd
	BwzW0=
X-Received: by 2002:a17:90b:380c:b0:3ab:3437:554f with SMTP id 98e67ed59e1d1-3ae89749415mr9681387a91.29.1793691618392;
        Mon, 02 Nov 2026 23:40:18 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:18 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:49 +1000
Subject: [PATCH v4 01/22] ASoC: dt-bindings: cs42l84: Allow referenced
 dai-common properties
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-macaudio-v4-1-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=fSXLE44RdgYerdaSvSI97z5S0Urixj0efXODzvWnMbw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8+uzimxE9rIuctleWOHd6XpBtbrKs2M2dzt87ke7
 DI/p5jTMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOr3DQz/02ICznJcm/+k9ciposevG2vm7L/yXF3ud8sENTubx31fbBkZVsRWc1z
 fEHvLY2916xEr702FD3vrZ8gFMXfwbnqoa3eJHQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234019_270641_0715D537 
X-CRM114-Status: GOOD (  11.61  )
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

Some consumers may wish to prepend the codec's name with a known value
to identify a specific codec among many and set #sound-dai-cells. Allow
this by allowing referenced properties from dai-common.yaml.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
index 94062c1d9d45..66cae8b7db5d 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
@@ -9,6 +9,9 @@ title: Cirrus Logic CS42L84 audio CODEC
 maintainers:
   - Martin Povišer <povik+lin@cutebit.org>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 description: |
   The CS42L84 is a headphone jack codec made by Cirrus Logic and embedded
   in personal computers sold by Apple. It was first seen in 2021 Macbook
@@ -29,14 +32,11 @@ properties:
   interrupts:
     maxItems: 1
 
-  '#sound-dai-cells':
-    const: 0
-
 required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.56.0


